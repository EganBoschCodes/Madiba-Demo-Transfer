@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP F01: Aging Grid Base'

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
	case main.UseReferencedInvoiceDates
		when 'X' then main.CashDiscount1Date
		else _ReferencedInvoices.CashDiscount1Date
	end as CashDiscount1Date,
	main.CashDiscount2Days,
	main.CashDiscount2Percent,
	case main.UseReferencedInvoiceDates
		when 'X' then main.CashDiscount2Date
		else _ReferencedInvoices.CashDiscount2Date
	end as CashDiscount2Date,
	main.PaymentTerms,
	main.PaymentBlockingReason,
	main.PaymentMethod,
	main.IsUsedInPaymentTransaction,
	main.PostingKey,
	main.FinancialAccountType,
	main.Supplier,
	main.InvoiceReferenceType,
	case main.UseReferencedInvoiceDates
		when 'X' then main.NetDueDate
		else _ReferencedInvoices.NetDueDate
	end as NetDueDate,
	main.SpecialGLCode,
	main.GLAccount,
	main.CostCenter,
	main.ProfitCenter,
	main.FunctionalArea,
	main.BusinessArea,
	main.Segment,
	main.PartnerCompany,
	main.PurchasingDocument,
	main.AssignmentReference,
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