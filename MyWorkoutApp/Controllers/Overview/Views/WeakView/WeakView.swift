//
//  WeakView.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

final class WeakView: BaseView {
    //календарь - текущий
    private let calendar = Date.calendar
    private var stackView = UIStackView()
}

extension WeakView {
    override func setupViews() {
        super.setupViews()
        addView(stackView)
    }
    
    override func setupLayoutViews() {
        super.setupLayoutViews()
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        //получаем текущую неделю - с названиями недели в сокращенном формате (3 буквы)
        var weakdays = calendar.shortStandaloneWeekdaySymbols
        //достаем первый день недели
        if calendar.firstWeekday == 2 {
            //удаляем его
            let sun = weakdays.remove(at: 0)
            //добавляем в конец
            //что бы первым в календаре недил - был понедельник
            weakdays.append(sun)
        }
        //проходимся по массиву недель
        weakdays.enumerated().forEach { index, name in
            //конфигурируем новые view и добавляем их в стек
            let view = WeakDayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
        }
    }
    
}
