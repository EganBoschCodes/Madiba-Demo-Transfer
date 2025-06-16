@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Fiscal Year Quarter'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FiscalYearQuarter'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F80G_FiscYearQuarter
	as select from ZSNAP_F80G_P_FiscalQuarter as main
	
	left outer to one join ZSNAP_F80G_P_FiscalQuarter as NextQuarter on main.FiscalYearVariant = NextQuarter.FiscalYearVariant and main.NextFsclQuarterConsecutiveNmbr = NextQuarter.FiscalQuarterConsecutiveNumber
	
	association [0..1] to ZSNAP_F80G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
{
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	@EndUserText.label: 'Fiscal Year Variant'
	key main.FiscalYearVariant,
	
	@ObjectModel.text.element: ['FiscalYearQuarterText']
	@EndUserText.label: 'Fiscal Year Quarter'
	key main.FiscalYearQuarter,
	concat_with_space (main.FiscalYear, concat ('Q', main.FiscalQuarter), 1) as FiscalYearQuarterText,
	
	@EndUserText.label: 'Fiscal Year'
	main.FiscalYear,
	
	@EndUserText.label: 'Start Of Fiscal Year'
	main.FiscalYearStartDate,
	
	@EndUserText.label: 'End Of Fiscal Year'
	main.FiscalYearEndDate,
	
	@EndUserText.label: 'Fiscal Quarter'
	main.FiscalQuarter,
	
	@EndUserText.label: 'Start Fiscal Quarter'
	main.FiscalQuarterStartDate,
	
	@EndUserText.label: 'End Of Fscal Quarter'
	main.FiscalQuarterEndDate,
	
	@EndUserText.label: 'Fiscal Year Quarter (Numbering)'
	main.FiscalQuarterConsecutiveNumber,
	
	@EndUserText.label: 'Next Fiscal Quarter'
	cast (NextQuarter.FiscalQuarter as fins_next_fiscalquarter preserving type) as NextFiscalQuarter,
	
	@EndUserText.label: 'Next Fiscal Year'
	cast (NextQuarter.FiscalYear as fins_next_fiscalyear preserving type) as NextFiscalYear,
	
	@EndUserText.label: 'Next Fiscal Year Quarter'
	cast (NextQuarter.FiscalYearQuarter as fins_next_fyearquarter preserving type) as NextFiscalYearQuarter,
	
	@EndUserText.label: 'Start Next Fiscal Quarter'
	cast (NextQuarter.FiscalQuarterStartDate as fins_next_fquarter_startdate preserving type) as NextFiscalQuarterStartDate,
	
	@EndUserText.label: 'End Next Fiscal Quarter'
	cast (NextQuarter.FiscalQuarterEndDate as fins_next_fquarter_enddate preserving type) as NextFiscalQuarterEndDate,
	
	@EndUserText.label: 'Next  Fiscal Year Quarter (Numbering)'
	cast (main.NextFsclQuarterConsecutiveNmbr as fins_next_fyearquarter_i preserving type) as NextFsclQuarterConsecutiveNmbr,
	_FiscalYearVariant
}