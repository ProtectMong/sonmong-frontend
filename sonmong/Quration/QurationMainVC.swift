//
//  QurationMainVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class QurationMainVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationMainView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
        baseView.layout(superView: self.view)
    }
    
    func bind(reactor: QurationMainReactor) {
        
        reactor.state.map { $0.historyDataSource }
            .distinctUntilChanged()
            .filterNil()
            .bind(to: baseView.qurationListTable.rx.items(cellIdentifier: "QurationHistoryTableViewCell", cellType: QurationHistoryTableViewCell.self)) { row, data, cell in
                cell.totalTitleLabel.text = data
            }
            .disposed(by: disposeBag)
        
        baseView.qurationListTable.delegate = self
        
        reactor.state.map { $0.isPresentQurationUserInfoVC }
            .distinctUntilChanged()
            .filterNil()
            .filter{ $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                let userInfoVC = QurationUserInfoVC()
                let userInfoReactor = QurationUserInfoReactor()
                userInfoVC.reactor = userInfoReactor
                
                vc.navigationController?.pushViewController(userInfoVC, animated: true)
            })
            .disposed(by: disposeBag)
        
    }
    
    init(reactor: QurationMainReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension QurationMainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "QurationHistoryTableViewHeaderView") as! QurationHistoryTableViewHeaderView
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func bindNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
    }
}
