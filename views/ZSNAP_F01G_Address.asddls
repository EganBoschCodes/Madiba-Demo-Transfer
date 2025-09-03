@AccessControl.authorizationCheck: #PRIVILEGED_ONLY
@EndUserText.label: 'Address'
@Metadata.allowExtensions: true
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F01G_Address
	as select from adrc as main
	
	left outer join adcp on adcp.addrnumber = main.addrnumber and adcp.date_from = '00010101' and adcp.nation = ' ' and adcp.comp_pers = 'P'
{
	key main.addrnumber as AddressID,
	main.country as Country,
	main.region as Region
}
where main.date_from = '00010101'
	and main.nation = ' '