//
//  BannerView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/16/25.
//


import UIKit
import SnapKit
import Then

final class BannerView: UIView {
    
    
    // MARK: - Properties
    
    private let imageView1 = UIImageView().then {
        $0.image = .homeEduImage1
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    private let imageView2 = UIImageView().then {
        $0.image = .homeEduImage2
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    private let imageView3 = UIImageView().then {
        $0.image = .homeEduImage3
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    private let imageView4 = UIImageView().then {
        $0.image = .homeEduImage4
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    private lazy var imageViews = [imageView1, imageView2, imageView3, imageView4]
    
    private let scrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator   = false
        $0.alwaysBounceVertical = false
        $0.bounces = false
        $0.isDirectionalLockEnabled = true
    }
    private let pageControl = UIPageControl().then {
        $0.hidesForSinglePage = true
        $0.pageIndicatorTintColor = .lightGray
        $0.currentPageIndicatorTintColor = .mainBlue
        $0.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
    }
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        pageControl.numberOfPages = imageViews.count
        pageControl.currentPage = 0
        
        setUI()
        setLayout()
        
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setting Method
    
    private func setUI() {
        self.addSubviews(scrollView, pageControl)
        scrollView.addSubviews(imageView1, imageView2, imageView3, imageView4)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(36)
        }

        pageControl.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        imageViews.enumerated().forEach { idx, iv in
            iv.snp.makeConstraints {
                $0.top.equalTo(scrollView).inset(13)
                $0.bottom.equalTo(scrollView)
                $0.width.equalTo(345)
                if idx == 0 {
                    $0.leading.equalTo(scrollView).offset(15)
                } else {
                    $0.leading.equalTo(imageViews[idx-1].snp.trailing).offset(30)
                }
                if idx == imageViews.count - 1 {
                    $0.trailing.equalTo(scrollView).inset(15)
                }
            }
        }
    }
    
    
    // MARK: - Pagecontrol Action
    
    @objc private func pageControlChanged(_ sender: UIPageControl) {
        let x = CGFloat(sender.currentPage) * scrollView.bounds.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
}


// MARK: - UIScrollViewDelegate

extension BannerView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ sv: UIScrollView) {
        let page = Int((sv.contentOffset.x + sv.bounds.width/2) / sv.bounds.width)
        pageControl.currentPage = page
    }
}
