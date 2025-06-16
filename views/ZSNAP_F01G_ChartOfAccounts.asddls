@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Chart Of Accounts'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ChartOfAccounts'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F01G_ChartOfAccounts
	as select from t004 as main
	
	association [0..*] to ZSNAP_F01G_COAText as _Text on $projection.ChartOfAccounts = _Text.ChartOfAccounts
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Chart of Accounts'
	key cast (main.ktopl as fis_ktopl preserving type) as ChartOfAccounts,
	
	@EndUserText.label: 'Group Chart Of Accts'
	main.kktpl as CorporateGroupChartOfAccounts,
	
	@EndUserText.label: 'Blocked'
	main.xsper as ChartOfAcctsIsBlocked,
	
	@EndUserText.label: 'Maint.Language'
	main.dspra as MaintenanceLanguage,
	_Text
}