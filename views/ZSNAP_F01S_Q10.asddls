@EndUserText.label: 'SNAP F01Q10: Cleared AP and Payment History'
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL
@ObjectModel.usageType.dataClass: #MIXED

define view entity ZSNAP_F01S_Q10	
	with parameters
		@Consumption.defaultValue: 'R'
		@EndUserText.label: 'Signage'
		@AnalyticsDetails.query.variableSequence: 1
		P_Signage: abap.char (1),
		@EndUserText.label: 'Open Items As Of'
		@Environment.systemField: #SYSTEM_DATE
		@AnalyticsDetails.query.variableSequence: 2
		P_KeyDate: abap.dats,
		@Consumption.defaultValue: 'USD'
		@EndUserText.label: 'Display Currency'
		@AnalyticsDetails.query.variableSequence: 3
		P_DisplayCurrency: abap.cuky,
		@Consumption.defaultValue: 'M'
		@EndUserText.label: 'Exchange Rate Type'
		@AnalyticsDetails.query.variableSequence: 4
		P_ExchangeRateType: kurst,
		@Consumption.defaultValue: 'N'
		@EndUserText.label: 'Include Special GL Transactions'
		@AnalyticsDetails.query.variableSequence: 11
		P_IncludeSpecialGL: abap.char (1),
		@Consumption.defaultValue: '2'
		@EndUserText.label: 'Early Payment Tolerance Days'
		@AnalyticsDetails.query.variableSequence: 10
		P_EarlyPaymentToleranceDays: abap.int4
	
	as select from ZSNAP_F01S_C01 (P_Signage: $parameters.P_Signage, P_KeyDate: $parameters.P_KeyDate, P_ClearedDate: '00000000', P_NetDueInterval1InDays: 0, P_NetDueInterval2InDays: 0, P_NetDueInterval3InDays: 0, P_NetDueInterval4InDays: 0, P_DisplayCurrency: $parameters.P_DisplayCurrency, P_ExchangeRateType: $parameters.P_ExchangeRateType, P_IncludeSpecialGL: $parameters.P_IncludeSpecialGL, P_EarlyPaymentToleranceDays: $parameters.P_EarlyPaymentToleranceDays) as main
{
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 5
	main.CompanyCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentItem,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DocumentItemText,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentCategory,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentTypeName,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentHeaderText,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentCreationDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.LastChangeDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DocumentReferenceID,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.InvoiceReference,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.InvoiceReferenceType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.InvoiceItemReference,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.InvoiceReferenceFiscalYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DebitCreditCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingAccountingDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FinancialAccountType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostingDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DocumentDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ParamKeyDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ParamClearedDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DueCalculationBaseDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashDiscount1Days,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashDiscount1Percent,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashDiscount1Date,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashDiscount2Days,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashDiscount2Percent,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashDiscount2Date,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PaymentTerms,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PaymentBlockingReason,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PaymentBlockingReasonName,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PaymentMethod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.IsUsedInPaymentTransaction,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostingKey,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostingKeyName,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.NetDueArrearsDays,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.hidden: true
	main.NetDueArrearsDaysInt,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.NetDueDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 6
	main.GLAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.GroupAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.GroupChartOfAccounts,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SpecialGLCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.IncludeSpecialGL,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IncludeSpecialGLFilter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.CostCenter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 7
	main.ProfitCenter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.BusinessArea,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.FunctionalArea,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Segment,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PurchasingDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AssignmentReference,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingClerk,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 9
	main.ReconciliationAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 8
	main.Supplier,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierName,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierBasicAuthorizationGrp,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierFinsAuthorizationGrp,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.WithholdingTaxCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierAccountGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierCountry,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierRegion,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CalendarMonth,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CalendarQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CalendarWeek,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CalendarYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalYearQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalYearPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingFiscalYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingFiscalPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingFiscalQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingFiscalYearPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingFiscalYearQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Signage,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.IsOverdue,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DaysOverdue,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsConversionBroken,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.hidden: true
	main.ClearingDateVsDueDateOffset,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.PaymentTimingCategory,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierIsIntercompany,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerCompany,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.IntercompanyPairing,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.TransactionCurrency,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CompanyCodeCurrency,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.GlobalCurrency,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DisplayCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.AmountInDisplayCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@AnalyticsDetails.query.hidden: true
	main.AmountInTransactionCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@AnalyticsDetails.query.hidden: true
	main.AmountInCompanyCodeCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@AnalyticsDetails.query.hidden: true
	main.AmountInGlobalCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@AnalyticsDetails.query.hidden: true
	main.NumberOfRows,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.NetDueIntervalText
}
where main.IncludeSpecialGL = $parameters.P_IncludeSpecialGL
	and main.IncludeSpecialGLFilter = 'Y'
	and main.Signage = $parameters.P_Signage
	and main.ChartOfAccounts = '1000'
	and main.ControllingArea = 'MED1'
	and main.FiscalYearVariant = 'K4'
	and main.IsCleared = 'X'