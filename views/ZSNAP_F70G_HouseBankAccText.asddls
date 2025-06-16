@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'House Bank Account - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'HouseBankAccount'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_HouseBankAccText
	as select from ZSNAP_F70G_P_HouseBankAccT as main
	
	association [0..1] to ZSNAP_F70G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [0..1] to ZSNAP_F70G_Housebank as _HouseBank on $projection.HouseBank = _HouseBank.HouseBank and $projection.CompanyCode = _HouseBank.CompanyCode
{
	@Semantics.language
	key main.spras as Language,
	
	@ObjectModel.foreignKey.association: '_CompanyCode'
	key main.bukrs as CompanyCode,
	
	@ObjectModel.foreignKey.association: '_HouseBank'
	key main.hbkid as HouseBank,
	key main.hktid as HouseBankAccount,
	
	@Semantics.text
	main.text1 as HouseBankAccountDescription,
	_CompanyCode,
	_HouseBank
}
where main.spras = $session.system_language