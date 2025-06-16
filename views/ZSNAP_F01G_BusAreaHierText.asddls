@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'BusinessArea Hierarchy - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'BusinessAreaHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F01G_BusAreaHierText
	as select from hrrp_directoryt as main
	
	inner join hrrp_directory on hrrp_directory.hryid = main.hryid and hrrp_directory.hryvalto = main.hryvalto
{
	key cast (main.hryid as fis_hryid_businessarea) as BusinessAreaHierarchy,
	
	@Semantics.businessDate.to: true
	key main.hryvalto as ValidityEndDate,
	
	@Semantics.language
	key main.spras as Language,
	
	@Semantics.businessDate.from: true
	main.hryvalfrom as ValidityStartDate,
	
	@Semantics.text
	cast (main.hrytxt as fis_hryn_businessarea) as BusinessAreaHierarchyName
}
where (hrrp_directory.hrytyp = 'GL04')
	and main.spras = $session.system_language