@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Journal Entry Type'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'AccountingDocumentType'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F01G_AccngDocType
	as select from t003 as main
	
	association [0..*] to ZSNAP_F01G_AccngDocTypeText as _Text on $projection.AccountingDocumentType = _Text.AccountingDocumentType
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Journal Entry Type'
	key cast (main.blart as farp_blart preserving type) as AccountingDocumentType,
	
	@EndUserText.label: 'Number Range'
	main.numkr as AccountingDocumentNumberRange,
	
	@EndUserText.label: 'Authorization Group'
	main.brgru as AuthorizationGroup,
	
	@EndUserText.label: 'Exchange Rate Type For Fc Documents'
	main.kurst as ExchangeRateType,
	
	@EndUserText.label: 'Account Types'
	main.koars as AllowedFinancialAccountTypes,
	_Text
}