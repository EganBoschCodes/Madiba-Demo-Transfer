@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP F01: Isolate AP Journal Items'

define view entity ZSNAP_F01S_050	
	with parameters
		P_KeyDate: sydate
	
	as select from ZSNAP_F01G_JournalEntryItem as main
	
	association [0..1] to ZSNAP_F01G_OffsetPO as _OffsetPurchaseOrder on main.CompanyCode = _OffsetPurchaseOrder.CompanyCode and main.FiscalYear = _OffsetPurchaseOrder.FiscalYear and main.AccountingDocument = _OffsetPurchaseOrder.AccountingDocument
	association [0..1] to ZSNAP_F01G_OplAcctgDocItem as _OperationalAcctgDocItem on $projection.CompanyCode = _OperationalAcctgDocItem.CompanyCode and $projection.FiscalYear = _OperationalAcctgDocItem.FiscalYear and $projection.AccountingDocument = _OperationalAcctgDocItem.AccountingDocument and $projection.AccountingDocumentItem = _OperationalAcctgDocItem.AccountingDocumentItem
{
	key main.CompanyCode,
	key main.FiscalYear,
	key main.AccountingDocument,
	key main.AccountingDocumentItem,
	_OperationalAcctgDocItem.DocumentItemText,
	main.AccountingDocumentCategory,
	main.AccountingDocumentType,
	main.ControllingArea,
	main.ChartOfAccounts,
	main.FiscalYearVariant,
	main.InvoiceReference,
	main.InvoiceItemReference,
	main.InvoiceReferenceFiscalYear,
	_OperationalAcctgDocItem.ClearingAccountingDocument,
	main.DebitCreditCode,
	main.ClearingDate,
	main.PostingDate,
	main.DocumentDate,
	_OperationalAcctgDocItem.DueCalculationBaseDate,
	_OperationalAcctgDocItem.CashDiscount1Days,
	concat (cast (cast (coalesce (_OperationalAcctgDocItem.CashDiscount1Percent, cast (0 as abap.dec(5, 3))) as abap.dec(5, 2)) as abap.char(20)), '%') as CashDiscount1Percent,
	_OperationalAcctgDocItem.CashDiscount1Date,
	_OperationalAcctgDocItem.CashDiscount2Days,
	concat (cast (cast (coalesce (_OperationalAcctgDocItem.CashDiscount2Percent, cast (0 as abap.dec(5, 3))) as abap.dec(5, 2)) as abap.char(20)), '%') as CashDiscount2Percent,
	_OperationalAcctgDocItem.CashDiscount2Date,
	_OperationalAcctgDocItem.PaymentBlockingReason,
	_OperationalAcctgDocItem.PaymentMethod,
	_OperationalAcctgDocItem.IsUsedInPaymentTransaction,
	main.FinancialAccountType,
	main.Supplier,
	main.FollowOnDocumentType as InvoiceReferenceType,
	main.NetDueDate,
	case
		when main.FollowOnDocumentType = '' or main.FollowOnDocumentType = 'V' or main.FollowOnDocumentType = 'P' or (main.InvoiceReference = '' and main.InvoiceItemReference = '000' and main.InvoiceReferenceFiscalYear = '0000') then 'X'
		else ''
	end as UseReferencedInvoiceDates,
	main.SpecialGLCode,
	main.GLAccount,
	main.CostCenter,
	main.ProfitCenter,
	main.FunctionalArea,
	main.BusinessArea,
	main.PartnerCompany,
	main.Segment,
	case main.PurchasingDocument
		when '' then coalesce (_OffsetPurchaseOrder.PurchaseOrder, '')
		else main.PurchasingDocument
	end as PurchasingDocument,
	main.AssignmentReference,
	_OperationalAcctgDocItem.PaymentTerms,
	main.PostingKey,
	main.Title,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.AmountInCompanyCodeCurrency,
	main.CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.AmountInTransactionCurrency,
	main.TransactionCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	main.AmountInGlobalCurrency,
	main.GlobalCurrency
}
where main.SourceLedger = '0L'
	and main.Ledger = '0L'
	and main.FinancialAccountType = 'K'
	and main.AccountingDocumentCategory = ''
	and main.AccountingDocumentItem <> '000'
	and main.NetDueDate <> '00000000'
	and main.NetDueDate is not null
	and main.PostingDate <= $parameters.P_KeyDate