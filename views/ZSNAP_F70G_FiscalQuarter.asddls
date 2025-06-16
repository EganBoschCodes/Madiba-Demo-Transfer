@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Fiscal Quarter'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FiscalQuarter'

define view entity ZSNAP_F70G_FiscalQuarter
	as select from ZSNAP_F70G_P_FiscalQuarter as main
	
	left outer to one join ZSNAP_F70G_P_FiscalQuarter as NextQuarter on main.FiscalYearVariant = NextQuarter.FiscalYearVariant and main.NextFsclQuarterConsecutiveNmbr = NextQuarter.FiscalQuarterConsecutiveNumber
	
	association [0..1] to ZSNAP_F70G_FiscalYear as _FiscalYear on $projection.FiscalYear = _FiscalYear.FiscalYear and $projection.FiscalYearVariant = _FiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F70G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
{
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	@EndUserText.label: 'Fiscal Year Variant'
	key main.FiscalYearVariant,
	
	@ObjectModel.foreignKey.association: '_FiscalYear'
	@EndUserText.label: 'Fiscal Year'
	key main.FiscalYear,
	
	@EndUserText.label: 'Fiscal Quarter'
	key main.FiscalQuarter,
	
	@EndUserText.label: 'Start Of Fiscal Year'
	main.FiscalYearStartDate,
	
	@EndUserText.label: 'End Of Fiscal Year'
	main.FiscalYearEndDate,
	
	@EndUserText.label: 'Fiscal Year Quarter'
	main.FiscalYearQuarter,
	
	@EndUserText.label: 'Start Fiscal Quarter'
	main.FiscalQuarterStartDate,
	
	@EndUserText.label: 'End Of Fscal Quarter'
	main.FiscalQuarterEndDate,
	
	@EndUserText.label: 'Fiscal Year Quarter (Numbering)'
	main.FiscalQuarterConsecutiveNumber,
	
	@EndUserText.label: 'Fiscal Quarter'
	NextQuarter.FiscalQuarter as NextFiscalQuarter,
	
	@EndUserText.label: 'Fiscal Year Quarter'
	NextQuarter.FiscalYearQuarter as NextFiscalYearQuarter,
	
	@EndUserText.label: 'Start Fiscal Quarter'
	NextQuarter.FiscalQuarterStartDate as NextFiscalQuarterStartDate,
	
	@EndUserText.label: 'End Of Fscal Quarter'
	NextQuarter.FiscalQuarterEndDate as NextFiscalQuarterEndDate,
	
	@EndUserText.label: 'Fiscal Year Quarter (Numbering)'
	main.NextFsclQuarterConsecutiveNmbr,
	_FiscalYear,
	_FiscalYearVariant
}