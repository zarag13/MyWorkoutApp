//
//  SessionController.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

class SessionController : BaseController {
    
    private let timerView = TimerView()
    private let timerDuration = 3.0
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
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        navigationItem.title = "High Intensity Cardio"
        
        addNavBarButton(position: .left, title: Resources.Strings.Session.navBarStart)
        addNavBarButton(position: .right, title: Resources.Strings.Session.navBarStop)
        
        timerView.configure(with: timerDuration, progress: 0)
    }
    
    override func navBarLeftButtonHendler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
        }else{
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
        
        setTitleForNavBarButton(timerView.state == .isRuning ? Resources.Strings.Session.navBarPause : Resources.Strings.Session.navBarStart, at: .left)
    }
    
    override func navBarRightButtonHendler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        setTitleForNavBarButton(Resources.Strings.Session.navBarStart, at: .left)
    }
}
