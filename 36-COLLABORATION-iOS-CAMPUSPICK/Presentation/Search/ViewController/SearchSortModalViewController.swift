//
//  SearchSortModalViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class SearchSortModalViewController: UIViewController {
    
    enum SortOption: String, CaseIterable {
        case latest = "최신순"
        case popular = "인기순"
        case relevance = "관련도순"
        case distance = "거리순"
    }

    
    // MARK: - Property

    private var selectedOption: SortOption = .latest
    var onOptionSelected: ((SortOption) -> Void)?

    private lazy var tableView = UITableView().then {
        $0.register(SortOptionTableViewCell.self, forCellReuseIdentifier: SortOptionTableViewCell.identifier)
        $0.delegate = self
        $0.dataSource = self
        $0.isScrollEnabled = false
        $0.separatorStyle = .singleLine
        $0.rowHeight = 39
    }
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    // MARK: - Set UI
    
    private func setStyle() {
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.addSubviews(tableView)
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}


// MARK: - Extension

extension SearchSortModalViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SortOption.allCases.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SortOptionTableViewCell.identifier,
            for: indexPath
        ) as? SortOptionTableViewCell else {
            return UITableViewCell()
        }

        let option = SortOption.allCases[indexPath.row]
        cell.dataBind(option: option.rawValue, isSelected: option == selectedOption)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SearchSortModalViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = SortOption.allCases[indexPath.row]
        selectedOption = selected
        onOptionSelected?(selected)
        dismiss(animated: true)
    }
}
