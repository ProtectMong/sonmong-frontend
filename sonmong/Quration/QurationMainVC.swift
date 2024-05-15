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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
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
        
        baseView.startQurationButton.rx.tap
            .map { Reactor.Action.didNextButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
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
    
    func bindNavigation() {
        let titleLabel = UILabel()
        titleLabel.text = "AI상담"
        titleLabel.textColor = Constant.Color.g5
        titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        titleLabel.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = leftItem
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
}
