@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Calendar Month'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CalendarMonth'
@ObjectModel.usageType.dataClass: #META
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_CalendarMonth
	as select from dd07l as main
	
	association [0..*] to ZSNAP_F70G_CalendarMonthTxt as _Text on $projection.CalendarMonth = _Text.CalendarMonth
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Calendar Month'
	key cast (substring (main.domvalue_l, 1, 2) as calendarmonth) as CalendarMonth,
	_Text
}
where main.domname = 'KMONAT'
	and main.as4local = 'A'