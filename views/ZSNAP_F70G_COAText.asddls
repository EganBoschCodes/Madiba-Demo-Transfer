@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Chart Of Accounts - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'ChartOfAccounts'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_COAText
	as select from t004t as main
{
	key cast (main.ktopl as fis_ktopl) as ChartOfAccounts,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@EndUserText.label: 'Chart Of Accounts Description'
	@Semantics.text: true
	main.ktplt as ChartOfAccountsName
}
where main.spras = $session.system_language