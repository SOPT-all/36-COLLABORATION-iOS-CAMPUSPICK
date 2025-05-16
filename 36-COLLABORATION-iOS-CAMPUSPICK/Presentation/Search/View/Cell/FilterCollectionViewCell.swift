//
//  FilterCollectionViewCell.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

import UIKit
import SnapKit
import Then

protocol FilterOptionType {
    func title() -> String
}

class FilterCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Property
    
    private let titleLabel = UILabel().then {
        $0.font = .soptFont(.caption2)
        $0.textColor = .gray1
    }

    private let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 13
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray3.cgColor
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
        containerView.addSubviews(titleLabel)
    }
    private func setLayout() {
        containerView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(6)
            $0.leading.trailing.equalToSuperview().inset(14)
        }
    }
    
    
    // MARK: - Change state
    
    override var isSelected: Bool {
        didSet {
            updateSelectedUI()
        }
    }
    
    private func updateSelectedUI() {
        if isSelected {
            containerView.backgroundColor = .mainBlue
            containerView.layer.borderColor = UIColor.clear.cgColor
            titleLabel.textColor = .white
        } else {
            containerView.backgroundColor = .white
            containerView.layer.borderColor = UIColor.gray3.cgColor
            titleLabel.textColor = .gray1
        }
    }
}


// MARK: - Extension

extension FilterCollectionViewCell {
    func dataBind(data: FilterOptionType) {
        titleLabel.text = data.title()
    }
}
