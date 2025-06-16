@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP AP: Deriving Net Due Interval'

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
	main.GLAccount,
	main.SpecialGLCode,
	main.CostCenter,
	main.ProfitCenter,
	main.FunctionalArea,
	main.BusinessArea,
	main.Segment,
	main.PurchasingDocument,
	main.AssignmentReference,
	main.PosNetDueInterval1InDays,
	main.PosNetDueInterval2InDays,
	main.PosNetDueInterval3InDays,
	main.PosNetDueInterval4InDays,
	main.NegNetDueInterval1InDays,
	main.NegNetDueInterval2InDays,
	main.NegNetDueInterval3InDays,
	main.NegNetDueInterval4InDays,
	main.MaxNetDueIntervalInDays,
	main.NumberOfParameters,
	case
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays < main.NegNetDueInterval4InDays then main.MaxNetDueIntervalInDays
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays < main.NegNetDueInterval3InDays and main.NetDueArrearsDays >= main.NegNetDueInterval4InDays then main.PosNetDueInterval4InDays
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays < main.NegNetDueInterval2InDays and main.NetDueArrearsDays >= main.NegNetDueInterval3InDays then main.PosNetDueInterval3InDays
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays < main.NegNetDueInterval1InDays and main.NetDueArrearsDays >= main.NegNetDueInterval2InDays then main.PosNetDueInterval2InDays
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays < 0 and main.NetDueArrearsDays >= main.NegNetDueInterval1InDays then main.PosNetDueInterval1InDays
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays <= main.PosNetDueInterval1InDays then 0
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays <= main.PosNetDueInterval2InDays then main.NegNetDueInterval1InDays
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays <= main.PosNetDueInterval3InDays then main.NegNetDueInterval2InDays
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays <= main.PosNetDueInterval4InDays then main.NegNetDueInterval3InDays
		when main.NumberOfParameters = 4 then main.NegNetDueInterval4InDays
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays < main.NegNetDueInterval3InDays then main.MaxNetDueIntervalInDays
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays < main.NegNetDueInterval2InDays and main.NetDueArrearsDays >= main.NegNetDueInterval3InDays then main.PosNetDueInterval3InDays
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays < main.NegNetDueInterval1InDays and main.NetDueArrearsDays >= main.NegNetDueInterval2InDays then main.PosNetDueInterval2InDays
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays < 0 and main.NetDueArrearsDays >= main.NegNetDueInterval1InDays then main.PosNetDueInterval1InDays
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays <= main.PosNetDueInterval1InDays then 0
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays <= main.PosNetDueInterval2InDays then main.NegNetDueInterval1InDays
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays <= main.PosNetDueInterval3InDays then main.NegNetDueInterval2InDays
		when main.NumberOfParameters = 3 then main.NegNetDueInterval3InDays
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays < main.NegNetDueInterval2InDays then main.MaxNetDueIntervalInDays
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays < main.NegNetDueInterval1InDays and main.NetDueArrearsDays >= main.NegNetDueInterval2InDays then main.PosNetDueInterval2InDays
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays < 0 and main.NetDueArrearsDays >= main.NegNetDueInterval1InDays then main.PosNetDueInterval1InDays
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays <= main.PosNetDueInterval1InDays then 0
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays <= main.PosNetDueInterval2InDays then main.NegNetDueInterval1InDays
		when main.NumberOfParameters = 2 then main.NegNetDueInterval2InDays
		when main.NumberOfParameters = 1 and main.NetDueArrearsDays < main.NegNetDueInterval1InDays then main.MaxNetDueIntervalInDays
		when main.NumberOfParameters = 1 and main.NetDueArrearsDays < 0 and main.NetDueArrearsDays >= main.NegNetDueInterval1InDays then main.PosNetDueInterval1InDays
		when main.NumberOfParameters = 1 then main.NegNetDueInterval1InDays
		when main.NumberOfParameters = 0 and main.NetDueArrearsDays < 0 then main.MaxNetDueIntervalInDays
		else 0
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