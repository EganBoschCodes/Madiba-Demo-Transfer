@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'P: Fiscal Period'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F80G_P_FiscalPeriod
	as select from finsc_period as main
	
	left outer to one join ZSNAP_F80G_P_FiscCalDate as fisc_cal_date on main.fiscal_year_variant = fisc_cal_date.fiscal_year_variant and main.fiscal_period_end_date = fisc_cal_date.calendar_date
{
	key cast (main.fiscal_year_variant as fis_periv preserving type) as fiscal_year_variant,
	key cast (main.fiscal_year as fis_gjahr preserving type) as fiscal_year,
	key main.fiscal_period,
	main.fiscal_period_start_date,
	main.fiscal_period_end_date,
	main.is_special_period,
	main.fiscal_year_start_date,
	main.fiscal_year_end_date,
	main.next_fiscal_period,
	main.next_fiscal_period_fiscal_year,
	cast (main.fiscal_year_period as fins_jahrper preserving type) as fiscal_year_period,
	case
		when fisc_cal_date.fiscal_quarter = '0' then '4'
		else fisc_cal_date.fiscal_quarter
	end as fiscal_quarter,
	fisc_cal_date.fiscal_year_quarter
}

union all select from finsc_period as main
{
	key cast (main.fiscal_year_variant as fis_periv preserving type) as fiscal_year_variant,
	key cast (main.fiscal_year as fis_gjahr preserving type) as fiscal_year,
	key '000' as fiscal_period,
	main.fiscal_period_start_date,
	main.fiscal_period_start_date as fiscal_period_end_date,
	'X' as is_special_period,
	main.fiscal_year_start_date,
	main.fiscal_year_end_date,
	'001' as next_fiscal_period,
	main.fiscal_year as next_fiscal_period_fiscal_year,
	cast (concat (main.fiscal_year, '000') as fins_jahrper) as fiscal_year_period,
	cast ('1' as abap.numc (1)) as fiscal_quarter,
	concat (main.fiscal_year, '1') as fiscal_year_quarter
}
where main.fiscal_period = '001'