@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Segment'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Segment'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F01G_Segment
	as select from fagl_segm as main
	
	association [0..*] to ZSNAP_F01G_SegmentHierNode as _SegmentHierNode on $projection.Segment = _SegmentHierNode.Segment
	association [0..*] to ZSNAP_F01G_SegmentText as _Text on $projection.Segment = _Text.Segment
{
	@ObjectModel.hierarchy.association: '_SegmentHierNode'
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Segment'
	key main.segment as Segment,
	_SegmentHierNode,
	_Text
}