@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F70G_P_FiscalYear
	as select from finsc_fisc_date as main
{
	key main.fiscal_year_variant as FiscalYearVariant,
	key cast (main.fiscal_year as abap.int4) as FiscalYearConsecutiveNumber,
	cast (main.fiscal_year as abap.int4) + 1 as NextFiscalYearConsecutiveNmbr,
	main.fiscal_year as FiscalYear,
	main.fiscal_year_start_date as FiscalYearStartDate,
	main.fiscal_year_end_date as FiscalYearEndDate
}
group by main.fiscal_year_variant,
	main.fiscal_year,
	main.fiscal_year_start_date,
	main.fiscal_year_end_date