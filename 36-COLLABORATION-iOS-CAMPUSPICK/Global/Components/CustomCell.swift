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
    private let dDayLabel = UILabel().then {
        $0.textColor = .gray2
    }
    
    private var imageHeightConstraint: Constraint?

    
    // MARK: - Life Cycle
    
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
    
    
    // MARK: - Setting Method

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
            commentLabel,
            dDayLabel
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
            $0.width.equalTo(150)
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
        dDayLabel.snp.makeConstraints {
            $0.height.equalTo(0)
            $0.width.equalTo(0)
        }
    }
    
    // MARK: - Configure Method
    
    func configure(with type: CellType, image: UIImage?, title: String, viewNum: Int, commentNum: Int, dDay: String? = nil) {
        posterView.image = image
        titleLabel.attributedText = .sopt(title, style: .body0)
        viewLabel.attributedText = .sopt("\(viewNum)", style: .caption3)
        commentLabel.attributedText = .sopt("\(commentNum)", style: .caption3)
        dDayLabel.attributedText = .sopt(dDay ?? "D-??", style: .caption4)
        imageHeightConstraint?.update(offset: type.imageHeight)

        switch type {
        case .small:
            imageHeightConstraint?.update(offset: CellType.small.imageHeight)
            
            dDayLabel.isHidden = true
            commentIconView.isHidden = false
            commentLabel.isHidden = false

            viewIconView.snp.remakeConstraints {
                $0.leading.equalToSuperview().offset(8)
                $0.bottom.equalToSuperview().inset(9)
                $0.size.equalTo(12)
            }

            viewLabel.snp.remakeConstraints {
                $0.centerY.equalTo(viewIconView)
                $0.leading.equalTo(viewIconView.snp.trailing).offset(2)
            }

            commentIconView.snp.remakeConstraints {
                $0.centerY.equalTo(viewIconView)
                $0.leading.equalTo(viewLabel.snp.trailing).offset(4)
                $0.size.equalTo(12)
            }

            commentLabel.snp.remakeConstraints {
                $0.centerY.equalTo(commentIconView)
                $0.leading.equalTo(commentIconView.snp.trailing).offset(2)
            }

        case .big:
            imageHeightConstraint?.update(offset: CellType.big.imageHeight)
            
            dDayLabel.isHidden = false
            commentIconView.isHidden = true
            commentLabel.isHidden = true

            dDayLabel.snp.remakeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(4)
                $0.leading.equalToSuperview().offset(8)
            }

            viewIconView.snp.remakeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(4)
                $0.leading.equalTo(dDayLabel.snp.trailing).offset(8)
                $0.size.equalTo(12)
            }

            viewLabel.snp.remakeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(4)
                $0.leading.equalTo(viewIconView.snp.trailing).offset(4)
            }
        }
    }
}
