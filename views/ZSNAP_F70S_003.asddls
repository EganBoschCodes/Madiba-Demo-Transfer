@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F70: Profit Center Actuals Base'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F70S_003
	as select from ZSNAP_F70G_JournalEntryItem as main
	
	association [0..1] to ZSNAP_F70G_JournalEntry as _JournalEntry on $projection.AccountingDocument = _JournalEntry.AccountingDocument and $projection.CompanyCode = _JournalEntry.CompanyCode and $projection.FiscalYear = _JournalEntry.FiscalYear
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
	main.AccountingDocumentCategory as AccountingDocumentStatus,
	cast ('A' as fis_actual_plan_code preserving type) as ActualPlanCode,
	main.TransactionTypeDetermination,
	main.AssetTransactionType,
	main.BillToParty,
	main.BusinessTransactionType,
	main.ChartOfAccounts,
	main.ControllingArea,
	main.CostCenter,
	main.CostCtrActivityType,
	main.Customer,
	main.CustomerGroup,
	main.Supplier,
	main.DebitCreditCode,
	main.SalesDocument,
	main.SalesDocumentItem,
	main.DistributionChannel,
	main.OrganizationDivision,
	main.SalesOrganization,
	main.ValuationArea,
	main.DocumentItemText,
	main.FinancialAccountType,
	main.FunctionalArea,
	main.GLAccount,
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
	main.OffsettingAccount,
	main.OffsettingAccountType,
	main.OffsettingChartOfAccounts,
	main.PartnerCompany,
	main.Plant,
	main.ProfitCenter,
	main.ReferenceDocument,
	main.ReferenceDocumentItem,
	main.ReferenceDocumentItemGroup,
	main.ReferenceDocumentType,
	_JournalEntry.OriginalReferenceDocument,
	main.ShipToParty,
	cast (case
		when main.SoldProduct = '' then main.Product
		else main.SoldProduct
	end as fins_matnr_pa preserving type) as SoldProduct,
	cast ('A' as abap.char (2)) as Source,
	main.CreationDate,
	main.CreationDateTime,
	main.DocumentDate,
	main.NetDueDate,
	cast (case
		when main.FiscalPeriod > '012' then '012'
		else main.FiscalPeriod
	end as fins_fiscalperiod) as FiscalPeriod,
	main.FiscalPeriod as SpecialPeriod,
	cast (case
		when main.FiscalPeriod > '012' then concat (main.FiscalYear, '012')
		else main.FiscalYearPeriod
	end as fis_jahrper) as FiscalYearPeriod,
	main.FiscalYearVariant,
	main.LedgerFiscalYear,
	main.PostingDate,
	main.AccountingDocumentItem,
	main.BusinessArea,
	main.FinancialTransactionType,
	main.WBSElement,
	main.Project,
	main.OrderID,
	main.PartnerProfitCenter,
	main.PartnerCostCenter,
	main.PartnerOrder,
	main.SpecialGLCode,
	main.PartnerFunctionalArea,
	main.PartnerCompanyCode,
	main.TaxCode,
	main.PartnerControllingObjectClass,
	main.CostOriginGroup,
	main.MasterFixedAsset,
	main.FixedAsset as FixedAssetSubNumber,
	main.Title,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.AmountInTransactionCurrency,
	main.TransactionCurrency,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.AmountInCompanyCodeCurrency,
	main.CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	main.AmountInGlobalCurrency,
	main.GlobalCurrency,
	
	@Semantics.amount.currencyCode: 'FourthCurrency'
	main.AmountInFreeDefinedCurrency1 as AmountInFourthCurrency,
	main.FreeDefinedCurrency1 as FourthCurrency,
	
	@Semantics.quantity.unitOfMeasure: 'CostSourceUnit'
	main.ValuationQuantity,
	
	@Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
	main.Quantity,
	main.BaseUnit as UnitOfMeasure,
	main.CostSourceUnit,
	main.NumberOfItems
}