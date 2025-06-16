@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'P: Fiscal Year Period Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_P_FiscYearPerTxt
	as select from ZSNAP_F72G_P_FiscPeriodText as main
	
	left outer to one join ZSNAP_F72G_FiscalPeriod as FiscPer on FiscPer.FiscalYear = main.FiscalYear and FiscPer.FiscalPeriod = main.FiscalPeriod and FiscPer.FiscalYearVariant = main.FiscalYearVariant
	left outer to one join ZSNAP_F72G_CalendarDate as CalendarYearDerive on CalendarYearDerive.CalendarDate = FiscPer.FiscalPeriodEndDate
{
	key main.Language,
	key main.FiscalYearVariant,
	key cast (concat (main.FiscalYear, main.FiscalPeriod) as fins_jahrper) as FiscalYearPeriod,
	case
		when main.FiscalPeriod = '000' then concat_with_space (main.FiscalPeriodName, main.FiscalYear, 1)
		else concat_with_space (main.FiscalPeriodName, CalendarYearDerive.CalendarYear, 1)
	end as FiscalYearPeriodText
}