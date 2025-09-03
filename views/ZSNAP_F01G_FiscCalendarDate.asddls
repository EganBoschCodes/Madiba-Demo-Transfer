@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Fiscal Calendar Date'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CalendarDate'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F01G_FiscCalendarDate
	as select from ZSNAP_F01G_P_FiscCalDate as main
	
	association [0..1] to ZSNAP_F01G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
{
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	@EndUserText.label: 'Fiscal Year Variant'
	key main.fiscal_year_variant as FiscalYearVariant,
	
	@EndUserText.label: 'Calendar Date'
	key main.calendar_date as CalendarDate,
	
	@EndUserText.label: 'Fiscal Year'
	main.fiscal_year as FiscalYear,
	
	@EndUserText.label: 'Start Of Fiscal Year'
	main.fiscal_year_start_date as FiscalYearStartDate,
	
	@EndUserText.label: 'End Of Fiscal Year'
	main.fiscal_year_end_date as FiscalYearEndDate,
	
	@EndUserText.label: 'Fiscal Period'
	main.fiscal_period as FiscalPeriod,
	
	@EndUserText.label: 'Start Fiscal Period'
	main.fiscal_period_start_date as FiscalPeriodStartDate,
	
	@EndUserText.label: 'End Of Fiscal Period'
	main.fiscal_period_end_date as FiscalPeriodEndDate,
	
	@EndUserText.label: 'Fiscal Quarter'
	main.fiscal_quarter as FiscalQuarter,
	
	@EndUserText.label: 'Start Fiscal Quarter'
	main.fiscal_quarter_start_date as FiscalQuarterStartDate,
	
	@EndUserText.label: 'End Of Fscal Quarter'
	main.fiscal_quarter_end_date as FiscalQuarterEndDate,
	
	@EndUserText.label: 'Fiscal Week'
	main.fiscal_week as FiscalWeek,
	
	@EndUserText.label: 'Start Fiscal Week'
	main.fiscal_week_start_date as FiscalWeekStartDate,
	
	@EndUserText.label: 'End Fiscal Week'
	main.fiscal_week_end_date as FiscalWeekEndDate,
	
	@EndUserText.label: 'Fiscal Year Period'
	main.fiscal_year_period as FiscalYearPeriod,
	
	@EndUserText.label: 'Fiscal Year Quarter'
	main.fiscal_year_quarter as FiscalYearQuarter,
	
	@EndUserText.label: 'Fiscal Year Week'
	main.fiscal_year_week as FiscalYearWeek,
	
	@EndUserText.label: 'Fiscal Year (Int)'
	cast (main.fiscal_year as fins_fiscalyear_i) as FiscalYearConsecutiveNumber,
	
	@EndUserText.label: 'Fiscal Year Period (Numbering)'
	main.fiscal_year_period_int as FiscalPeriodConsecutiveNumber,
	
	@EndUserText.label: 'Fiscal Year Quarter (Numbering)'
	main.fiscal_year_quarter_int as FiscalQuarterConsecutiveNumber,
	
	@EndUserText.label: 'Fiscal Year Week (Numbering)'
	main.fiscal_year_week_int as FiscalWeekConsecutiveNumber,
	_FiscalYearVariant
}