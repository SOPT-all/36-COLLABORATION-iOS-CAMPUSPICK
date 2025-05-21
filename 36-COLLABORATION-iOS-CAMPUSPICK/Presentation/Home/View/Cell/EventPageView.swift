//
//  ContentPageView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/20/25.
//

import UIKit
import SnapKit
import Then

final class EventPageView: UIView {
    
    
    // MARK: - Properies
    
    private let imageView = UIImageView().then {
        $0.image = .homeImgEvent
        $0.contentMode = .scaleAspectFill
    }
    private let titleLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.attributedText = .sopt("<파이널 데스티네이션 블러드라인> 5/7 (수) 대개봉 예매권 이벤트", style: .body0)
    }
    private let subtitleLabel = UILabel().then { 
        $0.attributedText = .sopt("이벤트", style: .caption1)
        $0.textColor = .gray2
    }
    private let labelView = UIView().then {
        $0.backgroundColor = .gray5
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setting Method
    
    private func setUI() {
        addSubviews(
            imageView,
            labelView
        )
        labelView.addSubviews(
            titleLabel,
            subtitleLabel
        )
    }

    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(229)
        }
        
        labelView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(65)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(7)
            $0.width.equalTo(280)
            
        }

        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(7)
        }
    }
}
