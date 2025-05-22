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
    
    private var keyword: String
    private var selectedDeadlineType: DeadlineType = .all
    private var selectedRegion: RegionType = .all
    private var selectedDay: DayType = .all
    private var searchData: [SearchModel] = []
    
    init(keyword: String) {
        self.keyword = keyword
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    private let clubHeaderView = ClubHeaderView(type: .basic)
    
    private let separatorLine = UIView().then {
        $0.backgroundColor = .gray4
    }
    
    private let clubSortView = ClubSortView()
    
    private let searchTableView = UITableView(frame: .zero, style: .plain)
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        setDelegate()
        addTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        Task {
            await self.fetchSearchResult()
        }
    }
    
    
    // MARK: - Set UI
    
    private func setStyle() {
        view.backgroundColor = .white
        view.addSubviews(clubHeaderView, separatorLine, clubSortView, searchTableView)
    }
    
    private func setLayout() {
        clubHeaderView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(47)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        separatorLine.snp.makeConstraints{
            $0.top.equalTo(clubHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(7)
        }
        
        clubSortView.snp.makeConstraints{
            $0.top.equalTo(separatorLine.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(16)
        }
        
        searchTableView.snp.makeConstraints {
            $0.top.equalTo(clubSortView.snp.bottom).offset(25)
            $0.bottom.trailing.leading.equalToSuperview()
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
    
    
    // MARK: - Function
    
    private func addTarget() {
        clubHeaderView.filterButton.addTarget(self, action: #selector(openFilterModal), for: .touchUpInside)
        clubHeaderView.setSearchKeyword(keyword)
        clubHeaderView.onSearchIconTapped = { [weak self] keyword in
            guard let self = self else { return }
            self.keyword = keyword
            Task {
                await self.fetchSearchResult()
            }
        }
        clubSortView.bottomSheetButton.addTarget(self, action: #selector(openSortModal), for: .touchUpInside)
    }
    
    @objc private func openFilterModal() {
        let modalVC = SearchFilterModalViewController()
        modalVC.configure(deadline: selectedDeadlineType, region: selectedRegion, day: selectedDay)
        modalVC.delegate = self
        if let sheet = modalVC.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in return 454 })]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 15
        }
        present(modalVC, animated: true)
    }
    
    @objc private func openSortModal() {
        let modalVC = SearchSortModalViewController()
        if let sheet = modalVC.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in return 246 })]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 15
        }
        present(modalVC, animated: true)
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

extension SearchResultViewController: FilterDataBindDelegate {
    func filterDataBind(deadline: DeadlineType, region: RegionType, day: DayType) {
        self.selectedDeadlineType = deadline
        self.selectedRegion = region
        self.selectedDay = day
        Task {
            await self.fetchSearchResult()
        }
    }
}

// MARK: - NETWORK

extension SearchResultViewController {
    func fetchSearchResult() async {
        let result = await NetworkService.shared.clubService.searchClubs(title: keyword, category: nil, deadlineType: selectedDeadlineType.serverValue, region: selectedRegion.serverValue, clubDay: selectedDay.serverValue)

        switch result {
        case .success(let data):
            print("✅ Club Ranking Data:")
            if let clubs = data.data {
                self.searchData = clubs.map {SearchModel(from: $0)}
                DispatchQueue.main.async {
                    self.searchTableView.reloadData()
                }
                for club in clubs {
                    print("클럽 정보: \(club.clubInfo), \(club.recruitPost)")
                }
            } else {
                print("데이터가 없습니다")
            }

        case .failure(let error):
            print("❌ Error fetching club ranking: \(error)")
        }
    }
}
