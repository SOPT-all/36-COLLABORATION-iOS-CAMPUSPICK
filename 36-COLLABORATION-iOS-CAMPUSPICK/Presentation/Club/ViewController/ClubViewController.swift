//
//  ClubViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

import UIKit

final class ClubViewController: UIViewController {
    private var headerView = ClubHeaderView()
    
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
        self.view.addSubview(headerView)
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(150)
        }
    }
    

}
