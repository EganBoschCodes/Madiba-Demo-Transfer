@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Quarter'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CalendarQuarter'
@ObjectModel.usageType.dataClass: #META
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F01G_CalendarQuarter
	as select from dd07l as main
	
	association [0..*] to ZSNAP_F01G_CalQuarterTxt as _Text on $projection.CalendarQuarter = _Text.CalendarQuarter
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Calendar Quarter'
	key cast (substring (main.domvalue_l, 1, 1) as calendarquarter) as CalendarQuarter,
	_Text
}
where main.domname = 'PB03_QUART'
	and main.as4local = 'A'