@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'P: Fiscal Quarter'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F70G_P_FiscalQuarter
	as select from finsc_fisc_date as main
{
	key main.fiscal_year_variant as FiscalYearVariant,
	key main.fiscal_year_quarter_int as FiscalQuarterConsecutiveNumber,
	main.fiscal_year as FiscalYear,
	main.fiscal_quarter as FiscalQuarter,
	main.fiscal_year_start_date as FiscalYearStartDate,
	main.fiscal_year_end_date as FiscalYearEndDate,
	main.fiscal_year_quarter as FiscalYearQuarter,
	main.fiscal_quarter_start_date as FiscalQuarterStartDate,
	main.fiscal_quarter_end_date as FiscalQuarterEndDate,
	main.fiscal_year_quarter_int + 1 as NextFsclQuarterConsecutiveNmbr
}
group by main.fiscal_year_variant,
	main.fiscal_year,
	main.fiscal_quarter,
	main.fiscal_year_start_date,
	main.fiscal_year_end_date,
	main.fiscal_year_quarter,
	main.fiscal_quarter_start_date,
	main.fiscal_quarter_end_date,
	main.fiscal_year_quarter_int