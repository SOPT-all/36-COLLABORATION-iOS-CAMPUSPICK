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
    
    
    // MARK: - Properties
    
    private let headerView = MainHeaderView()
    private let bannerView = BannerView()
    private let mainIconView = MainIconView()
    private let popularClubView = PopularClubView().then {
        $0.backgroundColor = .gray2
    }
    private let popularActivityView = PopularActivityView().then {
        $0.backgroundColor = .systemGreen
    }
    private let popularContestView = PopularContestView()
    private let eventView = EventView()
    
    private let scrollView = UIScrollView()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    
    // MARK: - Setting Method
    
    private func setUI() {
        view.addSubviews(
            headerView,
            scrollView
        )
        scrollView.addSubviews(
            bannerView,
            mainIconView,
            popularClubView,
            popularActivityView,
            popularContestView,
            eventView
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
        bannerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(145)
            $0.width.equalTo(scrollView.snp.width)
        }
        mainIconView.snp.makeConstraints {
            $0.top.equalTo(bannerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
            $0.width.equalToSuperview()
        }
        popularClubView.snp.makeConstraints {
            $0.top.equalTo(mainIconView.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(210)
            $0.width.equalToSuperview()
        }
        popularActivityView.snp.makeConstraints {
            $0.top.equalTo(popularClubView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(210)
            $0.width.equalToSuperview()
        }
        popularContestView.snp.makeConstraints {
            $0.top.equalTo(popularActivityView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(233)
            $0.width.equalToSuperview()
        }
        eventView.snp.makeConstraints {
            $0.top.equalTo(popularContestView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(370)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
