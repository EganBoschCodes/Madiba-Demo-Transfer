@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'G/L Account In Chart Of Accounts'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'GLAccount'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F80G_GLAccountInCOA
	as select from ska1 as main
	
	association [0..1] to ZSNAP_F80G_ChartOfAccounts as _ChartOfAccounts on $projection.ChartOfAccounts = _ChartOfAccounts.ChartOfAccounts
	association [0..*] to ZSNAP_F80G_GLAccGroupText as _GLAccountGroupText on $projection.GLAccountGroup = _GLAccountGroupText.GLAccountGroup and $projection.ChartOfAccounts = _GLAccountGroupText.ChartOfAccounts
	association [0..*] to ZSNAP_F80G_GLAccHierNode as _GLAccountHierarchyNode on $projection.GLAccount = _GLAccountHierarchyNode.GLAccount and $projection.ChartOfAccounts = _GLAccountHierarchyNode.ChartOfAccounts
	association [0..*] to ZSNAP_F80G_GLAccountText as _Text on $projection.ChartOfAccounts = _Text.ChartOfAccounts and $projection.GLAccount = _Text.GLAccount
{
	@ObjectModel.foreignKey.association: '_ChartOfAccounts'
	@EndUserText.label: 'Chart Of Accounts'
	key main.ktopl as ChartOfAccounts,
	
	@ObjectModel.hierarchy.association: '_GLAccountHierarchyNode'
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'G/L Account'
	key cast (main.saknr as saknr preserving type) as GLAccount,
	
	@EndUserText.label: 'Balance Sheet Account'
	main.xbilk as IsBalanceSheetAccount,
	
	@ObjectModel.text.association: '_GLAccountGroupText'
	@EndUserText.label: 'Account Group'
	main.ktoks as GLAccountGroup,
	
	@EndUserText.label: 'Group Chart Of Accts'
	_ChartOfAccounts.CorporateGroupChartOfAccounts,
	
	@EndUserText.label: 'Group Account Number'
	main.bilkt as CorporateGroupAccount,
	
	@EndUserText.label: 'P&L Statmt Acct Type'
	main.gvtyp as ProfitLossAccountType,
	
	@EndUserText.label: 'Sample Account'
	main.mustr as SampleGLAccount,
	
	@EndUserText.label: 'Mark For Deletion'
	main.xloev as AccountIsMarkedForDeletion,
	
	@EndUserText.label: 'Blocked For Creation'
	main.xspea as AccountIsBlockedForCreation,
	
	@EndUserText.label: 'Blocked For Posting'
	main.xspeb as AccountIsBlockedForPosting,
	
	@EndUserText.label: 'Blocked For Planning'
	main.xspep as AccountIsBlockedForPlanning,
	
	@EndUserText.label: 'Trading Partner No.'
	main.vbund as PartnerCompany,
	
	@EndUserText.label: 'Functional Area'
	main.func_area as FunctionalArea,
	
	@EndUserText.label: 'Created On'
	main.erdat as CreationDate,
	
	@EndUserText.label: 'Created By'
	main.ernam as CreatedByUser,
	
	@EndUserText.label: 'Time Stamp'
	main.last_changed_ts as LastChangeDateTime,
	
	@EndUserText.label: 'G/L Account Type'
	main.glaccount_type as GLAccountType,
	
	@EndUserText.label: 'G/L Account Subtype'
	main.glaccount_subtype as GLAccountSubtype,
	
	@EndUserText.label: 'G/L Account External ID'
	cast (main.sakan as fac_sakan) as GLAccountExternal,
	
	@EndUserText.label: 'Reconciliation Account'
	main.main_saknr as BankReconciliationAccount,
	
	@EndUserText.label: 'Profit Loss Account'
	cast (case
		when main.xbilk = 'X' then ''
		else 'X'
	end as xbilk) as IsProfitLossAccount,
	
	@EndUserText.label: 'GL Account Series'
	substring (ltrim (main.saknr, '0'), 1, 1) as GLAccountSeries,
	_ChartOfAccounts,
	
	@Consumption.hidden: true
	_GLAccountGroupText,
	_GLAccountHierarchyNode,
	_Text
}