//
//  LaunchViewController.swift
//  sonmong
//
//  Created by 이은솔 on 3/23/24.
//

import UIKit

class LaunchViewController: UIViewController {
    let baseView = LauchScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        baseView.layout(superView: self.view)
    }


}

