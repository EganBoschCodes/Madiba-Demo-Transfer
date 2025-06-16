@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F72: Additional Field Derivation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F72S_105	
	with parameters
		P_SFromFiscalYear: fins_gjahr,
		P_SToFiscalYearPeriod: fins_jahrper,
		P_Signage: abap.char (1)
	
	as select from ZSNAP_F72S_103 (P_SFromFiscalYear: $parameters.P_SFromFiscalYear, P_SToFiscalYearPeriod: $parameters.P_SToFiscalYearPeriod, P_Signage: $parameters.P_Signage) as main
	
	association [0..1] to ZSNAP_F72G_109 as _PCPrnt on $projection.ProfitCenter = _PCPrnt.ProfitCenter and $projection.ControllingArea = _PCPrnt.ControllingArea and _PCPrnt.ValidityEndDate = '99991231'
	association [0..1] to ZSNAP_F72G_129 as _GLPrnt on _GLPrnt.GLAccountHierarchy = 'BASK' and $projection.ChartOfAccounts = _GLPrnt.ChartOfAccounts and $projection.GLAccount = _GLPrnt.GLAccount and _GLPrnt.ValidityEndDate = '99991231'
	association [0..1] to ZSNAP_F72G_CalendarDate as _CalendarDate on $projection.FiscalPeriodEndDate = _CalendarDate.CalendarDate
	association [0..1] to ZSNAP_F72G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [0..1] to ZSNAP_F72G_Customer as _Customer on $projection.Customer = _Customer.Customer
	association [0..1] to ZSNAP_F72G_FiscCalendarDate as _FiscalCalendarDate on $projection.FiscalYearVariant = _FiscalCalendarDate.FiscalYearVariant and $projection.FiscalPeriodEndDate = _FiscalCalendarDate.CalendarDate
	association [0..1] to ZSNAP_F72G_GLAccountInCOA as _GLAccountInChartOfAccounts on $projection.ChartOfAccounts = _GLAccountInChartOfAccounts.ChartOfAccounts and $projection.GLAccount = _GLAccountInChartOfAccounts.GLAccount
	association [0..1] to ZSNAP_F72G_JournalEntry as _JournalEntry on $projection.AccountingDocument = _JournalEntry.AccountingDocument and $projection.CompanyCode = _JournalEntry.CompanyCode and $projection.FiscalYear = _JournalEntry.FiscalYear and $projection.FiscalYearVariant = _JournalEntry.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_Supplier as _Supplier on $projection.Supplier = _Supplier.Supplier
	association [0..1] to ZSNAP_F72M_ICCustomer as _ICCustomer on $projection.Customer = _ICCustomer.Customer
	association [0..1] to ZSNAP_F72M_ICSupplier as _ICSupplier on $projection.Supplier = _ICSupplier.Supplier
{
	key main.AccountingDocument,
	key main.CompanyCode,
	key main.FiscalYear,
	key main.Ledger,
	key main.LedgerGLLineItem,
	key main.SourceLedger,
	main.AccountAssignmentNumber,
	main.AccountAssignmentType,
	main.AccountingDocCreatedByUser,
	main.AccountingDocumentType,
	main.AccountingDocumentCategory,
	main.AccountingDocumentItem,
	_JournalEntry.ParkingDate,
	_JournalEntry.DocumentReferenceID,
	_JournalEntry.AlternativeReferenceDocument,
	_JournalEntry.AccountingDocumentHeaderText as DocumentHeaderText,
	_JournalEntry.ReverseDocument,
	_JournalEntry.ReverseDocumentFiscalYear,
	_JournalEntry.TransactionCode,
	_CompanyCode.Country,
	main.AssignmentReference,
	main.ClearingAccountingDocument,
	main.ClearingDate,
	main.ClearingDocFiscalYear,
	main.HouseBank,
	main.HouseBankAccount,
	main.DistributionChannel,
	main.SalesOrganization,
	main.InvoiceReference,
	main.InvoiceItemReference,
	main.IsOpenItemManaged,
	main.IsReversal,
	main.IsReversed,
	main.IsSettled,
	main.IsSettlement,
	main.MasterFixedAsset,
	main.PostingKey,
	main.PurchasingDocument,
	main.PurchasingDocumentItem,
	main.ReferenceDocumentItemGroup,
	main.SpecialGLCode,
	main.TaxCode,
	main.TransactionTypeDetermination,
	main.CreationDate,
	main.CustomerGroup,
	main.SoldMaterial,
	main.BillToParty,
	main.BusinessTransactionType,
	main.FinancialTransactionType,
	main.AssetTransactionType,
	main.BusinessArea,
	main.ChartOfAccounts,
	main.ControllingArea,
	main.CostCenter,
	main.CostCtrActivityType,
	main.Customer,
	_Customer.CustomerAccountGroup,
	_Customer.AuthorizationGroup as CustomerAuthorizationGroup,
	_ICCustomer.IsIntercompany as CustomerIsIntercompany,
	_ICCustomer.PartnerCompany as CustomerPartnerCompany,
	main.DebitCreditCode,
	main.DocumentItemText,
	main.FinancialAccountType,
	main.FunctionalArea,
	main.GLAccount,
	_GLPrnt.GLAcctLevel1,
	_GLPrnt.GLAcctLevel2,
	_GLPrnt.GLAcctLevel3,
	_GLPrnt.GLAcctLevel4,
	_GLPrnt.GLAcctLevel5,
	_GLAccountInChartOfAccounts.GLAccountGroup,
	_GLAccountInChartOfAccounts.IsBalanceSheetAccount,
	_GLAccountInChartOfAccounts.IsProfitLossAccount,
	_GLAccountInChartOfAccounts.ProfitLossAccountType,
	_GLAccountInChartOfAccounts.CorporateGroupAccount,
	_GLAccountInChartOfAccounts.CorporateGroupChartOfAccounts,
	main.Material,
	main.MaterialGroup,
	main.OffsettingAccount,
	main.OffsettingAccountType,
	main.OffsettingChartOfAccounts,
	main.PartnerCompany,
	main.PartnerProfitCenter,
	main.PartnerFunctionalArea,
	main.PartnerBusinessArea,
	main.Plant,
	main.PostingDate,
	main.Product,
	_PCPrnt.ProfCtrLevel1,
	_PCPrnt.ProfCtrLevel2,
	_PCPrnt.ProfCtrLevel3,
	_PCPrnt.ProfCtrLevel4,
	_PCPrnt.ProfCtrLevel5,
	_PCPrnt.ProfCtrLevel6,
	main.ProfitCenter,
	main.ReferenceDocument,
	main.ReferenceDocumentItem,
	main.ReferenceDocumentType,
	main.ShipToParty,
	main.SignFactor,
	main.SoldProduct,
	_CalendarDate.CalendarYear,
	_CalendarDate.YearMonth as CalendarYearMonth,
	_CalendarDate.YearQuarter as CalendarYearQuarter,
	main.DocumentDate,
	main.FiscalPeriod,
	main.PostingPeriod,
	main.FiscalYearPeriod,
	main.PostingYearPeriod,
	_FiscalCalendarDate.FiscalQuarter,
	_FiscalCalendarDate.FiscalYearQuarter,
	main.FiscalYearVariant,
	main.LedgerFiscalYear,
	main.CostSourceUnit,
	main.OrderID,
	main.WBSElement,
	main.Supplier,
	_Supplier.SupplierAccountGroup,
	_Supplier.AuthorizationGroup as SupplierAuthorizationGroup,
	_ICSupplier.IsIntercompany as SupplierIsIntercompany,
	_ICSupplier.PartnerCompany as SupplierPartnerCompany,
	main.Project,
	main.SpecialPeriod,
	main.Title,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	case
		when main.SignFactor = 'A' then main.AmountInTransactionCurrency
		else -main.AmountInTransactionCurrency
	end as AmountInTransactionCurrency,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	case
		when main.SignFactor = 'A' then main.EndingBalanceAmtInTransCrcy
		else -main.EndingBalanceAmtInTransCrcy
	end as EndingBalanceAmtInTransCrcy,
	main.TransactionCurrency,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	case
		when main.SignFactor = 'A' then main.AmountInCompanyCodeCurrency
		else -main.AmountInCompanyCodeCurrency
	end as AmountInCompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	case
		when main.SignFactor = 'A' then main.EndingBalanceAmtInCoCodeCrcy
		else -main.EndingBalanceAmtInCoCodeCrcy
	end as EndingBalanceAmtInCoCodeCrcy,
	main.CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	case
		when main.SignFactor = 'A' then main.AmountInGlobalCurrency
		else -main.AmountInGlobalCurrency
	end as AmountInGlobalCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	case
		when main.SignFactor = 'A' then main.EndingBalanceAmtInGlobalCrcy
		else -main.EndingBalanceAmtInGlobalCrcy
	end as EndingBalanceAmtInGlobalCrcy,
	main.GlobalCurrency,
	
	@Semantics.quantity.unitOfMeasure: 'CostSourceUnit'
	main.ValuationQuantity,
	main.FiscalPeriodEndDate
}