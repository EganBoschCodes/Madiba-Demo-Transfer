@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Segment Hierarchy Node'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #HIERARCHY
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL
@Hierarchy.parentChild: [{ recurse: { parent: ['ParentNode'], child: ['HierarchyNode']}, siblingsOrder: [{ by: 'SequenceNumber', direction: #ASC }], directory: '_Hierarchy'}]

define view entity ZSNAP_F01G_SegmentHierNode
	as select from hrrp_node as main
	
	inner join ZSNAP_F01G_SegmentHierarchy as HierarchyDir on HierarchyDir.SegmentHierarchy = main.hryid and HierarchyDir.ValidityEndDate = main.hryvalto
	
	association [0..*] to ZSNAP_F01G_SegmentHierNodeT as _Text on $projection.SegmentHierarchy = _Text.SegmentHierarchy and $projection.HierarchyNode = _Text.HierarchyNode and $projection.Segment = ''
	association [0..1] to ZSNAP_F01G_Segment as _Segment on $projection.Segment = _Segment.Segment
	association [1..1] to ZSNAP_F01G_SegmentHierarchy as _Hierarchy on $projection.SegmentHierarchy = _Hierarchy.SegmentHierarchy and $projection.ValidityEndDate = _Hierarchy.ValidityEndDate
{
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@ObjectModel.foreignKey.association: '_Hierarchy'
	@EndUserText.label: 'segment hierarchy id'
	key cast (main.hryid as fis_hryid_segment) as SegmentHierarchy,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Hierarchy Node'
	key main.hrynode as HierarchyNode,
	
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Validity End Date'
	key cast (main.hryvalto as fis_datbi) as ValidityEndDate,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Validity Start Date'
	cast (main.hryvalfrom as fis_datab) as ValidityStartDate,
	
	@EndUserText.label: 'Hierarchy Parent Node'
	main.parnode as ParentNode,
	
	@EndUserText.label: 'Hierarchy Version'
	main.hryver as HierarchyVersion,
	
	@ObjectModel.foreignKey.association: '_Segment'
	@EndUserText.label: 'Segment'
	cast (case main.nodetype
		when 'L' then main.nodevalue
		else ''
	end as fb_segment) as Segment,
	concat (main.hryseqnbr, main.hrynode) as SequenceNumber,
	
	@EndUserText.label: 'Hierarchy Level'
	main.hrylevel as HierarchyNodeLevel,
	
	@EndUserText.label: 'Hierarchy Node Type'
	main.nodetype as NodeType,
	_Text,
	_Segment,
	_Hierarchy
}
where main.nodetype <> 'D'