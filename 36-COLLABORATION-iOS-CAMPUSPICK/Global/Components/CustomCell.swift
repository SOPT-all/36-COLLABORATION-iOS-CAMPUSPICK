//
//  CustomCell.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/21/25.
//

import UIKit
import SnapKit
import Then

final class CustomCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    private let posterView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private let textView = UIView().then {
        $0.backgroundColor = .gray5
        $0.clipsToBounds = true
    }
    private let titleLabel = UILabel().then {
        $0.numberOfLines = 2
    }
    private let viewIconView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = .eyeIcon
    }
    private let viewLabel = UILabel().then {
        $0.textColor = .gray2
    }
    private let commentIconView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = .commentIcon
    }
    private let commentLabel = UILabel().then {
        $0.textColor = .gray2
    }
    
    private var imageHeightConstraint: Constraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 6
        layer.masksToBounds = true
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        addSubviews(
            posterView,
            textView
        )
        
        textView.addSubviews(
            titleLabel,
            viewIconView,
            viewLabel,
            commentIconView,
            commentLabel
        )
    }
    
    private func setLayout() {
        posterView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            imageHeightConstraint = $0.height.equalTo(0).constraint
        }
        textView.snp.makeConstraints {
            $0.top.equalTo(posterView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(8)
        }
        viewIconView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().inset(9)
            $0.width.height.equalTo(12)
        }
        viewLabel.snp.makeConstraints {
            $0.centerY.equalTo(viewIconView.snp.centerY)
            $0.leading.equalTo(viewIconView.snp.trailing).offset(2)
        }
        commentIconView.snp.makeConstraints {
            $0.centerY.equalTo(viewLabel.snp.centerY).offset(1)
            $0.leading.equalTo(viewLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(12)
        }
        commentLabel.snp.makeConstraints {
            $0.centerY.equalTo(commentIconView.snp.centerY)
            $0.leading.equalTo(commentIconView.snp.trailing).offset(2)
        }
    }

    func configure(with type: CellType, image: UIImage?, title: String, viewNum: String, commentNum: String) {
        posterView.image = image
        titleLabel.attributedText = .sopt(title, style: .body0)
        viewLabel.attributedText = .sopt(viewNum, style: .caption3)
        commentLabel.attributedText = .sopt(commentNum, style: .caption3)
        imageHeightConstraint?.update(offset: type.imageHeight)
    }
}
