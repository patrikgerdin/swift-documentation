import Foundation


public struct UDateTime {
    
    
    
}

/* DATE */
public extension UDateTime {
    
    static let currentDate: Date = Date()
    
    static let distantPastDate: Date = Date.distantPast
    
    static let distantFutureDate: Date = Date.distantFuture
    
    /**
     Create a date from the specified amount of seconds since the current date.
     */
    static func date(secondsSinceNow seconds: TimeInterval) -> Date {
        return Date(timeIntervalSinceNow: seconds)
    }
    
    /**
     Create a date from the specified amount of seconds since 2001-01-01.
     */
    static func date(secondsSince2001 seconds: TimeInterval) -> Date {
        return Date(timeIntervalSinceReferenceDate: seconds)
    }
    
    /**
     Create a date from the specified amount of seconds since 1970-01-01.
     */
    static func date(secondsSince1970 seconds: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: seconds)
    }
    
    /**
     Create a date from the specified amount of seconds from a date.
     */
    static func date(secondsSince seconds: TimeInterval, date: Date) -> Date {
        return Date(timeInterval: seconds, since: date)
    }
    
    /**
     Create a date from date components.
     Example:
     date(DateComponents(calendar: Calendar(identifier: Calendar.Identifier.gregorian), year: 2020, ...))
     */
    static func date(_ components: DateComponents) -> Date? {
        let calendar: Calendar = components.calendar ?? .current
        return calendar.date(from: components)
    }
    
}

/* DATE INTERVAL */
public extension UDateTime {
    
    /**
     Get the date interval between the start date and the end date.
     */
    static func interval(from start: Date, to end: Date) -> DateInterval {
        return DateInterval(start: start, end: end)
    }
    
    /**
     Get the date interval between the start date and the specified amount of seconds.
     */
    static func interval(from start: Date, to duration: TimeInterval) -> DateInterval {
        return DateInterval(start: start, duration: duration)
    }
    
}

public extension UDateTime {
    
    /**
     Get the date components from the specified date (and optional specified calendar).
     Deafults to the current date, current calendar and the components: year, month, day, hour, minute, second.
     */
    static func components(_ components: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second],
                           calendar: Calendar = .current,
                           from date: Date = Date()) -> DateComponents {
         
        return calendar.dateComponents(components, from: date)
         
    }
    
}

public extension UDateTime {
    
    struct DateFormatTemplate {
        public static let iso8601 = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        public static let iso8601Zone = "yyyy-MM-dd'T'HH:mm:ss ZZZZ"
        public static let rfc822 = "EEE, dd MMM yyyy HH:mm:ss zzz"
        public static let rfc3339 = "yyyy-MM-dd HH:mm:ssZZZZZ"
        public static let shortDate = "MMMMd"
        public static let USShortDate = "dd/MM/yyyy"
        public static let fullEra = "EEEE d MMMM yyyy GGGG HH:mm:ss zzzz"
    }
    
    struct DateFormatTemplateExample {
        public static let timestamp = "1551335591"
        public static let iso8601 = "2020-10-14T23:33:11+00:00"
        public static let rfc822 = "Wed, 14 Oct 2020 23:33:11 EST"
        public static let rfc1036 = "Wed, 14 Oct 2020 23:33:11 +0000"
        public static let rfc1123 = "Wed, 14 Oct 2020 23:33:11 +0000"
        public static let rfc2822 = "Wed, 14 Oct 2020 23:33:11 +0000"
        public static let rfc2822UTC = "Wednesday, 14-Oct-20 23:33:11 UTC"
        public static let rfc3339 = "2020-10-14 23:33:11+02:00"
        public static let USShortDate = "14/10/2020"
        public static let time = "23:33:11"
        public static let timeAndZone = "23:33:11+02:00"
        public static let timeUTC = "23:33:11 UTC"
    }
    
    /* STRING FROM DATE ***************************************************/
    
    /// String from formatted Date defined by DateFormatter
    static func stringFrom(_ date: Date,
                           formatter: DateFormatter) -> String {
        
        return formatter.string(from: date)
        
    }
    
    /// String from system formatted Date
    static func stringFrom(_ date: Date,
                           dateStyle: DateFormatter.Style = .full,
                           timeStyle: DateFormatter.Style = .full,
                           context: Formatter.Context = .dynamic,
                           relative: Bool = false,
                           lenient: Bool = false,
                           timeZone: TimeZone = .current,
                           locale: Locale = .current,
                           calendar: Calendar = .current) -> String {
        
        let df = DateFormatter()
        df.dateStyle = dateStyle
        df.timeStyle = timeStyle
        df.formattingContext = context
        df.doesRelativeDateFormatting = relative
        df.isLenient = lenient
        df.timeZone = timeZone
        df.locale = locale
        df.calendar = calendar
        
        return df.string(from: date)
        
    }
    
    /// String from template formatted Date
    static func stringFrom(_ date: Date,
                           template: String = "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
                           context: Formatter.Context = .dynamic,
                           relative: Bool = false,
                           lenient: Bool = false,
                           timeZone: TimeZone = .current,
                           locale: Locale = .current,
                           calendar: Calendar = .current) -> String {
        
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate(template)
        df.formattingContext = context
        df.doesRelativeDateFormatting = relative
        df.isLenient = lenient
        df.timeZone = timeZone
        df.locale = locale
        df.calendar = calendar
        
        return df.string(from: date)
        
    }
    
    /// String from fixed template formatted Date
    static func stringFrom(_ date: Date,
                           fixedTemplate: String = "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
                           context: Formatter.Context = .dynamic,
                           relative: Bool = false,
                           lenient: Bool = false,
                           timeZone: TimeZone = .current,
                           locale: Locale = .current,
                           calendar: Calendar = .current) -> String {
        
        let df = DateFormatter()
        df.dateFormat = fixedTemplate
        df.formattingContext = context
        df.doesRelativeDateFormatting = relative
        df.isLenient = lenient
        df.timeZone = timeZone
        df.locale = locale
        df.calendar = calendar
        
        return df.string(from: date)
        
    }
    
    /// String from ISO8601 formatted Date defined by ISO8601DateFormatter
    static func stringFrom(_ date: Date,
                           iso8601Formatter: ISO8601DateFormatter) -> String {
        
        return iso8601Formatter.string(from: date)
        
    }
    
    /// String from ISO8601 formatted Date with options
    static func stringFrom(_ date: Date,
                           options: ISO8601DateFormatter.Options = [.withInternetDateTime],
                           timeZone: TimeZone = .current) -> String {
        
        let df = ISO8601DateFormatter()
        df.timeZone = timeZone
        
        return df.string(from: date)
        
    }
    
    /* DATE FROM STRING ***************************************************/
    
    /// Date from system formatted string
    static func dateFrom(_ string: String,
                           dateStyle: DateFormatter.Style = .full,
                           timeStyle: DateFormatter.Style = .full,
                           context: Formatter.Context = .dynamic,
                           relative: Bool = false,
                           lenient: Bool = false,
                           timeZone: TimeZone = .current,
                           locale: Locale = .current,
                           calendar: Calendar = .current) -> Date? {
        
        let df = DateFormatter()
        df.dateStyle = dateStyle
        df.timeStyle = timeStyle
        df.formattingContext = context
        df.doesRelativeDateFormatting = relative
        df.isLenient = lenient
        df.timeZone = timeZone
        df.locale = locale
        df.calendar = calendar
        
        return df.date(from: string)
        
    }
    
    /// Date from ISO8601 formatted string
    static func dateFrom(_ string: String,
                         options: ISO8601DateFormatter.Options = [.withInternetDateTime],
                         timeZone: TimeZone = .current) -> Date? {
        
        let df = ISO8601DateFormatter()
        df.formatOptions = options
        df.timeZone = timeZone
        
        return df.date(from: string)
        
    }
    
}

/* TIME INTERVAL */
public extension UDateTime {
    
    /// TimeInterval is always specified in seconds
    struct CommonTimeInterval {
        public static let now: TimeInterval = 0
        public static let nano: TimeInterval = 0.000000001
        public static let ms: TimeInterval = 0.001
        public static let second: TimeInterval = 1
        public static let minute: TimeInterval = 60
        public static let hour: TimeInterval = 3600
        public static let day: TimeInterval = 86_400
        public static let week: TimeInterval = 604_800
        public static let month: TimeInterval = 2_629_743.83
        public static let year: TimeInterval = 31_556_926
        public static let decade: TimeInterval = 10 * CommonTimeInterval.year
        public static let century: TimeInterval = 100 * CommonTimeInterval.year
        public static let millennium: TimeInterval = 1000 * CommonTimeInterval.year
    }
    
}

/* TIME ZONE */
public extension UDateTime {
    
    // The time zone currently used by the system.
    static let currentTimeZone: TimeZone = TimeZone.current
    
    // The time zone currently used by the system, automatically updating to the user’s current preference.
    static var currentDynamicTimeZone: TimeZone = TimeZone.autoupdatingCurrent
    
    // The geopolitical region identifier that identifies the time zone.
    static var currentTimeZoneIdentifier: String = currentDynamicTimeZone.identifier
    
    struct CommonTimeZoneAbbreviation {
        public static let GMT = "GMT"
        public static let UTC = "UTC"
        public static let Europe_London_BST = "BST"
        public static let Europe_Paris_CET = "CET"
        public static let Europe_Paris_CEST = "CEST"
        public static let Europe_Athens_EET = "EET"
        public static let Europe_Athens_EEST = "EEST"
        public static let America_NewYork_EDT = "EDT"
        public static let America_NewYork_EST = "EST"
        public static let America_LosAngeles_PDT = "PDT"
        public static let America_LosAngeles_PST = "PST"
        public static let Asia_HonKong_HKT = "HKT"
        public static let Asia_Tokyo_JST = "JST"
        public static let Asia_Bangkok_ICT = "ICT"
    }
    
}

/* Locale
 
 */
public extension UDateTime {
    
    // The user's region settings at the time the property is read.
    static let currentLocale: Locale = Locale.current
    
    // The user's region settings tracked (auto updating).
    static var currentDynamicLocale: Locale = Locale.autoupdatingCurrent
    
    // The identifier of the locale.
    static var currentLocaleIdentifier: String = currentDynamicLocale.identifier
    
    struct LocaleIdentifier {
        public static let enUSPOSIX = "en_US_POSIX"
        public static let enUS = "en_US"
        public static let enGB = "en_GB"
        public static let enSE = "en_SE"
        public static let svSE = "sv_SE"
        public static let nbNO = "nb_NO"
        public static let daDK = "da_DK"
        public static let isIS = "is_IS"
        public static let foFO = "fo_FO"
        public static let fiFI = "fi_FI"
        public static let deDE = "de_DE"
        public static let nlDE = "nl_DE"
        public static let frFR = "fr_FR"
        public static let esES = "es_ES"
        public static let jaJP = "ja_JP"
    }
    
}
