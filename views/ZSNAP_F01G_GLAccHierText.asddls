@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'G/L Account Hierarchy - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'GLAccountHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F01G_GLAccHierText
	as select from hrrp_directoryt as main
	
	inner join hrrp_directory on hrrp_directory.hryid = main.hryid and hrrp_directory.hryvalto = main.hryvalto
{
	key main.hryid as GLAccountHierarchy,
	
	@Semantics.businessDate.to: true
	key main.hryvalto as ValidityEndDate,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.businessDate.from: true
	main.hryvalfrom as ValidityStartDate,
	
	@Semantics.text: true
	main.hrytxt as GLAccountHierarchyName
}
where (hrrp_directory.hrytyp = 'FSVN')
	and main.spras = $session.system_language