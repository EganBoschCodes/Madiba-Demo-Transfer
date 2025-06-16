@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F72: Duplicate Activity for Balances'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F72S_060	
	with parameters
		P_SFromFiscalYear: gjahr,
		P_SToFiscalYearPeriod: fins_jahrper
	
	as select from ZSNAP_F72S_055 (P_SFromFiscalYear: $parameters.P_SFromFiscalYear, P_SToFiscalYearPeriod: $parameters.P_SToFiscalYearPeriod) as main
	
	inner join ZSNAP_F72S_056 (
		P_SFromFiscalYear: $parameters.P_SFromFiscalYear,
		P_SToFiscalYearPeriod: $parameters.P_SToFiscalYearPeriod
	) as BalancePeriods on main.FiscalYearVariant = BalancePeriods.FiscalYearVariant and main.FiscalYear = BalancePeriods.FiscalYear and main.FiscalPeriod <= BalancePeriods.FiscalPeriod
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
	main.BusinessTransactionType,
	main.FinancialTransactionType,
	main.AssetTransactionType,
	main.BusinessArea,
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
	main.PartnerProfitCenter,
	main.Plant,
	main.PostingDate,
	main.Product,
	main.ProfitCenter,
	main.ReferenceDocument,
	main.ReferenceDocumentItem,
	main.ReferenceDocumentType,
	main.ShipToParty,
	main.SoldProduct,
	cast ('00000000' as datum) as DocumentDate,
	BalancePeriods.FiscalPeriod,
	main.FiscalPeriod as PostingPeriod,
	BalancePeriods.FiscalPeriod as SpecialPeriod,
	BalancePeriods.FiscalYearPeriod,
	main.FiscalYearPeriod as PostingYearPeriod,
	main.FiscalYearVariant,
	main.LedgerFiscalYear,
	BalancePeriods.FiscalPeriodEndDate,
	main.OrderID,
	main.WBSElement,
	main.Project,
	main.Supplier,
	main.Title,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	cast (0 as abap.curr (23, 2)) as AmountInTransactionCurrency,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	cast (main.AmountInTransactionCurrency as abap.curr (23, 2)) as EndingBalanceAmtInTransCrcy,
	main.TransactionCurrency,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	cast (0 as abap.curr (23, 2)) as AmountInCompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	cast (main.AmountInCompanyCodeCurrency as abap.curr (23, 2)) as EndingBalanceAmtInCoCodeCrcy,
	main.CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	cast (0 as abap.curr (23, 2)) as AmountInGlobalCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	cast (main.AmountInGlobalCurrency as abap.curr (23, 2)) as EndingBalanceAmtInGlobalCrcy,
	main.GlobalCurrency,
	
	@Semantics.quantity.unitOfMeasure: 'CostSourceUnit'
	main.ValuationQuantity,
	main.CostSourceUnit
}
where main.IsStartingBalanceRelevant = 'X'