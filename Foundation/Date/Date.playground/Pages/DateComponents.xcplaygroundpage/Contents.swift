import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution
//PlaygroundPage.current.finishExecution()
import Foundation
/*:
 # DateComponents
 
 [DateComponents](https://developer.apple.com/documentation/foundation/datecomponents) is a date or time specified in terms of units (such as year, month, day, hour, and minute) to be evaluated in a calendar system and time zone.
 DateComponents encapsulates the components of a date in an extendable, structured manner.
 
 It is used to specify a date by providing the temporal components that make up a date and time in a
 particular calendar: hour, minutes, seconds, day, month, year, and so on. It can also be used to
 specify a duration of time, for example, 5 hours and 16 minutes. A DateComponents is not required
 to define all the component fields.
 
 When a new instance of DateComponents is created, the date components are set to nil.
 */
/*:
 ### Choose a calendar to use
 
 Most locales use the most widely used civil [Calendar](https://developer.apple.com/documentation/foundation/calendar)
 (see [NSCalendar](https://developer.apple.com/documentation/foundation/nscalendar) for more types of calendars),
 called the Gregorian calendar, but there are others used around the world. Some examples:
 
 - `current` - the current user’s chosen system locale
 - `gregorian`
 - `buddhist`
 - `japanese`
 - `indian`
 - `hebrew`
 - `chinese`
 - etc...
 */
let currentCalendar = Calendar.current
let gregorianCalendar = Calendar(identifier: Calendar.Identifier.gregorian)
let buddhistCalendar = Calendar(identifier: Calendar.Identifier.buddhist)
/*:
 ### Get components from date
 
 - `weekdayOrdinal`
 
    Weekday ordinal units represent the position of the weekday within the next larger
    calendar unit, such as the month. For example, 2 is the weekday ordinal unit for
    the second Friday of the month. This value is interpreted in the context of the
    calendar in which it is used.
 */
var currentCalendarDateComponents: DateComponents = currentCalendar.dateComponents([
    Calendar.Component.era,
    Calendar.Component.year,
    Calendar.Component.yearForWeekOfYear,
    Calendar.Component.quarter,
    Calendar.Component.month,
    Calendar.Component.weekOfYear,
    Calendar.Component.weekOfMonth,
    Calendar.Component.weekday,
    Calendar.Component.weekdayOrdinal,
    Calendar.Component.day,
    Calendar.Component.hour,
    Calendar.Component.minute,
    Calendar.Component.second,
    Calendar.Component.nanosecond,
    Calendar.Component.timeZone,
    Calendar.Component.calendar,
], from: UDateTime.currentDate)

currentCalendarDateComponents.era
currentCalendarDateComponents.year
// ...

currentCalendarDateComponents.value(for: Calendar.Component.era)
currentCalendarDateComponents.value(for: Calendar.Component.year)
// ...
/*:
 ### Set value for a component
 */
currentCalendarDateComponents.setValue(2021, for: Calendar.Component.year)
/*:
 ### Create a date from components
 */
var dateAComponents: DateComponents = DateComponents()

dateAComponents.year = 2021
dateAComponents.month = 3
dateAComponents.day = 12
dateAComponents.hour = 21
dateAComponents.minute = 0
dateAComponents.second = 3

// Create the date
let dateA: Date? = currentCalendar.date(from: dateAComponents)

// Or...

let dateBComponents: DateComponents = DateComponents(calendar: .current,
                                                     timeZone: .current,
                                                     era: 2,
                                                     year: 2019,
                                                     month: 2,
                                                     day: 28,
                                                     hour: 11,
                                                     minute: 43,
                                                     second: 0,
                                                     nanosecond: 0,
                                                     weekday: 4,
                                                     weekdayOrdinal: 3,
                                                     quarter: 0,
                                                     weekOfMonth: 5,
                                                     weekOfYear: 9,
                                                     yearForWeekOfYear: 2019)

// Create the date
let dateB: Date? = currentCalendar.date(from: dateBComponents)
/*:
 ### Validate the date of the components
 */
dateAComponents.isValidDate
dateAComponents.isValidDate(in: currentCalendar)
dateAComponents.isLeapMonth
/*:
 ### Compare components
 */
dateAComponents == dateBComponents
dateAComponents.year == dateBComponents.year
dateAComponents != dateBComponents
dateAComponents.year != dateBComponents.year
/*:
 # DateComponentsFormatter
 
 An [DateComponentsFormatter](https://developer.apple.com/documentation/foundation/datecomponentsformatter) object takes quantities of time and formats them as a user-readable string.
 Use a date components formatter to create strings for your app’s interface. The formatter object
 has many options for creating both abbreviated and expanded strings. The formatter takes the
 current user’s locale and language into account when generating strings.
 
 To use this class, create an instance, configure its properties, and call one of its methods to
 generate an appropriate string. The properties of this class let you configure the calendar and
 specify the date and time units you want displayed in the resulting string.
 */
let formatter = DateComponentsFormatter()
/*:
 ### allowedUnits
 
 The bitmask of calendrical units such as day and month to include in the output string.
 The allowed calendar units are (other calendar units results in an exception):
 
 - `year`
 - `month`
 - `weekOfMonth`
 - `day`
 - `hour`
 - `minute`
 - `second`
 */
formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
/*:
 ### allowsFractionalUnits
 
 A Boolean indicating whether non-integer units may be used for values. Fractional units may be
 used when a value cannot be exactly represented using the available units. For example, if
 minutes are not allowed, the value "1h 30m" could be formatted as "1.5h".
 The default value of this property is `false`.
 */
formatter.allowsFractionalUnits = false
/*:
 ### unitsStyle
 
 The [DateComponentsFormatter.UnitsStyle](https://developer.apple.com/documentation/foundation/datecomponentsformatter/unitsstyle) configures the strings to use (if any) for unit
 names such as days, hours, minutes, and seconds. Use this property to specify whether you want
 abbreviated or shortened versions of unit names, for example, `hrs` instead of `hours`.
 
 All date and time values are localized and formatted according to the current user’s language preferences.
 The following table shows how the quantity of 9 hours, 41 minutes, and 30 seconds is displayed in the U.S. English locale for each style:
 
 - `spellOut` - "nine hours, forty-one minutes, thirty seconds"
 - `full` - "9 hours, 41 minutes, 30 seconds"
 - `short` - "9 hr, 41 min, 30 sec"
 - `brief` - "9hr 41min 30sec"
 - `abbreviated` - "9h 41m 30s"
 - `positional` (default) - "9:31:30"
 
 */
formatter.unitsStyle = .full
/*:
 ### allowsFractionalUnits
 
 A Boolean indicating whether non-integer units may be used for values. Fractional units may be
 used when a value cannot be exactly represented using the available units. For example, if
 minutes are not allowed, the value "1h 30m" could be formatted as "1.5h". The default value of
 this property is `false`.
 */
formatter.allowsFractionalUnits = false
/*:
 ### calendar
 
 The formatter uses the calendar in this property to format values that do not have an inherent
 calendar of their own. For example, the formatter uses this calendar when formatting an
 `TimeInterval` value. The default value of this property is the calendar returned by the
 `autoupdatingCurrent` method of NSCalendar. Setting this property to `nil` causes the formatter to
 use the Gregorian calendar with the `en_US_POSIX` locale.
 */
formatter.calendar
/*:
 ### collapsesLargestUnit
 
 A Boolean value indicating whether to collapse the largest unit into smaller units when a certain
 threshold is met. An example of when this property might apply is when expressing 63 seconds
 worth of time. When this property is set to true, the formatted value would be "63s". When the
 value of this property is false, the formatted value would be "1m 3s". The default value of this
 property is `false`.
 */
formatter.collapsesLargestUnit = false
/*:
 ### includesApproximationPhrase
 
 A Boolean value indicating whether the resulting phrase reflects an inexact time value. Setting the
 value of this property to `true` adds phrasing to output strings to reflect that the given time
 value is approximate and not exact. Using this property yields more correct phrasing than simply
 prepending the string "About" to an output string. The default value of this property is `false`.
 */
formatter.includesApproximationPhrase = false
/*:
 ### includesTimeRemainingPhrase
 
 A Boolean value indicating whether output strings reflect the amount of time remaining. Setting this
 property to true results in output strings like "30 minutes remaining". The default value of this
 property is `false`.
 */
formatter.includesTimeRemainingPhrase = false
/*:
 ### maximumUnitCount
 
 The maximum number of time units to include in the output string. Use this property to limit the number
 of units displayed in the resulting string. For example, with this property set to 2, instead of
 "1h 10m, 30s", the resulting string would be "1h 10m". Use this property when you are constrained for
 space or want to round up values to the nearest large unit. The default value of this property is `0`,
 which does not cause the elimination of any units.
 */
formatter.maximumUnitCount = 0
/*:
 ### zeroFormattingBehavior
 
 The [DateComponentsFormatter.ZeroFormattingBehavior](https://developer.apple.com/documentation/foundation/datecomponentsformatter/zeroformattingbehavior) is the formatting style for units whose value is 0.
 When the value for a particular unit is 0, the zero formatting behavior determines whether that value is
 retained or omitted from any resulting strings. For example, when the formatting behavior is dropTrailing,
 the value of one hour, ten minutes, and zero seconds would omit the mention of seconds. The default value
 of this property is `default`.
 
 - `default`
 
 The default formatting behavior. When using positional units, this behavior drops leading zeroes but pads middle and trailing values with zeros as needed. For example, with hours, minutes, and seconds displayed, the value for one hour and 10 seconds is “1:00:10”. For all other unit styles, this behavior drops all units whose values are 0. For example, when days, hours, minutes, and seconds are allowed, the abbreviated version of one hour and 10 seconds is displayed as “1h 10s”.
 
 - `dropLeading`
 
 The drop leading zeroes formatting behavior. Units whose values are 0 are dropped starting at the beginning of the sequence. Units continue to be dropped until a non-zero value is encountered. For example, when days, hours, minutes, and seconds are allowed, the abbreviated version of ten minutes is displayed as “10m 0s”.
 
 - `dropMiddle`
 
 The drop middle zero units behavior. Units whose values are 0 are dropped from anywhere in the middle of a sequence. For example, when days, hours, minutes, and seconds are allowed, the abbreviated version of one hour, zero minutes, and five seconds is displayed as “0d 1h 5s”.
 
 - `dropTrailing`
 
 The drop trailing zero units behavior. Units whose value is 0 are dropped starting at the end of the sequence. For example, when days, hours, minutes, and seconds are allowed, the abbreviated version of one hour is displayed as “0d 1h”.
 
 - `dropAll`
 
 The drop all zero units behavior. This behavior drops all units whose values are 0. For example, when days, hours, minutes, and seconds are allowed, the abbreviated version of one hour is displayed as “1h”.
 
 - `pad`
 
 The add padding zeroes behavior. This behavior pads values with zeroes as appropriate. For example, consider the value of one hour formatted using the positional and abbreviated unit styles. When days, hours, minutes, and seconds are allowed, the value is displayed as “0d 1:00:00” using the positional style, and as “0d 1h 0m 0s” using the abbreviated style.
 */
formatter.zeroFormattingBehavior = .default
/*:
 ### formattingContext
 
 The formatting context allows the formatter to apply appropriate capitalization depending on how the how
 the string will be used, and whether the locale makes capitalization distinctions.
 
 `enum Formatter.Context: Int`
 
 Use formatting [contexts](https://developer.apple.com/documentation/foundation/formatter/context) to specify where the result of formatting will appear, so that the formatter can
 provide the most appropriate result. For example, when formatting a date or date symbol for a French locale,
 you want the month name to be capitalized if it appears at the beginning of the sentence (“Juin est mon mois
 de naissance”), but not if it appears elsewhere (“Mon mois de naissance est juin”).
 
 If the formatting context isn't known ahead of time, specify `Formatter.Context.dynamic` to have the system
 determine the context automatically.
 
 - `unknown` - An unknown formatting context.
 - `dynamic` - A formatting context determined automatically at runtime.
 - `standalone` - The formatting context for stand-alone usage.
 - `listItem` - The formatting context for a list or menu item.
 - `beginningOfSentence` - The formatting context for the beginning of a sentence.
 - `middleOfSentence` - The formatting context for the middle of a sentence.
 */
formatter.formattingContext = .unknown
/*:
 ### referenceDate
 */
formatter.referenceDate = nil
/*:
 ### Get the formatted string
 */
/*:
 Returns a localized string based on the specified date components and style option.
 Use this convenience method to format a string using the default formatter values,
 with the exception of the unitsStyle value.
 */
DateComponentsFormatter.localizedString(from: dateAComponents, unitsStyle: .full)
/*:
 Returns a formatted string based on the specified date component information.
 Use this method to format date information that is already broken down into the
 component day and time values.
 */
formatter.string(from: dateAComponents)
/*:
 Returns a formatted string based on the date information in the specified object.
 An object containing the date and time information to format. The object in this parameter
 must be a `DateComponents` (`NSDateComponents`) object, if it is not, the method raises an
 exception. This parameter must not be `nil`.
 
 This method has the same behavior as the `string(from:)` method.
 */
formatter.string(for: dateAComponents)
/*:
 Returns a formatted string based on the specified number of seconds. This method formats
 the specified number of seconds into the appropriate units. For example, if the
 formatter allows the display of minutes and seconds, creating an abbreviated string for
 the value 70 seconds results in the string "1m 10s".
 */
formatter.string(from: 3600)
/*:
 Returns a formatted string based on the time difference between two dates. This method
 calculates the elapsed time between the startDate and endDate values and uses that
 information to generate the string. For example, if there is exactly one hour and ten
 minutes difference between the start and end dates, generating an abbreviated string
 would result in a string of "1h 10m".
 */
formatter.string(from: dateA!, to: dateB!)
/*:
 # UDateTime Tests
 
 Test the `UDateTime` utility object in the `Sources` folder.
 */
func uDateTimeTests() {
    
    let components = UDateTime.components([.calendar, .year, .timeZone, .yearForWeekOfYear],
                                          calendar: .current,
                                          from: UDateTime.currentDate)
    components.calendar
    components.year
    components.yearForWeekOfYear
    components.timeZone
    
    UDateTime.date(DateComponents(calendar: .current, year: 2020))
    UDateTime.date(DateComponents(calendar: .current, year: 2021, month: 3, day: 19, hour: 21, minute: 0))
    UDateTime.date(DateComponents(calendar: Calendar(identifier: Calendar.Identifier.gregorian), era: 1, year: 2020))
    UDateTime.date(DateComponents(calendar: Calendar(identifier: Calendar.Identifier.buddhist), era: 1, year: 2020))
    UDateTime.date(DateComponents(calendar: Calendar(identifier: Calendar.Identifier.chinese), era: 1, year: 2020))
    
    UDateTime.date(DateComponents(year: 2020, month: 3, day: 4, hour: 23, minute: 32, second: 33))
    
    UDateTime.date(DateComponents(calendar: .current,
                                  timeZone: TimeZone(abbreviation:
                                                        UDateTime.CommonTimeZoneAbbreviation.America_LosAngeles_PST),
                                  year: 2020,
                                  month: 3,
                                  day: 4,
                                  hour: 23,
                                  minute: 32,
                                  second: 33))
    
}

uDateTimeTests()



/*:
 ### -----------------------------------------------------
 */

func dateComponentsFormatterAllowedUnitsTests() {
    
    func convenienceFM(components: DateComponents, style: DateComponentsFormatter.UnitsStyle) -> String? {
        return DateComponentsFormatter.localizedString(from: components, unitsStyle: style)
    }

    func fmAllowAll(components: DateComponents, style: DateComponentsFormatter.UnitsStyle) -> String? {
        let fm = DateComponentsFormatter()
        fm.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
        fm.unitsStyle = style
        return fm.string(from: components)
    }

    func fmAllowDateTime(components: DateComponents, style: DateComponentsFormatter.UnitsStyle) -> String? {
        let fm = DateComponentsFormatter()
        fm.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        fm.unitsStyle = style
        return fm.string(from: components)
    }

    func fmAllowDate(components: DateComponents, style: DateComponentsFormatter.UnitsStyle) -> String? {
        let fm = DateComponentsFormatter()
        fm.allowedUnits = [.year, .month, .day]
        fm.unitsStyle = style
        return fm.string(from: components)
    }

    func fmAllowTime(components: DateComponents, style: DateComponentsFormatter.UnitsStyle) -> String? {
        let fm = DateComponentsFormatter()
        fm.allowedUnits = [.hour, .minute, .second]
        fm.unitsStyle = style
        return fm.string(from: components)
    }

    // -----

    let timeComponents = DateComponents(day: 5, hour: 13, minute: 20, second: 23)
    let dateComponents = DateComponents(year: 2020, month: 3, day: 5)
    let dateTimeComponents = DateComponents(year: 2020, month: 3, day: 5, hour: 13, minute: 20, second: 23)
    let eraComponents = DateComponents(era: 1, year: 2020, month: 3, day: 5, hour: 13, minute: 20, second: 23, nanosecond: 23)

    let date = UDateTime.date(eraComponents)!
    let datePlusHour = UDateTime.date(eraComponents)!.addingTimeInterval(UDateTime.CommonTimeInterval.hour)
    let datePlusDay = UDateTime.date(eraComponents)!.addingTimeInterval(UDateTime.CommonTimeInterval.day)
    let datePlusWeek = UDateTime.date(eraComponents)!.addingTimeInterval(UDateTime.CommonTimeInterval.week)
    let datePlusMonth = UDateTime.date(eraComponents)!.addingTimeInterval(UDateTime.CommonTimeInterval.month)
    let datePlusYear = UDateTime.date(eraComponents)!.addingTimeInterval(UDateTime.CommonTimeInterval.year)

    // -----

    convenienceFM(components: eraComponents, style: .spellOut)
    convenienceFM(components: eraComponents, style: .full)
    convenienceFM(components: eraComponents, style: .short)
    convenienceFM(components: eraComponents, style: .brief)
    convenienceFM(components: eraComponents, style: .abbreviated)
    convenienceFM(components: timeComponents, style: .positional) // ! only time allowed

    // -----
    
    fmAllowAll(components: dateTimeComponents, style: .spellOut)
    fmAllowAll(components: dateTimeComponents, style: .full)
    fmAllowAll(components: dateTimeComponents, style: .short)
    fmAllowAll(components: dateTimeComponents, style: .brief)
    fmAllowAll(components: dateTimeComponents, style: .abbreviated)
    fmAllowAll(components: timeComponents, style: .positional)
    
    // -----
    
    fmAllowDateTime(components: dateTimeComponents, style: .spellOut)
    fmAllowDateTime(components: dateTimeComponents, style: .full)
    fmAllowDateTime(components: dateTimeComponents, style: .short)
    fmAllowDateTime(components: dateTimeComponents, style: .brief)
    fmAllowDateTime(components: dateTimeComponents, style: .abbreviated)
    //fmAllowDateTime(components: timeComponents, style: .positional) // ! Do not work with date and time
    
    // -----
    
    fmAllowDate(components: dateComponents, style: .spellOut)
    fmAllowDate(components: dateComponents, style: .full)
    fmAllowDate(components: dateComponents, style: .short)
    fmAllowDate(components: dateComponents, style: .brief)
    fmAllowDate(components: dateComponents, style: .abbreviated)
    //fmAllowDate(components: timeComponents, style: .positional) // ! Do not work with date
    
    // -----
    
    fmAllowTime(components: timeComponents, style: .spellOut)
    fmAllowTime(components: timeComponents, style: .full)
    fmAllowTime(components: timeComponents, style: .short)
    fmAllowTime(components: timeComponents, style: .brief)
    fmAllowTime(components: timeComponents, style: .abbreviated)
    fmAllowTime(components: timeComponents, style: .positional)
    
}

dateComponentsFormatterAllowedUnitsTests()

// ******************************************************************

let fm = DateComponentsFormatter()

fm.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]

let d = UDateTime.components([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond], calendar: .current, from: UDateTime.date(DateComponents(era: 1, year: 2020, month: 3, day: 5, hour: 13, minute: 20, second: 23, nanosecond: 23))!)

fm.string(from: DateComponents(era: 1, year: 2020, month: 3, day: 5, hour: 13, minute: 20, second: 23, nanosecond: 23))

fm.string(from: UDateTime.date(d)!, to: UDateTime.date(d)!.addingTimeInterval(453600))
