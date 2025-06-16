@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F72: Balance Period Duplication'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F72S_056	
	with parameters
		P_SFromFiscalYear: fins_gjahr,
		P_SToFiscalYearPeriod: fins_jahrper
	
	as select from ZSNAP_F72G_FiscalPeriod as main
{
	key main.FiscalYearVariant,
	key main.FiscalYear,
	key main.FiscalPeriod,
	main.FiscalPeriodEndDate,
	main.FiscalYearPeriod
}
where main.FiscalYearPeriod <= $parameters.P_SToFiscalYearPeriod
	and main.FiscalYear >= $parameters.P_SFromFiscalYear
	and main.IsSpecialPeriod = ''