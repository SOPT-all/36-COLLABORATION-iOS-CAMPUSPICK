//
//  ClubViewController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

import UIKit

final class ClubViewController: UIViewController {
    private var headerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        self.view.addSubview(headerView)
    }
    
    private func setLayout() {
        
    }
    

}
