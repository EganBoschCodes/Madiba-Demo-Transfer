@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'General Ledger Account - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'GLAccount'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F80G_GLAccountText
	as select from ZSNAP_F80G_P_GLAcctInDfl_BC as main
	
	association [0..1] to ZSNAP_F80G_ChartOfAccounts as _ChartOfAccounts on $projection.ChartOfAccounts = _ChartOfAccounts.ChartOfAccounts
{
	@ObjectModel.foreignKey.association: '_ChartOfAccounts'
	key main.ktopl as ChartOfAccounts,
	
	@ObjectModel.text.element: ['GLAccountLongName']
	key main.saknr as GLAccount,
	
	@Semantics.language: true
	key main.Language,
	
	@Semantics.text: true
	main.txt20 as GLAccountName,
	
	@Semantics.text: true
	main.txt50 as GLAccountLongName,
	main.last_changed_ts as LastChangeDateTime,
	_ChartOfAccounts
}
where main.Language = $session.system_language