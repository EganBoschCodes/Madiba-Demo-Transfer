@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Fiscal Year'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FiscalYear'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_FiscalYear
	as select from ZSNAP_F70G_P_FiscalYear as main
	
	left outer to one join ZSNAP_F70G_P_FiscalYear as NextYear on main.FiscalYearVariant = NextYear.FiscalYearVariant and main.NextFiscalYearConsecutiveNmbr = NextYear.FiscalYearConsecutiveNumber
	
	association [0..1] to ZSNAP_F70G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
{
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	@EndUserText.label: 'Fiscal Year Variant'
	key main.FiscalYearVariant,
	
	@EndUserText.label: 'Fiscal Year'
	key main.FiscalYear,
	
	@EndUserText.label: 'Start Of Fiscal Year'
	main.FiscalYearStartDate,
	
	@EndUserText.label: 'End Of Fiscal Year'
	main.FiscalYearEndDate,
	
	@EndUserText.label: 'Fiscal Year'
	main.FiscalYearConsecutiveNumber,
	
	@EndUserText.label: 'Next Fiscal Year'
	cast (NextYear.FiscalYear as fins_next_fiscalyear preserving type) as NextFiscalYear,
	
	@EndUserText.label: 'Start of Next Fiscal Year'
	cast (NextYear.FiscalYearStartDate as fins_next_fyear_startdate preserving type) as NextFiscalYearStartDate,
	
	@EndUserText.label: 'End of Next Fiscal Year'
	cast (NextYear.FiscalYearEndDate as fins_next_fyear_enddate preserving type) as NextFiscalYearEndDate,
	_FiscalYearVariant
}