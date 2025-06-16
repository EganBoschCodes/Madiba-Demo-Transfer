@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP F80: Field Derivation'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F80S_405	
	with parameters
		P_Signage: abap.char (1),
		P_CashStartDate: abap.dats
	
	as select from ZSNAP_F80S_403 (P_Client: $session.client, P_SystemDate: $session.system_date, P_CashStartDate: $parameters.P_CashStartDate) as main
	
	left outer to one join ZSNAP_F80G_OffsetCustomer as OffsetCustomer on main.CompanyCode = OffsetCustomer.CompanyCode and main.FiscalYear = OffsetCustomer.FiscalYear and main.AccountingDocument = OffsetCustomer.AccountingDocument
	left outer to one join ZSNAP_F80G_OffsetSupplier as OffsetSupplier on main.CompanyCode = OffsetSupplier.CompanyCode and main.FiscalYear = OffsetSupplier.FiscalYear and main.AccountingDocument = OffsetSupplier.AccountingDocument
	
	association [0..1] to ZSNAP_F80G_109 as _PCHierFlatten on $projection.ProfitCenter = _PCHierFlatten.ProfitCenter and $projection.ControllingArea = _PCHierFlatten.ControllingArea and _PCHierFlatten.ValidityEndDate = '99991231'
	association [0..1] to ZSNAP_F80G_129 as _GLHierFlatten on _GLHierFlatten.GLAccountHierarchy = 'BASK' and $projection.ChartOfAccounts = _GLHierFlatten.ChartOfAccounts and $projection.GLAccount = _GLHierFlatten.GLAccount and _GLHierFlatten.ValidityEndDate = '99991231'
	association [0..1] to ZSNAP_F80G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [0..1] to ZSNAP_F80G_FiscCalendarDate as _CashPostingDate on $projection.FiscalYearVariant = _CashPostingDate.FiscalYearVariant and $projection.CashPostingDate = _CashPostingDate.CalendarDate
	association [0..1] to ZSNAP_F80G_FiscCalendarDate as _FiscalCalendarDate on $projection.FiscalYearVariant = _FiscalCalendarDate.FiscalYearVariant and $projection.PostingDate = _FiscalCalendarDate.CalendarDate
	association [0..1] to ZSNAP_F80G_GLAccountInCOA as _GLAccountInChartOfAccounts on $projection.ChartOfAccounts = _GLAccountInChartOfAccounts.ChartOfAccounts and $projection.GLAccount = _GLAccountInChartOfAccounts.GLAccount
	association [0..1] to ZSNAP_F80G_JournalEntry as _JournalEntry on $projection.CompanyCode = _JournalEntry.CompanyCode and $projection.FiscalYear = _JournalEntry.FiscalYear and $projection.AccountingDocument = _JournalEntry.AccountingDocument
	association [1..1] to ZSNAP_F80G_OplAcctgDocItem as _AccountingDocumentItem on $projection.CompanyCode = _AccountingDocumentItem.CompanyCode and $projection.FiscalYear = _AccountingDocumentItem.FiscalYear and $projection.AccountingDocument = _AccountingDocumentItem.AccountingDocument and $projection.AccountingDocumentItem = _AccountingDocumentItem.AccountingDocumentItem
{
	key main.AccountingDocument,
	key main.CompanyCode,
	key main.FiscalYear,
	key main.Ledger,
	key main.LedgerGLLineItem,
	key main.SourceLedger,
	main.AccountingDocumentItem,
	main.AccountingDocumentType,
	main.ChartOfAccounts,
	main.AssignmentReference,
	main.TransactionTypeDetermination,
	_JournalEntry.DocumentReferenceID,
	_JournalEntry.AccountingDocumentHeaderText as DocumentHeaderText,
	_JournalEntry.ReverseDocument,
	_JournalEntry.ReverseDocumentFiscalYear,
	_JournalEntry.IntercompanyTransaction,
	_JournalEntry.TransactionCode,
	_GLAccountInChartOfAccounts.ProfitLossAccountType,
	_GLAccountInChartOfAccounts.IsBalanceSheetAccount,
	_GLAccountInChartOfAccounts.IsProfitLossAccount,
	_AccountingDocumentItem.IsAutomaticallyCreated,
	_AccountingDocumentItem.IsUsedInPaymentTransaction,
	_AccountingDocumentItem.DueCalculationBaseDate,
	main.OrderID,
	main.ClearingAccountingDocument,
	main.ControllingArea,
	main.CostCenter,
	_CompanyCode.Country,
	main.CustomerGroup,
	main.DebitCreditCode,
	main.DocumentItemText,
	main.FinancialAccountType,
	main.FollowOnDocumentType,
	main.GLAccount,
	_GLHierFlatten.GLAcctLevel1,
	_GLHierFlatten.GLAcctLevel2,
	_GLHierFlatten.GLAcctLevel3,
	_GLHierFlatten.GLAcctLevel4,
	_GLHierFlatten.GLAcctLevel5,
	main.InvoiceItemReference,
	main.InvoiceReference,
	main.IsOpenItemManaged,
	main.IsReversal,
	main.IsReversed,
	main.Material,
	main.MaterialGroup,
	main.PartnerCompany,
	main.PostingKey,
	main.Product,
	_PCHierFlatten.ProfCtrLevel1,
	_PCHierFlatten.ProfCtrLevel2,
	_PCHierFlatten.ProfCtrLevel3,
	_PCHierFlatten.ProfCtrLevel4,
	_PCHierFlatten.ProfCtrLevel5,
	main.ProfitCenter,
	main.Project,
	main.ReferenceDocument,
	main.ReferenceDocumentItem,
	main.Source,
	main.ResetFlag,
	substring (cast (main.EntryCounter as abap.char (20)), 1, 2) as EntryCounter,
	main.SpecialGLCode,
	main.TaxCode,
	case
		when main.Customer = '' then OffsetCustomer.Customer
		else main.Customer
	end as Customer,
	case
		when main.Supplier = '' then OffsetSupplier.Supplier
		else main.Supplier
	end as Supplier,
	main.WBSElement,
	main.Title,
	main.CashPostingDate,
	_CashPostingDate.FiscalYear as CashYear,
	_CashPostingDate.FiscalQuarter as CashQuarter,
	_CashPostingDate.FiscalYearQuarter as CashYearQuarter,
	_CashPostingDate.FiscalPeriod as CashPeriod,
	_CashPostingDate.FiscalYearPeriod as CashYearPeriod,
	_CashPostingDate.FiscalYearWeek as CashYearWeek,
	main.ClearingDate,
	case
		when main.ClearingDate is not initial then 'X'
	end as IsCleared,
	_JournalEntry.AccountingDocCreatedByUser as CreatedByUser,
	main.DocumentDate,
	main.FiscalYearVariant,
	main.InvoiceReferenceFiscalYear,
	main.PostingDate,
	_FiscalCalendarDate.FiscalPeriod as PostPeriod,
	_FiscalCalendarDate.FiscalQuarter as PostQuarter,
	_FiscalCalendarDate.FiscalYear as PostYear,
	_FiscalCalendarDate.FiscalYearPeriod as PostYearPeriod,
	_FiscalCalendarDate.FiscalYearQuarter as PostYearQuarter,
	_FiscalCalendarDate.FiscalYearWeek as PostYearWeek,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	case
		when $parameters.P_Signage = 'A' then main.AmountInTransactionCurrency
		else -main.AmountInTransactionCurrency
	end as AmountInTransactionCurrency,
	main.TransactionCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	case
		when $parameters.P_Signage = 'A' then main.AmountInGlobalCurrency
		else -main.AmountInGlobalCurrency
	end as AmountInGlobalCurrency,
	main.GlobalCurrency,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	case
		when $parameters.P_Signage = 'A' then main.AmountInCompanyCodeCurrency
		else -main.AmountInCompanyCodeCurrency
	end as AmountInCompanyCodeCurrency,
	main.CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'FourthCurrency'
	case
		when $parameters.P_Signage = 'A' then main.AmountInFourthCurrency
		else -main.AmountInFourthCurrency
	end as AmountInFourthCurrency,
	main.FourthCurrency
}