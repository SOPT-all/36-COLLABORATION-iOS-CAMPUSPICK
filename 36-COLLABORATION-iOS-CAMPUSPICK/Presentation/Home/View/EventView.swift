//
//  EventView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/19/25.
//

import UIKit
import SnapKit
import Then

final class EventView: UIView {
    
    
    // MARK: - Upper Bar Properties
    
    private let titleLabel = UILabel().then {
        $0.attributedText = .sopt("이벤트", style: .heading1)
    }
    
    private lazy var buttonView = UIView().then {
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moreButtonTap)))
    }
    private let buttonLabel = UILabel().then {
        $0.attributedText = .sopt("더 보기", style: .caption3)
        $0.isUserInteractionEnabled = false
        $0.textColor = .gray2
    }
    private let moreButton = UIButton().then {
        $0.setImage(.arrowSmall, for: .normal)
        $0.isUserInteractionEnabled = false
    }
    
    
    // MARK: - Cell Properties
    
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
        
        setDefault()
        setUI()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setting Method
    
    private func setDefault() {
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
    }
    
    private func setUI() {
        self.addSubviews(
            titleLabel,
            buttonView,
            scrollView,
            pageControl
        )
        buttonView.addSubviews(
            buttonLabel,
            moreButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(15)
        }
        buttonView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(40)
            $0.height.equalTo(12)
        }
        
        buttonLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        moreButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(310)
        }
        pageControl.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(24)
        }
        
        let pageViews: [EventPageView] = (0..<4).map { _ in
            EventPageView().then {
                $0.clipsToBounds = true
                $0.layer.cornerRadius = 6
            }
        }
        
        pageViews.enumerated().forEach { idx, view in
            scrollView.addSubview(view)
            view.snp.makeConstraints {
                $0.top.equalTo(scrollView).inset(13)
                $0.bottom.equalTo(scrollView)
                $0.width.equalTo(345)
                
                if idx == 0 {
                    $0.leading.equalTo(scrollView).offset(15)
                } else {
                    $0.leading.equalTo(pageViews[idx - 1].snp.trailing).offset(30)
                }
                
                if idx == pageViews.count - 1 {
                    $0.trailing.equalTo(scrollView).inset(15)
                }
            }
        }
    }
    
    
    // MARK: - Target Method
    
    @objc private func moreButtonTap() {
        print("더 보기 버튼 눌림!!")
    }
    
    @objc private func pageControlChanged(_ sender: UIPageControl) {
        let x = CGFloat(sender.currentPage) * scrollView.bounds.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
}


// MARK: - Extensions

extension EventView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ sv: UIScrollView) {
        let page = Int((sv.contentOffset.x + sv.bounds.width/2) / sv.bounds.width)
        pageControl.currentPage = page
    }
}

/// 특정 모서리만 둥글게 만드는 함수
extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}
