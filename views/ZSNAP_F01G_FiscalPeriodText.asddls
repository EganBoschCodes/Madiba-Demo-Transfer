@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fiscal Period Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'FiscalPeriod'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F01G_FiscalPeriodText
	as select from ZSNAP_F01G_P_FiscPeriodText as main
	
	association [0..1] to ZSNAP_F01G_FiscalYear as _FiscalYear on $projection.FiscalYearVariant = _FiscalYear.FiscalYearVariant and $projection.FiscalYear = _FiscalYear.FiscalYear
	association [0..1] to ZSNAP_F01G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
{
	@EndUserText.label: 'Language Key'
	@Semantics.language: true
	key main.Language,
	
	@EndUserText.label: 'Fiscal Year Variant'
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	key main.FiscalYearVariant,
	
	@EndUserText.label: 'Fiscal Year'
	@ObjectModel.foreignKey.association: '_FiscalYear'
	key main.FiscalYear,
	
	@EndUserText.label: 'Fiscal Period'
	@ObjectModel.text.element: ['FiscalPeriodName']
	key main.FiscalPeriod,
	
	@EndUserText.label: 'Text'
	@Semantics.text: true
	main.FiscalPeriodName,
	_FiscalYear,
	_FiscalYearVariant
}
where main.Language = $session.system_language