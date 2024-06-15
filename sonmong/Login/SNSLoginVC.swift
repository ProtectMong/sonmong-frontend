//
//  SNSLoginVC.swift
//  sonmong
//
//  Created by 이은솔 on 6/2/24.
//

import Foundation
import UIKit
import RxSwift
import ReactorKit
import RxKeyboard
import RxOptional

class SNSLoginVC: UIViewController, View  {
    var disposeBag = DisposeBag()
    let baseView = SNSLoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        bindKeyboard()
    }
    
    func bind(reactor: SNSLoginReactor) {
        baseView.layout(superView: self.view)
    }
    
    init(reactor: SNSLoginReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

