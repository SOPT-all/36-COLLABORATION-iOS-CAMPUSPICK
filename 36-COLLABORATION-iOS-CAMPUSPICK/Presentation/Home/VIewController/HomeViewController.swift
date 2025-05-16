//
//  HomeViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    private let headerView = MainHeaderView()
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemMint
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.addSubviews(
            headerView,
            scrollView
        )
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(-29)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(24)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}
