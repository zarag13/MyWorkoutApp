//
//  TimerView.swift
//  MyWorkoutApp
//
//  Created by Kirill on 05.09.2023.
//

import UIKit

class TimerView: BaseInfoView {
    
    private let progressView: ProgressView = {
        let view = ProgressView()
        view.drawProgress(with: 0)
        return view
    }()
}

extension TimerView {
    override func setupViews() {
        super.setupViews()
        addView(progressView)
    }
    
    override func setupLayoutViews() {
        super.setupLayoutViews()
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        progressView.backgroundColor = .red.withAlphaComponent(0.2)
        
    }
}
