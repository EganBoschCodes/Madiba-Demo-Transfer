@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Global Company Hierarchy Node - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F80G_GlobalCoHierN_JG
	as select from hrrp_nodet as main
	
	inner join hrrp_directory on main.hryid = hrrp_directory.hryid and main.hryvalto = hrrp_directory.hryvalto
	
	association [1..*] to ZSNAP_F80G_GlobalCoHier as _Hierarchy on $projection.GlobalCompanyHierarchy = _Hierarchy.GlobalCompanyHierarchy
{
	@ObjectModel.foreignKey.association: '_Hierarchy'
	key cast (main.hryid as fis_hryid_company) as GlobalCompanyHierarchy,
	key main.hrynode as HierarchyNode,
	
	@Semantics.businessDate.to: true
	key cast (main.hryvalto as fis_datbi preserving type) as ValidityEndDate,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.nodetxt as HierarchyNodeText,
	
	@Semantics.businessDate.from: true
	cast (main.hryvalfrom as fis_datab preserving type) as ValidityStartDate,
	_Hierarchy
}
where (hrrp_directory.hrytyp = 'CS20')
	and main.spras = $session.system_language