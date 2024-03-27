//
//  QurationLoadingVC.swift
//  sonmong
//
//  Created by 이은솔 on 2024/03/28.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class QurationLoadingVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationLoadingView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func bind(reactor: QurationLoadingReactor) {
        baseView.layout(superView: self.view)
        
    }
    
}
