//
//  SortOptionTableViewCell.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class SortOptionTableViewCell: UITableViewCell {

    
    // MARK: - Property
    private let titleLabel = UILabel().then {
        $0.font = .soptFont(.body4)
        $0.textColor = .black
    }

    private let checkmark = UIImageView().then {
        $0.image = .checkIcon
        $0.isHidden = true
    }

    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - Set UI
    
    private func setStyle() {
        addSubviews(titleLabel, checkmark)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }

        checkmark.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(25)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(18)
        }
    }
}


// MARK: - Extension

extension SortOptionTableViewCell {
    func dataBind(option: String, isSelected: Bool) {
        titleLabel.text = option
        checkmark.isHidden = !isSelected
    }
}
