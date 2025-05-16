//
//  MainHeaderView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class MainHeaderView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.attributedText = .sopt("캠퍼스픽", style: .heading0)
        $0.textColor = .mainBlue
    }
    
    private let alarmButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "bell")?.resizeImageTo(size: CGSize(width: 24, height: 24))
        $0.setImage(image, for: .normal)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Mark :- Setting Method
    
    private func setUI() {
        self.addSubviews(
            titleLabel,
            alarmButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
        }
        alarmButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}


extension UIImage {
    func resizeImageTo(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
