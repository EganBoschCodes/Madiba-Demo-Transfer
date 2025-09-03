@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Accounting Document Type - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'AccountingDocumentType'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F01G_AccngDocTypeText
	as select from t003t as main
{
	key cast (main.blart as farp_blart preserving type) as AccountingDocumentType,
	
	@Semantics.language
	key main.spras as Language,
	
	@Semantics.text
	cast (main.ltext as farp_ltext_003t preserving type) as AccountingDocumentTypeName
}
where main.spras = $session.system_language