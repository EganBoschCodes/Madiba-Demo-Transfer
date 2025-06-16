@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Fiscal Year Period Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'FiscalYearPeriod'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_FiscYearPerTxt
	as select from ZSNAP_F70G_P_FiscYearPerTxt as main
	
	association [0..1] to ZSNAP_F70G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
{
	@Semantics.language: true
	key main.Language,
	
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	key main.FiscalYearVariant,
	
	@ObjectModel.text.element: ['FiscalYearPeriodText']
	key main.FiscalYearPeriod,
	
	@Semantics.text: true
	main.FiscalYearPeriodText,
	_FiscalYearVariant
}
where main.Language = $session.system_language