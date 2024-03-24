//
//  HomeVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class HomeVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    
    //    let baseView = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
    }
    
    func bind(reactor: HomeReactor) {
        //        baseView.layout(self.view)
        
    }
}
