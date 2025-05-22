//
//  CommunityViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class CommunityViewController: UIViewController {
    
    private let communityView = UIView().then{
        $0.backgroundColor = .systemBlue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        view.addSubview(communityView)
        
        communityView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
