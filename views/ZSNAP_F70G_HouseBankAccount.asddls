@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'House Bank Account'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'HouseBankAccount'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_HouseBankAccount
	as select from ZSNAP_F70G_P_HouseBankAcc as main
	
	association [0..1] to ZSNAP_F70G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [1..*] to ZSNAP_F70G_HouseBankAccText as _Text on $projection.CompanyCode = _Text.CompanyCode and $projection.HouseBank = _Text.HouseBank and $projection.HouseBankAccount = _Text.HouseBankAccount
	association [0..1] to ZSNAP_F70G_Housebank as _HouseBank on $projection.HouseBank = _HouseBank.HouseBank and $projection.CompanyCode = _HouseBank.CompanyCode
{
	@ObjectModel.foreignKey.association: '_CompanyCode'
	@EndUserText.label: 'Company Code'
	key main.bukrs as CompanyCode,
	
	@ObjectModel.foreignKey.association: '_HouseBank'
	@EndUserText.label: 'House Bank'
	key main.hbkid as HouseBank,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'House Bank Account'
	key main.hktid as HouseBankAccount,
	
	@EndUserText.label: 'Technical Id'
	main.acc_id as BankAccountInternalID,
	
	@EndUserText.label: 'Bank Account'
	main.bankn as BankAccount,
	
	@EndUserText.label: 'Account Number'
	main.acc_num as BankAccountNumber,
	
	@EndUserText.label: 'Currency'
	main.waers as BankAccountCurrency,
	
	@EndUserText.label: 'G/L Account'
	main.hkont as GLAccount,
	
	@EndUserText.label: 'Use In Cash Pooling'
	main.cash_pooling_flag as CashPoolingIsUsed,
	
	@EndUserText.label: 'Authorization Group'
	main.bank_account_auth_group as AuthorizationGroup,
	_CompanyCode,
	_HouseBank,
	_Text
}