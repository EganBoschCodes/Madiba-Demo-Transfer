@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Global Company Hierarchy - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'PartnerCompanyHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F01G_PartnerCoHierT
	as select from hrrp_directoryt as main
	
	inner join hrrp_directory on hrrp_directory.hryid = main.hryid and hrrp_directory.hryvalto = main.hryvalto
{
	key cast (hrrp_directory.hryid as fis_hryid_company) as PartnerCompanyHierarchy,
	
	@Semantics.businessDate.to: true
	key cast (main.hryvalto as fis_datbi preserving type) as ValidityEndDate,
	
	@Semantics.language
	key main.spras as Language,
	
	@Semantics.businessDate.from: true
	cast (main.hryvalfrom as fis_datab preserving type) as ValidityStartDate,
	
	@Semantics.text
	main.hrytxt as PartnerCompanyHierarchyName
}
where (hrrp_directory.hrytyp = 'CS20')
	and main.spras = $session.system_language