@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Company Code Hierarchy Node'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #HIERARCHY
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL
@Hierarchy.parentChild: [{ recurse: { parent: ['ParentNode'], child: ['HierarchyNode']}, siblingsOrder: [{ by: 'HierarchyNodeSequence', direction: #ASC }], directory: '_Hierarchy'}]

define view entity ZSNAP_F80G_CoCodeHierNode
	as select from hrrp_node as main
	
	inner join ZSNAP_F80G_CompanyCodeHier as HierarchyFilter on HierarchyFilter.CompanyCodeHierarchy = main.hryid and HierarchyFilter.ValidityEndDate = main.hryvalto
	
	association [0..*] to ZSNAP_F80G_CoCodeHierNodeT as _Text on $projection.CompanyCodeHierarchy = _Text.CompanyCodeHierarchy and $projection.HierarchyNode = _Text.HierarchyNode and $projection.CompanyCode = ''
	association [0..1] to ZSNAP_F80G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [1..1] to ZSNAP_F80G_CompanyCodeHier as _Hierarchy on $projection.CompanyCodeHierarchy = _Hierarchy.CompanyCodeHierarchy and $projection.ValidityEndDate = _Hierarchy.ValidityEndDate
{
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@ObjectModel.foreignKey.association: '_Hierarchy'
	@EndUserText.label: 'Hierarchy Id'
	key main.hryid as CompanyCodeHierarchy,
	
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
	
	@ObjectModel.foreignKey.association: '_CompanyCode'
	@EndUserText.label: 'Company Code'
	cast (case main.nodetype
		when 'L' then main.nodevalue
		else ''
	end as bukrs) as CompanyCode,
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
	_CompanyCode,
	_Hierarchy
}
where main.nodetype <> 'D'