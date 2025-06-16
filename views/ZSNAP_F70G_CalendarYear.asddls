@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Year'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CalendarYear'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_CalendarYear
	as select from scal_tt_year as main
{
	@EndUserText.label: 'Calendar Year'
	key main.calendaryear as CalendarYear,
	
	@EndUserText.label: 'Is Leap Year'
	main.isleapyear as IsLeapYear,
	
	@EndUserText.label: 'Number Of Days'
	main.numberofdays as NumberOfDays
}