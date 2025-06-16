@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F70: Final Field Derivation'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F70S_009	
	with parameters
		P_Signage: abap.char (1)
	
	as select from ZSNAP_F70S_007 (P_Signage: $parameters.P_Signage) as main
	
	association [0..1] to ZSNAP_F70G_CalendarDate as _CalendarDate on $projection.PostingDate = _CalendarDate.CalendarDate
	association [0..1] to ZSNAP_F70G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [0..1] to ZSNAP_F70G_Customer as _Customer on $projection.Customer = _Customer.Customer
	association [0..1] to ZSNAP_F70G_CustomerCompany as _CustomerCompany on $projection.Customer = _CustomerCompany.Customer and $projection.CompanyCode = _CustomerCompany.CompanyCode
	association [0..1] to ZSNAP_F70G_FiscCalendarDate as _ClearingDate on $projection.ClearingDate = _ClearingDate.CalendarDate and $projection.FiscalYearVariant = _ClearingDate.FiscalYearVariant
	association [0..1] to ZSNAP_F70G_FiscCalendarDate as _FiscalCalendarDate on $projection.FiscalYearVariant = _FiscalCalendarDate.FiscalYearVariant and $projection.PostingDate = _FiscalCalendarDate.CalendarDate
	association [0..1] to ZSNAP_F70G_FiscalPeriod as _FiscalPeriod on $projection.FiscalYearVariant = _FiscalPeriod.FiscalYearVariant and $projection.FiscalYear = _FiscalPeriod.FiscalYear and $projection.FiscalPeriod = _FiscalPeriod.FiscalPeriod
	association [0..1] to ZSNAP_F70G_GLAccountInCOA as _GLAccountInChartOfAccounts on $projection.ChartOfAccounts = _GLAccountInChartOfAccounts.ChartOfAccounts and $projection.GLAccount = _GLAccountInChartOfAccounts.GLAccount
	association [0..1] to ZSNAP_F70G_JournalEntry as _JournalEntry on $projection.CompanyCode = _JournalEntry.CompanyCode and $projection.FiscalYear = _JournalEntry.FiscalYear and $projection.AccountingDocument = _JournalEntry.AccountingDocument and $projection.FiscalYearVariant = _JournalEntry.FiscalYearVariant
	association [0..1] to ZSNAP_F70G_ProjectBasicData as _Project on $projection.Project = _Project.Project
	association [0..1] to ZSNAP_F70G_PrchngDocItem as _PurchaseOrderItem on $projection.PurchasingDocument = _PurchaseOrderItem.PurchasingDocument and $projection.PurchasingDocumentItem = _PurchaseOrderItem.PurchasingDocumentItem
	association [0..1] to ZSNAP_F70G_Supplier as _Supplier on $projection.Supplier = _Supplier.Supplier
	association [0..1] to ZSNAP_F70G_SupplierCompany as _SupplierCompany on $projection.Supplier = _SupplierCompany.Supplier and $projection.CompanyCode = _SupplierCompany.CompanyCode
	association [0..1] to ZSNAP_F70G_WBSElementByE_O1 as _WBSElement on $projection.WBSElement = _WBSElement.WBSElement
{
	key main.AccountingDocument,
	key main.CompanyCode,
	key main.FiscalYear,
	key main.Ledger,
	key main.LedgerGLLineItem,
	key main.SourceLedger,
	_CompanyCode.Country,
	main.AccountingDocumentItem,
	main.AccountAssignmentNumber,
	main.AccountAssignmentType,
	main.AccountingDocumentStatus,
	main.AccountingDocCreatedByUser,
	main.AccountingDocumentType,
	main.Reference1IDByBusinessPartner,
	main.Reference2IDByBusinessPartner,
	main.Reference3IDByBusinessPartner,
	main.ActualPlanCode,
	main.TransactionTypeDetermination,
	main.AssetTransactionType,
	main.BillToParty,
	main.BusinessTransactionType,
	main.FinancialTransactionType,
	main.BusinessArea,
	main.ChartOfAccounts,
	main.ControllingArea,
	main.CostCenter,
	main.PartnerCostCenter,
	main.CostCtrActivityType,
	main.Customer,
	main.CustomerGroup,
	_Customer.CustomerAccountGroup,
	_Customer.AuthorizationGroup as CustomerAuthorizationGroup,
	_CustomerCompany.ReconciliationAccount as CustomerReconAccount,
	main.Supplier,
	_Supplier.SupplierAccountGroup,
	_Supplier.AuthorizationGroup as SupplierAuthorizationGroup,
	_SupplierCompany.ReconciliationAccount as SupplierReconAccount,
	main.DistributionChannel,
	main.OrganizationDivision,
	main.SalesOrganization,
	main.SalesDocument,
	main.SalesDocumentItem,
	main.ValuationArea,
	main.DebitCreditCode,
	main.DocumentItemText,
	_PurchaseOrderItem.PurchasingDocumentItemText,
	main.FinancialAccountType,
	main.FunctionalArea,
	main.GLAccount,
	main.GLAcctLevel1,
	main.GLAcctLevel2,
	main.GLAcctLevel3,
	main.GLAcctLevel4,
	main.GLAcctLevel5,
	_GLAccountInChartOfAccounts.GLAccountSeries,
	main.HouseBank,
	main.HouseBankAccount,
	main.InvoiceItemReference,
	main.InvoiceReference,
	main.IsOpenItemManaged,
	main.IsReversal,
	main.IsReversed,
	main.IsSettled,
	main.IsSettlement,
	main.PostingKey,
	main.InventoryValuationType,
	_GLAccountInChartOfAccounts.CorporateGroupAccount,
	_GLAccountInChartOfAccounts.CorporateGroupChartOfAccounts as GroupChartOfAccounts,
	_GLAccountInChartOfAccounts.IsBalanceSheetAccount,
	_GLAccountInChartOfAccounts.IsProfitLossAccount,
	_GLAccountInChartOfAccounts.ProfitLossAccountType,
	main.OffsetCustomer,
	main.OffsetSupplier,
	main.OffsettingAccount,
	main.OffsettingAccountType,
	main.OffsettingChartOfAccounts,
	main.OrderID,
	main.PartnerOrder,
	main.PartnerCompany,
	main.PayerParty,
	main.Plant,
	main.Product,
	main.ProfCtrLevel1,
	main.ProfCtrLevel2,
	main.ProfCtrLevel3,
	main.ProfCtrLevel4,
	main.ProfCtrLevel5,
	main.ProfCtrLevel6,
	main.ProfitCenter,
	main.PartnerProfitCenter,
	main.PartnerFunctionalArea,
	main.PartnerCompanyCode,
	main.TaxCode,
	main.PartnerControllingObjectClass,
	main.CostOriginGroup,
	main.MasterFixedAsset,
	main.FixedAssetSubNumber,
	main.Project,
	_Project.ProjectProfileCode,
	main.ReferenceDocument,
	main.ReferenceDocumentItem,
	main.ReferenceDocumentItemGroup,
	main.ReferenceDocumentType,
	main.BillingDocument,
	main.ShipToParty,
	main.SignFactor,
	main.SoldProduct,
	main.Source,
	main.SpecialGLCode,
	main.WBSElement,
	_WBSElement.ProjectType,
	main.IsAutomaticallyCreated,
	main.IsUsedInPaymentTransaction,
	main.PaymentTerms,
	main.PaymentDifferenceReason,
	main.BaselineDate,
	main.NetDueDate,
	main.AssignmentReference,
	main.PurchasingDocument,
	main.PurchasingDocumentItem,
	main.ClearingAccountingDocument,
	main.ClearingDocFiscalYear,
	_ClearingDate.FiscalYearPeriod as ClearingDocFiscalYearPeriod,
	main.ClearingDate,
	_CalendarDate.CalendarMonth,
	_CalendarDate.CalendarQuarter,
	_CalendarDate.CalendarWeek,
	_CalendarDate.CalendarYear,
	_FiscalCalendarDate.FiscalWeek,
	_FiscalCalendarDate.FiscalYearWeek,
	main.CreationDate,
	main.CreationDateTime,
	main.DocumentDate,
	
	@Semantics.fiscal.period: true
	main.FiscalPeriod,
	
	@Semantics.fiscal.period: true
	main.SpecialPeriod,
	
	@Semantics.fiscal.quarter: true
	_FiscalPeriod.FiscalQuarter,
	
	@Semantics.fiscal.yearPeriod: true
	main.FiscalYearPeriod,
	
	@EndUserText.label: 'Fiscal Year Quarter'
	@Semantics.fiscal.yearQuarter: true
	_FiscalPeriod.FiscalYearQuarter,
	
	@Semantics.fiscal.yearVariant: true
	main.FiscalYearVariant,
	
	@Semantics.fiscal.year: true
	main.LedgerFiscalYear,
	main.PostingDate,
	_CalendarDate.YearMonth,
	_CalendarDate.YearQuarter,
	_JournalEntry.PlannedReversalDate,
	_JournalEntry.ReversalReason,
	_JournalEntry.ParkingDate,
	_JournalEntry.OriginalReferenceDocument,
	_JournalEntry.DocumentReferenceID,
	_JournalEntry.AccountingDocumentHeaderText as DocumentHeaderText,
	_JournalEntry.Reference1InDocumentHeader,
	_JournalEntry.Reference2InDocumentHeader,
	_JournalEntry.ReverseDocument,
	_JournalEntry.ReverseDocumentFiscalYear,
	_JournalEntry.IntercompanyTransaction,
	_JournalEntry.TransactionCode,
	main.Title,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	case
		when main.SignFactor = 'A' then main.AmountInCompanyCodeCurrency
		else -main.AmountInCompanyCodeCurrency
	end as AmountInCompanyCodeCurrency,
	main.CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	case
		when main.SignFactor = 'A' then main.AmountInGlobalCurrency
		else -main.AmountInGlobalCurrency
	end as AmountInGlobalCurrency,
	main.GlobalCurrency,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	case
		when main.SignFactor = 'A' then main.AmountInTransactionCurrency
		else -main.AmountInTransactionCurrency
	end as AmountInTransactionCurrency,
	main.TransactionCurrency,
	
	@Semantics.amount.currencyCode: 'FourthCurrency'
	case
		when main.SignFactor = 'A' then main.AmountInFourthCurrency
		else -main.AmountInFourthCurrency
	end as AmountInFourthCurrency,
	main.FourthCurrency,
	
	@Semantics.quantity.unitOfMeasure: 'CostSourceUnit'
	case
		when main.SignFactor = 'A' then main.ValuationQuantity
		else -main.ValuationQuantity
	end as ValuationQuantity,
	main.CostSourceUnit,
	
	@Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
	main.Quantity,
	main.UnitOfMeasure,
	main.NumberOfItems
}