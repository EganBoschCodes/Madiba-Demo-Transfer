@EndUserText.label: 'SNAP F70D01: Financial Activity Data Prof.'
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL
@ObjectModel.usageType.dataClass: #MIXED

define view entity ZSNAP_F70S_D01	
	with parameters
		@Consumption.defaultValue: 'A'
		@EndUserText.label: 'Signage (A/R)'
		@AnalyticsDetails.query.variableSequence: 11
		P_Signage: abap.char (1),
		@Consumption.defaultValue: '0L'
		@EndUserText.label: 'Ledger'
		@AnalyticsDetails.query.variableSequence: 1
		P_Ledger: abap.char (2),
		@Consumption.defaultValue: 'BASK'
		@EndUserText.label: 'GL Hierarchy'
		@AnalyticsDetails.query.variableSequence: 6
		P_GLHierarchy: abap.char (4)
	
	as select from ZSNAP_F70S_C01 (P_Signage: $parameters.P_Signage) as main
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
	@Consumption.derivation.binding: [{ targetElement: 'FiscalYearVariant', type: #CONSTANT, value: 'K4' }, { targetElement: 'CalendarDate', type: #SYSTEM_FIELD, value: '#SYSTEM_DATE' }]
	@Consumption.derivation.lookupEntity: 'ZSNAP_F70G_FiscCalendarDate'
	@Consumption.derivation.resultElement: 'FiscalYear'
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 2
	main.FiscalYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Ledger,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.LedgerGLLineItem,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SourceLedger,
	
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
	main.AccountingDocumentStatus,
	
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
	main.Reference1IDByBusinessPartner,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Reference2IDByBusinessPartner,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Reference3IDByBusinessPartner,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ActualPlanCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.TransactionTypeDetermination,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AssetTransactionType,
	
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
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ChartOfAccounts,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ControllingArea,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 9
	main.CostCenter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Country,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CostCtrActivityType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.Customer,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CustomerGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CustomerAccountGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CustomerAuthorizationGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CustomerReconAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CostOriginGroup,
	
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
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SupplierReconAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DebitCreditCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DistributionChannel,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.OrganizationDivision,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SalesOrganization,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SalesDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SalesDocumentItem,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ValuationArea,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FinancialAccountType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.FunctionalArea,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerFunctionalArea,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.displayHierarchy: #FILTER
	@AnalyticsDetails.query.hierarchyInitialLevel: 2
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.hierarchyBinding: [{ type: #PARAMETER, value: 'P_GLHierarchy' }]
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #HIERARCHY_NODE
	@AnalyticsDetails.query.variableSequence: 7
	main.GLAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 5
	main.GLAccount2,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.GLAccountSeries,
	
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
	main.HouseBank,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.HouseBankAccount,
	
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
	main.PostingKey,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.InventoryValuationType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.MasterFixedAsset,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FixedAssetSubNumber,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.OffsetCustomer,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.OffsetSupplier,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.OffsettingAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.OffsettingAccountType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.OffsettingChartOfAccounts,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.OrderID,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerOrder,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerCompany,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerCompanyCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.TaxCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerControllingObjectClass,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PayerParty,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 10
	main.Plant,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Product,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Product2,
	
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
	@AnalyticsDetails.query.variableSequence: 8
	main.ProfitCenter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ProfitCenter2,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.Project,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ProjectType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ProjectProfileCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerProfitCenter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PartnerCostCenter,
	
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
	main.ReferenceDocumentItemGroup,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ReferenceDocumentType,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.BillingDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ShipToParty,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SignFactor,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SoldProduct,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Source,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SpecialGLCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.WBSElement,
	
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
	main.CreationDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CreationDateTime,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DocumentDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	@Consumption.derivation.binding: [{ targetElement: 'FiscalYearVariant', type: #CONSTANT, value: 'K4' }, { targetElement: 'CalendarDate', type: #SYSTEM_FIELD, value: '#SYSTEM_DATE' }]
	@Consumption.derivation.lookupEntity: 'ZSNAP_F70G_FiscCalendarDate'
	@Consumption.derivation.resultElement: 'FiscalPeriod'
	@Consumption.filter.mandatory: false
	@Consumption.filter.multipleSelections: true
	@Consumption.filter.selectionType: #INTERVAL
	@AnalyticsDetails.query.variableSequence: 3
	main.FiscalPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.SpecialPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalWeek,
	
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
	main.FiscalYearVariant,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FiscalYearWeek,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.LedgerFiscalYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PostingDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.YearMonth,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.YearQuarter,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.CostSourceUnit,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.UnitOfMeasure,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AccountingDocumentItem,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PlannedReversalDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ReversalReason,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ParkingDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.OriginalReferenceDocument,
	
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
	main.Reference1InDocumentHeader,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Reference2InDocumentHeader,
	
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
	main.IntercompanyTransaction,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.TransactionCode,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsAutomaticallyCreated,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.IsUsedInPaymentTransaction,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PaymentTerms,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PaymentDifferenceReason,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.NetDueDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.BaselineDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.AssignmentReference,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.DocumentItemText,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PurchasingDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.PurchasingDocumentItemText,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingAccountingDocument,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingDocFiscalYear,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingDocFiscalYearPeriod,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.ClearingDate,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY_TEXT
	@AnalyticsDetails.query.totals: #HIDE
	main.CorporateGroupAccount,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.GroupChartOfAccounts,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.Title,
	
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
	main.TransactionCurrency,
	
	@AnalyticsDetails.query.axis: #FREE
	@AnalyticsDetails.query.display: #KEY
	@AnalyticsDetails.query.totals: #HIDE
	main.FourthCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@AnalyticsDetails.query.hidden: true
	main.ValuationQuantity,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.AmountInTransactionCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.AmountInCompanyCodeCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.AmountInGlobalCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@AnalyticsDetails.query.hidden: true
	main.AmountInFourthCurrency,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	@AnalyticsDetails.query.hidden: true
	main.Quantity,
	
	@AnalyticsDetails.query.axis: #COLUMNS
	main.NumberOfItems
}
where main.Ledger = $parameters.P_Ledger
	and main.SignFactor = $parameters.P_Signage
	and main.ControllingArea = 'MED1'
	and main.FiscalYearVariant = 'K4'
	and main.ChartOfAccounts = '1000'