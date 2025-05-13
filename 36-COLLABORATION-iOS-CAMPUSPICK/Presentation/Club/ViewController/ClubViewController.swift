//
//  ClubViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

import UIKit

final class ClubViewController: UIViewController {
    private var headerView = ClubHeaderView()
    private var popularView = PopularView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setUI() {
        self.view.addSubviews(headerView, popularView)
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        popularView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(303)
        }
        
    }

}
