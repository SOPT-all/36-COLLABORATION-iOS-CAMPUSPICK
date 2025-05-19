//
//  MainIconView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/19/25.
//

import UIKit
import SnapKit
import Then

final class MainIconView: UIView {
    
    
    // MARK: - Properties
    
    private lazy var clubIconButton = UIButton().then {
        $0.setImage(.clubPng, for: .normal)
        $0.layer.cornerRadius = 13
        $0.backgroundColor = .skyBlue
        $0.addTarget(self, action: #selector(clubIconButtonTap), for: .touchUpInside)
    }
    private let clubLabel = UILabel().then {
        $0.attributedText = .sopt("동아리", style: .caption2)
        $0.textAlignment = .center
    }
    
    private let activityIconButton = UIButton().then {
        $0.setImage(.activityPng, for: .normal)
        $0.layer.cornerRadius = 13
        $0.backgroundColor = .skyBlue
    }
    private let activityLabel = UILabel().then {
        $0.attributedText = .sopt("대외활동", style: .caption2)
        $0.textAlignment = .center
    }
    
    private let contestIconButton = UIButton().then {
        $0.setImage(.contestPng, for: .normal)
        $0.layer.cornerRadius = 13
        $0.backgroundColor = .skyBlue
    }
    private let contestLabel = UILabel().then {
        $0.attributedText = .sopt("공모전", style: .caption2)
        $0.textAlignment = .center
    }
    
    private let jobIconButton = UIButton().then {
        $0.setImage(.jobPng, for: .normal)
        $0.layer.cornerRadius = 13
        $0.backgroundColor = .skyBlue
    }
    private let jobLabel = UILabel().then {
        $0.attributedText = .sopt("취업 정보", style: .caption2)
        $0.textAlignment = .center
    }
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setting Method
    
    private func setUI() {
        self.addSubviews(
            clubIconButton,
            clubLabel,
            activityIconButton,
            activityLabel,
            contestIconButton,
            contestLabel,
            jobIconButton,
            jobLabel
        )
    }
    
    private func setLayout() {
        clubIconButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(47)
            $0.height.equalTo(44)
            $0.width.equalTo(44)
        }
        clubLabel.snp.makeConstraints {
            $0.top.equalTo(clubIconButton.snp.bottom).offset(4)
            $0.centerX.equalTo(clubIconButton.snp.centerX)
        }
        
        activityIconButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalTo(clubIconButton.snp.trailing).offset(35)
            $0.height.equalTo(44)
            $0.width.equalTo(44)
        }
        activityLabel.snp.makeConstraints {
            $0.top.equalTo(activityIconButton.snp.bottom).offset(4)
            $0.centerX.equalTo(activityIconButton.snp.centerX)
        }
        
        contestIconButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalTo(activityIconButton.snp.trailing).offset(35)
            $0.height.equalTo(44)
            $0.width.equalTo(44)
        }
        contestLabel.snp.makeConstraints {
            $0.top.equalTo(contestIconButton.snp.bottom).offset(4)
            $0.centerX.equalTo(contestIconButton.snp.centerX)
        }
        
        jobIconButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalTo(contestIconButton.snp.trailing).offset(35)
            $0.height.equalTo(44)
            $0.width.equalTo(44)
        }
        jobLabel.snp.makeConstraints {
            $0.top.equalTo(jobIconButton.snp.bottom).offset(4)
            $0.centerX.equalTo(jobIconButton.snp.centerX)
        }
    }
    
    
    // MARK: - Target Method
    
    @objc func clubIconButtonTap() {
        print("버튼 눌림")
        let label = UILabel()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "동아리 버튼 눌림!!"
        label.alpha = 0.0
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        
        self.addSubview(label)
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(40)
            $0.width.equalToSuperview().multipliedBy(0.6)
            $0.height.equalTo(35)
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
            label.alpha = 1.0
        }, completion: { _ in
            
            
            UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseOut, animations: {
                label.alpha = 0.0
            }, completion: { _ in
                label.removeFromSuperview()
            })
        })
    }
}
