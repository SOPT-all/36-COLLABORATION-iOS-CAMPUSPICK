//
//  RankingView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

import UIKit

import SnapKit
import Then

class RankingView: UIView {
    let mockData = ClubRankingModel.dummy()
    
    // MARK: - Components

    private let titleLabel = UILabel().then {
        $0.attributedText = .sopt("동아리 랭킹", style: .heading1)
        $0.textColor = .black
    }
    
    private let moreButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.titleLabel?.attributedText = .sopt("더보기", style: .body3)
        $0.setTitleColor(.gray2, for: .normal)
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        .then {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            $0.collectionViewLayout = layout
            $0.register(ClubRankingCell.self, forCellWithReuseIdentifier: ClubRankingCell.cellIdentifier)
            $0.showsHorizontalScrollIndicator = false
        }
    
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setting Method

    private func setUI() {
        self.addSubviews(titleLabel, moreButton, collectionView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(15)
        }
        
        moreButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(201)
            $0.width.equalTo(334)
        }
    }
    
    private func setDelegate() {
        collectionView.do {
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

// MARK: - Delegate & DataSource

extension RankingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClubRankingCell.cellIdentifier, for: indexPath)
                as? ClubRankingCell
        else {
            return UICollectionViewCell()
        }
        
        cell.configure(item: mockData[indexPath.row])
        return cell
    }
}

extension RankingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 334, height: 57)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
