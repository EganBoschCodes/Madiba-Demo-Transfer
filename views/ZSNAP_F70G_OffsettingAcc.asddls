@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Offsetting Account'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'OffsettingAccount'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F70G_OffsettingAcc
	as select from ZSNAP_F70G_P_OffsettingAcc as main
	
	association [0..1] to ZSNAP_F70G_ChartOfAccounts as _ChartOfAccounts on $projection.ChartOfAccounts = _ChartOfAccounts.ChartOfAccounts
	association [0..1] to ZSNAP_F70G_FinancialAccType as _OffsettingAccountType on $projection.OffsettingAccountType = _OffsettingAccountType.FinancialAccountType
{
	@ObjectModel.foreignKey.association: '_ChartOfAccounts'
	@EndUserText.label: 'Chart Of Accounts'
	key main.ChartOfAccounts,
	
	@ObjectModel.foreignKey.association: '_OffsettingAccountType'
	@EndUserText.label: 'Offsetting Account Type'
	key main.OffsettingAccountType,
	
	@ObjectModel.text.element: ['OffsettingAccountName']
	@EndUserText.label: 'Offsetting Account'
	key main.OffsettingAccount,
	
	@Semantics.text: true
	@EndUserText.label: 'Offsetting Account Name'
	main.OffsettingAccountName,
	_ChartOfAccounts,
	_OffsettingAccountType
}