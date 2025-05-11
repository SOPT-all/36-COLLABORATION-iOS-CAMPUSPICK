//
//  ViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/8/25.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    private let label = UILabel().then {
        $0.attributedText = .sopt("테스트 폰트", style: .heading0)
        $0.textColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }


}

