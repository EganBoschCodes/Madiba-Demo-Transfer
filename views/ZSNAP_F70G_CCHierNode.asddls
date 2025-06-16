@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cost Center Hierarchy Node'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #HIERARCHY
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL
@Hierarchy.parentChild: [{ recurse: { parent: ['ParentNode'], child: ['HierarchyNode']}, siblingsOrder: [{ by: 'SequenceNumber', direction: #ASC }], directory: '_Hierarchy'}]

define view entity ZSNAP_F70G_CCHierNode
	as select from hrrp_node as main
	
	association [0..1] to ZSNAP_F70G_ControllingArea as _ControllingAreaText on $projection.ControllingArea = _ControllingAreaText.ControllingArea
	association [0..*] to ZSNAP_F70G_CCHierNodeT as _Text on $projection.CostCenterHierarchy = _Text.CostCenterHierarchy and $projection.HierarchyNode = _Text.HierarchyNode and $projection.ControllingArea = _Text.ControllingArea and $projection.CostCenter = ''
	association [0..*] to ZSNAP_F70G_CostCenter as _CostCenter on $projection.CostCenter = _CostCenter.CostCenter and $projection.ControllingArea = _CostCenter.ControllingArea
	association [1..1] to ZSNAP_F70G_CostCenterHier as _Hierarchy on $projection.CostCenterHierarchy = _Hierarchy.CostCenterHierarchy and $projection.ControllingArea = _Hierarchy.ControllingArea and $projection.ValidityEndDate = _Hierarchy.ValidityEndDate
	association [0..1] to ZSNAP_F70G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
{
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@ObjectModel.foreignKey.association: '_ControllingArea'
	@ObjectModel.text.association: '_ControllingAreaText'
	@EndUserText.label: 'Controlling Area'
	key cast (main.nodecls as fis_kokrs) as ControllingArea,
	
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@ObjectModel.foreignKey.association: '_Hierarchy'
	@EndUserText.label: 'Cost Center Hierarchy'
	key cast (main.hryid as fis_hryid_cctr) as CostCenterHierarchy,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Hierarchy Node'
	key main.hrynode as HierarchyNode,
	
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Validity End Date'
	key cast (main.hryvalto as fis_datbi) as ValidityEndDate,
	
	@EndUserText.label: 'Hierarchy Parent Node'
	main.parnode as ParentNode,
	
	@EndUserText.label: 'Hierarchy Version'
	main.hryver as HierarchyVersion,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Validity Start Date'
	cast (main.hryvalfrom as fis_datab) as ValidityStartDate,
	
	@EndUserText.label: 'Cost Center'
	@ObjectModel.foreignKey.association: '_CostCenter'
	cast (case main.nodetype
		when 'L' then main.nodevalue
		else ''
	end as fis_kostl) as CostCenter,
	
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
	_CostCenter,
	_Hierarchy,
	_ControllingArea,
	
	@Consumption.hidden: true
	_ControllingAreaText
}
where main.nodetype <> 'D'
	and main.nodetype <> 'B'
	and main.nodetype <> 'J'
	and main.nodetype <> 'V'
	and main.hrytype = '0101'