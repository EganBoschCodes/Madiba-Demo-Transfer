@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Fiscal Year Period'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FiscalYearPeriod'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F72G_FiscalYearPeriod
	as select from ZSNAP_F72G_P_FiscalPeriod as main
	
	association [0..1] to ZSNAP_F72G_FiscCalendarDate as _FiscalCalendarDate on $projection.FiscalYearVariant = _FiscalCalendarDate.FiscalYearVariant and $projection.FiscalPeriodEndDate = _FiscalCalendarDate.CalendarDate
	association [0..1] to ZSNAP_F72G_FiscCalendarDate as _FiscalPeriodStartDate on $projection.FiscalYearVariant = _FiscalPeriodStartDate.FiscalYearVariant and $projection.FiscalPeriodStartDate = _FiscalPeriodStartDate.CalendarDate
	association [0..*] to ZSNAP_F72G_FiscYearPerTxt as _Text on $projection.FiscalYearVariant = _Text.FiscalYearVariant and $projection.FiscalYearPeriod = _Text.FiscalYearPeriod
	association [0..1] to ZSNAP_F72G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
{
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	@EndUserText.label: 'Fiscal Year Variant'
	key main.fiscal_year_variant as FiscalYearVariant,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Fiscal Year Period'
	key cast (main.fiscal_year_period as fins_jahrper) as FiscalYearPeriod,
	
	@EndUserText.label: 'Fiscal Year'
	main.fiscal_year as FiscalYear,
	
	@EndUserText.label: 'Fiscal Period'
	main.fiscal_period as FiscalPeriod,
	
	@EndUserText.label: 'Start Fiscal Period'
	main.fiscal_period_start_date as FiscalPeriodStartDate,
	
	@EndUserText.label: 'End Of Fiscal Period'
	main.fiscal_period_end_date as FiscalPeriodEndDate,
	
	@EndUserText.label: 'Is Special Period'
	main.is_special_period as IsSpecialPeriod,
	
	@EndUserText.label: 'Start Of Fiscal Year'
	main.fiscal_year_start_date as FiscalYearStartDate,
	
	@EndUserText.label: 'End Of Fiscal Year'
	main.fiscal_year_end_date as FiscalYearEndDate,
	
	@EndUserText.label: 'Fiscal Year Period (Numbering)'
	_FiscalCalendarDate.FiscalPeriodConsecutiveNumber,
	
	@EndUserText.label: 'Next Fiscal Period'
	main.next_fiscal_period as NextFiscalPeriod,
	
	@EndUserText.label: 'Next Fiscal Period Fiscal Year'
	main.next_fiscal_period_fiscal_year as NextFiscalPeriodFiscalYear,
	
	@EndUserText.label: 'Next Fiscal Year Period'
	concat (main.next_fiscal_period_fiscal_year, main.next_fiscal_period) as NextFiscalYearPeriod,
	
	@EndUserText.label: 'Next Fiscal Period Consecutive Number'
	_FiscalCalendarDate.FiscalPeriodConsecutiveNumber + 1 as NextFsclPeriodConsecutiveNmbr,
	
	@EndUserText.label: 'Fiscal Quarter'
	main.fiscal_quarter as FiscalQuarter,
	
	@EndUserText.label: 'Fiscal Year Quarter'
	main.fiscal_year_quarter as FiscalYearQuarter,
	_FiscalPeriodStartDate,
	_FiscalYearVariant,
	_Text
}