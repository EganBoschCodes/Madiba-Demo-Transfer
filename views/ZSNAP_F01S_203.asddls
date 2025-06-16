@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP AP: Cleared Documents'

define view entity ZSNAP_F01S_203	
	with parameters
		P_KeyDate: sydate,
		P_ClearedDate: sydate,
		P_DisplayCurrency: abap.cuky,
		P_ExchangeRateType: kurst,
		P_EarlyPaymentToleranceDays: abap.int4
	
	as select from ZSNAP_F01S_050 (P_KeyDate: $parameters.P_KeyDate) as main
{
	key main.CompanyCode,
	key main.FiscalYear,
	key main.AccountingDocument,
	key main.AccountingDocumentItem,
	main.DocumentItemText,
	main.AccountingDocumentCategory,
	main.AccountingDocumentType,
	main.ClearingAccountingDocument,
	main.InvoiceReference,
	main.InvoiceItemReference,
	main.InvoiceReferenceFiscalYear,
	main.DebitCreditCode,
	main.ControllingArea,
	main.ChartOfAccounts,
	main.FiscalYearVariant,
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
	main.NetDueDate,
	main.SpecialGLCode,
	main.GLAccount,
	main.CostCenter,
	main.ProfitCenter,
	main.FunctionalArea,
	main.BusinessArea,
	main.Segment,
	main.PurchasingDocument,
	main.AssignmentReference,
	cast (case
		when main.ClearingDate <= main.CashDiscount1Date then dats_days_between (main.ClearingDate, main.CashDiscount1Date)
		when main.ClearingDate <= main.CashDiscount2Date then dats_days_between (main.ClearingDate, main.CashDiscount2Date)
		else dats_days_between (main.ClearingDate, main.NetDueDate)
	end as abap.dec (10, 0)) as ClearingDateVsDueDateOffset,
	case
		when main.IsUsedInPaymentTransaction = 'X' then 'X'
		when $projection.ClearingDateVsDueDateOffset > $parameters.P_EarlyPaymentToleranceDays then 'E'
		when $projection.ClearingDateVsDueDateOffset < 0 then 'L'
		else 'O'
	end as PaymentTimingCategory,
	cast (dats_days_between ($parameters.P_KeyDate, main.NetDueDate) as abap.dec (10, 0)) as NetDueArrearsDaysInt,
	cast ($projection.NetDueArrearsDaysInt as abap.char (15)) as NetDueArrearsDays,
	'' as IsOverdue,
	cast (cast (0 as abap.char (15)) as abap.numc (15)) as DaysOverdue,
	'X' as IsCleared,
	cast ('A. Cleared' as farp_netdue_intvl_text) as NetDueIntervalText,
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
	
	@Semantics.amount.currencyCode: 'DisplayCurrency'
	cast (currency_conversion (client => cast ('010' as abap.clnt), amount => main.AmountInCompanyCodeCurrency, source_currency => main.CompanyCodeCurrency, target_currency => $parameters.P_DisplayCurrency, exchange_rate_date => $parameters.P_KeyDate, exchange_rate_type => $parameters.P_ExchangeRateType, round => 'X', decimal_shift => 'X', decimal_shift_back => 'X', error_handling => 'SET_TO_NULL') as abap.curr (23, 2)) as AmountInDisplayCurrency,
	cast ($parameters.P_DisplayCurrency as vdm_v_display_currency) as DisplayCurrency
}
where main.ClearingDate <= $parameters.P_KeyDate
	and main.ClearingDate > $parameters.P_ClearedDate
	and main.ClearingDate <> '00000000'