@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F72: Financial Balances Basis'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F72S_050	
	with parameters
		P_SFromFiscalYear: fins_gjahr,
		P_SToFiscalYearPeriod: fins_jahrper
	
	as select from ZSNAP_F72G_GLAccLineItem as main
	
	association [0..1] to ZSNAP_F72G_FiscalYearPeriod as _FiscalYearPeriod on main.FiscalYearVariant = _FiscalYearPeriod.FiscalYearVariant and main.FiscalYearPeriod = _FiscalYearPeriod.FiscalYearPeriod
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
	main.BusinessArea,
	main.BusinessTransactionType,
	main.FinancialTransactionType,
	main.AssetTransactionType,
	main.ChartOfAccounts,
	main.ControllingArea,
	main.CostCenter,
	main.CostCtrActivityType,
	main.Customer,
	main.DebitCreditCode,
	main.DocumentItemText,
	main.FinancialAccountType,
	main.FunctionalArea,
	main.GLAccount,
	main.Material,
	main.MaterialGroup,
	main.OffsettingAccount,
	main.OffsettingAccountType,
	main.OffsettingChartOfAccounts,
	main.PartnerCompany,
	main.Plant,
	main.Product,
	main.ProfitCenter,
	main.ReferenceDocument,
	main.ReferenceDocumentItem,
	main.ReferenceDocumentType,
	main.ShipToParty,
	main.SoldProduct,
	main.DocumentDate,
	main.OrderID,
	main.Supplier,
	main.PostingDate,
	main.FiscalPeriod as SpecialPeriod,
	case _FiscalYearPeriod.IsSpecialPeriod
		when 'X' then _FiscalYearPeriod._FiscalPeriodStartDate.FiscalPeriod
		else main.FiscalPeriod
	end as FiscalPeriod,
	main.FiscalYearPeriod,
	
	@Semantics.fiscal.yearVariant: true
	main.FiscalYearVariant,
	
	@Semantics.fiscal.year: true
	main.LedgerFiscalYear,
	
	@EndUserText.label: 'Title'
	main.Title,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	cast (main.AmountInTransactionCurrency as abap.curr (23, 2)) as AmountInTransactionCurrency,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	cast (0 as abap.curr (23, 2)) as EndingBalanceAmtInTransCrcy,
	main.TransactionCurrency,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	cast (main.AmountInCompanyCodeCurrency as abap.curr (23, 2)) as AmountInCompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	cast (0 as abap.curr (23, 2)) as EndingBalanceAmtInCoCodeCrcy,
	main.CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	cast (main.AmountInGlobalCurrency as abap.curr (23, 2)) as AmountInGlobalCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	cast (0 as abap.curr (23, 2)) as EndingBalanceAmtInGlobalCrcy,
	main.GlobalCurrency,
	
	@Semantics.quantity.unitOfMeasure: 'CostSourceUnit'
	main.ValuationQuantity,
	main.CostSourceUnit,
	main.PartnerProfitCenter,
	main.PartnerFunctionalArea,
	main.PartnerBusinessArea,
	main.WBSElement,
	main.Project,
	_FiscalYearPeriod
}
where main.FiscalYearPeriod <= $parameters.P_SToFiscalYearPeriod
	and main.FiscalYear >= $parameters.P_SFromFiscalYear
	and main.AccountingDocumentCategory <> 'J'
	and main.FiscalPeriod <> '000'