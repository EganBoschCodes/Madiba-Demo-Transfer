@EndUserText.label: 'Calendar Quarter text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'CalendarQuarter'
@ObjectModel.usageType.dataClass: #META
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F01G_CalQuarterTxt
	as select from dd07t as main
{
	key cast (substring (main.domvalue_l, 1, 1) as calendarquarter) as CalendarQuarter,
	
	@Semantics.language: true
	key main.ddlanguage as Language,
	
	@EndUserText.label: 'Calendar Quarter Name'
	@EndUserText.quickInfo: 'Calendar Quarter Name'
	@Semantics.text: true
	main.ddtext as CalendarQuarterName
}
where (main.domname = 'PB03_QUART' and main.as4local = 'A')
	and main.ddlanguage = $session.system_language