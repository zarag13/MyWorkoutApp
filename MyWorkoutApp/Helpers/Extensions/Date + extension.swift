//
//  Date + extension.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import Foundation

extension Date {
    //создаем календарь
    static var calendar: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2
        return calendar
    }()
    
    //
    var startOfweak: Date {
        //номер текущей недели в году
        let components  = Date.calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        //какой день сейчас этой недели
        guard let firstDay = Date.calendar.date(from: components) else { return self }
        //вовзращаем этот день
        return Date.calendar.date(byAdding: .day, value: 0, to: firstDay) ?? self
    }
    
    //на сколько дней нужно подвинуться вперед
    func agoForward(to days: Int) -> Date {
        return Date.calendar.date(byAdding: .day, value: days, to: self) ?? self
    }
    
    //функция которая обрезаует текущий формат даты - предоставляя только день/год/месяц
    func stripTime()  -> Date {
        let components  = Date.calendar.dateComponents([.year, .month, .day], from: self)
        return Date.calendar.date(from: components) ?? self
    }
}
