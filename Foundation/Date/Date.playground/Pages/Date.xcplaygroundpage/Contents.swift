import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution
//PlaygroundPage.current.finishExecution()
import Foundation
/*:
 # Date
 
 A [Date](https://developer.apple.com/documentation/foundation/date) value encapsulate a single point in time, independent of any particular calendrical system or time zone. Date values represent a time interval relative to an absolute reference date.
 
 Date bridges to the [NSDate](https://developer.apple.com/documentation/foundation/nsdate) class.
 */
let currentDate: Date = Date()
let distantPastDate: Date = Date.distantPast
let distantFutureDate: Date = Date.distantFuture

// A date value initialized relative to the current date and time by a given number of seconds.
let dateSinceNow: Date = Date(timeIntervalSinceNow: Seconds.day)

// A date value initialized relative to January 1, 1970 at 00:00:00 UTC by a given number of seconds.
let dateSince1970: Date = Date(timeIntervalSince1970: Seconds.now)

// A date value initialized relative to January 1, 2001 at 00:00:00 UTC by a given number of seconds.
let dateSince2001: Date = Date(timeIntervalSinceReferenceDate: Seconds.now)

// A date value initialized relative to another given date by a given number of seconds.
let dateSinceDate: Date = Date(timeInterval: Seconds.hour, since: Date())
/*:
 ### Describing Dates
 */
// A textual description of the date value.
let dateDescription = Date().description

// Returns a string representation of the date using the given locale.
let dateDescriptionWithLocale = Date().description(with: Locale?.init(Locale.current))

// A textual description of the date suitable for debugging.
let dateDebugDescription = Date().debugDescription

// The computed hash value of the date.
let dateHashValue = Date().hashValue
/*:
 ### Comparing Dates
 
 Date conforms to Comparable protocol so you can simply use `<`, `<=`, `>`, `>=`, `==`, and `!=` to compare two dates.
 */
currentDate < dateSince2001
currentDate <= dateSince2001
currentDate > dateSince2001
currentDate >= dateSince2001
currentDate == currentDate
currentDate != currentDate
/*:
 Compares two date values, ComparisonResult: Constants that indicate sort order.
 These constants are used to indicate how items in a request are ordered, from the
 first one given in a method invocation or function call to the last (that is,
 left to right in code).
 */
let dateCompared: ComparisonResult = dateSince2001.compare(currentDate)
let dateComparedInt: Int = dateSince2001.compare(currentDate).rawValue
/*:
 ### Adding or Subtracting a TimeInterval
 */
var dateWithAddedTimeInterval: Date = currentDate + Seconds.hour
var dateWithSubtractedTimeInterval: Date = currentDate - Seconds.hour

dateWithAddedTimeInterval += Seconds.hour
dateWithAddedTimeInterval -= Seconds.hour

/*:
 Adds a time interval to this date. Warning This only adjusts an absolute value.
 If you wish to add calendrical concepts like hours, days, months then you must
 use a Calendar. That will take into account complexities like daylight saving
 time, months with different numbers of days, and more.
*/
dateWithAddedTimeInterval.addTimeInterval(Seconds.hour * 2)

// Creates a new date value by adding a time interval to this date.
let newDateWithAddedTimeInterval = Date().addingTimeInterval(Seconds.hour)
/*:
 ### Date Ranges
 */
let dateRange: Range<Date> = Date()..<Date(timeIntervalSinceNow: Seconds.hour)
let closedDateRange: ClosedRange<Date> = Date()...Date(timeIntervalSinceNow: Seconds.hour)
let partialDateRangeThrough: PartialRangeThrough<Date> = ...Date(timeIntervalSinceNow: Seconds.hour)
let partialDateRangeUpTo: PartialRangeUpTo<Date> = ..<Date(timeIntervalSinceNow: Seconds.hour)
