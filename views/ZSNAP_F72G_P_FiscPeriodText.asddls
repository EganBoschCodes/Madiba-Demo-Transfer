@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'P: Fiscal Period Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_P_FiscPeriodText
	as select from t009c as main
	
	inner join finsc_period on main.periv = finsc_period.fiscal_year_variant and main.poper = finsc_period.fiscal_period and (main.bdatj = finsc_period.fiscal_year or main.bdatj = '0000')
{
	key main.spras as Language,
	key cast (main.periv as fis_periv preserving type) as FiscalYearVariant,
	key cast (finsc_period.fiscal_year as fis_gjahr preserving type) as FiscalYear,
	key cast (main.poper as fins_fiscalperiod preserving type) as FiscalPeriod,
	main.ltext as FiscalPeriodName
}

union all select from t009c as main
	
	inner join finsc_period on main.periv = finsc_period.fiscal_year_variant and main.poper = finsc_period.fiscal_period and (main.bdatj = finsc_period.fiscal_year or main.bdatj = '0000')
{
	key main.spras as Language,
	key cast (main.periv as fis_periv preserving type) as FiscalYearVariant,
	key cast (finsc_period.fiscal_year as fis_gjahr preserving type) as FiscalYear,
	key cast ('000' as fins_fiscalperiod preserving type) as FiscalPeriod,
	'Opening Balance' as FiscalPeriodName
}
where main.poper = '001'