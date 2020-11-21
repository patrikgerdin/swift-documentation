import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution
//PlaygroundPage.current.finishExecution()
import Foundation
/*:
 # DateInterval
 */
let currentDateComponents = UDateTime.components([.year, .month, .day, .hour, .minute, .second],
                                                 calendar: .current,
                                                 from: UDateTime.currentDate)

let pastDateComponents = UDateTime.components([.year, .month, .day, .hour, .minute, .second],
                                              calendar: .current,
                                              from: UDateTime.date(DateComponents(year: 2019, month: 3, day: 15, hour: 23, minute: 43, second: 0))!)

let futureDateComponents = UDateTime.components([.year, .month, .day, .hour, .minute, .second],
                                                calendar: .current,
                                                from: UDateTime.date(DateComponents(year: 2021, month: 3, day: 15, hour: 23, minute: 43, second: 0))!)

let todayDate: Date = UDateTime.date(currentDateComponents)!
let pastDate: Date = UDateTime.date(pastDateComponents)!
let futureDate: Date = UDateTime.date(futureDateComponents)!


let interval1 = UDateTime.interval(from: todayDate, to: futureDate)

let interval2 = UDateTime.interval(from: todayDate, to: Seconds.year)

print("\n\nDATE INTERVAL 1\n")

let dateInterval1 = DateInterval(start: pastDate, end: todayDate)

print("Interval: \t\t\t\(dateInterval1)")
print("Start: \t\t\t\t\(dateInterval1.start)")
print("End: \t\t\t\t\(dateInterval1.end)")
print("Duration: \t\t\t\(dateInterval1.duration / Seconds.year) years")



print("\n\nDATE INTERVAL 2\n")

let di2timef = DateFormatter()
di2timef.dateStyle = .none
di2timef.timeStyle = .short
di2timef.locale = Locale(identifier: "sv_SE")

let dateInterval2 = DateInterval(start: todayDate, duration: Seconds.hour)

print("Interval: \t\t\t\(dateInterval2)")
print("Start: \t\t\t\t\(di2timef.string(from: dateInterval2.start)) [\(dateInterval2.start)]")
print("End: \t\t\t\t\(di2timef.string(from: dateInterval2.end)) [\(dateInterval2.end)]")
print("Duration: \t\t\t\(dateInterval2.duration / Seconds.hour) hours")



print("\n\nDATE INTERVAL INTERSECTION\n")

print("Intersects: \t\t\(dateInterval1.intersects(dateInterval2))")
if dateInterval1.intersects(dateInterval2) {
    print("Intersections: \t\(dateInterval1.intersection(with: dateInterval2)!)")
}



print("\n\nDATE INTERVAL FORMATTER 1\n")

let dif1 = DateIntervalFormatter()
dif1.dateStyle = .full
dif1.timeStyle = .full

print("Calendar: \t\t\t\(dif1.calendar!)")
print("Time zone: \t\t\t\(dif1.timeZone!)")
print("Locale: \t\t\t\(dif1.locale!)")
print("Date style: \t\t\(dif1.dateStyle.rawValue)")
print("Time style: \t\t\(dif1.timeStyle.rawValue)")
print("Template: \t\t\t\(dif1.dateTemplate!)\n")

print("Interval: \t\t\t\(dif1.string(from: dateInterval2)!)")
print("Dates: \t\t\t\t\(dif1.string(from: pastDate, to: todayDate))")



print("\n\nDATE INTERVAL FORMATTER 2\n")

let dif2 = DateIntervalFormatter()
dif2.calendar = Calendar.init(identifier: Calendar.Identifier.ethiopicAmeteMihret)
dif2.timeZone = TimeZone(secondsFromGMT: Int(Seconds.hour))
dif2.locale = Locale(identifier: "de_DE")
dif2.dateTemplate = "yyyy MM dd hh:mm:ss"

print("Calendar: \t\t\t\(dif2.calendar!)")
print("Time zone: \t\t\t\(dif2.timeZone!)")
print("Locale: \t\t\t\(dif2.locale!)")
print("Date style: \t\t\(dif2.dateStyle.rawValue)")
print("Time style: \t\t\(dif2.timeStyle.rawValue)")
print("Template: \t\t\t\(dif2.dateTemplate!)\n")

print("Interval: \t\t\t\(dif2.string(from: dateInterval2)!)")
print("Dates: \t\t\t\t\(dif2.string(from: pastDate, to: todayDate))")













//do {
//
//
//    let calendar = Calendar.current
//
//
//
//    // Dates
//
//    print("\nDATES\n")
//
//    let df = DateFormatter()
//    df.dateStyle = .full
//    df.timeStyle = .full
//
//    let todayComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
//
//    var pastComponents = DateComponents()
//    pastComponents.calendar = .current
//    pastComponents.year = 2017
//    pastComponents.month = 3
//    pastComponents.day = 1
//    pastComponents.hour = 9
//    pastComponents.minute = 12
//    pastComponents.second = 19
//
//    let today = calendar.date(from: todayComponents)!
//    let pastDate = calendar.date(from: pastComponents)!
//
//    print("Todays date: \t\t\(df.string(from: today))")
//    print("Past date: \t\t\t\(df.string(from: pastDate))")
//
//
//
//    // Date interval 1
//
//    print("\n\nDATE INTERVAL 1\n")
//
//    let dateInterval1 = DateInterval(start: pastDate, end: today)
//
//    print("Interval: \t\t\t\(dateInterval1)")
//    print("Start: \t\t\t\t\(dateInterval1.start)")
//    print("End: \t\t\t\t\(dateInterval1.end)")
//    print("Duration: \t\t\t\(dateInterval1.duration / Seconds.year) years")
//
//
//
//    // Date interval 2
//
//    print("\n\nDATE INTERVAL 2\n")
//
//    let di2timef = DateFormatter()
//    di2timef.dateStyle = .none
//    di2timef.timeStyle = .short
//    di2timef.locale = Locale(identifier: "sv_SE")
//
//    let dateInterval2 = DateInterval(start: today, duration: Seconds.hour)
//
//    print("Interval: \t\t\t\(dateInterval2)")
//    print("Start: \t\t\t\t\(di2timef.string(from: dateInterval2.start)) [\(dateInterval2.start)]")
//    print("End: \t\t\t\t\(di2timef.string(from: dateInterval2.end)) [\(dateInterval2.end)]")
//    print("Duration: \t\t\t\(dateInterval2.duration / Seconds.hour) hours")
//
//
//
//    // Intersection
//
//    print("\n\nDATE INTERVAL INTERSECTION\n")
//
//    print("Intersects: \t\t\(dateInterval1.intersects(dateInterval2))")
//    if dateInterval1.intersects(dateInterval2) {
//        print("Intersections: \t\(dateInterval1.intersection(with: dateInterval2)!)")
//    }
//
//
//
//    // Date Interval Formatter 1
//
//    print("\n\nDATE INTERVAL FORMATTER 1\n")
//
//    let dif1 = DateIntervalFormatter()
//    dif1.dateStyle = .full
//    dif1.timeStyle = .full
//
//    print("Calendar: \t\t\t\(dif1.calendar!)")
//    print("Time zone: \t\t\t\(dif1.timeZone!)")
//    print("Locale: \t\t\t\(dif1.locale!)")
//    print("Date style: \t\t\(dif1.dateStyle.rawValue)")
//    print("Time style: \t\t\(dif1.timeStyle.rawValue)")
//    print("Template: \t\t\t\(dif1.dateTemplate!)\n")
//
//    print("Interval: \t\t\t\(dif1.string(from: dateInterval2)!)")
//    print("Dates: \t\t\t\t\(dif1.string(from: pastDate, to: today))")
//
//
//
//    // Date Interval Formatter 2
//
//    print("\n\nDATE INTERVAL FORMATTER 2\n")
//
//    let dif2 = DateIntervalFormatter()
//    dif2.calendar = Calendar.init(identifier: Calendar.Identifier.ethiopicAmeteMihret)
//    dif2.timeZone = TimeZone(secondsFromGMT: Int(Seconds.hour))
//    dif2.locale = Locale(identifier: "de_DE")
//    dif2.dateTemplate = "yyyy MM dd hh:mm:ss"
//
//    print("Calendar: \t\t\t\(dif2.calendar!)")
//    print("Time zone: \t\t\t\(dif2.timeZone!)")
//    print("Locale: \t\t\t\(dif2.locale!)")
//    print("Date style: \t\t\(dif2.dateStyle.rawValue)")
//    print("Time style: \t\t\(dif2.timeStyle.rawValue)")
//    print("Template: \t\t\t\(dif2.dateTemplate!)\n")
//
//    print("Interval: \t\t\t\(dif2.string(from: dateInterval2)!)")
//    print("Dates: \t\t\t\t\(dif2.string(from: pastDate, to: today))")
//
//}
