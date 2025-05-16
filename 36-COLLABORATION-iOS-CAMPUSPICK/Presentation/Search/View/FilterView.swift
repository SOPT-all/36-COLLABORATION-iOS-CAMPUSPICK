//
//  FilterView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class FilterView<T: FilterOptionType & RawRepresentable & CaseIterable>: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout where T.RawValue == String {

    private let keywords: [T] = T.allCases as! [T]

    private var selectedOption: T? {
        didSet {
            if let selected = selectedOption {
                UserDefaults.standard.set(selected.rawValue, forKey: "storageKey")
            }
        }
    }
    private var storageKey: String
    private var titleText: String
    
    // MARK: - Property
    
    private let titleLabel = UILabel().then {
        $0.text = "마감 기한"
        $0.font = .soptFont(.heading3)
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.collectionViewLayout = layout
        $0.dataSource = self
        $0.delegate = self
        $0.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.cellIdentifier)
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
    }

    // MARK: - Init
    
    init(title: String, storageKey: String) {
        self.titleText = title
        self.storageKey = storageKey
        super.init(frame: .zero)
        if let rawValue = UserDefaults.standard.string(forKey: storageKey),
           let savedOption = T(rawValue: rawValue) {
            selectedOption = savedOption
        }
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
    
    
    //  MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        keywords.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.cellIdentifier, for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(data: keywords[indexPath.item])
        
        if let selected = selectedOption,
           keywords[indexPath.item] == selected {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
            cell.isSelected = true
        }
        return cell
    }
}
