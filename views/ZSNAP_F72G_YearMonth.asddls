@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Year Month'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'YearMonth'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F72G_YearMonth
	as select from scal_tt_month as month
	
	inner join scal_tt_year as year on month.calendaryear = year.calendaryear
{
	@EndUserText.label: 'Year Month'
	key month.yearmonth as YearMonth,
	
	@EndUserText.label: 'Calendar Month'
	month.calendarmonth as CalendarMonth,
	
	@EndUserText.label: 'Calendar Year'
	month.calendaryear as CalendarYear,
	
	@EndUserText.label: 'Calendar Quarter'
	month.calendarquarter as CalendarQuarter,
	
	@EndUserText.label: 'Is Leap Year'
	year.isleapyear as IsLeapYear,
	
	@EndUserText.label: 'Number Of Days'
	month.numberofdays as NumberOfDays,
	
	@EndUserText.label: 'First Day Of Month'
	month.firstdayofmonthdate as FirstDayOfMonthDate,
	
	@EndUserText.label: 'Last Day Of Month'
	month.lastdayofmonthdate as LastDayOfMonthDate,
	
	@EndUserText.label: 'Half Year'
	month.halfyear as HalfYear
}