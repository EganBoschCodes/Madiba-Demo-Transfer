@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'G/L Account Group - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'GLAccountGroup'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_GLAccGroupText
	as select from t077z as main
	
	association [0..1] to ZSNAP_F72G_ChartOfAccounts as _ChartOfAccounts on $projection.ChartOfAccounts = _ChartOfAccounts.ChartOfAccounts
{
	@ObjectModel.foreignKey.association: '_ChartOfAccounts'
	key main.ktopl as ChartOfAccounts,
	key main.ktoks as GLAccountGroup,
	
	@Semantics.language
	key main.spras as Language,
	
	@Semantics.text: true
	main.txt30 as AccountGroupName,
	_ChartOfAccounts
}
where main.spras = $session.system_language