//
//  ClubHeaderView.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

import UIKit

import SnapKit
import Then

enum HeaderType {
    case withCategory
    case none
}

protocol ClubHeaderTypeProtocol: AnyObject {
    func headerType(type: HeaderType)
}

class ClubHeaderView: UIView, ClubHeaderTypeProtocol {
    private let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = .label
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
    }
    
    private func setLayout() {
        
    }

    

}


// MARK: - Method

extension ClubHeaderView {
    func headerType(type: HeaderType) {
        switch type {
        case .withCategory:
//            categoryButton.isHidden = false
        case .none:
//            categoryButton.isHidden = true
        }
    }
}
