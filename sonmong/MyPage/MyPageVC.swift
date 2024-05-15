//
//  MyPageVC.swift
//  sonmong
//
//  Created by 이은솔 on 5/15/24.
//

import Foundation
import Foundation
import UIKit
import RxSwift
import ReactorKit

class MyPageVC: UIViewController, View {
    var disposeBag = DisposeBag()
    let baseView = MyPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
    }
    
    func bind(reactor: MyPageReactor) {
        
    }
    
    init(reactor: MyPageReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindNavigation() {
        let titleLabel = UILabel()
        titleLabel.text = "마이"
        titleLabel.textColor = Constant.Color.g5
        titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        titleLabel.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = leftItem
    }
}
