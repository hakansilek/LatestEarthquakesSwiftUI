//
//  Date.swift
//  LatestEarthquakesSwiftUI
//
//  Created by Hakan Silek on 17.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation

extension Date{
    func startOfMonth() -> String{
        return DateFormatter().getDay(date: getFirstDayOfMonth())
    }
    func endOfMonth() -> String{
        return DateFormatter().getDay(date:Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: getFirstDayOfMonth())!)
    }
    private func getFirstDayOfMonth() -> Date{
        var components = Calendar.current.dateComponents([.year,.month], from: self)
        components.day = 1
        let firstDateOfMonth: Date = Calendar.current.date(from: components)!
        return firstDateOfMonth
    }
}

extension DateFormatter{
    func getDay(date: Date) -> String{
        dateFormat = "yyyy-MM-dd"
        return self.string(from: date)
    }
}
