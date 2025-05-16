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
    private let rankLabel = UILabel().then {
        $0.textColor = .mainBlue
    }
    
    private let clubNameLabel = UILabel().then {
        $0.attributedText = .sopt("", style: .body0)
        $0.textColor = .black
    }
    
    private let clubIntroduceLabel = UILabel().then {
        $0.attributedText = .sopt("", style: .caption5)
        $0.textColor = .gray2
    }
    
    private let clubImageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            $0.bottom.equalToSuperview().inset(10)
        }
        
        clubImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(57)
        }
    }
    
    
    // MARK: - Method

    func configure(item: ClubRankingModel) {
        self.rankLabel.text = item.id.description
        self.clubNameLabel.text = item.clubName
        self.clubIntroduceLabel.text = item.clubIntroduce
        self.clubImageView.image = UIImage(named: item.clubImage)
    }
    
}
