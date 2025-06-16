@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Business Transaction Type Hierarchy Text'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'BusTransacTypeHier'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F72G_BusTransacTpH_BZ
	as select from hrrp_directoryt as main
	
	inner join hrrp_directory on hrrp_directory.hryid = main.hryid and hrrp_directory.hryvalto = main.hryvalto
{
	key main.hryid as BusTransacTypeHier,
	
	@Semantics.businessDate.to: true
	key cast (main.hryvalto as fis_datbi) as ValidityEndDate,
	
	@Semantics.language
	key main.spras as Language,
	
	@Semantics.businessDate.from: true
	cast (main.hryvalfrom as fis_datab) as ValidityStartDate,
	
	@Semantics.text
	main.hrytxt as BusTransacTypeHierName
}
where (hrrp_directory.hrytyp = 'GL03')
	and main.spras = $session.system_language