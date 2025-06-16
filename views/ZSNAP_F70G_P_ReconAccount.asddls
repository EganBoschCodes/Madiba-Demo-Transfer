@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'P: Reconciliation Account'

define view entity ZSNAP_F70G_P_ReconAccount
	as select from ZSNAP_F70G_P_ReconAccBasis as main
	
	association [0..1] to ZSNAP_F70G_GLAccountInCOA as _Data on $projection.ReconciliationAccount = _Data.GLAccount and $projection.ChartOfAccounts = _Data.ChartOfAccounts
{
	key main.ReconciliationAccount,
	key main.ChartOfAccounts,
	key main.ReconAccountType,
	_Data.IsBalanceSheetAccount,
	_Data.GLAccountGroup,
	_Data.CorporateGroupChartOfAccounts,
	_Data.CorporateGroupAccount,
	_Data.ProfitLossAccountType,
	_Data.SampleGLAccount,
	_Data.AccountIsMarkedForDeletion,
	_Data.AccountIsBlockedForCreation,
	_Data.AccountIsBlockedForPosting,
	_Data.AccountIsBlockedForPlanning,
	_Data.PartnerCompany,
	_Data.FunctionalArea,
	_Data.CreationDate,
	_Data.CreatedByUser,
	_Data.LastChangeDateTime,
	_Data.GLAccountType,
	_Data.GLAccountSubtype,
	_Data.GLAccountExternal,
	_Data.BankReconciliationAccount
}