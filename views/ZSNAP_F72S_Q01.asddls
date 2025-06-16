@EndUserText.label: 'SNAP F72Q01: Financial Balances'
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL
@ObjectModel.usageType.dataClass: #MIXED

define view entity ZSNAP_F72S_Q01	
	with parameters
		@Consumption.defaultValue: 'BASK'
		@EndUserText.label: 'GL Hierarchy'
		@AnalyticsDetails.query.variableSequence: 8
		P_GLHierarchy: abap.char (4),
		@Consumption.hidden: true
		@Consumption.defaultValue: 'A'
		@EndUserText.label: 'Signage (A/R)'
		@AnalyticsDetails.query.variableSequence: 11
		P_Signage: abap.char (1),
		@Consumption.defaultValue: '0L'
		@EndUserText.label: 'Ledger'
		@AnalyticsDetails.query.variableSequence: 1
		P_Ledger: abap.char (2),
		@Consumption.derivation.lookupEntity: 'ZSNAP_F72G_FiscCalendarDate'
		@Consumption.derivation.resultElement: 'FiscalYear'
		@Consumption.derivation.binding: [{ targetElement: 'CalendarDate', type: #SYSTEM_FIELD, value: '#SYSTEM_DATE' }, { targetElement: 'FiscalYearVariant', type: #CONSTANT, value: 'K4' }]
		@EndUserText.label: 'From Fiscal Year'
		@AnalyticsDetails.query.variableSequence: 2
		P_SFromFiscalYear: gjahr,
		@Consumption.derivation.lookupEntity: 'ZSNAP_F72G_FiscCalendarDate'
		@Consumption.derivation.resultElement: 'FiscalYearPeriod'
		@Consumption.derivation.binding: [{ targetElement: 'CalendarDate', type: #SYSTEM_FIELD, value: '#SYSTEM_DATE' }, { targetElement: 'FiscalYearVariant', type: #CONSTANT, value: 'K4' }]
		@EndUserText.label: 'To Fiscal Year Period'
		@AnalyticsDetails.query.variableSequence: 3
		P_SToFiscalYearPeriod: fins_jahrper
	
	as select from ZSNAP_F72S_C01 (P_SFromFiscalYear: $parameters.P_SFromFiscalYear, P_SToFiscalYearPeriod: $parameters.P_SToFiscalYearPeriod, P_Signage: $parameters.P_Signage) as main
{
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
	main.AccountAssignmentNumber,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountAssignmentType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocCreatedByUser,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CompanyCodeName,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ParkingDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DocumentReferenceID,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AlternativeReferenceDocument,
	
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
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.TransactionCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Country,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AssetTransactionType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentCategory,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentItem,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AssignmentReference,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingAccountingDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingDocFiscalYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.HouseBank,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.HouseBankAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DistributionChannel,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SalesOrganization,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.InvoiceReference,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.InvoiceItemReference,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsOpenItemManaged,
	
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
	main.IsSettled,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsSettlement,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.MasterFixedAsset,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostingKey,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PurchasingDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PurchasingDocumentItem,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ReferenceDocumentItemGroup,
	
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
	main.TransactionTypeDetermination,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CreationDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CustomerGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CustomerAuthorizationGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SoldMaterial,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.BillToParty,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.BusinessTransactionType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FinancialTransactionType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.BusinessArea,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	main.CostCenter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.Customer,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CustomerAccountGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.Supplier,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierAccountGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierAuthorizationGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.CorporateGroupAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CorporateGroupChartOfAccounts,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
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
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.FunctionalArea,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.displayHierarchy: #FILTER
	@AnalyticsDetails.query.hierarchyInitialLevel: 2
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.hierarchyBinding: [{ type: #PARAMETER, value: 'P_GLHierarchy' }]
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #HIERARCHY_NODE
	@AnalyticsDetails.query.variableSequence: 9
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
	main.GLAccountGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsBalanceSheetAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsProfitLossAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ProfitLossAccountType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 6
	main.Material,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.MaterialGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.OffsettingChartOfAccounts,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.OrderID,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.WBSElement,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.Project,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerCompany,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerProfitCenter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerFunctionalArea,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerBusinessArea,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 5
	main.Plant,
	
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
	@AnalyticsDetails.query.display: #TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.ProfCtrLevel6,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 10
	main.ProfitCenter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ReferenceDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ReferenceDocumentItem,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ReferenceDocumentType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SoldProduct,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CalendarYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CalendarYearMonth,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CalendarYearQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DocumentDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostingDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SpecialPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostingPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalYearPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalYearQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalPeriodEndDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierIsIntercompany,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierPartnerCompany,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CustomerIsIntercompany,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CustomerPartnerCompany,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Title,
	
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
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.AmountInTransactionCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.AmountInCompanyCodeCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.AmountInGlobalCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@DefaultAggregation: #FORMULA
	@AnalyticsDetails.query.formula: '$projection.EndingBalanceAmtInTransCrcy'
	@AnalyticsDetails.exceptionAggregationSteps: [{exceptionAggregationBehavior: #LAST, exceptionAggregationElements: ['FiscalYearPeriod']}, {exceptionAggregationBehavior: #LAST, exceptionAggregationElements: [ 'SpecialPeriod']}]
	@EndUserText.label: 'Bal in TC'
	0 as ExceptAgg_D7B6A4,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@DefaultAggregation: #FORMULA
	@AnalyticsDetails.query.formula: '$projection.EndingBalanceAmtInCoCodeCrcy'
	@AnalyticsDetails.exceptionAggregationSteps: [{exceptionAggregationBehavior: #LAST, exceptionAggregationElements: ['FiscalYearPeriod']}, {exceptionAggregationBehavior: #LAST, exceptionAggregationElements: [ 'SpecialPeriod']}]
	@EndUserText.label: 'Bal in LC'
	0 as ExceptAgg_BM4WRJN,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@DefaultAggregation: #FORMULA
	@AnalyticsDetails.query.formula: '$projection.EndingBalanceAmtInGlobalCrcy'
	@AnalyticsDetails.exceptionAggregationSteps: [{exceptionAggregationBehavior: #LAST, exceptionAggregationElements: ['FiscalYearPeriod']}, {exceptionAggregationBehavior: #LAST, exceptionAggregationElements: [ 'SpecialPeriod']}]
	@EndUserText.label: 'Bal in GC'
	0 as ExceptAgg_BVFIXU9,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@Consumption.hidden: true
	main.EndingBalanceAmtInTransCrcy,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@Consumption.hidden: true
	main.EndingBalanceAmtInCoCodeCrcy,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@Consumption.hidden: true
	main.EndingBalanceAmtInGlobalCrcy
}
where main.Ledger = $parameters.P_Ledger
	and main.FiscalYearPeriod <= $parameters.P_SToFiscalYearPeriod
	and main.SignFactor = $parameters.P_Signage
	and main.ControllingArea = 'MED1'
	and main.FiscalYearVariant = 'K4'
	and main.ChartOfAccounts = '1000'