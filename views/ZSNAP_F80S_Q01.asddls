@EndUserText.label: 'SNAP F80Q01: Direct Cash Flow'
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL
@ObjectModel.usageType.dataClass: #MIXED

define view entity ZSNAP_F80S_Q01	
	with parameters
		@Consumption.hidden: true
		@Consumption.defaultValue: '0L'
		@EndUserText.label: 'Ledger'
		@AnalyticsDetails.query.variableSequence: 1
		P_Ledger: abap.char (2),
		@Consumption.defaultValue: 'A'
		@EndUserText.label: 'Signage (A/R)'
		@AnalyticsDetails.query.variableSequence: 2
		P_Signage: abap.char (1),
		@Consumption.hidden: true
		@Consumption.derivation.lookupEntity: 'ZSNAP_F80M_CashStartDate'
		@Consumption.derivation.resultElement: 'CashStartDate'
		@Consumption.derivation.binding: [{ targetElement: 'BindingField', type: #CONSTANT, value: 'C' }]
		@EndUserText.label: 'Cash Start Date'
		@AnalyticsDetails.query.variableSequence: 3
		P_CashStartDate: abap.dats,
		@Consumption.defaultValue: 'BASK'
		@EndUserText.label: 'GL Hierarchy'
		@AnalyticsDetails.query.variableSequence: 5
		P_GLHierarchy: abap.char (4)
	
	as select from ZSNAP_F80S_C01 (P_Signage: $parameters.P_Signage, P_CashStartDate: $parameters.P_CashStartDate) as main
{
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Ledger,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 4
	main.CompanyCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.LedgerGLLineItem,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentItem,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ChartOfAccounts,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AssignmentReference,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.TransactionTypeDetermination,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DocumentReferenceID,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DocumentHeaderText,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ReverseDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ReverseDocumentFiscalYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.OrderID,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingAccountingDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ControllingArea,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.CostCenter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Country,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.Customer,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CustomerGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.DebitCreditCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DocumentItemText,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FinancialAccountType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FollowOnDocumentType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.displayHierarchy: #FILTER
	@AnalyticsDetails.query.hierarchyInitialLevel: 2
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.hierarchyBinding: [{ type: #PARAMETER, value: 'P_GLHierarchy' }]
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #HIERARCHY_NODE
	@AnalyticsDetails.query.variableSequence: 6
	main.GLAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 7
	main.GLAccount2,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.GLAcctLevel1,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.GLAcctLevel2,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.GLAcctLevel3,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.GLAcctLevel4,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.GLAcctLevel5,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.InvoiceItemReference,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.InvoiceReference,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.InvoiceReferenceFiscalYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsAutomaticallyCreated,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsBalanceSheetAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsCleared,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsOpenItemManaged,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsProfitLossAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsReversal,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsReversed,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsUsedInPaymentTransaction,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IntercompanyTransaction,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.Material,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.MaterialGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerCompany,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostingKey,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Product,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.ProfCtrLevel1,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.ProfCtrLevel2,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.ProfCtrLevel3,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.ProfCtrLevel4,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.ProfCtrLevel5,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.ProfitCenter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ProfitLossAccountType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.Project,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ReferenceDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ReferenceDocumentItem,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.Source,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.EntryCounter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ResetFlag,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SourceLedger,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SpecialGLCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.TaxCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.TransactionCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.Supplier,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.WBSElement,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashPostingDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.derivation.binding: [{ targetElement: 'FiscalYearVariant', type: #CONSTANT, value: 'K4' }, { targetElement: 'CalendarDate', type: #SYSTEM_FIELD, value: '#SYSTEM_DATE' }]
	@Consumption.derivation.lookupEntity: 'ZSNAP_F80G_FiscCalendarDate'
	@Consumption.derivation.resultElement: 'FiscalYearPeriod'
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 8
	main.CashYearPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashYearQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CashYearWeek,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CreatedByUser,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DocumentDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DueCalculationBaseDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalYearVariant,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostingDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostYearPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostYearQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostYearWeek,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Title,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.GlobalCurrency,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CompanyCodeCurrency,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FourthCurrency,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.TransactionCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.AmountInGlobalCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.AmountInCompanyCodeCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.AmountInFourthCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.AmountInTransactionCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.NumberOfRows
}
where main.ControllingArea = 'MED1'
	and main.FiscalYearVariant = 'K4'
	and main.ChartOfAccounts = '1000'
	and main.Ledger = $parameters.P_Ledger
	and main.PostingDate >= $parameters.P_CashStartDate