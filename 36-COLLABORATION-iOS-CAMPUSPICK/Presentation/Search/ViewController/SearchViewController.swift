//
//  SearchViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/15/25.
//

import UIKit
import SnapKit
import Then

class SearchViewController: UIViewController {
    
    private var selectedDeadlineType: DeadlineType = .all
    private var selectedRegion: RegionType = .all
    private var selectedDay: DayType = .all

    
    // MARK: - Property
    
    private let clubHeaderView = ClubHeaderView(type: .withOutCategory)
    
    private let separatorLine = UIView().then {
        $0.backgroundColor = .gray4
    }

    private let recentView = RecentSearchView()
    
    private let popularView = PopularSearchView()

    private let adImageView = UIImageView().then {
        $0.image = .searchImgAd
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
    }
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        addTarget()
    }
    
    
    // MARK: - Set UI
    
    private func setStyle() {
        view.backgroundColor = .white
        view.addSubviews(clubHeaderView, separatorLine, recentView, popularView, adImageView)
    }
    
    private func setLayout() {
        clubHeaderView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(47)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(114)
        }
        
        separatorLine.snp.makeConstraints {
            $0.top.equalTo(clubHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        recentView.snp.makeConstraints {
            $0.top.equalTo(separatorLine.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(60)
        }
        
        popularView.snp.makeConstraints {
            $0.top.equalTo(recentView.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(99)
        }
        
        adImageView.snp.makeConstraints {
            $0.top.equalTo(popularView.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(80)
        }
    }
    
    
    // MARK: - Function
    
    private func addTarget() {
        clubHeaderView.filterButton.addTarget(self, action: #selector(openModal), for: .touchUpInside)
        clubHeaderView.onSearchIconTapped = { [weak self] keyword in
            guard let self else { return }
            let vc = SearchResultViewController(keyword: keyword)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc private func openModal() {
        let modalVC = SearchFilterModalViewController()
        modalVC.configure(deadline: selectedDeadlineType, region: selectedRegion, day: selectedDay)
        if let sheet = modalVC.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in return 454 })]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 15
        }
        present(modalVC, animated: true)
    }
}

extension SearchViewController: FilterDataBindDelegate {
    func filterDataBind(deadline: DeadlineType, region: RegionType, day: DayType) {
        self.selectedDeadlineType = deadline
        self.selectedRegion = region
        self.selectedDay = day
    }
}
