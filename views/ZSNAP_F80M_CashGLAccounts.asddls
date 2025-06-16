@EndUserText.label: 'SNAP F80: Cash Accounts'

define view entity ZSNAP_F80M_CashGLAccounts
	as select from ZSNAP_F80G_129 as main
{
	key main.GLAccount
}
where main.GLAccountHierarchy = 'BASK'
	and (main.GLAcctLevel1 = '0169' or main.GLAcctLevel2 = '0169' or main.GLAcctLevel3 = '0169' or main.GLAcctLevel4 = '0169' or main.GLAcctLevel5 = '0169' or main.GLAcctLevel6 = '0169')