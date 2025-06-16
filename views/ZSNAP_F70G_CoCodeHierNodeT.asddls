@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Company Code Hierarchy Node - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F70G_CoCodeHierNodeT
	as select from hrrp_nodet as main
	
	inner join hrrp_directory on hrrp_directory.hryid = main.hryid and hrrp_directory.hryvalto = main.hryvalto
	
	association [1..*] to ZSNAP_F70G_CompanyCodeHier as _Hierarchy on $projection.CompanyCodeHierarchy = _Hierarchy.CompanyCodeHierarchy
{
	@ObjectModel.foreignKey.association: '_Hierarchy'
	key main.hryid as CompanyCodeHierarchy,
	key main.hrynode as HierarchyNode,
	
	@Semantics.businessDate.to: true
	key cast (main.hryvalto as fis_datbi) as ValidityEndDate,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.nodetxt as HierarchyNodeText,
	
	@Semantics.businessDate.from: true
	cast (main.hryvalfrom as fis_datab) as ValidityStartDate,
	_Hierarchy
}
where (hrrp_directory.hrytyp = 'COCD')
	and main.spras = $session.system_language