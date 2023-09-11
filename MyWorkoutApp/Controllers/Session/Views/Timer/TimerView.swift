//
//  TimerView.swift
//  MyWorkoutApp
//
//  Created by Kirill on 05.09.2023.
//

import UIKit

enum TimerState {
    case isRuning
    case isPaused
    case isStopped
}

class TimerView: BaseInfoView {
    
    private let progressView =  ProgressView()
    
    private let elepsedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.elapsedTime
        label.font = Resources.Founts.helvelticaRegular(with: 14)
        label.textColor = Resources.Colors.inaActiy
        label.textAlignment = .center
        return label
    }()
    private let elepsedTimeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "02:15"
        label.font = Resources.Founts.helvelticaRegular(with: 46)
        label.textColor = Resources.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.remainingTime
        label.font = Resources.Founts.helvelticaRegular(with: 13)
        label.textColor = Resources.Colors.inaActiy
        label.textAlignment = .center
        return label
    }()
    private let remainingTimeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "12:45"
        label.font = Resources.Founts.helvelticaRegular(with: 13)
        label.textColor = Resources.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let timeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()

    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    public var state: TimerState = .isStopped
    
    func configure(with duaration: Double, progress: Double) {
        timerDuration = duaration
        
        //прогресс и длительность в секундах - сколько секунд на заполнение поставили, столько секунд надо на 100% заполнение 
        let tempCurrentValue = progress > duaration ? duaration : progress
        let goalValueDevider = duaration == 0 ? 1 : duaration
        let percent = tempCurrentValue / goalValueDevider
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard self.timerProgress > 0 else { return }
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= 0.1
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
}

extension TimerView {
    override func setupViews() {
        super.setupViews()
        addView(progressView)
        addView(timeStackView)
        [
            elepsedTimeLabel,
            elepsedTimeValueLabel,
            remainingTimeLabel,
            remainingTimeValueLabel
        ].forEach { item in
            timeStackView.addArrangedSubview(item)
        }
    }
    
    override func setupLayoutViews() {
        super.setupLayoutViews()
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()        
    }
}
