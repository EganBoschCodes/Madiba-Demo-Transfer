@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Functional Area Hierarchy Node - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F01G_FnctlAreaHier_B1
	as select from hrrp_nodet as main
	
	inner join hrrp_directory on hrrp_directory.hryid = main.hryid and hrrp_directory.hryvalto = main.hryvalto
	
	association [1..*] to ZSNAP_F01G_FnctlAreaHier as _Hierarchy on $projection.FunctionalAreaHierarchy = _Hierarchy.FunctionalAreaHierarchy
{
	@ObjectModel.foreignKey.association: '_Hierarchy'
	key main.hryid as FunctionalAreaHierarchy,
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
where (hrrp_directory.hrytyp = '0112')
	and main.spras = $session.system_language