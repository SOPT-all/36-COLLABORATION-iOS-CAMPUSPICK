//
//  EventView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/19/25.
//

import UIKit
import SnapKit
import Then

final class EventView: UIView {
    
    
    // MARK: - Properties
    
    private let titleLabel = UILabel().then {
        $0.attributedText = .sopt("이벤트", style: .heading1)
    }
    
    private lazy var buttonView = UIView().then {
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moreButtonTap)))
    }
    private let buttonLabel = UILabel().then {
        $0.attributedText = .sopt("더 보기", style: .caption3)
        $0.isUserInteractionEnabled = false
        $0.textColor = .gray2
    }
    private let moreButton = UIButton().then {
        $0.setImage(.arrowSmall, for: .normal)
        $0.isUserInteractionEnabled = false
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
            titleLabel,
            buttonView
        )
        buttonView.addSubviews(
            buttonLabel,
            moreButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(15)
        }
        buttonView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(40)
            $0.height.equalTo(12)
        }
        
        buttonLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        moreButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    
    // MARK: - Target Method
    
    @objc private func moreButtonTap() {
        print("더 보기 버튼 눌림!!")
    }
}
