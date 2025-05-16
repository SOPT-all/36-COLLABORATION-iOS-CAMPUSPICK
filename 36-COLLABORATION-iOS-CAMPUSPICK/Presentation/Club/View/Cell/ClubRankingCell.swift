//
//  ClubRankingCell.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/16/25.
//

import UIKit

import SnapKit
import Then

class ClubRankingCell: UICollectionViewCell {
    
    // MARK: - Components

    private let rankLabel = UILabel().then {
        $0.textColor = .mainBlue
    }
    
    private let clubNameLabel = UILabel()
    
    private let clubIntroduceLabel = UILabel()
    
    private let clubImageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 27
    }
    
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setting Method

    private func setUI() {
        self.addSubviews(rankLabel, clubNameLabel, clubIntroduceLabel, clubImageView)
    }
    
    private func setLayout() {
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        clubNameLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(20)
            $0.top.equalToSuperview().inset(10)
        }
        
        clubIntroduceLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(20)
            $0.top.equalTo(clubNameLabel.snp.bottom).offset(6)
        }
        
        clubImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(57)
        }
    }
    
    
    // MARK: - Method

    func configure(item: ClubRankingModel) {
        self.rankLabel.attributedText = .sopt(item.id.description, style: .heading2)
        
        self.clubNameLabel.attributedText = .sopt(item.clubName, style: .body0)
        self.clubNameLabel.textColor = .black
        
        self.clubIntroduceLabel.attributedText = .sopt(item.clubIntroduce, style: .caption5)
        self.clubIntroduceLabel.textColor = .gray2
        
        self.clubImageView.image = UIImage(named: item.clubImage)
    }
    
}
