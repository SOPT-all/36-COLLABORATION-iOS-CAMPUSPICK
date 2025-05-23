//
//  ClubHeaderView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

import UIKit

import SnapKit
import Then

class ClubHeaderView: UIView {
    private var headerTypeValue: ClubHeaderType?
    
    var onSearchIconTapped: ((String) -> Void)?

    // MARK: - Components
    
    private let backButtonContainerView = UIView().then {
        $0.isUserInteractionEnabled = true
    }
    
    private let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = .mainBlue
        $0.isUserInteractionEnabled = false
    }
    
    private let backButtonTitle = UILabel().then {
        $0.attributedText = .sopt("뒤로", style: .heading2)
        $0.textColor = .mainBlue
        $0.isUserInteractionEnabled = false
    }
    
    private let titleLabel = UILabel().then {
        $0.attributedText = .sopt("동아리", style: .heading1)
        $0.textColor = .mainBlue
    }
    
    private let myActivityLabel = UILabel().then {
        $0.attributedText = .sopt("내 활동", style: .heading2)
        $0.textColor = .mainBlue
    }

    private let searchContainerView = UIView().then {
        $0.backgroundColor = .gray4
        $0.layer.cornerRadius = 18
    }

    private lazy var searchIcon = UIButton().then {
        $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        $0.tintColor = .gray2
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(didTapSearchIcon), for: .touchUpInside)
    }

    private let searchTextField = UITextField().then {
        $0.attributedPlaceholder = .sopt("찾으시는 동아리가 있나요?", style: .body3)
        $0.attributedText = .sopt("", style: .body3)
        $0.font = .soptFont(.body3)
        $0.textColor = .black
    }
    
    let filterButton = UIButton().then {
        $0.setImage(.filterIcon, for: .normal)
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        .then {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            $0.collectionViewLayout = layout
            $0.register(HeaderCategoryCollectionViewCell.self, forCellWithReuseIdentifier: HeaderCategoryCollectionViewCell.cellIdentifier)
            $0.showsHorizontalScrollIndicator = false
        }
    
    
    // MARK: - Life Cycle

    init(type: ClubHeaderType) {
        self.headerTypeValue = type
        super.init(frame: .zero)
        
        setUI()
        setLayout()
        setDelegate()
        setAddTarget()
        headerType(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setting Method
    
    private func setUI() {
        self.addSubviews(backButtonContainerView, titleLabel, myActivityLabel, searchContainerView, filterButton, collectionView)
        
        backButtonContainerView.addSubviews(backButton, backButtonTitle)
        searchContainerView.addSubviews(searchIcon, searchTextField)
    }
    
    private func setLayout() {
        backButtonContainerView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(10)
            $0.width.equalTo(50)
            $0.height.equalTo(21)
        }

        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalTo(12)
            $0.height.equalTo(21)
        }

        backButtonTitle.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.trailing).offset(7)
            $0.centerY.equalTo(backButton)
        }

        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(10)
        }

        myActivityLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(10)
        }

        searchContainerView.snp.makeConstraints {
            $0.top.equalTo(backButtonContainerView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(15)
            
            if headerTypeValue == .withOutCategory {
                $0.trailing.equalToSuperview().inset(63)
            } else if headerTypeValue == .basic {
                $0.trailing.equalToSuperview().inset(63)
            } else {
                $0.trailing.equalToSuperview().inset(15)
            }
            
            $0.height.equalTo(38)
        }

        searchIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(18)
        }

        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalTo(searchIcon.snp.leading).offset(-10)
            $0.centerY.equalToSuperview()
        }
        
        filterButton.snp.makeConstraints {
            $0.leading.equalTo(searchContainerView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(15)
            $0.size.equalTo(38)
            $0.centerY.equalTo(searchContainerView)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchContainerView.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(30)
        }
    }
    
    private func setDelegate() {
        collectionView.do {
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setAddTarget() {
        backButtonContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonTapped)))
    }

    func setSearchKeyword(_ keyword: String) {
        searchTextField.text = keyword
    }
}

// MARK: - Method

extension ClubHeaderView {
    @objc private func backButtonTapped() {
        let vc = self.findViewController()
        vc?.navigationController?.popViewController(animated: true)
        print("뒤로 버튼 눌림")
    }
    
    func headerType(type: ClubHeaderType) {
        self.headerTypeValue = type
        switch type {
        case .withOutCategory:
            collectionView.isHidden = true
            collectionView.snp.removeConstraints()
        case .withOutFilter:
            filterButton.isHidden = true
            filterButton.snp.removeConstraints()
            searchTextField.isEnabled = false
            searchContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchBarTapped)))
        case .basic: break
        }
    }
    
    @objc private func searchBarTapped() {
        let vc = self.findViewController()
        vc?.navigationController?.pushViewController(SearchViewController(), animated: true)
        print("검색창 네비게이션 클릭")
    }
    
    @objc private func didTapSearchIcon() {
        let keyword = searchTextField.text ?? ""
        onSearchIconTapped?(keyword)
    }
}

// MARK: - Delegate & DataSource

extension ClubHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CategoryType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCategoryCollectionViewCell.cellIdentifier, for: indexPath)
                as? HeaderCategoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.configure(title: CategoryType.allCases[indexPath.item].title())
        return cell
    }
}

extension ClubHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let tmpLabel : UILabel = UILabel()
        tmpLabel.text = CategoryType.allCases[indexPath.item].title()
        return CGSize(width: Int(tmpLabel.intrinsicContentSize.width) + 10, height: 26)
    }
}
