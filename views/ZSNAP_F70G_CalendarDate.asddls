@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Date'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CalendarDate'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F70G_CalendarDate
	as select from scal_tt_date as main
{
	@EndUserText.label: 'Calendar Date'
	key main.calendardate as CalendarDate,
	
	@EndUserText.label: 'Calendar Year'
	main.calendaryear as CalendarYear,
	
	@EndUserText.label: 'Calendar Quarter'
	main.calendarquarter as CalendarQuarter,
	
	@EndUserText.label: 'Calendar Month'
	main.calendarmonth as CalendarMonth,
	
	@EndUserText.label: 'Calendar Week'
	main.calendarweek as CalendarWeek,
	
	@EndUserText.label: 'Calendar Day'
	main.calendarday as CalendarDay,
	
	@EndUserText.label: 'Year Month'
	main.yearmonth as YearMonth,
	
	@EndUserText.label: 'Year Quarter'
	main.yearquarter as YearQuarter,
	
	@EndUserText.label: 'Year And Calendar Week'
	main.yearweek as YearWeek,
	
	@EndUserText.label: 'Week Day'
	main.weekday as WeekDay,
	
	@EndUserText.label: 'First Day Of Week Date'
	main.firstdayofweekdate as FirstDayOfWeekDate,
	
	@EndUserText.label: 'First Day Of Month'
	main.firstdayofmonthdate as FirstDayOfMonthDate,
	
	@EndUserText.label: 'Last Day Of Month'
	main.lastdayofmonthdate as LastDayOfMonthDate,
	
	@EndUserText.label: 'Calendar Day Of Year'
	main.calendardayofyear as CalendarDayOfYear,
	
	@EndUserText.label: 'Day Of The Year'
	main.yearday as YearDay
}