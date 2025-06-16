@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP AP: Aging Grid Base'

define view entity ZSNAP_F01S_103	
	with parameters
		P_KeyDate: sydate,
		P_NetDueInterval1InDays: abap.int4,
		P_NetDueInterval2InDays: abap.int4,
		P_NetDueInterval3InDays: abap.int4,
		P_NetDueInterval4InDays: abap.int4
	
	as select from ZSNAP_F01S_050 (P_KeyDate: $parameters.P_KeyDate) as main
	
	association [0..1] to ZSNAP_F01G_OplAcctgDocItem as _ReferencedInvoices on main.CompanyCode = _ReferencedInvoices.CompanyCode and main.InvoiceReference = _ReferencedInvoices.AccountingDocument and main.InvoiceItemReference = _ReferencedInvoices.AccountingDocumentItem and main.InvoiceReferenceFiscalYear = _ReferencedInvoices.FiscalYear and _ReferencedInvoices.FinancialAccountType = 'K' and main.AccountingDocumentCategory = _ReferencedInvoices.AccountingDocumentCategory
{
	key main.CompanyCode,
	key main.FiscalYear,
	key main.AccountingDocument,
	key main.AccountingDocumentItem,
	main.DocumentItemText,
	main.AccountingDocumentCategory,
	main.AccountingDocumentType,
	main.ClearingAccountingDocument,
	main.ControllingArea,
	main.ChartOfAccounts,
	main.FiscalYearVariant,
	main.InvoiceReference,
	main.InvoiceItemReference,
	main.InvoiceReferenceFiscalYear,
	main.DebitCreditCode,
	main.ClearingDate,
	main.PostingDate,
	main.DocumentDate,
	main.DueCalculationBaseDate,
	main.CashDiscount1Days,
	main.CashDiscount1Percent,
	main.CashDiscount1Date,
	main.CashDiscount2Days,
	main.CashDiscount2Percent,
	main.CashDiscount2Date,
	main.PaymentTerms,
	main.PaymentBlockingReason,
	main.PaymentMethod,
	main.IsUsedInPaymentTransaction,
	main.PostingKey,
	main.FinancialAccountType,
	main.Supplier,
	main.InvoiceReferenceType,
	case
		when main.InvoiceReferenceType = '' or main.InvoiceReferenceType = 'V' or main.InvoiceReferenceType = 'P' or (main.InvoiceReference = '' and main.InvoiceItemReference = '000' and main.InvoiceReferenceFiscalYear = '0000') then main.NetDueDate
		else _ReferencedInvoices.NetDueDate
	end as NetDueDate,
	main.SpecialGLCode,
	main.GLAccount,
	main.CostCenter,
	main.ProfitCenter,
	main.FunctionalArea,
	main.BusinessArea,
	main.Segment,
	main.PurchasingDocument,
	main.AssignmentReference,
	$parameters.P_NetDueInterval1InDays as PosNetDueInterval1InDays,
	$parameters.P_NetDueInterval2InDays as PosNetDueInterval2InDays,
	$parameters.P_NetDueInterval3InDays as PosNetDueInterval3InDays,
	$parameters.P_NetDueInterval4InDays as PosNetDueInterval4InDays,
	-1 * $parameters.P_NetDueInterval1InDays as NegNetDueInterval1InDays,
	-1 * $parameters.P_NetDueInterval2InDays as NegNetDueInterval2InDays,
	-1 * $parameters.P_NetDueInterval3InDays as NegNetDueInterval3InDays,
	-1 * $parameters.P_NetDueInterval4InDays as NegNetDueInterval4InDays,
	main.Title,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.AmountInCompanyCodeCurrency,
	main.CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	main.AmountInGlobalCurrency,
	main.GlobalCurrency,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.AmountInTransactionCurrency,
	main.TransactionCurrency,
	_ReferencedInvoices
}
where main.ClearingDate > $parameters.P_KeyDate
	or main.ClearingDate = '00000000'