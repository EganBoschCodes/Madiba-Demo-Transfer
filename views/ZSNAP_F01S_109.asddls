@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP AP: Text Bucketing/Curr. Conversion'

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
	cast (0 as abap.dec (10, 0)) as ClearingDateVsDueDateOffset,
	'' as PaymentTimingCategory,
	main.NetDueArrearsDays as NetDueArrearsDaysInt,
	cast (main.NetDueArrearsDays as abap.char (15)) as NetDueArrearsDays,
	cast (cast (case
		when main.NetDueArrearsDays > 0 then main.NetDueArrearsDays
		else 0
	end as abap.char (15)) as abap.numc (15)) as DaysOverdue,
	main.NetDueDate,
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
	
	@EndUserText.label: 'Net Due Date Interval'
	cast (case
		when main.NumberOfParameters = 4 and main.NetDueArrearsDays = 0 then 'G. Due on Key Date'
		when main.NumberOfParameters = 4 and main.NetDueInterval = main.MaxNetDueIntervalInDays then concat_with_space ('B. Due in over', cast (main.PosNetDueInterval4InDays as abap.char (20)), 1)
		when main.NumberOfParameters = 4 and main.NetDueInterval = main.PosNetDueInterval4InDays then concat_with_space ('C. Due between', concat_with_space (concat_with_space (cast (main.PosNetDueInterval3InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval4InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 4 and main.NetDueInterval = main.PosNetDueInterval3InDays then concat_with_space ('D. Due between', concat_with_space (concat_with_space (cast (main.PosNetDueInterval2InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval3InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 4 and main.NetDueInterval = main.PosNetDueInterval2InDays then concat_with_space ('E. Due between', concat_with_space (concat_with_space (cast (main.PosNetDueInterval1InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval2InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 4 and main.NetDueInterval = main.PosNetDueInterval1InDays then concat_with_space ('F. Due within', cast (main.PosNetDueInterval1InDays as abap.char (20)), 1)
		when main.NumberOfParameters = 4 and main.NetDueInterval = 0 then concat_with_space ('H. Less than', concat_with_space (cast (main.PosNetDueInterval1InDays as abap.char (20)), 'Overdue', 1), 1)
		when main.NumberOfParameters = 4 and main.NetDueInterval = main.NegNetDueInterval1InDays then concat_with_space ('I. Overdue by', concat_with_space (concat_with_space (cast (main.PosNetDueInterval1InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval2InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 4 and main.NetDueInterval = main.NegNetDueInterval2InDays then concat_with_space ('J. Overdue by', concat_with_space (concat_with_space (cast (main.PosNetDueInterval2InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval3InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 4 and main.NetDueInterval = main.NegNetDueInterval3InDays then concat_with_space ('K. Overdue by', concat_with_space (concat_with_space (cast (main.PosNetDueInterval3InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval4InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 4 and main.NetDueInterval = main.NegNetDueInterval4InDays then concat_with_space ('L. More than', concat_with_space (cast (main.PosNetDueInterval4InDays as abap.char (20)), 'Overdue', 1), 1)
		when main.NumberOfParameters = 3 and main.NetDueArrearsDays = 0 then 'F. Due on Key Date'
		when main.NumberOfParameters = 3 and main.NetDueInterval = main.MaxNetDueIntervalInDays then concat_with_space ('B. Due in over', cast (main.PosNetDueInterval3InDays as abap.char (20)), 1)
		when main.NumberOfParameters = 3 and main.NetDueInterval = main.PosNetDueInterval3InDays then concat_with_space ('C. Due between', concat_with_space (concat_with_space (cast (main.PosNetDueInterval2InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval3InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 3 and main.NetDueInterval = main.PosNetDueInterval2InDays then concat_with_space ('D. Due between', concat_with_space (concat_with_space (cast (main.PosNetDueInterval1InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval2InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 3 and main.NetDueInterval = main.PosNetDueInterval1InDays then concat_with_space ('E. Due within', cast (main.PosNetDueInterval1InDays as abap.char (20)), 1)
		when main.NumberOfParameters = 3 and main.NetDueInterval = 0 then concat_with_space ('G. Less than', concat_with_space (cast (main.PosNetDueInterval1InDays as abap.char (20)), 'Overdue', 1), 1)
		when main.NumberOfParameters = 3 and main.NetDueInterval = main.NegNetDueInterval1InDays then concat_with_space ('H. Overdue by', concat_with_space (concat_with_space (cast (main.PosNetDueInterval1InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval2InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 3 and main.NetDueInterval = main.NegNetDueInterval2InDays then concat_with_space ('I. Overdue by', concat_with_space (concat_with_space (cast (main.PosNetDueInterval2InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval3InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 3 and main.NetDueInterval = main.NegNetDueInterval3InDays then concat_with_space ('J. More than', concat_with_space (cast (main.PosNetDueInterval3InDays as abap.char (20)), 'Overdue', 1), 1)
		when main.NumberOfParameters = 2 and main.NetDueArrearsDays = 0 then 'E. Due on Key Date'
		when main.NumberOfParameters = 2 and main.NetDueInterval = main.MaxNetDueIntervalInDays then concat_with_space ('B. Due in over', cast (main.PosNetDueInterval2InDays as abap.char (20)), 1)
		when main.NumberOfParameters = 2 and main.NetDueInterval = main.PosNetDueInterval2InDays then concat_with_space ('C. Due between', concat_with_space (concat_with_space (cast (main.PosNetDueInterval1InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval2InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 2 and main.NetDueInterval = main.PosNetDueInterval1InDays then concat_with_space ('D. Due within', cast (main.PosNetDueInterval1InDays as abap.char (20)), 1)
		when main.NumberOfParameters = 2 and main.NetDueInterval = 0 then concat_with_space ('F. Less than', concat_with_space (cast (main.PosNetDueInterval1InDays as abap.char (20)), 'Overdue', 1), 1)
		when main.NumberOfParameters = 2 and main.NetDueInterval = main.NegNetDueInterval1InDays then concat_with_space ('G. Overdue by', concat_with_space (concat_with_space (cast (main.PosNetDueInterval1InDays + 1 as abap.char (20)), '-', 1), cast (main.PosNetDueInterval2InDays as abap.char (20)), 1), 1)
		when main.NumberOfParameters = 2 and main.NetDueInterval = main.NegNetDueInterval2InDays then concat_with_space ('H. More than', concat_with_space (cast (main.PosNetDueInterval2InDays as abap.char (20)), 'Overdue', 1), 1)
		when main.NumberOfParameters = 1 and main.NetDueArrearsDays = 0 then 'D. Due on Key Date'
		when main.NumberOfParameters = 1 and main.NetDueInterval = main.MaxNetDueIntervalInDays then concat_with_space ('B. Due in over', cast (main.PosNetDueInterval1InDays as abap.char (20)), 1)
		when main.NumberOfParameters = 1 and main.NetDueInterval = main.PosNetDueInterval1InDays then concat_with_space ('C. Due within', cast (main.PosNetDueInterval1InDays as abap.char (20)), 1)
		when main.NumberOfParameters = 1 and main.NetDueInterval = 0 then concat_with_space ('E. Less than ', concat_with_space (cast (main.PosNetDueInterval1InDays as abap.char (20)), 'Overdue', 1), 1)
		when main.NumberOfParameters = 1 and main.NetDueInterval = main.NegNetDueInterval1InDays then concat_with_space ('F. More than', concat_with_space (cast (main.PosNetDueInterval1InDays as abap.char (20)), 'Overdue', 1), 1)
		when main.NumberOfParameters = 0 and main.NetDueArrearsDays = 0 then 'C. Due on Key Date'
		when main.NumberOfParameters = 0 and main.NetDueInterval = main.MaxNetDueIntervalInDays then 'B. Not Overdue'
		when main.NumberOfParameters = 0 and main.NetDueInterval = 0 then 'D. Overdue'
		else 'ERROR'
	end as abap.char (40)) as NetDueIntervalText,
	'' as IsCleared,
	case
		when main.NetDueInterval > 0 then ''
		else 'X'
	end as IsOverdue,
	
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
	cast (currency_conversion (client => $session.client, amount => main.AmountInCompanyCodeCurrency, source_currency => main.CompanyCodeCurrency, target_currency => $parameters.P_DisplayCurrency, exchange_rate_date => $parameters.P_KeyDate, exchange_rate_type => $parameters.P_ExchangeRateType, round => 'X', decimal_shift => 'X', decimal_shift_back => 'X', error_handling => 'SET_TO_NULL') as abap.curr (23, 2)) as AmountInDisplayCurrency,
	cast ($parameters.P_DisplayCurrency as vdm_v_display_currency) as DisplayCurrency
}