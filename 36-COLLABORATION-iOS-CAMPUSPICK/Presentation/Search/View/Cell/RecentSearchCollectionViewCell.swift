//
//  RecentSearchCollectionViewCell.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

import UIKit
import SnapKit
import Then

class RecentSearchCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Property
    
    private let titleLabel = UILabel().then {
        $0.font = .soptFont(.caption2)
        $0.textColor = .gray1
    }

    private let deleteImageView = UIImageView().then {
        $0.image = .xIcon
    }

    private let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 13
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray4.cgColor
    }
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layout
    
    private func setStyle() {
        addSubview(containerView)
        containerView.addSubviews(titleLabel, deleteImageView)
    }
    
    private func setLayout() {
        containerView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.equalToSuperview().inset(8)
        }

        deleteImageView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(4)
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
    }
}


// MARK: - Extension

extension RecentSearchCollectionViewCell {
    func dataBind(data: String) {
        titleLabel.text = data
    }
}
