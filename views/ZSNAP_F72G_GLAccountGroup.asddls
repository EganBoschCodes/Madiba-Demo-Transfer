@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'General Ledger Account Group'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'GLAccountGroup'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_GLAccountGroup
	as select from t077s as main
	
	association [1] to ZSNAP_F72G_ChartOfAccounts as _ChartOfAccounts on $projection.ChartOfAccounts = _ChartOfAccounts.ChartOfAccounts
	association [0..*] to ZSNAP_F72G_COAText as _ChartOfAccountsText on $projection.ChartOfAccounts = _ChartOfAccountsText.ChartOfAccounts
	association [0..*] to ZSNAP_F72G_GLAccGroupText as _GLAccountGroupText on $projection.ChartOfAccounts = _GLAccountGroupText.ChartOfAccounts and $projection.GLAccountGroup = _GLAccountGroupText.GLAccountGroup
{
	@ObjectModel.foreignKey.association: '_ChartOfAccounts'
	@ObjectModel.text.association: '_ChartOfAccountsText'
	@EndUserText.label: 'Chart Of Accounts'
	key main.ktopl as ChartOfAccounts,
	
	@ObjectModel.text.association: '_GLAccountGroupText'
	@EndUserText.label: 'Account Group'
	key main.ktoks as GLAccountGroup,
	_ChartOfAccounts,
	_ChartOfAccountsText,
	_GLAccountGroupText
}