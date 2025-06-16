@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Date'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F80G_CalendarDate
	as select from scal_tt_date as main
{
	key main.calendardate as CalendarDate,
	main.calendaryear as CalendarYear
}