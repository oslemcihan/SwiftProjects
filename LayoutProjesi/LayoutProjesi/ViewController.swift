//
//  ViewController.swift
//  LayoutProjesi
//
//  Created by Özlem CİHAN on 27.07.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        //label
        let myLabel = UILabel()
        myLabel.text = "Text text"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width*0.5 - 100, y: height*0.5 - 25, width: 200, height: 50)
        view.addSubview(myLabel)
        
        //button
        let myButton = UIButton()
        myButton.setTitle("Buton", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.frame = CGRect(x: width*0.5 - 50, y: height*0.5 + 25, width: 100, height: 50)
        
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.benimfunc), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func benimfunc() {
        print("Butona Basıldı")
    }


}

