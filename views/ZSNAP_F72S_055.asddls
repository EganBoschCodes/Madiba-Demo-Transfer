@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F72: Balance Derivation Basis'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F72S_055	
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
	case main.AccountingDocumentCategory
		when 'J' then case main.FiscalPeriod
			when '000' then cast ('X' as xfeld preserving type)
			else ''
		end
		else 'X'
	end as IsStartingBalanceRelevant,
	main.Material,
	main.MaterialGroup,
	main.OffsettingAccount,
	main.OffsettingAccountType,
	main.OffsettingChartOfAccounts,
	main.Plant,
	main.Product,
	main.ProfitCenter,
	main.ReferenceDocument,
	main.ReferenceDocumentItem,
	main.ReferenceDocumentType,
	main.ShipToParty,
	main.SoldProduct,
	case _FiscalYearPeriod.IsSpecialPeriod
		when 'X' then _FiscalYearPeriod._FiscalPeriodStartDate.FiscalPeriod
		else main.FiscalPeriod
	end as FiscalPeriod,
	main.FiscalYearPeriod,
	main.FiscalYearVariant,
	main.LedgerFiscalYear,
	main.PostingDate,
	main.OrderID,
	main.Supplier,
	
	@EndUserText.label: 'Partner Company'
	main.PartnerCompany,
	
	@EndUserText.label: 'Partner Profit Center'
	main.PartnerProfitCenter,
	
	@EndUserText.label: 'WBS Element'
	main.WBSElement,
	main.Project,
	main.Title,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	cast (main.AmountInTransactionCurrency as abap.curr (23, 2)) as AmountInTransactionCurrency,
	main.TransactionCurrency,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	cast (main.AmountInCompanyCodeCurrency as abap.curr (23, 2)) as AmountInCompanyCodeCurrency,
	main.CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	cast (main.AmountInGlobalCurrency as abap.curr (23, 2)) as AmountInGlobalCurrency,
	main.GlobalCurrency,
	
	@EndUserText.label: 'Valuation Quantity'
	@Semantics.quantity.unitOfMeasure: 'CostSourceUnit'
	cast (0 as abap.quan (23, 3)) as ValuationQuantity,
	main.CostSourceUnit
}
where main.FiscalYearPeriod <= $parameters.P_SToFiscalYearPeriod
	and main.FiscalYear >= $parameters.P_SFromFiscalYear