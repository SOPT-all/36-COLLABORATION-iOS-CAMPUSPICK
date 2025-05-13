//
//  ClubViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

import UIKit

final class ClubViewController: UIViewController {
    
    // MARK: - Property
    
    private let scrollview = UIScrollView()
    private let contentView = UIView()
    private var headerView = ClubHeaderView()
    private let seperatorView1 = UIView().then {
        $0.backgroundColor = .gray4
    }
    private var popularView = PopularView()
    private let seperatorView2 = UIView().then {
        $0.backgroundColor = .gray4
    }
    private var rankingView = RankingView()
    private let seperatorView3 = UIView().then {
        $0.backgroundColor = .gray4
    }
    private var findClubView = FindClubView()
    private var pageImage = UIImageView().then {
        $0.image = .pagination
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    // MARK: - settting Method
    
    private func setUI() {
        self.view.addSubview(scrollview)
        scrollview.addSubview(contentView)
        contentView.addSubviews(headerView, seperatorView1, popularView, seperatorView2, rankingView, seperatorView3, findClubView, pageImage)
    }
    
    private func setLayout() {
        scrollview.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        seperatorView1.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom)
            $0.height.equalTo(7)
        }
        
        popularView.snp.makeConstraints {
            $0.top.equalTo(seperatorView1.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(303)
        }
        
        seperatorView2.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(popularView.snp.bottom)
            $0.height.equalTo(7)
        }
        
        rankingView.snp.makeConstraints {
            $0.top.equalTo(seperatorView2.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(260)
        }
        
        seperatorView3.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(rankingView.snp.bottom)
            $0.height.equalTo(7)
        }
        
        findClubView.snp.makeConstraints {
            $0.top.equalTo(seperatorView3.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1655)
        }
        
        pageImage.snp.makeConstraints {
            $0.top.equalTo(findClubView.snp.bottom).offset(42)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(272)
            $0.height.equalTo(32)
            $0.bottom.equalToSuperview().inset(30)
        }
    }

}
