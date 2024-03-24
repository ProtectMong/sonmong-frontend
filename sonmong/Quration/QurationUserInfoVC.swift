//
//  QurationUserInfoVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class QurationUserInfoVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationUserInfoView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bind(reactor: QurationUserInfoReactor) {
        baseView.layout(superView: self.view)
        
    }
}
