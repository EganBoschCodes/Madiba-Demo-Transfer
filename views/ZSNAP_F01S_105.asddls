@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP AP: Deriving Parameter Fields'

define view entity ZSNAP_F01S_105	
	with parameters
		P_KeyDate: sydate,
		P_NetDueInterval1InDays: abap.int4,
		P_NetDueInterval2InDays: abap.int4,
		P_NetDueInterval3InDays: abap.int4,
		P_NetDueInterval4InDays: abap.int4
	
	as select from ZSNAP_F01S_103 (P_KeyDate: $parameters.P_KeyDate, P_NetDueInterval1InDays: $parameters.P_NetDueInterval1InDays, P_NetDueInterval2InDays: $parameters.P_NetDueInterval2InDays, P_NetDueInterval3InDays: $parameters.P_NetDueInterval3InDays, P_NetDueInterval4InDays: $parameters.P_NetDueInterval4InDays) as main
{
	key main.CompanyCode,
	key main.FiscalYear,
	key main.AccountingDocument,
	key main.AccountingDocumentItem,
	main.DocumentItemText,
	main.AccountingDocumentCategory,
	main.AccountingDocumentType,
	main.InvoiceReference,
	main.InvoiceReferenceType,
	main.InvoiceItemReference,
	main.InvoiceReferenceFiscalYear,
	main.DebitCreditCode,
	main.ClearingAccountingDocument,
	main.ControllingArea,
	main.ChartOfAccounts,
	main.FiscalYearVariant,
	main.FinancialAccountType,
	cast (dats_days_between ($parameters.P_KeyDate, main.NetDueDate) as abap.dec (10, 0)) as NetDueArrearsDays,
	main.NetDueDate,
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
	main.Supplier,
	main.GLAccount,
	main.SpecialGLCode,
	main.CostCenter,
	main.ProfitCenter,
	main.FunctionalArea,
	main.BusinessArea,
	main.Segment,
	main.PurchasingDocument,
	main.AssignmentReference,
	cast (99999 as abap.int4) as MaxNetDueIntervalInDays,
	main.PosNetDueInterval1InDays,
	main.PosNetDueInterval2InDays,
	main.PosNetDueInterval3InDays,
	main.PosNetDueInterval4InDays,
	main.NegNetDueInterval1InDays,
	main.NegNetDueInterval2InDays,
	main.NegNetDueInterval3InDays,
	main.NegNetDueInterval4InDays,
	case
		when main.PosNetDueInterval4InDays <> 0 then 4
		when main.PosNetDueInterval3InDays <> 0 then 3
		when main.PosNetDueInterval2InDays <> 0 then 2
		when main.PosNetDueInterval1InDays <> 0 then 1
		else 0
	end as NumberOfParameters,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.AmountInCompanyCodeCurrency,
	main.CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	main.AmountInGlobalCurrency,
	main.GlobalCurrency,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.AmountInTransactionCurrency,
	main.TransactionCurrency
}