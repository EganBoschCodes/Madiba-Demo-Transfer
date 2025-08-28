@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP F01: Text Bucketing/Curr. Conversion'

define view entity ZSNAP_F01S_109	
	with parameters
		P_KeyDate: sydate,
		P_NetDueInterval1InDays: abap.int4,
		P_NetDueInterval2InDays: abap.int4,
		P_NetDueInterval3InDays: abap.int4,
		P_NetDueInterval4InDays: abap.int4,
		P_DisplayCurrency: abap.cuky,
		P_ExchangeRateType: kurst
	
	as select from ZSNAP_F01S_107 (P_KeyDate: $parameters.P_KeyDate, P_NetDueInterval1InDays: $parameters.P_NetDueInterval1InDays, P_NetDueInterval2InDays: $parameters.P_NetDueInterval2InDays, P_NetDueInterval3InDays: $parameters.P_NetDueInterval3InDays, P_NetDueInterval4InDays: $parameters.P_NetDueInterval4InDays) as main
	
	left outer to one join ZSNAP_F01M_NetDueIntervalT (
		P_NetDueInterval1InDays: $parameters.P_NetDueInterval1InDays,
		P_NetDueInterval2InDays: $parameters.P_NetDueInterval2InDays,
		P_NetDueInterval3InDays: $parameters.P_NetDueInterval3InDays,
		P_NetDueInterval4InDays: $parameters.P_NetDueInterval4InDays
	) as NetDueIntervalTextDerive on main.NetDueInterval = NetDueIntervalTextDerive.NetDueInterval
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
	main.ChartOfAccounts,
	main.ControllingArea,
	main.FiscalYearVariant,
	main.FinancialAccountType,
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
	cast (0 as abap.dec(10, 0)) as ClearingDateVsDueDateOffset,
	'' as PaymentTimingCategory,
	main.NetDueArrearsDays as NetDueArrearsDaysInt,
	cast (main.NetDueArrearsDays as abap.char(15)) as NetDueArrearsDays,
	cast (cast ($projection.DaysOverdueInt as abap.char(15)) as abap.numc(15)) as DaysOverdue,
	case
		when main.NetDueArrearsDays > 0 then main.NetDueArrearsDays
		else 0
	end as DaysOverdueInt,
	main.NetDueDate,
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
	NetDueIntervalTextDerive.NetDueIntervalText,
	'O' as IsCleared,
	case
		when main.NetDueArrearsDays < 0 then ''
		else 'X'
	end as IsOverdue,
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
	cast (currency_conversion (client => $session.client, amount => main.AmountInCompanyCodeCurrency, source_currency => main.CompanyCodeCurrency, target_currency => $parameters.P_DisplayCurrency, exchange_rate_date => $parameters.P_KeyDate, exchange_rate_type => $parameters.P_ExchangeRateType, round => 'X', decimal_shift => 'X', decimal_shift_back => 'X', error_handling => 'SET_TO_NULL') as abap.curr(23, 2)) as AmountInDisplayCurrency,
	cast ($parameters.P_DisplayCurrency as vdm_v_display_currency) as DisplayCurrency
}