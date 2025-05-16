//
//  SearchFilterModalViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class SearchFilterModalViewController: UIViewController {

    
    // MARK: - Property
    
    let deadlineView = FilterView<DeadlineType>(title: "마감 기한")
    let regionView = FilterView<RegionType>(title: "지역")
    let dayView = FilterView<DayType>(title: "활동 선호 요일")

    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
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
}
