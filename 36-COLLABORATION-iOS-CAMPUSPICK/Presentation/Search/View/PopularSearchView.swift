//
//  PopularSearchView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class PopularSearchView: UIView {

    private let keywords = ["전시회", "댄스", "밴드", "영상 제작", "영화", "야구", "여행 동아리"]

    
    // MARK: - Property
    
    private let titleLabel = UILabel().then {
        $0.text = "인기 검색어"
        $0.font = .soptFont(.heading3)
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.collectionViewLayout = layout
        $0.dataSource = self
        $0.delegate = self
        $0.register(PopularSearchCollectionViewCell.self, forCellWithReuseIdentifier: PopularSearchCollectionViewCell.cellIdentifier)
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
    }

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Set UI
    
    private func setStyle() {
        addSubviews(titleLabel, collectionView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}


// MARK: - Extension

extension PopularSearchView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        keywords.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSearchCollectionViewCell.cellIdentifier, for: indexPath) as? PopularSearchCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(data: keywords[indexPath.item])
        return cell
    }
}

extension PopularSearchView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

