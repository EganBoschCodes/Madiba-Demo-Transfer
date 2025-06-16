@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Special General Ledger Code'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'SpecialGLCode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_SpecialGLCode
	as select from t074u as main
	
	association [1..1] to ZSNAP_F72G_FinancialAccType as _FinancialAccountType on $projection.FinancialAccountType = _FinancialAccountType.FinancialAccountType
	association [0..*] to ZSNAP_F72G_SpecialGLCdText as _Text on $projection.FinancialAccountType = _Text.FinancialAccountType and $projection.SpecialGLCode = _Text.SpecialGLCode
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Special G/L Ind.'
	key main.umskz as SpecialGLCode,
	
	@ObjectModel.foreignKey.association: '_FinancialAccountType'
	@EndUserText.label: 'Account Type'
	key main.koart as FinancialAccountType,
	
	@EndUserText.label: 'Sp. G/L Trans.Type'
	main.umsks as SpecialGLTransactionType,
	
	@EndUserText.label: 'Rel.To Credit Limit'
	main.klimp as CreditLimitIsChecked,
	
	@EndUserText.label: 'Noted Items'
	main.merkp as IsNotedItmWithoutBalUpdt,
	_FinancialAccountType,
	_Text
}