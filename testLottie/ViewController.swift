//
//  ViewController.swift
//  testLottie
//
//  Created by HengVisal on 6/1/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import UIKit
import Lottie // Animation Library
import SnapKit // Layout Library

class ViewController: UIViewController {
    
    var animation : LOTAnimationView!
    var button : UIButton!
    var label : UILabel!
    var uiSlider : UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        createComponent()
        addSupview()
        setupLayout()

    }
    
    //Slider Drag
    @objc func valueChange() -> Void {
        
        //Bind Slider Value to Label
        label.text = String(Int(round(uiSlider.value)))
        
        //Bind With AnimationSpeed
        let speed = round(uiSlider.value) / 100
        animation.animationSpeed = CGFloat(speed)
    }
    
    //Button Click
    @objc func btnClick() -> Void {
        animation.stop()
        animation.play()
    }
}

// MARK: - Creat UI Component
extension ViewController {
    func createComponent() -> Void {
     
        //Lottie
        animation = LOTAnimationView(name: "data")
      
        //Label
        label = UILabel()
        label.textAlignment = .center
        label.text = "50"
        
        //Slider
        uiSlider = UISlider()
        uiSlider.minimumValue = 1
        uiSlider.maximumValue = 100
        uiSlider.value = 50
        uiSlider.isContinuous = true
        uiSlider.addTarget(self, action: #selector(valueChange), for: .valueChanged)
        
        //Button
        button = UIButton()
        button.setTitle("START", for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
       
    }
}

// MARK: - Add Supview
extension ViewController {
    func addSupview() -> Void {
        self.view.addSubview(label)
        self.view.addSubview(animation)
        self.view.addSubview(button)
        self.view.addSubview(uiSlider)
    }
}

// MARK: - Setup Layout
extension ViewController {
    func setupLayout() -> Void {
        
        //Lottie
        animation.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }

        //Label
        label.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottom.equalTo(uiSlider.snp.top)
        }
        
        //Slider
        uiSlider.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        //Button
        button.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottom.equalTo(label.snp.top)
        }
    }
}
