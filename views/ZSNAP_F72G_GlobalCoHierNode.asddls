@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Global Company Hierarchy Node'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #HIERARCHY
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL
@Hierarchy.parentChild: [{ recurse: { parent: ['ParentNode'], child: ['HierarchyNode']}, siblingsOrder: [{ by: 'HierarchyNodeSequence', direction: #ASC }], directory: '_Hierarchy'}]

define view entity ZSNAP_F72G_GlobalCoHierNode
	as select from hrrp_node as main
	
	association [0..*] to ZSNAP_F72G_GlobalCoHierN_B2 as _Text on $projection.GlobalCompanyHierarchy = _Text.GlobalCompanyHierarchy and $projection.HierarchyNode = _Text.HierarchyNode and $projection.Company = ''
	association [0..1] to ZSNAP_F72G_GlobalCompany as _Company on $projection.Company = _Company.Company
	association [1..1] to ZSNAP_F72G_GlobalCoHier as _Hierarchy on $projection.GlobalCompanyHierarchy = _Hierarchy.GlobalCompanyHierarchy and $projection.ValidityEndDate = _Hierarchy.ValidityEndDate
{
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@ObjectModel.foreignKey.association: '_Hierarchy'
	@EndUserText.label: 'Global Company Hierarchy'
	key cast (main.hryid as fis_hryid_company) as GlobalCompanyHierarchy,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Hierarchy Node'
	key main.hrynode as HierarchyNode,
	
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Validity End Date'
	key cast (main.hryvalto as fis_datbi preserving type) as ValidityEndDate,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Validity Start Date'
	cast (main.hryvalfrom as fis_datab preserving type) as ValidityStartDate,
	
	@EndUserText.label: 'Hierarchy Parent Node'
	main.parnode as ParentNode,
	
	@EndUserText.label: 'Hierarchy Version'
	main.hryver as HierarchyVersion,
	
	@ObjectModel.foreignKey.association: '_Company'
	@EndUserText.label: 'Trading Partner'
	cast (case main.nodetype
		when 'L' then main.nodevalue
		else ''
	end as fis_rassc) as Company,
	
	@EndUserText.label: 'Hierarchy Sequence Number'
	main.hryseqnbr as HierarchyNodeSequence,
	
	@EndUserText.label: 'Hierarchy Level'
	main.hrylevel as HierarchyNodeLevel,
	
	@EndUserText.label: 'Hierarchy Node Type'
	main.nodetype as NodeType,
	
	@EndUserText.label: 'Node Value'
	main.nodevalue as HierarchyNodeVal,
	_Text,
	_Company,
	_Hierarchy
}
where main.nodetype <> 'D'