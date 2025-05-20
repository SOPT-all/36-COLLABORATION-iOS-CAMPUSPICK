//
//  SearchResultViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/14/25.
//

import UIKit
import SnapKit
import Then

class SearchResultViewController: UIViewController {
    
    private let searchData = SearchModel.dummy()
    
    
    // MARK: - Property
    
    private let searchTableView = UITableView(frame: .zero, style: .plain)
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        setDelegate()
    }
    
    
    // MARK: - Set UI
    
    private func setStyle() {
        view.backgroundColor = .white
        view.addSubview(searchTableView)
        searchTableView.contentInset.top = -15
    }
    
    private func setLayout() {
        searchTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
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


// MARK: - Extension

extension SearchResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 161
    }
}

extension SearchResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        cell.dataBind(data: searchData[indexPath.row])
        return cell
    }
}
