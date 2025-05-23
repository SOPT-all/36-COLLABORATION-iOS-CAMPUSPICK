//
//  FindClubView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

import UIKit

import SnapKit
import Then

class FindClubView: UIView {
    
    // MARK: - Property

    private var filterbuttonToggle: Bool = false
    var searchData: [SearchModel] = []

    
    // MARK: - Components

    private let titleLabel = UILabel().then {
        $0.attributedText = .sopt("동아리 탐색", style: .heading1)
        $0.textColor = .black
    }
    
    private let filterLabel = UILabel().then {
        $0.attributedText = .sopt("마감된 공고 제외", style: .caption2)
        $0.textColor = .black
    }
    
    private let filterButton = UIButton().then {
        $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .gray2
    }
    
    private let seperator = UIView().then {
        $0.backgroundColor = .gray2
    }
    
    private let localLabel = UILabel().then {
        $0.attributedText = .sopt("지역", style: .caption2)
        $0.textColor = .black
    }
    
    private let localButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        $0.tintColor = .gray2
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
    private let bottomSheetLabel = UILabel().then {
        $0.attributedText = .sopt("최신순", style: .caption2)
        $0.textColor = .black
    }
    
    private let bottomSheetButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        $0.tintColor = .gray2
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
    let searchTableView = UITableView(frame: .zero, style: .plain)
    
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setUI()
        setLayout()
        setAddTarget()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setting Method

    private func setUI() {
        self.addSubviews(titleLabel, filterLabel, filterButton, seperator, localLabel, localButton, bottomSheetLabel, bottomSheetButton, searchTableView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(15)
        }
        
        filterLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(59)
            $0.centerY.equalTo(titleLabel)
        }
        
        filterButton.snp.makeConstraints {
            $0.leading.equalTo(filterLabel.snp.trailing).offset(3)
            $0.centerY.equalTo(titleLabel)
            $0.size.equalTo(16)
        }
        
        seperator.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(filterButton.snp.trailing).offset(10)
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        
        localLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(seperator.snp.trailing).offset(10)
        }
        
        localButton.snp.makeConstraints {
            $0.leading.equalTo(localLabel.snp.trailing).offset(3)
            $0.centerY.equalTo(titleLabel)
            $0.size.equalTo(12)
        }
        
        bottomSheetLabel.snp.makeConstraints {
            $0.trailing.equalTo(bottomSheetButton.snp.leading).offset(-3)
            $0.centerY.equalTo(titleLabel)
        }
        
        bottomSheetButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalTo(titleLabel)
            $0.size.equalTo(12)
        }
        
        searchTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        localButton.addTarget(self, action: #selector(localButtonTapped), for: .touchUpInside)
        bottomSheetButton.addTarget(self, action: #selector(bottomSheetButtonTapped), for: .touchUpInside)
    }

    private func setDelegate() {
        searchTableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorStyle = .none
            $0.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        }
    }
}


// MARK: - Method

extension FindClubView {
    @objc private func filterButtonTapped() {
        print("Filter button tapped")
        filterbuttonToggle.toggle()
        filterButton.tintColor = self.filterbuttonToggle ? .blue : .gray2
    }

    @objc private func localButtonTapped() {
        print("Local button tapped")
    }

    @objc private func bottomSheetButtonTapped() {
        print("Bottom sheet button tapped")
    }
}


extension FindClubView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 161
    }
}

extension FindClubView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        cell.dataBind(data: searchData[indexPath.row])
        return cell
    }
}
