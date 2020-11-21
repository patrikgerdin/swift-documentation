import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution
//PlaygroundPage.current.finishExecution()
import Foundation
/*:
 # DateFormatter
 
 Instances of [DateFormatter](https://developer.apple.com/documentation/foundation/dateformatter)
 create string representations of [NSDate](https://developer.apple.com/documentation/foundation/nsdate) objects, and convert textual representations of dates and
 times into NSDate objects. For user-visible representations of dates and times, DateFormatter
 provides a variety of localized presets and configuration options. For fixed format representations
 of dates and times, you can specify a custom format string.
 */
/*:
 ### Predefined DateFormatter
 
 - `Style`
 
    Predefined format styles for dates and times. The format for these date and time
    styles is not exact because they depend on the locale, user preference settings,
    and the operating system version. Do not use these constants if you want an exact
    format.
 
    - `none` (default)
    - `short` - such as "11/23/37" or "3:30 PM"
    - `medium` - such as "Nov 23, 1937" or "3:30:32 PM"
    - `long` - such as "November 23, 1937" or "3:30:32 PM PST"
    - `full` - such as "Tuesday, April 12, 1952 AD" or "3:30:42 PM Pacific Standard Time"
 */
let predefinedDF = DateFormatter()

predefinedDF.dateStyle = .full
predefinedDF.timeStyle = .full

let predefinedDateFormattedString: String = predefinedDF.string(from: UDateTime.currentDate)
/*:
 ### Custom DateFormatter
 
 For user-visible representations, you should use the `dateStyle` and `timeStyle` properties, or the `setLocalizedDateFormatFromTemplate(_:)` method if your desired format cannot be achieved using the
 predefined styles, both of these properties and this method provide a localized date representation
 appropriate for display to the user.
 */
let customDF = DateFormatter()

customDF.setLocalizedDateFormatFromTemplate("yyyy-MM-dd'T'HH:mm:ssZZZZZ")

let customDateFormattedString: String = customDF.string(from: UDateTime.currentDate)
/*:
 ### Fixed DateFormatter
 
 - `dateFormat`
 
    The date format string used, you should only set this property when working with fixed format
 representations, as discussed in [Working With Fixed Format Date Representations](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html#//apple_ref/doc/uid/TP40002369-SW1).
 */
let fixedDF = DateFormatter()

fixedDF.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

let fixedDateFormattedString: String = fixedDF.string(from: UDateTime.currentDate)
/*:
 ### Locale DateFormat
 
 Different locales have different conventions for the ordering of date components. You use this method
 to get an appropriate format string for a given set of components for a specified locale (typically
 you use the current locale).
 
 Returns a localized date format string representing the date format components given in template,
 arranged appropriately for the locale specified by locale. The returned string may not contain exactly
 those components given in template, but may, for example, have locale-specific adjustments applied.
 
 - `template`
 
    A string containing date format patterns (such as “MM” or “h”). For full details, see
    [Date and Time Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/DatesAndTimes/DatesAndTimes.html#//apple_ref/doc/uid/10000039i).
 
 - `options`
 
    No options are currently defined.
 
 - `locale`

    The locale for which the template is required.
 */
let USDateFormatTemplate: String? = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
                                                             options: 0,
                                                             locale: Locale(identifier: "en_US"))

let GBDateFormatTemplate: String? = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
                                                             options: 0,
                                                             locale: Locale(identifier: "en_GB"))
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
let contextDF = DateFormatter()

contextDF.dateStyle = .full
contextDF.timeStyle = .full
contextDF.locale = Locale(identifier: "fr_FR")
contextDF.formattingContext.rawValue
contextDF.formattingContext = .beginningOfSentence

let contextFormattedDateString: String = contextDF.string(from: UDateTime.currentDate)
/*:
 ### DateFormatter Attributes
 */
let attributesDF = DateFormatter()

attributesDF.calendar = .init(identifier: Calendar.Identifier.gregorian)
attributesDF.defaultDate = Date.init(timeIntervalSinceNow: 0)
attributesDF.locale = Locale(identifier: "en_GB")
attributesDF.timeZone
attributesDF.timeZone = TimeZone(secondsFromGMT: 0)
/*
 The twoDigitStartDate is earliest date that can be denoted by a two-digit year specifier. If the two-digit start date
 is set to January 6, 1976, then “January 1, 76” is interpreted as New Year's Day in 2076, whereas “February 14, 76”
 is interpreted as Valentine's Day in 1976. By default, this property is equal to December 31, 1949.
 */
attributesDF.twoDigitStartDate
/*
 The gregorianStartDate is the start date of the Gregorian calendar. This is used to specify the start date for the
 Gregorian calendar switch from the Julian calendar. Different locales switched at different times. Normally you
 should just accept the locale's default date for the switch.
 */
attributesDF.gregorianStartDate
/*:
 ### DateFormatter Behavior
 
 Constants that specify the behavior NSDateFormatter should exhibit.
 
 - default (0) - Specifies default formatting behavior.
 - behavior10_0 (1000) - Specifies formatting behavior equivalent to that in OS X 10.0.
 - behavior10_4 (1040) - Specifies formatting behavior equivalent for OS X 10.4.
 */
let behaviorDF = DateFormatter()

behaviorDF.dateStyle = .full
behaviorDF.timeStyle = .full
behaviorDF.formatterBehavior.rawValue
/*
 Returns the default formatting behavior for instances of the class. For iOS and for macOS applications
 linked against macOS 10.5 and later, the default is NSDateFormatterBehavior10_4.
 */
let defaultDateFormatterBehavior = DateFormatter.defaultFormatterBehavior
/*:
 ### Natural Language Support
 
 - `isLenient`
 
    A Boolean value that indicates whether the receiver uses heuristics (trial and error) when parsing a
    string. `true` if the receiver has been set to use heuristics when parsing a string to guess at the date
    which is intended, otherwise `false`.
    If a formatter is set to be lenient, when parsing a string it uses heuristics to guess at the date which
    is intended. As with any guessing, it may get the result date wrong (that is, a date other than that which
    was intended).
 
 - `doesRelativeDateFormatting`
 
    A Boolean value that indicates whether the receiver uses phrases such as "today" and "tomorrow" for the
    date component. `true` if the receiver uses relative date formatting, otherwise `false`. If a date formatter
    uses relative date formatting, where possible it replaces the date component of its output with a phrase, such
    as "today" or "tomorrow", that indicates a relative date. The available phrases depend on the locale for the
    date formatter, whereas, for dates in the future, English may only allow "tomorrow", French may allow "the day
    after the day after tomorrow", as illustrated in the following example.
 */
let naturalLanguageSupportDF = DateFormatter()

naturalLanguageSupportDF.dateStyle = .medium
naturalLanguageSupportDF.timeStyle = .none
naturalLanguageSupportDF.locale = Locale(identifier: UDateTime.LocaleIdentifier.svSE)
naturalLanguageSupportDF.isLenient
naturalLanguageSupportDF.doesRelativeDateFormatting = true

let naturalLanguageSupportFormattedDateString: String = naturalLanguageSupportDF.string(from: Date(timeIntervalSinceNow: 60 * 60 * 24 * 2))
/*:
 ### Symbols
 
 Get and set.
 */
let symbolsDF = DateFormatter()

symbolsDF.dateStyle = .full
symbolsDF.timeStyle = .full
symbolsDF.amSymbol
symbolsDF.pmSymbol
symbolsDF.weekdaySymbols
symbolsDF.shortWeekdaySymbols
symbolsDF.veryShortWeekdaySymbols
symbolsDF.standaloneWeekdaySymbols
symbolsDF.shortStandaloneWeekdaySymbols
symbolsDF.veryShortStandaloneWeekdaySymbols
symbolsDF.monthSymbols
symbolsDF.shortMonthSymbols
symbolsDF.veryShortMonthSymbols
symbolsDF.standaloneMonthSymbols
symbolsDF.shortStandaloneMonthSymbols
symbolsDF.veryShortStandaloneMonthSymbols
symbolsDF.quarterSymbols
symbolsDF.shortQuarterSymbols
symbolsDF.standaloneQuarterSymbols
symbolsDF.shortStandaloneQuarterSymbols
symbolsDF.eraSymbols
symbolsDF.longEraSymbols
/*:
 # ISO8601DateFormatter
 
 The [ISO8601DateFormatter](https://developer.apple.com/documentation/foundation/iso8601dateformatter) class generates and parses string representations of dates following the [ISO 8601](http://www.iso.org/iso/home/standards/iso8601) standard. Use this class to create ISO 8601 representations of dates and create dates from text strings in ISO 8601 format.
 */
// An ISO 8601 date formatter with default format, time zone, and options.
let iso8601DF = ISO8601DateFormatter()

// The time zone used to create and parse date representations. When unspecified, GMT is used.
iso8601DF.timeZone
/*:
 ### ISO8601DateFormatter.Options
 
 Options used to generate and parse ISO 8601 date representations.
 
 - `withYear`
 
    The date representation includes the year. The format for year is inferred based on the other specified options.
 
    - If `withWeekOfYear` is specified, YYYY is used.
    - Otherwise, yyyy is used.
 
 - `withMonth`
 
    The date representation includes the month. The format for month is MM.
 
 - `withWeekOfYear`
 
    The date representation includes the week of the year. The format for week of year is ww, including the W prefix.
 
 - `withDay`
 
    The date representation includes the day. The format for day is inferred based on provided options:
 
    - If withMonth is specified, dd is used.
    - If withWeekOfYear is specified, ee is used.
    - Otherwise, DDD is used.
 
 - `withTime`
 
    The date representation includes the time. The format for time is HH:mm:ss.
 
 - `withTimeZone`
 
    The date representation includes the timezone. The format for timezone is ZZZZZ.
 
 - `withSpaceBetweenDateAndTime`
 
    The date representation uses a space instead of T between the date and time.
 
 - `withDashSeparatorInDate`
 
    The date representation uses the dash separator (-) in the date.
 
 - `withColonSeparatorInTime`
 
    The date representation uses the colon separator (:) in the time.
 
 - `withColonSeparatorInTimeZone`
 
    The date representation uses the colon separator (:) in the time zone.
 
 - `withFullDate`
 
    The date representation includes the year, month, and day.
    Equivalent to specifying `withYear`, `withMonth`, and `withDay`.
 
 - `withFullTime`
 
    The date representation includes the hour, minute, and second.
 
 - `withInternetDateTime`
 
    The format used for internet date times, according to the [RFC 3339](https://www.ietf.org/rfc/rfc3339)
    standard. Equivalent to specifying `withFullDate`, `withFullTime`, `withDashSeparatorInDate`,
    `withColonSeparatorInTime`, and `withColonSeparatorInTimeZone`.
 
 - `withFractionalSeconds`
 */
iso8601DF.formatOptions = [.withInternetDateTime]
/*:
 ### string(from:timeZone:formatOptions)
 */
ISO8601DateFormatter.string(from: UDateTime.currentDate, timeZone: .current, formatOptions: [.withInternetDateTime])
/*:
 ### DateUtils stringFrom ISO8601 Date Tests
 */
func stringFromDateISO8601Tests() {
    
    UDateTime.stringFrom(UDateTime.currentDate,
                         options: [.withInternetDateTime],
                         timeZone: .current)
    
    UDateTime.stringFrom(UDateTime.currentDate,
                         options: [.withYear, .withMonth],
                         timeZone: TimeZone(secondsFromGMT: 0)!)
    
}

stringFromDateISO8601Tests()







func iso8601DateToString(_ date: Date = Date(), options: ISO8601DateFormatter.Options = [], timeZone: TimeZone? = TimeZone(secondsFromGMT: 0)) -> String {
    
    let df = ISO8601DateFormatter()
    
    df.formatOptions = options
    df.timeZone = timeZone
    
    return df.string(from: date)
    
}

iso8601DateToString(UDateTime.currentDate, options: [.withInternetDateTime, .withDay], timeZone: nil)

func iso8601StringToDate(_ string: String, options: ISO8601DateFormatter.Options = [], timeZone: TimeZone? = TimeZone(secondsFromGMT: 0)) -> Date? {
    
    let df = ISO8601DateFormatter()
    
    df.formatOptions = options
    df.timeZone = timeZone
    
    return df.date(from: string)
    
}









//do {
//    
//    print("\nISO8601 Date Formatter\n")
//    
//    let date = Date()
//    let iso8601 = "2019-02-28T06:33:11+00:00"
//    
//    let df = ISO8601DateFormatter()
//    
//    df.formatOptions = [.withInternetDateTime, .withDay]
//    //df.timeZone = TimeZone.current
//    
//    print("From Date: \(df.string(from: date))")
//    print("From String: \(String(describing: df.date(from: iso8601)))")
//    
//}
//
//
//do {
//    
//    print("\nISO8601 Date Formatter 2\n")
//    
//    // https://medium.com/@tjcarney89/using-dateformatter-to-format-dates-and-times-from-apis-57622ce11d04
//    
//    let df8601 = DateFormatter()
//    df8601.calendar = Calendar(identifier: Calendar.Identifier.iso8601)
//    df8601.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
//    
//    let df8601Formatted = DateFormatter()
//    //df8601Formatted.calendar = Calendar(identifier: Calendar.Identifier.iso8601)
//    df8601Formatted.dateFormat = "MMM dd"
//    
//    let iso8601DateString = df8601.string(from: Date())
//    print("\nISO8601 Date: \(iso8601DateString)")
//    
//    if let iso8601Date = df8601.date(from: iso8601DateString) {
//        print("iso8601Date: \(iso8601Date) ( string: \(df8601.string(from: iso8601Date)) )")
//    } else {
//        print("iso8601Date: nil")
//    }
//    
//    if let iso8601DateFormatted = df8601Formatted.date(from: iso8601DateString) {
//        print("iso8601DateFormatted: \(iso8601DateFormatted) ( string: \(df8601Formatted.string(from: iso8601DateFormatted)) )")
//    } else {
//        print("iso8601DateFormatted: nil")
//    }
//    
//}
//
//
//do {
//    
//    print("\nDate String Splitter\n")
//    
//    let str = "2017–04–02T13:10:00"
//    
//    let components = str.components(separatedBy: "T")
//    
//    print(components[0])
//    print(components[1])
//    
//}


/*:
 # UDateTime Tests
 
 Test the `UDateTime` utility object in the `Sources` folder.
 */
func uDateTimeTests() {
    
    // Predefined
    
    UDateTime.stringFrom(UDateTime.currentDate,
                         dateStyle: .full,
                         timeStyle: .full,
                         context: .dynamic,
                         relative: true,
                         lenient: false,
                         timeZone: .current,
                         locale: .current,
                         calendar: .current)
    
    UDateTime.stringFrom(UDateTime.currentDate,
                         dateStyle: .full,
                         timeStyle: .full,
                         locale: Locale(identifier: UDateTime.LocaleIdentifier.svSE))
    
    UDateTime.stringFrom(UDateTime.currentDate,
                         dateStyle: .full,
                         timeStyle: .full,
                         locale: Locale(identifier: UDateTime.LocaleIdentifier.enUS))
    
    // Template
    
    UDateTime.stringFrom(UDateTime.currentDate.addingTimeInterval(80000),
                         template: UDateTime.DateFormatTemplate.USShortDate,
                         context: .dynamic,
                         relative: true,
                         lenient: false,
                         timeZone: .current,
                         locale: .current,
                         calendar: .current)
    
    UDateTime.stringFrom(UDateTime.currentDate,
                         template: UDateTime.DateFormatTemplate.shortDate,
                         locale: Locale(identifier: UDateTime.LocaleIdentifier.svSE))
    
    UDateTime.stringFrom(UDateTime.currentDate,
                         template: UDateTime.DateFormatTemplate.fullEra,
                         locale: Locale(identifier: UDateTime.LocaleIdentifier.svSE))
    
    UDateTime.stringFrom(UDateTime.currentDate,
                         template: UDateTime.DateFormatTemplate.shortDate,
                         locale: Locale(identifier: UDateTime.LocaleIdentifier.enUS))
    
    UDateTime.stringFrom(UDateTime.currentDate,
                         template: UDateTime.DateFormatTemplate.fullEra,
                         locale: Locale(identifier: UDateTime.LocaleIdentifier.enUS))
    
    // Fixed Template
    
    UDateTime.stringFrom(UDateTime.currentDate.addingTimeInterval(80000),
                         fixedTemplate: UDateTime.DateFormatTemplate.USShortDate,
                         context: .dynamic,
                         relative: true,
                         lenient: false,
                         timeZone: .current,
                         locale: .current,
                         calendar: .current)
    
    UDateTime.stringFrom(UDateTime.currentDate,
                         fixedTemplate: UDateTime.DateFormatTemplate.rfc822,
                         locale: Locale(identifier: UDateTime.LocaleIdentifier.svSE))
    
    UDateTime.stringFrom(UDateTime.currentDate,
                         fixedTemplate: UDateTime.DateFormatTemplate.rfc822,
                         locale: Locale(identifier: UDateTime.LocaleIdentifier.enUS))
    
}

uDateTimeTests()
