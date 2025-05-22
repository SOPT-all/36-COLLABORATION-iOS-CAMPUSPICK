//
//  SearchFilterModalViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

import UIKit
import SnapKit
import Then

protocol FilterDataBindDelegate: AnyObject {
    func filterDataBind(deadline: DeadlineType, region: RegionType, day: DayType)
}

final class SearchFilterModalViewController: UIViewController {
    
    weak var delegate: FilterDataBindDelegate?
    private var initialDeadline: DeadlineType = .all
    private var initialRegion: RegionType = .all
    private var initialDay: DayType = .all

    
    // MARK: - Property
    
    let deadlineView = FilterView<DeadlineType>(title: "마감 기한")
    let regionView = FilterView<RegionType>(title: "지역")
    let dayView = FilterView<DayType>(title: "활동 선호 요일")

    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        
        deadlineView.setSelected(option: initialDeadline)
        regionView.setSelected(option: initialRegion)
        dayView.setSelected(option: initialDay)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let selectedDeadline = deadlineView.selectedOption ?? .all
        let selectedRegion = regionView.selectedOption ?? .all
        let selectedDay = dayView.selectedOption ?? .all

        delegate?.filterDataBind(
            deadline: selectedDeadline,
            region: selectedRegion,
            day: selectedDay
        )
    }
    
    
    // MARK: - Set UI
    
    private func setStyle() {
        view.backgroundColor = .white
        view.addSubviews(deadlineView, regionView, dayView)
    }

    private func setLayout() {
        deadlineView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(34)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(99)
        }
        
        regionView.snp.makeConstraints {
            $0.top.equalTo(deadlineView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(135)
        }

        dayView.snp.makeConstraints {
            $0.top.equalTo(regionView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(99)
        }
    }
    
    
    // MARK: - Function
    
    func configure(deadline: DeadlineType, region: RegionType, day: DayType) {
        self.initialDeadline = deadline
        self.initialRegion = region
        self.initialDay = day
    }
}
