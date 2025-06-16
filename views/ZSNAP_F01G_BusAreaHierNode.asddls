@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'BusinessArea Hier Node'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #HIERARCHY
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL
@Hierarchy.parentChild: [{ recurse: { parent: ['ParentNode'], child: ['HierarchyNode']}, siblingsOrder: [{ by: 'SequenceNumber', direction: #ASC }], directory: '_Hierarchy'}]

define view entity ZSNAP_F01G_BusAreaHierNode
	as select from hrrp_node as main
	
	inner join ZSNAP_F01G_BusinessAreaHier as HierarchyDirectory on HierarchyDirectory.BusinessAreaHierarchy = main.hryid and HierarchyDirectory.ValidityEndDate = main.hryvalto
	
	association [0..*] to ZSNAP_F01G_BusAreaHierNodeT as _Text on $projection.BusinessAreaHierarchy = _Text.BusinessAreaHierarchy and $projection.HierarchyNode = _Text.HierarchyNode and $projection.BusinessArea = ''
	association [0..1] to ZSNAP_F01G_BusinessArea as _BusinessArea on $projection.BusinessArea = _BusinessArea.BusinessArea
	association [1..1] to ZSNAP_F01G_BusinessAreaHier as _Hierarchy on $projection.BusinessAreaHierarchy = _Hierarchy.BusinessAreaHierarchy and $projection.ValidityEndDate = _Hierarchy.ValidityEndDate
{
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@ObjectModel.foreignKey.association: '_Hierarchy'
	@EndUserText.label: 'Business Area Hierarchy ID'
	key cast (main.hryid as fis_hryid_businessarea) as BusinessAreaHierarchy,
	
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
	
	@ObjectModel.foreignKey.association: '_BusinessArea'
	@EndUserText.label: 'Business Area'
	cast (case main.nodetype
		when 'L' then main.nodevalue
		else ''
	end as gsber) as BusinessArea,
	concat (main.hryseqnbr, main.hrynode) as SequenceNumber,
	
	@EndUserText.label: 'Hierarchy Level'
	main.hrylevel as HierarchyNodeLevel,
	
	@EndUserText.label: 'Hierarchy Node Type'
	main.nodetype as NodeType,
	
	@EndUserText.label: 'Node Value'
	main.nodevalue as HierarchyNodeVal,
	_Text,
	_BusinessArea,
	_Hierarchy
}
where main.nodetype <> 'D'