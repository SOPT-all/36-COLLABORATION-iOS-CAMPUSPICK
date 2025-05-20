//
//  RecentSearchView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class RecentSearchView: UIView {

    private let keywords = ["디자인", "IT", "개발", "밴드"]

    
    // MARK: - Property
    
    private let titleLabel = UILabel().then {
        $0.text = "최근 검색어"
        $0.font = .soptFont(.heading3)
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.collectionViewLayout = layout
        $0.dataSource = self
        $0.delegate = self
        $0.register(RecentSearchCollectionViewCell.self, forCellWithReuseIdentifier: RecentSearchCollectionViewCell.cellIdentifier)
        $0.showsHorizontalScrollIndicator = false
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

extension RecentSearchView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        keywords.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentSearchCollectionViewCell.cellIdentifier, for: indexPath) as? RecentSearchCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(data: keywords[indexPath.item])
        return cell
    }
}

extension RecentSearchView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}
