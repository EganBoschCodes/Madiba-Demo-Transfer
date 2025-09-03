@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Segment - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'Segment'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_SegmentText
	as select from fagl_segmt as main
{
	@Semantics.language: true
	key main.langu as Language,
	key main.segment as Segment,
	
	@Semantics.text: true
	cast (main.name as fis_segment_name preserving type) as SegmentName
}
where main.langu = $session.system_language