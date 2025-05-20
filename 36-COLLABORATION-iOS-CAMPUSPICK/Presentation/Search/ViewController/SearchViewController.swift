//
//  SearchViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/15/25.
//

import UIKit
import SnapKit
import Then

class SearchViewController: UIViewController {
    
    
    // MARK: - Property
    
    private let separatorLine = UIView().then {
        $0.backgroundColor = .gray4
    }

    private let recentView = RecentSearchView()
    
    private let popularView = PopularSearchView()

    private let adImageView = UIImageView().then {
        $0.image = .searchImgAd
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
    }
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    
    // MARK: - Set UI
    
    private func setStyle() {
        view.backgroundColor = .white
        view.addSubviews(separatorLine, recentView, popularView, adImageView)
    }
    
    private func setLayout() {
        separatorLine.snp.makeConstraints {
            $0.top.equalToSuperview().inset(114)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        recentView.snp.makeConstraints {
            $0.top.equalTo(separatorLine.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(60)
        }
        
        popularView.snp.makeConstraints {
            $0.top.equalTo(recentView.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(99)
        }
        
        adImageView.snp.makeConstraints {
            $0.top.equalTo(popularView.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(80)
        }
    }
    
//    // 나중에쓸거
//    @objc private func openModal() {
//        let modalVC = SearchFilterModalViewController()
////        let modalVC = SearchSortModalViewController()
//        if let sheet = modalVC.sheetPresentationController {
//            sheet.detents = [.custom(resolver: { _ in return 454 })]
////            sheet.detents = [.custom(resolver: { _ in return 246 })]
//            sheet.prefersGrabberVisible = true
//            sheet.preferredCornerRadius = 15
//        }
//        present(modalVC, animated: true)
//    }
}
