@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Functional Area Hierarchy Node'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #HIERARCHY
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL
@Hierarchy.parentChild: [{ recurse: { parent: ['ParentNode'], child: ['HierarchyNode']}, siblingsOrder: [{ by: 'SequenceNumber', direction: #ASC }], directory: '_Hierarchy'}]

define view entity ZSNAP_F01G_FnctlAreaHier_D8
	as select from hrrp_node as main
	
	inner join ZSNAP_F01G_FnctlAreaHier as HierarchyDirectory on HierarchyDirectory.FunctionalAreaHierarchy = main.hryid and HierarchyDirectory.ValidityEndDate = main.hryvalto
	
	association [0..*] to ZSNAP_F01G_FnctlAreaHier_B1 as _Text on $projection.FunctionalAreaHierarchy = _Text.FunctionalAreaHierarchy and $projection.HierarchyNode = _Text.HierarchyNode and $projection.FunctionalArea = ''
	association [0..1] to ZSNAP_F01G_FunctionalArea as _FunctionalArea on $projection.FunctionalArea = _FunctionalArea.FunctionalArea
	association [1..1] to ZSNAP_F01G_FnctlAreaHier as _Hierarchy on $projection.FunctionalAreaHierarchy = _Hierarchy.FunctionalAreaHierarchy and $projection.ValidityEndDate = _Hierarchy.ValidityEndDate
{
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@ObjectModel.foreignKey.association: '_Hierarchy'
	@EndUserText.label: 'Hierarchy Id'
	key main.hryid as FunctionalAreaHierarchy,
	
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
	
	@ObjectModel.foreignKey.association: '_FunctionalArea'
	@EndUserText.label: 'Functional Area'
	cast (case main.nodetype
		when 'L' then main.nodevalue
		else ''
	end as fkber) as FunctionalArea,
	
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'HierarchyNodeSequence'
	concat (main.hryseqnbr, main.hrynode) as SequenceNumber,
	
	@EndUserText.label: 'Hierarchy Sequence Number'
	main.hryseqnbr as HierarchyNodeSequence,
	
	@EndUserText.label: 'Hierarchy Level'
	main.hrylevel as HierarchyNodeLevel,
	
	@EndUserText.label: 'Hierarchy Node Type'
	main.nodetype as NodeType,
	
	@EndUserText.label: 'Node Value'
	main.nodevalue as HierarchyNodeVal,
	_Text,
	_FunctionalArea,
	_Hierarchy
}
where main.nodetype <> 'D'