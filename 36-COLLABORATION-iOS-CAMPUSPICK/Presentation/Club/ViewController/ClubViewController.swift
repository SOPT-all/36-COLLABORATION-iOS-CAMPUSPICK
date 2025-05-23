//
//  ClubViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

import UIKit

import SnapKit
import Then

final class ClubViewController: UIViewController {
    
    // MARK: - Property
    
    private let scrollview = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    private let contentView = UIView()
    private var headerView = ClubHeaderView(type: ClubHeaderType.withOutFilter)
    private let seperatorView1 = UIView().then {
        $0.backgroundColor = .gray4
    }
    private let popularLabel = UILabel().then {
        $0.attributedText = .sopt("인기 모집 공고", style: .heading1)
    }
    private var popularView = PopularClubView(frame: .zero, type: .big)
    private let seperatorView2 = UIView().then {
        $0.backgroundColor = .gray4
    }
    private var rankingView = RankingView()
    private let seperatorView3 = UIView().then {
        $0.backgroundColor = .gray4
    }
    private var findClubView = FindClubView()
    private var pageImage = UIImageView().then {
        $0.image = .pagination
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setUI()
        setLayout()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        Task {
            await fetchClubRanking()
            await fetchPopularClub()
            await fetchSearchResult()
        }
    }
    
    
    // MARK: - settting Method
    
    private func setUI() {
        self.view.addSubview(scrollview)
        scrollview.addSubview(contentView)
        contentView.addSubviews(headerView, seperatorView1, popularLabel, popularView, seperatorView2, rankingView, seperatorView3, findClubView, pageImage)
    }
    
    private func setLayout() {
        scrollview.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        seperatorView1.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom)
            $0.height.equalTo(7)
        }
        
        popularLabel.snp.makeConstraints {
            $0.top.equalTo(seperatorView1.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(35)
        }
        
        popularView.snp.makeConstraints {
            $0.top.equalTo(popularLabel.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(245)
        }
        
        seperatorView2.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(popularView.snp.bottom)
            $0.height.equalTo(7)
        }
        
        rankingView.snp.makeConstraints {
            $0.top.equalTo(seperatorView2.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(260)
        }
        
        seperatorView3.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(rankingView.snp.bottom)
            $0.height.equalTo(7)
        }
        
        findClubView.snp.makeConstraints {
            $0.top.equalTo(seperatorView3.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1350)
        }
        
        pageImage.snp.makeConstraints {
            $0.top.equalTo(findClubView.snp.bottom).offset(42)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(272)
            $0.height.equalTo(32)
            $0.bottom.equalToSuperview().inset(30)
        }
    }
    


}


// MARK: - NETWORK

extension ClubViewController {
    func fetchClubRanking() async {
        let result = await NetworkService.shared.clubService.getClubRanking()
        
        switch result {
        case .success(let data):
            if let clubs = data.data {
                Task {
                    self.rankingView.configureData(clubs)
                }
            } else {
                print("데이터가 없습니다")
            }
            
        case .failure(let error):
            print("❌ Error fetching club ranking: \(error)")
        }
    }
    
    func fetchPopularClub() async {
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
            popularView.update(with: clubModels)

        case .failure(let error):
            print("❌ 인기 클럽 로드 실패:", error)
        }
    }
    
    func fetchSearchResult() async {
        let result = await NetworkService.shared.clubService.searchClubs(title: "", category: "", deadlineType: "", region: "", clubDay: "")

        switch result {
        case .success(let data):
            print("✅ Club Ranking Data:")
            if let clubs = data.data {
                findClubView.searchData = clubs.map {SearchModel(from: $0)}
                DispatchQueue.main.async {
                    self.findClubView.searchTableView.reloadData()
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
