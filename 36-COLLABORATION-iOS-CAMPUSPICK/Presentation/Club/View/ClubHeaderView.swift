//
//  ClubHeaderView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

import UIKit

import SnapKit
import Then

enum HeaderType {
    case withCategory
    case none
}

protocol ClubHeaderTypeProtocol: AnyObject {
    func headerType(type: HeaderType)
}

// protocol 상속 받기.
class ClubHeaderView: UIView {
    private let backButtonView = UIView().then {
        $0.isUserInteractionEnabled = true
    }
    
    private let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = .mainBlue
        $0.isUserInteractionEnabled = false
    }
    
    private let backButtonTitle = UILabel().then {
        $0.attributedText = .sopt("뒤로", style: .heading2)
        $0.textColor = .mainBlue
        $0.isUserInteractionEnabled = false
    }
    
    private let titleLabel = UILabel().then {
        $0.attributedText = .sopt("동아리", style: .heading1)
        $0.textColor = .mainBlue
    }
    
    private let myActivityLabel = UILabel().then {
        $0.attributedText = .sopt("내 활동", style: .heading2)
        $0.textColor = .mainBlue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .gray3
        
        setUI()
        setLayout()
        setActionRegister()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.addSubviews(backButtonView, titleLabel, myActivityLabel)
        
        backButtonView.addSubviews(backButton, backButtonTitle)
    }
    
    private func setLayout() {
        backButtonView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(10)
            $0.width.equalTo(50)
            $0.height.equalTo(21)
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalTo(12)
            $0.height.equalTo(21)
        }
        
        backButtonTitle.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.trailing).offset(7)
            $0.centerY.equalTo(backButton)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(10)
        }
        
        myActivityLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(10)
        }
        
    }
    
    //
    private func setActionRegister() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButtonView.addGestureRecognizer(tapGesture)
    }

    

}


// MARK: - Method

extension ClubHeaderView {
    
    @objc private func backButtonTapped() {
        print("뒤로 버튼 눌림")

        // view 계층 안에서 가장 가까운 ViewController를 찾음
//        if let viewController = self.findViewController() {
//            viewController.navigationController?.popViewController(animated: true)
//        }
    }
    
    
    
    
//    func headerType(type: HeaderType) {
//        switch type {
//        case .withCategory:
//            categoryButton.isHidden = false
//        case .none:
//            categoryButton.isHidden = true
//        }
//    }
}
