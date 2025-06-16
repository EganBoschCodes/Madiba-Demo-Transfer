@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Supplier Reconciliation Account'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ReconciliationAccount'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_SupplierReconAcc
	as select from ZSNAP_F70G_P_ReconAccount as main
	
	association [0..1] to ZSNAP_F70G_ChartOfAccounts as _ChartOfAccounts on $projection.ChartOfAccounts = _ChartOfAccounts.ChartOfAccounts
	association [0..*] to ZSNAP_F70G_GLAccGroupText as _GLAccountGroupText on $projection.GLAccountGroup = _GLAccountGroupText.GLAccountGroup and $projection.ChartOfAccounts = _GLAccountGroupText.ChartOfAccounts
	association [0..*] to ZSNAP_F70G_GLAccountText as _Text on $projection.ChartOfAccounts = _Text.ChartOfAccounts and $projection.ReconciliationAccount = _Text.GLAccount
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'G/L Account'
	key main.ReconciliationAccount,
	
	@ObjectModel.foreignKey.association: '_ChartOfAccounts'
	@EndUserText.label: 'Chart Of Accounts'
	key main.ChartOfAccounts,
	
	@EndUserText.label: 'Balance Sheet Account'
	main.IsBalanceSheetAccount,
	
	@ObjectModel.text.association: '_GLAccountGroupText'
	@EndUserText.label: 'Account Group'
	main.GLAccountGroup,
	
	@EndUserText.label: 'Group Chart Of Accts'
	main.CorporateGroupChartOfAccounts,
	
	@EndUserText.label: 'Group Account Number'
	main.CorporateGroupAccount,
	
	@EndUserText.label: 'P&L Statmt Acct Type'
	main.ProfitLossAccountType,
	
	@EndUserText.label: 'Sample Account'
	main.SampleGLAccount,
	
	@EndUserText.label: 'Mark For Deletion'
	main.AccountIsMarkedForDeletion,
	
	@EndUserText.label: 'Blocked For Creation'
	main.AccountIsBlockedForCreation,
	
	@EndUserText.label: 'Blocked For Posting'
	main.AccountIsBlockedForPosting,
	
	@EndUserText.label: 'Blocked For Planning'
	main.AccountIsBlockedForPlanning,
	
	@EndUserText.label: 'Trading Partner No.'
	main.PartnerCompany,
	
	@EndUserText.label: 'Functional Area'
	main.FunctionalArea,
	
	@EndUserText.label: 'Created On'
	main.CreationDate,
	
	@EndUserText.label: 'Created By'
	main.CreatedByUser,
	
	@EndUserText.label: 'Time Stamp'
	main.LastChangeDateTime,
	
	@EndUserText.label: 'G/L Account Type'
	main.GLAccountType,
	
	@EndUserText.label: 'G/L Account Subtype'
	main.GLAccountSubtype,
	
	@EndUserText.label: 'G/L Account External ID'
	main.GLAccountExternal,
	
	@EndUserText.label: 'Reconciliation Account'
	main.BankReconciliationAccount,
	_ChartOfAccounts,
	_GLAccountGroupText,
	_Text
}
where main.ReconAccountType = 'K'