//
//  ProgressController.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

class ProgressController : BaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Workout Progress"
        
        addNavBarButton(position: .right, title: "Export")
        addNavBarButton(position: .left, title: "Details")
    }
}

extension ProgressController {
    override func setupViews() {
        super.setupViews()
    }
    
    override func setupLayoutViews() {
        super.setupLayoutViews()
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
