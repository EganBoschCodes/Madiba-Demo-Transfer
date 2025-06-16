@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Fiscal Period'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FiscalPeriod'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F72G_FiscalPeriod
	as select from ZSNAP_F72G_P_FiscalPeriod as main
	
	association [0..*] to ZSNAP_F72G_FiscalPeriodText as _Text on $projection.FiscalYearVariant = _Text.FiscalYearVariant and $projection.FiscalYear = _Text.FiscalYear and $projection.FiscalPeriod = _Text.FiscalPeriod
	association [0..1] to ZSNAP_F72G_FiscalYear as _FiscalYear on $projection.FiscalYearVariant = _FiscalYear.FiscalYearVariant and $projection.FiscalYear = _FiscalYear.FiscalYear
	association [0..1] to ZSNAP_F72G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
{
	@EndUserText.label: 'Fiscal Year Variant'
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	key main.fiscal_year_variant as FiscalYearVariant,
	
	@EndUserText.label: 'Fiscal Year'
	@ObjectModel.foreignKey.association: '_FiscalYear'
	key main.fiscal_year as FiscalYear,
	
	@EndUserText.label: 'Fiscal Period'
	@ObjectModel.text.association: '_Text'
	key main.fiscal_period as FiscalPeriod,
	
	@EndUserText.label: 'Fiscal Period Start Date'
	main.fiscal_period_start_date as FiscalPeriodStartDate,
	
	@EndUserText.label: 'Fiscal Period End Date'
	main.fiscal_period_end_date as FiscalPeriodEndDate,
	
	@EndUserText.label: 'Is Special Period'
	main.is_special_period as IsSpecialPeriod,
	
	@EndUserText.label: 'Fiscal Year Start Date'
	main.fiscal_year_start_date as FiscalYearStartDate,
	
	@EndUserText.label: 'Fiscal Year End Date'
	main.fiscal_year_end_date as FiscalYearEndDate,
	
	@EndUserText.label: 'Fiscal Year Period'
	main.fiscal_year_period as FiscalYearPeriod,
	
	@EndUserText.label: 'Next Fiscal Period'
	main.next_fiscal_period as NextFiscalPeriod,
	
	@EndUserText.label: 'Fiscal Year of Next Fiscal Period'
	main.next_fiscal_period_fiscal_year as NextFiscalPeriodFiscalYear,
	
	@EndUserText.label: 'Fiscal Quarter'
	main.fiscal_quarter as FiscalQuarter,
	
	@EndUserText.label: 'Fiscal Year Quarter'
	main.fiscal_year_quarter as FiscalYearQuarter,
	_FiscalYear,
	_FiscalYearVariant,
	_Text
}