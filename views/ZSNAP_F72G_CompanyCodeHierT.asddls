@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Company Code Hierarchy - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'CompanyCodeHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F72G_CompanyCodeHierT
	as select from hrrp_directoryt as main
	
	inner join hrrp_directory on hrrp_directory.hryid = main.hryid and hrrp_directory.hryvalto = main.hryvalto
{
	key main.hryid as CompanyCodeHierarchy,
	
	@Semantics.businessDate.to: true
	key cast (main.hryvalto as fis_datbi) as ValidityEndDate,
	
	@Semantics.language
	key main.spras as Language,
	
	@Semantics.businessDate.from: true
	cast (main.hryvalfrom as fis_datab) as ValidityStartDate,
	
	@Semantics.text
	main.hrytxt as CompanyCodeHierarchyName
}
where (hrrp_directory.hrytyp = 'COCD')
	and main.spras = $session.system_language