@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Fiscal Year Variant'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FiscalYearVariant'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_FiscYearVariant
	as select from t009 as main
	
	association [0..*] to ZSNAP_F72G_FiscYearVrntTxt as _Text on $projection.FiscalYearVariant = _Text.FiscalYearVariant
{
	@ObjectModel.text.association: '_Text'
	@Semantics.fiscal.yearVariant: true
	@EndUserText.label: 'Fiscal Year Variant'
	key cast (main.periv as fis_periv preserving type) as FiscalYearVariant,
	
	@EndUserText.label: 'Fiscal Period Is Equal Month'
	cast (main.xkale as fis_xkale preserving type) as FiscalPeriodIsEqualMonth,
	
	@EndUserText.label: 'Year-Dependent'
	main.xjabh as IsYearDependent,
	
	@EndUserText.label: 'No. Posting Periods'
	main.anzbp as PostingPeriodsNumberVal,
	
	@EndUserText.label: 'No. Special Periods'
	main.anzsp as NumberOfSpecialPeriods,
	
	@EndUserText.label: 'Fiscal Weeks From Fy Start'
	main.xweek as FsclWeekStartIsFsclYearStart,
	
	@EndUserText.label: 'Weekly Calendar'
	main.xweekquart as FiscalCalendarIsWeekBased,
	_Text
}