//
//  Date + extension.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import Foundation

extension Date {
    //создаем календарь
    private var calendar: Calendar {
        return Calendar.current
    }
    
    //
    var startOfweak: Date {
        //номер текущей недели в году
        let components  = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        //какой день сейчас этой недели
        guard let firstDay = calendar.date(from: components) else { return self }
        //вовзращаем этот день
        return calendar.date(byAdding: .day, value: 1, to: firstDay) ?? self
    }
    
    //на сколько дней нужно подвинуться вперед
    func agoForward(to days: Int) -> Date {
        return calendar.date(byAdding: .day, value: days, to: self) ?? self
    }
    
    //функция которая обрезаует текущий формат даты - предоставляя только день/год/месяц
    func stripTime()  -> Date {
        let components  = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: components) ?? self
    }
}
