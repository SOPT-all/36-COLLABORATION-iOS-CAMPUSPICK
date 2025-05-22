//
//  ClubSortView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/21/25.
//

import UIKit
import SnapKit
import Then

class ClubSortView: UIView {
    
    // MARK: - Property

    private var filterbuttonToggle: Bool = false
    
    private let filterLabel = UILabel().then {
        $0.attributedText = .sopt("마감된 공고 제외", style: .caption2)
        $0.textColor = .black
    }
    
    private let filterButton = UIButton().then {
        $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .gray2
    }
    
    private let seperator = UIView().then {
        $0.backgroundColor = .gray2
    }
    
    private let bottomSheetLabel = UILabel().then {
        $0.attributedText = .sopt("최신순", style: .caption2)
        $0.textColor = .black
    }
    
    let bottomSheetButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        $0.tintColor = .gray2
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setting Method

    private func setUI() {
        self.addSubviews(filterLabel, filterButton, seperator, bottomSheetLabel, bottomSheetButton)
    }
    
    private func setLayout() {
        
        filterLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(194)
        }
        
        filterButton.snp.makeConstraints {
            $0.leading.equalTo(filterLabel.snp.trailing).offset(3)
            $0.centerY.equalTo(filterLabel)
            $0.size.equalTo(16)
        }
        
        seperator.snp.makeConstraints {
            $0.centerY.equalTo(filterLabel)
            $0.leading.equalTo(filterButton.snp.trailing).offset(10)
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        
        bottomSheetLabel.snp.makeConstraints {
            $0.leading.equalTo(seperator.snp.trailing).offset(10)
            $0.centerY.equalTo(filterLabel)
        }
        
        bottomSheetButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18)
            $0.centerY.equalTo(filterLabel)
            $0.size.equalTo(12)
        }
    }
    
    private func setAddTarget() {
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
    }
}


// MARK: - Method

extension ClubSortView {
    @objc private func filterButtonTapped() {
        print("Filter button tapped")
        filterbuttonToggle.toggle()
        filterButton.tintColor = self.filterbuttonToggle ? .mainBlue : .gray2
    }
}
