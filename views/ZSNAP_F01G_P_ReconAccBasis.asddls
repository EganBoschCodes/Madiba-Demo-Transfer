@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'P: Reconciliation Account Basis'

define view entity ZSNAP_F01G_P_ReconAccBasis
	as select from ZSNAP_F01G_GLAccInCoCode as main
	
	left outer to one join ZSNAP_F01G_CompanyCode as CompCode on CompCode.CompanyCode = main.CompanyCode
{
	key main.GLAccount as ReconciliationAccount,
	key CompCode.ChartOfAccounts,
	key main.ReconciliationAccountType as ReconAccountType
}
where main.ReconciliationAccountType <> ''
group by main.GLAccount,
	CompCode.ChartOfAccounts,
	main.ReconciliationAccountType