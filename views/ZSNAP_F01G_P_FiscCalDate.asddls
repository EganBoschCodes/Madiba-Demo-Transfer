@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'P: Fiscal Calendar Date'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F01G_P_FiscCalDate
	as select from finsc_fisc_date as main
{
	key cast (main.fiscal_year_variant as fis_periv preserving type) as fiscal_year_variant,
	key cast (main.calendar_date as calendardate preserving type) as calendar_date,
	cast (main.fiscal_year as fis_gjahr preserving type) as fiscal_year,
	main.fiscal_year_start_date,
	main.fiscal_year_end_date,
	main.fiscal_period,
	main.fiscal_period_start_date,
	main.fiscal_period_end_date,
	main.fiscal_quarter,
	main.fiscal_quarter_start_date,
	main.fiscal_quarter_end_date,
	main.fiscal_week,
	main.fiscal_week_start_date,
	main.fiscal_week_end_date,
	cast (main.fiscal_year_period as fins_jahrper preserving type) as fiscal_year_period,
	main.fiscal_year_quarter,
	main.fiscal_year_week,
	main.fiscal_year_period_int,
	main.fiscal_year_quarter_int,
	main.fiscal_year_week_int
}