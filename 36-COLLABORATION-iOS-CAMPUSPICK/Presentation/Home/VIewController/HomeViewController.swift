//
//  HomeViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    private let service: HomeServiceProtocol = HomeService()
    
    // MARK: - Properties
    
    private let headerView = MainHeaderView()
    private let bannerView = BannerView()
    private let mainIconView = MainIconView()
    private let popularClubView = PopularClubView(frame: .zero, type: .small)
    private let popularActivityView = PopularActivityView()
    private let popularContestView = PopularContestView()
    private let eventView = EventView()
    private let titleLabel = UILabel().then {
        $0.attributedText = .sopt("인기 동아리", style: .heading1)
    }
    
    private let scrollView = UIScrollView()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        Task { @MainActor in
            await fetchHomeData()   
        }
    }
    
    
    // MARK: - Setting Method
    
    private func setUI() {
        view.addSubviews(
            headerView,
            scrollView
        )
        scrollView.addSubviews(
            bannerView,
            mainIconView,
            titleLabel,
            popularClubView,
            popularActivityView,
            popularContestView,
            eventView
        )
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(-29)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(24)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        bannerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(150)
            $0.width.equalTo(scrollView.snp.width)
        }
        mainIconView.snp.makeConstraints {
            $0.top.equalTo(bannerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
            $0.width.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(mainIconView.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(15)
        }
        popularClubView.snp.makeConstraints {
            $0.top.equalTo(mainIconView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(215)
            $0.width.equalToSuperview()
        }
        popularActivityView.snp.makeConstraints {
            $0.top.equalTo(popularClubView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(233)
            $0.width.equalToSuperview()
        }
        popularContestView.snp.makeConstraints {
            $0.top.equalTo(popularActivityView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(233)
            $0.width.equalToSuperview()
        }
        eventView.snp.makeConstraints {
            $0.top.equalTo(popularContestView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(370)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}


@MainActor
extension HomeViewController {
    func fetchHomeData() async {
        let clubResult = await NetworkService.shared.homeService.getPopularClubs()
        
        switch clubResult {
        case .success(let dto):
            let list = dto.data ?? []
            let clubModels: [ClubModel] = list.compactMap { (item: PopularData) -> ClubModel? in
                guard let uiImage = UIImage(named: item.image) else {
                    print("이미지 로드 실패:", item.image)
                    return nil    // Optional 반환이 가능
                }
                return ClubModel(
                    image: uiImage,
                    title: item.title,
                    viewNum: item.viewCount,
                    commentNum: item.commentCount
                )
            }
            popularClubView.update(with: clubModels)

        case .failure(let error):
            print("❌ 인기 클럽 로드 실패:", error)
        }

        let activityResult = await NetworkService.shared.homeService.getPopularActivities()
        
        switch activityResult {
        case .success(let dto):
            let list = dto.data ?? []
            let activityModels: [ActivityModel] = list.compactMap { (item: PopularData) -> ActivityModel? in
                guard let uiImage = UIImage(named: item.image) else { return nil }
                return ActivityModel(
                    image: uiImage,
                    title: item.title,
                    viewNum: item.viewCount,
                    commentNum: item.commentCount
                )
            }
            popularActivityView.update(with: activityModels)

        case .failure(let error):
            print("❌ 인기 활동 로드 실패:", error)
        }
    }
}
