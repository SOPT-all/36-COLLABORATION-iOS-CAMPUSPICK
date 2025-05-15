//
//  SearchCollectionViewCell.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/14/25.
//

import UIKit
import SnapKit
import Then

class SearchTableViewCell: UITableViewCell {
    
    
    // MARK: - Property

    private let categoryLabel = UILabel().then {
        $0.textColor = .gray1
        $0.font = .soptFont(.caption5)
    }
    
    private let categoryContainerView = UIView().then {
        $0.backgroundColor = .gray4
        $0.layer.cornerRadius = 11
    }
    
    private let regionLabel = UILabel().then {
        $0.textColor = .gray1
        $0.font = .soptFont(.caption5)
    }
    
    private let regionContainerView = UIView().then {
        $0.backgroundColor = .gray4
        $0.layer.cornerRadius = 11
    }
    
    private let clubProfileImageView = UIImageView()
    
    private let clubNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .soptFont(.heading3)
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .soptFont(.body2)
        $0.numberOfLines = 0
    }
    
    private let imageImageView = UIImageView()
    
    private let dDayLabel = UILabel().then {
        $0.textColor = .mainBlue
        $0.font = .soptFont(.caption4)
    }
    
    private let viewCountImageView = UIImageView().then {
        $0.image = .viewIcon
    }
    
    private let viewCountLabel = UILabel().then {
        $0.textColor = .gray2
        $0.font = .soptFont(.caption3)
    }
    
    private let commentCountImageView = UIImageView().then {
        $0.image = .commentIcon
    }
    
    private let commentCountLabel = UILabel().then {
        $0.textColor = .gray2
        $0.font = .soptFont(.caption3)
    }
    
    private let separatorLine = UIView().then {
        $0.backgroundColor = .gray4
    }
    
    private let space = UIView()
    
    // MARK: - In it
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Stack
    
    private lazy var captionStackView = UIStackView(arrangedSubviews: [categoryContainerView, regionContainerView]).then {
        $0.axis = .horizontal
        $0.spacing = 4
    }
    
    private lazy var viewCountStackView = UIStackView(arrangedSubviews: [viewCountImageView, viewCountLabel]).then {
        $0.axis = .horizontal
        $0.spacing = 2
        $0.alignment = .center
    }
    
    private lazy var commentCountStackView = UIStackView(arrangedSubviews: [commentCountImageView, commentCountLabel]).then {
        $0.axis = .horizontal
        $0.spacing = 2
        $0.alignment = .center
    }
    
    
    // MARK: - Set UI
    
    private func setStyle() {
        selectionStyle = .none
        addSubviews( captionStackView, clubProfileImageView, clubNameLabel, titleLabel, imageImageView, dDayLabel, viewCountStackView, commentCountStackView, separatorLine, space )
        categoryContainerView.addSubview(categoryLabel)
        regionContainerView.addSubview(regionLabel)
    }
    
    private func setLayout() {
        categoryLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8))
        }

        regionLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8))
        }
        
        captionStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(19)
        }
        
        clubProfileImageView.snp.makeConstraints {
            $0.top.equalTo(captionStackView.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(15)
            $0.width.height.equalTo(29)
        }
               
        clubNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(38.5)
            $0.leading.equalTo(clubProfileImageView.snp.trailing).offset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(clubProfileImageView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalTo(imageImageView.snp.leading).offset(5)
        }
        
        imageImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(77)
            $0.height.equalTo(109)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        dDayLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(15)
        }
        
        viewCountStackView.snp.makeConstraints {
            $0.top.equalTo(dDayLabel.snp.top)
            $0.leading.equalTo(dDayLabel.snp.trailing).offset(9)
        }
        
        commentCountStackView.snp.makeConstraints {
            $0.top.equalTo(dDayLabel.snp.top)
            $0.leading.equalTo(viewCountStackView.snp.trailing).offset(5)
        }
        
        separatorLine.snp.makeConstraints{
            $0.height.equalTo(2)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalTo(space.snp.top)
        }
        
        space.snp.makeConstraints{
            $0.size.equalTo(15)
            $0.bottom.equalToSuperview()
        }
    }
}


// MARK: - Extension

extension SearchTableViewCell {
    func dataBind(data: SearchModel) {
        categoryLabel.text = data.category
        regionLabel.text = data.region
        clubProfileImageView.image = data.clubProfileImage
        clubNameLabel.text = data.clubName
        titleLabel.text = data.title
        imageImageView.image = data.image
        dDayLabel.text = "D-\(data.dDay)"
        viewCountLabel.text = "\(data.viewCount)"
        commentCountLabel.text = "\(data.commentCount)"
    }
}
