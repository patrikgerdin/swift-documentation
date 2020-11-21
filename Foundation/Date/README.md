# Dates and Times

[developer.apple.com/dates-and-times](https://developer.apple.com/documentation/foundation/dates_and_times)

Compare dates and times, and perform calendar and time zone calculations.

<br>

## Date

<span style="color: #888;">struct</span>

A Date value encapsulate a single point in time, such as `January 1, 1970 at 00:00:00 UTC`, independent of any particular calendrical system or time zone. Date values represent a time interval relative to an absolute reference date.

The Date structure provides methods for comparing dates, calculating the time interval between two dates, and creating a new date from a time interval relative to another date. Use date values in conjunction with DateFormatter instances to create localized representations of dates and times and with Calendar instances to perform calendar arithmetic.

Date bridges to the `NSDate` class. You can use these interchangeably in code that interacts with Objective-C APIs.

<br>

### Date format patterns

A date pattern is a string of characters, where specific strings of characters are replaced with date and time data from a calendar when formatting or used to generate data for a calendar when parsing. See date format patterns at [unicode.org](http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns).

[help.sumologic.com/timestamps-time-zones-time-ranges-and-date-formats](https://help.sumologic.com/03Send-Data/Sources/04Reference-Information-for-Sources/Timestamps%2C-Time-Zones%2C-Time-Ranges%2C-and-Date-Formats)

- `yyyy.MM.dd G 'at' HH:mm:ss zzz` 1996.07.10 AD at 15:08:56 PDT  
- `EEE, MMM d, ''yy` Wed, July 10, '96  
- `h:mm a` 12:08 PM  
- `hh 'o''clock' a, zzzz`	 12 o'clock PM, Pacific Daylight Time  
- `K:mm a, z`	0:00 PM, PST
- `yyyyy.MMMM.dd GGG hh:mm aaa` 01996.July.10 AD 12:08 PM

Characters may be used multiple times. For example, if `y` is used for the year, `yy` might produce 99, whereas `yyyy` produces 1999. For most numerical fields, the number of characters specifies the field width. For example, if `h` is the hour, `h` might produce 5, but `hh` produces 05. For some characters, the count specifies whether an abbreviated or full form should be used, but may have other choices.

Two single quotes represents a literal single quote, either inside or outside single quotes. Text within single quotes is not interpreted in any way (except for two adjacent single quotes). Otherwise all ASCII letter from a to z and A to Z are reserved as syntax characters, and require quoting if they are to represent literal characters. In addition, certain ASCII punctuation characters may become variable in the future (eg `:` being interpreted as the time separator and `/` as a date separator, and replaced by respective locale-sensitive characters in display).

The counter-intuitive use of 5 letters for the narrow form of weekdays and months is forced by backwards compatibility.

#### Era

There are only two values for an era in a Gregorian calendar, "BC" and "AD". These values can be translated into other languages, like "a.C." and and "d.C." for Spanish, but there are no other eras in the Gregorian calendar. Other calendars have a different numbers of eras. Care should be taken when translating the era names for a specific calendar.

`GGGGG` Era string for the current date. One to three letters for the abbreviated form (AD), four letters for the long form (Anno Domini), five for the narrow form (A).

#### Year

`yyyy` Normally the length specifies the padding, but for two letters it also specifies the maximum length.

`YYYY` Year (of "Week of Year"), used in ISO year-week calendar. May differ from calendar year.

`u...` Extended year. This is a single number designating the year of this calendar system, encompassing all supra-year fields. For example, for the Julian calendar system, year numbers are positive, with an era of BCE or CE. An extended year value for the Julian calendar system assigns positive values to CE years and negative values to BCE years, with 1 BCE being year 0.

#### Quarter

`qqqq` Stand-Alone Quarter, use one or two for the numerical quarter (02), three for the abbreviation (Q2), or four for the full name (2nd quarter).

`QQQQ` Quarter, use one or two for the numerical quarter (02), three for the abbreviation (Q2), or four for the full name (2nd quarter).

#### Month

`MMMMM` Use one or two for the numerical month (09), three for the abbreviation (Sept), or four for the full name (September), or five for the narrow name (S).

`LLLLL` Stand-Alone Month, use one or two for the numerical month (09), three for the abbreviation (Sept), or four for the full name (September), or five for the narrow name (S).

#### Week

Values calculated for the Week of Year field range from 1 to 53 for the Gregorian calendar (they may have different ranges for other calendars). Week 1 for a year is the first week that contains at least the specified minimum number of days from that year. Weeks between week 1 of one year and week 1 of the following year are numbered sequentially from 2 to 52 or 53 (if needed). For example, January 1, 1998 was a Thursday. If the first day of the week is MONDAY and the minimum days in a week is 4 (these are the values reflecting ISO 8601 and many national standards), then week 1 of 1998 starts on December 29, 1997, and ends on January 4, 1998. However, if the first day of the week is SUNDAY, then week 1 of 1998 starts on January 4, 1998, and ends on January 10, 1998. The first three days of 1998 are then part of week 53 of 1997. 

Values are similarly calculated for the Week of Month.

`ww` Week of Year, one letter (1-53), two letters (01-53).

`W` Week of Month

#### Day

`dd` Date, Day of the month, one letter (5) or two letters (05).

`DDD` Day of year, one letter (5), two letters (05) or tree letters (005).

`F` Day of Week in Month (1-5).

`g...` Modified Julian day. This is different from the conventional Julian day number in two regards. First, it demarcates days at local zone midnight, rather than noon GMT. Second, it is a local number; that is, it depends on the local time zone. It can be thought of as a single number that encompasses all the date-related fields.

#### Weekday

`EEEEE` Use one through three letters for the short day (Tues), or four for the full name (Tuesday), or five for the narrow name (T).

`eeeee` Local day of week. One or two letters for a numeric value (2) that depends on the local starting day of the week. For this example, Monday is the first day of the week. Three letters for the short day (Tues), or four for the full name (Tuesday), or five for the narrow name (T).

`ccccc` Stand-Alone local day of week, use one letter for the local numeric value (2), three for the short day (Tues), or four for the full name (Tuesday), or five for the narrow name (T).

#### Period

Even for countries where the customary date format only has a 24 hour format, both the am and pm localized strings must be present and must be distinct from one another. Note that as long as the 24 hour format is used, these strings will normally never be used, but for testing and unusual circumstances they must be present.

`a` AM or PM.

#### Hour

`hh` One letter (1-12), two letters (01-12).

`HH` One letter (0-23), two letters (00-23).

`KK` One letter (0-11), two letters (00-11).

`kk` One letter (1-24), two letters (01-24).

#### Minute

`mm` One letter (0-59), two letters (00-59).

#### Second

`ss` One letter (0-59), two letters (00-59).

`S...` Fractional Second, rounds to the count of letters (12.34567 seconds).

`A...` Milliseconds in day. This field behaves exactly like a composite of all time-related fields, not including the zone fields. As such, it also reflects discontinuities of those fields on DST transition days. On a day of DST onset, it will jump forward. On a day of DST cessation, it will jump backward. This reflects the fact that is must be combined with the offset field to obtain a unique local time value.

#### Zone

`zzzz` Timezone display names, use one to three letters for the short timezone (PDT) or four for the full name (Pacific Daylight Time).

`ZZZZ` Use one to three letters for RFC 822 (-0800), four letters for GMT format (GMT-08:00).

`vvvv` Use one letter for short wall (generic) time (PT), four for long wall time (Pacific Time).

<br>


## DateFormatter

<span style="color: #888;">class : Formatter</span>

A formatter that converts between dates and their textual representations.
A formatter providing methods for converting from Date to String and from String to Date.
It also allows you to customize the representation of the date string using predefines styles or building your own format. It also supports localization.

Instances of DateFormatter create string representations of NSDate objects, and convert textual representations of dates and times into NSDate objects. For user-visible representations of dates and times, DateFormatter provides a variety of localized presets and configuration options. For fixed format representations of dates and times, you can specify a custom format string.



- [Date Formatting Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/DataFormatting/DataFormatting.html#//apple_ref/doc/uid/10000029i)
- [Date and Time Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/DatesAndTimes/DatesAndTimes.html#//apple_ref/doc/uid/10000039i)


#### Working with fixed format date representations

When working with fixed format dates, such as RFC 3339, you set the `dateFormat` property to specify a format string. For most fixed formats, you should also set the `locale` property to a POSIX locale `"en_US_POSIX"`, and set the `timeZone` property to UTC.

**Important**: Use the ISO8601DateFormatter class when working with ISO 8601 date representations.


#### DateFormatter.Style

<span style="color: #888;">enum : UInt</span>

Specifies predefined format styles for dates and times. The format for these date and time styles is not exact because they depend on the locale, user preference settings, and the operating system version. Do not use these constants if you want an exact format.

Based on the values of the `dateStyle` and `timeStyle` properties, DateFormatter provides a representation of a specified date that is appropriate for a given locale.

- `.none` No style.

- `.short` Typically numeric only, such as "11/23/37" or "3:30 PM".

- `.medium` Typically with abbreviated text, such as "Nov 23, 1937" or "3:30:32 PM".

- `.long` Typically with full text, such as "November 23, 1937" or "3:30:32 PM PST".

- `.full` Complete details, such as "Tuesday, April 12, 1952 AD" or "3:30:42 PM Pacific Standard Time".


#### dateFormat

The date format string used by the receiver. You should only set this property when working with fixed format representations. For user-visible representations, you should use the `dateStyle` and `timeStyle` properties, or the `setLocalizedDateFormatFromTemplate(_:)` method if your desired format cannot be achieved using the predefined styles, both of these properties and this method provide a localized date representation appropriate for display to the user.

The dateFormat property of the DateFormatter **MUST match the date format of the string**.


#### locale

The locale for the receiver.


#### timeZone

The time zone for the receiver. If unspecified, the system time zone is used.


#### setLocalizedDateFormatFromTemplate(_:)

Sets the date format from a template using the specified locale for the receiver. Calling this method is equivalent to, but not necessarily implemented as, setting the dateFormat property to the result of calling the dateFormat(fromTemplate:options:locale:) method, passing no options and the locale property value.

**Important**: You should call this method only after setting the locale of the receiver.

`dateFormatTemplate` A string containing date format patterns (such as “MM” or “h”).


#### date(from: String)

Returns a date representation of a given string interpreted using the receiver’s current settings. A date representation of string interpreted using the receiver’s current settings. If date(from:) can not parse the string, returns nil.


#### string(from: Date)

Returns a string representation of a given date formatted using the receiver’s current settings. A string representation of date formatted using the receiver’s current settings.


<br>


## ISO8601DateFormatter

<span style="color: #888;">class : Formatter</span>

A formatter that converts between dates and their ISO 8601 string representations. The ISO8601DateFormatter class generates and parses string representations of dates following the ISO 8601 standard. Use this class to create ISO 8601 representations of dates and create dates from text strings in ISO 8601 format.

By default, uses the GMT time zone, the RFC 3339 standard format `yyyy-MM-dd'T'HH:mm:ssZZZZZ`, and the following options: `withInternetDateTime`, `withDashSeparatorInDate`, `withColonSeparatorInTime`, and `withTimeZone`.

#### ISO 8601

ISO 8601 describes an internationally accepted way to represent dates and times using numbers. When dates are represented with numbers they can be interpreted in different ways. For example, 01/05/12 could mean January 5, 2012, or May 1, 2012. ISO 8601 tackles this uncertainty by setting out an internationally agreed way to represent dates:

YYYY-MM-DD

For example, September 27, 2012 is represented as 2012-09-27.

[ISO8601 Wiki](https://en.wikipedia.org/wiki/ISO_8601)


#### formatOptions

<span style="color: #888;">var</span>

Options for generating and parsing ISO 8601 date representations. The ISO 8601 specification allows for dates to be expressed in a variety of ways. You can configure the format used to parse and generate representations by specifying various combinations of format options.

[Options](https://developer.apple.com/documentation/foundation/iso8601dateformatter/1643324-formatoptions)


#### timeZone

<span style="color: #888;">func</span>

The time zone used to create and parse date representations. When unspecified, GMT is used. Resetting this property can incur a significant performance cost, as it may cause internal state to be regenerated.

<br>

## DateIntervalFormatter

<span style="color: #888;">class : Formatter</span>

A formatter that creates string representations of time intervals. An DateIntervalFormatter object creates user-readable strings from pairs of dates. Use a date interval formatter to create user-readable strings of the form _**start - end**_ for your app’s interface, where start and end are date values that you supply. The formatter uses locale and language information, along with custom formatting options, to define the content of the resulting string. You can specify different styles for the date and time information in each date value.

To use this class, create an instance, configure its properties, and call the `string(from:to:)` method to generate a string. The properties of this class let you configure the calendar and specify the style to apply to date and time values. Given a current date of January 16, 2015, Configuring the Formatter Options shows how to configure a formatter object and generate the string "1/16/15 - 1/17/15". The `string(from:to:)` method may be called safely from any thread of your app. It is also safe to share a single instance of this class from multiple threads, with the caveat that you should not change the configuration of the object while another thread is using it to generate a string.

Always set to the `dateStyle` and `timeStyle` properties to appropriate values before generating any strings.

<br>

## DateComponents

<span style="color: #888;">struct</span>

A date or time specified in terms of units (such as year, month, day, hour, and minute) to be evaluated in a calendar system and time zone. DateComponents encapsulates the components of a date in an extendable, structured manner. It is used to specify a date by providing the temporal components that make up a date and time in a particular calendar: hour, minutes, seconds, day, month, year, and so on. It can also be used to specify a duration of time, for example, 5 hours and 16 minutes. A DateComponents is not required to define all the component fields. When a new instance of DateComponents is created, the date components are set to nil.

<br>

## Calendar

<span style="color: #888;">struct</span>

A definition of the relationships between calendar units (such as eras, years, and weekdays) and absolute points in time, providing features for calculation and comparison of dates. Calendar encapsulates information about systems of reckoning time in which the beginning, length, and divisions of a year are defined. It provides information about the calendar and support for calendrical computations such as determining the range of a given calendrical unit and adding units to a given absolute time.

#### Calendar.Identifier

<span style="color: #888;">enum</span>

An enumeration for the available calendars.

- **iso8601**: Identifier for the ISO8601 calendar.
- **buddhist**: Identifier for the Buddhist calendar.
- **chinese**: Identifier for the Chinese calendar.
- **coptic**: Identifier for the Coptic calendar.
- **ethiopicAmeteAlem**: Identifier for the Ethiopic (Amete Alem) calendar.
- **ethiopicAmeteMihret**: Identifier for the Ethiopic (Amete Mihret) calendar.
- **gregorian**: Identifier for the Gregorian calendar.
- **hebrew**: Identifier for the Hebrew calendar.
- **indian**: Identifier for the Indian calendar.
- **islamic**: Identifier for the Islamic calendar.
- **islamicCivil**: Identifier for the Islamic civil calendar.
- **islamicTabular**: Identifier for the tabular Islamic calendar.
- **islamicUmmAlQura**: Identifier for the Islamic Umm al-Qura calendar, as used in Saudi Arabia.
- **japanese**: Identifier for the Japanese calendar.
- **persian**: Identifier for the Persian calendar.
- **republicOfChina**: Identifier for the Republic of China (Taiwan) calendar.


#### current

<span style="color: #888;">static var</span>

The user’s current calendar. This calendar does not track changes that the user makes to their preferences.

#### autoupdatingCurrent

<span style="color: #888;">static var</span>

A calendar that tracks changes to user’s preferred calendar. If mutated, this calendar will no longer track the user’s preferred calendar. The autoupdating Calendar will only compare equal to another autoupdating Calendar.

<br>

## DateInterval

<span style="color: #888;">struct : Codable</span>

The span of time between a specific start date and end date. DateInterval represents a closed date interval in the form of [startDate, endDate]. It is possible for the start and end dates to be the same with a duration of 0. DateInterval does not support reverse intervals i.e. intervals where the duration is less than 0 and the end date occurs earlier in time than the start date.

<br>

## TimeInterval

<span style="color: #888;">TypeAlias : Double</span>

A number of seconds. A TimeInterval value is always specified in seconds, it yields sub-millisecond precision over a range of 10,000 years. On its own, a time interval does not specify a unique point in time, or even a span between specific times. Combining a time interval with one or more known reference points yields a Date or DateInterval value.