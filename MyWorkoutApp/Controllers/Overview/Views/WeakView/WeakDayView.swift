//
//  WeakDayView.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

extension WeakView {
    final class WeakDayView: BaseView {
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        
        func configure(with index: Int, and name: String) {
            //получаем с помощью созданого раширения текущий день
            let startOfWeak = Date().startOfweak
            print("startOfWeak   - \(startOfWeak)")
            
            //тут будут поступать инексы недели с помощью которых мыф будем двигать ткущий день вперед и в итоге получим неделю
            let currentDay =  startOfWeak.agoForward(to: index)
            print("currentDay   - \(currentDay)")
            
            //получаем день по используемому индексу
            let day = Date.calendar.component(.day, from: currentDay)
            print("day   - \(day)")
            
            //узнаем равен ли текущий день и день который отрисовываем с использованием индекса
            let isToday = currentDay.stripTime() == Date().stripTime()
            backgroundColor = isToday ? Resources.Colors.actiy : Resources.Colors.backgroundViews
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isToday ? .white : Resources.Colors.inaActiy
            
            dateLabel.text = "\(day)"
            dateLabel.textColor = isToday ? .white : Resources.Colors.inaActiy
        }
    }
}

extension WeakView.WeakDayView {
    override func setupViews() {
        super.setupViews()
        
        addView(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
        
    }
    
    override func setupLayoutViews() {
        super.setupLayoutViews()
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        nameLabel.font = Resources.Founts.helvelticaRegular(with: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = Resources.Founts.helvelticaRegular(with: 15)
        dateLabel.textAlignment = .center
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
    
}
