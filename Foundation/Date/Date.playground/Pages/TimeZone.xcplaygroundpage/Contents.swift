import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution
//PlaygroundPage.current.finishExecution()
import Foundation
/*:
 # TimeZone
 
 A [TimeZone](https://developer.apple.com/documentation/foundation/timezone)
 defines the behavior of a time zone. Time zone values represent geopolitical regions.
 Consequently, these values have names for these regions. Time zone values also
 represent a temporal offset, either plus or minus, from Greenwich Mean Time (GMT) and
 an abbreviation (such as PST for Pacific Standard Time).
 
 TimeZone provides two static functions to get time zone values: `current` and
 `autoupdatingCurrent`. The autoupdatingCurrent time zone automatically tracks updates
 made by the user.
 
 Note that time zone database entries such as "America/Los_Angeles" are IDs, not names.
 An example of a time zone name is "Pacific Daylight Time". Although many TimeZone
 functions include the word "name", they refer to IDs.
 
 Cocoa does not provide any API to change the time zone of the computer, or of other
 applications.
 */
// The time zone currently used by the system, automatically updating to the user’s current preference.
TimeZone.autoupdatingCurrent

// The time zone currently used by the system.
TimeZone.current

// Returns an array of strings listing the identifier of all the time zones known to the system.
TimeZone.knownTimeZoneIdentifiers

// Returns the mapping of abbreviations to time zone identifiers.
TimeZone.abbreviationDictionary

// Returns a time zone initialized with a specific number of seconds from GMT.
let secondsFromGreenwichMeanTime: TimeZone? = TimeZone(secondsFromGMT: Int(UDateTime.CommonTimeInterval.hour * 2))
