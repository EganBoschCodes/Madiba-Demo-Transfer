@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fiscal Year Variant Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'FiscalYearVariant'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_FiscYearVrntTxt
	as select from t009t as main
{
	@Semantics.language: true
	key main.spras as Language,
	key cast (main.periv as fis_periv preserving type) as FiscalYearVariant,
	
	@Semantics.text: true
	main.ltext as FiscalYearVariantDescription
}
where main.spras = $session.system_language