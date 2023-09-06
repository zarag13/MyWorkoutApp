//
//  OverviewController.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

class OverviewController : BaseController {
    
    private let navBar = OverviewNavBar()
    
}

extension OverviewController {
    override func setupViews() {
        super.setupViews()
        view.addView(navBar)
    }
    
    override func setupLayoutViews() {
        super.setupLayoutViews()
        NSLayoutConstraint.activate([
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        navigationItem.title = "Overview"
        navigationController?.navigationBar.isHidden = true
    }
}
