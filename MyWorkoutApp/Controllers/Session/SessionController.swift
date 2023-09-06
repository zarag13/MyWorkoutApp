//
//  SessionController.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

class SessionController : BaseController {
    
    private let timerView: TimerView = {
        let view = TimerView()
        
        return view
    }()
}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        view.addView(timerView)
    }
    
    override func setupLayoutViews() {
        super.setupLayoutViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        navigationItem.title = "High Intensity Cardio"
        
        addNavBarButton(position: .left, title: "Pause")
        addNavBarButton(position: .right, title: "Finish")
    }
}
