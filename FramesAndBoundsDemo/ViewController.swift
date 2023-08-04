//
//  ViewController.swift
//  FramesAndBoundsDemo
//
//  Created by Kumaran on 20/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    var demoView: UIView!
    var frameView: UIView!
    var boundsView: UIView!
    var frameLabel: UILabel!
    var boundsLabel: UILabel!
    var rotateButton: UIButton!
    
    var rotationDegrees: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBoundsView()
        setupFrameView()
        setupDemoView()
        setupFrameLabel()
        setupBoundsLabel()
        setupRotateButton()
        
        view.layoutIfNeeded()
        
        printFrame()
        printBounds()
    }
    
    func setupDemoView() {
        
        demoView  = UIView(frame: .zero)
        demoView.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 0.25)
        demoView.layer.borderWidth = 1
        demoView.layer.borderColor = UIColor.blue.cgColor
        view.addSubview(demoView)
        
        // Setup auto-layout constraints.
        demoView.translatesAutoresizingMaskIntoConstraints = false
        demoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        demoView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        demoView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        demoView.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    func setupFrameView() {
        frameView = UIView(frame: .zero)
        frameView.layer.borderWidth = 2
        frameView.layer.borderColor = UIColor.magenta.cgColor
        self.view.addSubview(frameView)
    }
    
    func setupBoundsView() {
        boundsView = UIView(frame: .zero)
        boundsView.layer.borderWidth = 2
        boundsView.layer.borderColor = UIColor.green.cgColor
        self.view.addSubview(boundsView)
    }
    func setupRotateButton() {
        rotateButton = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.transform()
        }))
        rotateButton.setTitle("Rotate", for: .normal)
        view.addSubview(rotateButton)
        
        // Specify auto-layout constraints.
        rotateButton.translatesAutoresizingMaskIntoConstraints = false
        rotateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rotateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        rotateButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        rotateButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupFrameLabel() {
        frameLabel = UILabel()
        setCommonProperties(toLabel: frameLabel)
        view.addSubview(frameLabel)
        
        // Specify auto-layout constraints.
        frameLabel.translatesAutoresizingMaskIntoConstraints = false
        frameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        // Configure common constraints.
        setCommonConstraints(toLabel: frameLabel)
    }
    
    
    func setupBoundsLabel() {
        boundsLabel = UILabel()
        setCommonProperties(toLabel: boundsLabel)
        view.addSubview(boundsLabel)
        
        // Specify auto-layout constraints.
        boundsLabel.translatesAutoresizingMaskIntoConstraints = false
        boundsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // Configure common constraints.
        setCommonConstraints(toLabel: boundsLabel)
    }
    
    
    func setCommonProperties(toLabel label: UILabel) {
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .boldSystemFont(ofSize: 12)
    }
    
    
    func setCommonConstraints(toLabel label: UILabel) {
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
            .isActive = true
        label.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2)
            .isActive = true
        label.heightAnchor.constraint(equalToConstant: 120)
            .isActive = true
    }
    
    
    func printFrame() {
        print("-- FRAME --")
        print("X: \(demoView.frame.origin.x)")
        print("Y: \(demoView.frame.origin.y)")
        print("Width: \(demoView.frame.size.width)")
        print("Height: \(demoView.frame.size.height)")
        print("")
        
        frameLabel.text = """
                    -- FRAME --
                    X: \(demoView.frame.origin.x.rounded())
                    Y: \(demoView.frame.origin.y.rounded())
                    Width: \(demoView.frame.size.width.rounded())
                    Height: \(demoView.frame.size.height.rounded())
        """
    }
    
    func printBounds() {
        print("-- Bounds --")
        print("X: \(demoView.bounds.origin.x)")
        print("Y: \(demoView.bounds.origin.y)")
        print("Width: \(demoView.bounds.size.width)")
        print("Height: \(demoView.bounds.size.height)")
        print("")
        
        boundsLabel.text = """
                    -- BOUNDS --
                    X: \(demoView.bounds.origin.x)
                    Y: \(demoView.bounds.origin.y)
                    Width: \(demoView.bounds.size.width)
                    Height: \(demoView.bounds.size.height)
        """
    }
    
    
    func transform() {
        // Rotate the demo view.
        rotationDegrees += 15
        demoView.transform = CGAffineTransform(rotationAngle: rotationDegrees * .pi / 180)
        
        // Update the frame of the frameView.
        frameView.frame = demoView.frame
        
        // Update the frame of the boundsView.
        boundsView.frame = demoView.bounds
        
        // Update the content of the two labels with
        // the new frame and bounds values.
        printFrame()
        printBounds()
    }
}
