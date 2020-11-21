import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution
//PlaygroundPage.current.finishExecution()
import Foundation
/*:
 # TimeInterval
 
 ### typealias TimeInterval = Double
 
 A [TimeInterval](https://developer.apple.com/documentation/foundation/timeinterval) value is always specified in seconds.
 */
// Returns the interval between the receiver and another given date.
let timeIntervalBetweenDates = Date(timeIntervalSinceNow: UDateTime.CommonTimeInterval.now).timeIntervalSince(Date(timeIntervalSinceNow: -UDateTime.CommonTimeInterval.minute))

// The time interval between the date value and the current date and time.
let timeIntervalBetweenDateAndNow = Date(timeIntervalSinceNow: UDateTime.CommonTimeInterval.hour).timeIntervalSinceNow

// The interval between the date value and 00:00:00 UTC on 1 January 2001.
let timeIntervalBetweenDateAnd2001 = Date(timeIntervalSinceNow: UDateTime.CommonTimeInterval.now).timeIntervalSinceReferenceDate

// The interval between the date value and 00:00:00 UTC on 1 January 1970.
let timeIntervalBetweenDateAnd1970 = Date(timeIntervalSinceNow: UDateTime.CommonTimeInterval.hour).timeIntervalSince1970

// The interval between 00:00:00 UTC on 1 January 2001 and the current date and time.
let timeIntervalBetween2001AndNow = Date.timeIntervalSinceReferenceDate

// The number of seconds from 1 January 1970 to the reference date, 1 January 2001.
let timeIntervalBetween1970And2001 = Date.timeIntervalBetween1970AndReferenceDate


let timeIntervalBetweenNowAnd200Years = Date(timeIntervalSinceNow: Seconds.now).timeIntervalSince(Date(timeIntervalSinceNow: -UDateTime.CommonTimeInterval.year * 200))

let timeIntervalBetweenNowAndDistantPast = Date(timeIntervalSinceNow: Seconds.now).timeIntervalSince(Date(timeIntervalSinceNow: Date.distantPast.timeIntervalSinceNow))


print("Seconds since 1 minute ago: \(timeIntervalBetweenDates)")
print("Seconds since 1 hour ago: \(timeIntervalBetweenDateAndNow)")
print("Seconds since 2001: \(timeIntervalBetweenDateAnd2001)")
print("Seconds since 1970: \(timeIntervalBetweenDateAnd1970)")
print("Seconds since 2001: \(timeIntervalBetween2001AndNow)")
print("Seconds between 1970 and 2001: \(timeIntervalBetween1970And2001)\n")

print("\nHours between 1970 and 2001: \(timeIntervalBetween1970And2001 / UDateTime.CommonTimeInterval.hour)")
print("Days between 1970 and 2001: \(timeIntervalBetween1970And2001 / UDateTime.CommonTimeInterval.day)")
print("Weeks between 1970 and 2001: \(timeIntervalBetween1970And2001 / UDateTime.CommonTimeInterval.week)")
print("Months between 1970 and 2001: \(timeIntervalBetween1970And2001 / UDateTime.CommonTimeInterval.month)")
print("Years between 1970 and 2001: \(timeIntervalBetween1970And2001 / UDateTime.CommonTimeInterval.year)")
print("Decades between 1970 and 2001: \(timeIntervalBetween1970And2001 / UDateTime.CommonTimeInterval.decade)")
print("Centuries between 1970 and 2001: \(timeIntervalBetween1970And2001 / UDateTime.CommonTimeInterval.century)")
print("Centuries between now and 200 years: \(timeIntervalBetweenNowAnd200Years / UDateTime.CommonTimeInterval.century)")
print("Years between now and distant past: \(timeIntervalBetweenNowAndDistantPast / UDateTime.CommonTimeInterval.year)")
