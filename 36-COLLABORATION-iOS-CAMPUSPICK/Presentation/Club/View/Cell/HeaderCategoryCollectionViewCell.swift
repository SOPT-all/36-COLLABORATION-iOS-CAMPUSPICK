//
//  HeaderCategoryCollectionViewCell.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

import UIKit

class HeaderCategoryCollectionViewCell: UICollectionViewCell {
    private let containerView = UIView().then {
        $0.layer.cornerRadius = 18
    }
    
    private let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.addSubviews(containerView)
        containerView.addSubview(title)
    }
    
    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func configure(title: String) {
        let tmpLabel : UILabel = UILabel()
        tmpLabel.text = title
        
        if title == "전체" {
            self.title.do {
                $0.attributedText = .sopt(title, style: .body1)
                $0.textColor = .white
                $0.backgroundColor = .mainBlue
            }
            
            self.containerView.do {
                $0.backgroundColor = .mainBlue
            }
        } else {
            self.title.do {
                $0.attributedText = .sopt(title, style: .body2)
                $0.textColor = .gray1
                $0.backgroundColor = .gray4
            }
            
            self.containerView.do {
                $0.backgroundColor = .gray4
            }
        }
    }
}
