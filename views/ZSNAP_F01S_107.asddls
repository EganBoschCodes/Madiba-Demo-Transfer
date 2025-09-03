@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP F01: Deriving Net Due Interval'

define view entity ZSNAP_F01S_107	
	with parameters
		P_KeyDate: sydate,
		P_NetDueInterval1InDays: abap.int4,
		P_NetDueInterval2InDays: abap.int4,
		P_NetDueInterval3InDays: abap.int4,
		P_NetDueInterval4InDays: abap.int4
	
	as select from ZSNAP_F01S_105 (P_KeyDate: $parameters.P_KeyDate, P_NetDueInterval1InDays: $parameters.P_NetDueInterval1InDays, P_NetDueInterval2InDays: $parameters.P_NetDueInterval2InDays, P_NetDueInterval3InDays: $parameters.P_NetDueInterval3InDays, P_NetDueInterval4InDays: $parameters.P_NetDueInterval4InDays) as main
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
	main.NetDueArrearsDays,
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
	main.PartnerCompany,
	main.GLAccount,
	main.SpecialGLCode,
	main.CostCenter,
	main.ProfitCenter,
	main.FunctionalArea,
	main.BusinessArea,
	main.Segment,
	main.PurchasingDocument,
	main.AssignmentReference,
	case
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays < -$parameters.P_NetDueInterval4InDays then 5
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays < -$parameters.P_NetDueInterval3InDays then 4
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays < -$parameters.P_NetDueInterval2InDays then 3
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays < -$parameters.P_NetDueInterval1InDays then 2
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays < 0 then 1
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays = 0 then 0
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays <= $parameters.P_NetDueInterval1InDays then -1
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays <= $parameters.P_NetDueInterval2InDays then -2
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays <= $parameters.P_NetDueInterval3InDays then -3
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays <= $parameters.P_NetDueInterval4InDays then -4
		when main.NumberOfParameters = 4 then -5
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays < -$parameters.P_NetDueInterval3InDays then 4
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays < -$parameters.P_NetDueInterval2InDays then 3
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays < -$parameters.P_NetDueInterval1InDays then 2
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays < 0 then 1
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays = 0 then 0
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays <= $parameters.P_NetDueInterval1InDays then -1
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays <= $parameters.P_NetDueInterval2InDays then -2
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays <= $parameters.P_NetDueInterval3InDays then -3
		when main.NumberOfParameters = 3 then -4
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays < -$parameters.P_NetDueInterval2InDays then 3
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays < -$parameters.P_NetDueInterval1InDays then 2
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays < 0 then 1
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays = 0 then 0
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays <= $parameters.P_NetDueInterval1InDays then -1
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays <= $parameters.P_NetDueInterval2InDays then -2
		when main.NumberOfParameters = 2 then -3
		when main.NumberOfParameters = 1 and main.NetDueArrearsDays < -$parameters.P_NetDueInterval1InDays then 2
		when main.NumberOfParameters = 1 and main.NetDueArrearsDays < 0 then 1
		when main.NumberOfParameters = 1 and main.NetDueArrearsDays = 0 then 0
		when main.NumberOfParameters = 1 and main.NetDueArrearsDays <= $parameters.P_NetDueInterval1InDays then -1
		when main.NumberOfParameters = 1 then -2
		when main.NumberOfParameters = 0 and main.NetDueArrearsDays < 0 then 1
		when main.NumberOfParameters = 0 and main.NetDueArrearsDays = 0 then 0
		else -1
	end as NetDueInterval,
	main.Title,
	
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