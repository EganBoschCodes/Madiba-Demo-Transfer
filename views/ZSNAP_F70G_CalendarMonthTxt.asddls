@EndUserText.label: 'Calendar Month Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'CalendarMonth'
@ObjectModel.usageType.dataClass: #META
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_CalendarMonthTxt
	as select from dd07t as main
{
	key cast (substring (main.domvalue_l, 1, 2) as calendarmonth) as CalendarMonth,
	
	@Semantics.language: true
	key main.ddlanguage as Language,
	
	@Semantics.text
	main.ddtext as CalendarMonthName
}
where (main.domname = 'KMONAT' and main.as4local = 'A')
	and main.ddlanguage = $session.system_language