@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Order Hierarchy Text'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'OrderHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F80G_OrderHierText
	as select from hrrp_directoryt as main
	
	inner join hrrp_directory on hrrp_directory.hryid = main.hryid and hrrp_directory.hryvalto = main.hryvalto
{
	key main.hryid as OrderHierarchy,
	
	@Semantics.businessDate.to: true
	key cast (main.hryvalto as fis_datbi) as ValidityEndDate,
	
	@Semantics.language
	key main.spras as Language,
	
	@Semantics.businessDate.from: true
	cast (main.hryvalfrom as fis_datab) as ValidityStartDate,
	
	@Semantics.text
	main.hrytxt as CompanyCodeHierarchyName
}
where (hrrp_directory.hrytyp = '0103')
	and main.spras = $session.system_language