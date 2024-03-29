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
        
//        bindNavigation()
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
        self.title = "손몽이를 지켜줘!"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = Constant.Color.f2
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .bold)
        ]
        
//        self.navigationController?.navigationBar.tintColor = Enti.Color.c000000
        
        let searchButtonItem = UIBarButtonItem(image: UIImage(named: "search_ic"),
                                                  style: .plain,
                                                  target: nil,
                                                  action: nil)
        
        searchButtonItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        searchButtonItem.tintColor = Constant.Color.b1
//        self.navigationItem.setRightBarButtonItems([searchButtonItem], animated: false)
//
//        searchButtonItem.rx.tap
//            .subscribe(onNext: { _ in
//                #warning("검색 기능 구현")
//            }).disposed(by: disposeBag)
    }
}
