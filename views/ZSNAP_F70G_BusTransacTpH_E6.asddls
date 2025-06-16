@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Business Transaction Type Hier Node'
@ObjectModel.dataCategory: #HIERARCHY
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL
@Hierarchy.parentChild: [{ recurse: { parent: ['ParentNode'], child: ['HierarchyNode']}, siblingsOrder: [{ by: 'SequenceNumber', direction: #ASC }], directory: '_Hierarchy'}]

define view entity ZSNAP_F70G_BusTransacTpH_E6
	as select from hrrp_node as main
	
	association [0..*] to ZSNAP_F70G_BusTransacTpH_BJ as _Text on $projection.BusTransacTypeHier = _Text.BusTransacTypeHier and $projection.HierarchyNode = _Text.HierarchyNode and $projection.BusinessTransactionType = ''
	association [0..1] to ZSNAP_F70G_BusTransactionTp as _BusinessTransactionType on $projection.BusinessTransactionType = _BusinessTransactionType.BusinessTransactionType
	association [1..1] to ZSNAP_F70G_BusTransacTpHier as _Hierarchy on $projection.BusTransacTypeHier = _Hierarchy.BusTransacTypeHier and $projection.ValidityEndDate = _Hierarchy.ValidityEndDate
{
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@ObjectModel.foreignKey.association: '_Hierarchy'
	@EndUserText.label: 'Hierarchy Id'
	key main.hryid as BusTransacTypeHier,
	
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
	
	@ObjectModel.foreignKey.association: '_BusinessTransactionType'
	@EndUserText.label: 'Business Transaction Category'
	cast (case main.nodetype
		when 'L' then main.nodevalue
		else ''
	end as fins_bttype) as BusinessTransactionType,
	concat (main.hryseqnbr, main.hrynode) as SequenceNumber,
	
	@EndUserText.label: 'Hierarchy Level'
	main.hrylevel as HierarchyNodeLevel,
	
	@EndUserText.label: 'Hierarchy Node Type'
	main.nodetype as NodeType,
	
	@EndUserText.label: 'Node Value'
	main.nodevalue as HierarchyNodeVal,
	_Text,
	_BusinessTransactionType,
	_Hierarchy
}
where main.nodetype <> 'D'