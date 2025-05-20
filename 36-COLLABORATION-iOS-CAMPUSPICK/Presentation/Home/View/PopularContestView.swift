//
//  PopularContestView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/19/25.
//

import UIKit
import SnapKit
import Then

final class PopularContestView: UIView {
    
    
    // MARK: - Properties
    
    private let titleLabel = UILabel().then {
        $0.attributedText = .sopt("인기 공모전", style: .heading1)
    }
    private lazy var contestCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.cellIdentifier)
        $0.delegate = self
        $0.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 155, height: 217)
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
    }
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setting Method
    
    private func setUI() {
        self.addSubviews(
            titleLabel,
            contestCollectionView
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(15)
        }
        contestCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(217)
        }
    }
}

extension CustomCell {
    func configure(with type: CellType = .small, model: ContestModel) {
        configure(
            with: type,
            image: model.image,
            title: model.title,
            viewNum: model.viewNum,
            commentNum: model.commentNum
        )
    }
}

extension PopularContestView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var contestList: [ContestModel] {
        return ContestModel.dummy()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contestList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.cellIdentifier, for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: .small, model: contestList[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 155, height: CellType.small.cellHeight)
    }
}
