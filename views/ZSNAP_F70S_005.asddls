@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F70: PC Actuals Cust./Supp. Derivation'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F70S_005
	as select from ZSNAP_F70S_003 as main
	
	association [0..1] to ZSNAP_F70G_OffsetAsset as _FixedAsset on main.AccountingDocument = _FixedAsset.AccountingDocument and main.CompanyCode = _FixedAsset.CompanyCode and main.FiscalYear = _FixedAsset.FiscalYear
	association [0..1] to ZSNAP_F70G_OffsetCustomer as _OffSetCust on main.AccountingDocument = _OffSetCust.AccountingDocument and main.CompanyCode = _OffSetCust.CompanyCode and main.FiscalYear = _OffSetCust.FiscalYear
	association [0..1] to ZSNAP_F70G_OffsetSupplier as _OffsetSupplier on main.AccountingDocument = _OffsetSupplier.AccountingDocument and main.CompanyCode = _OffsetSupplier.CompanyCode and main.FiscalYear = _OffsetSupplier.FiscalYear
	association [0..1] to ZSNAP_F70G_OplAcctgDocItem as _AccountingDocumentItem on $projection.CompanyCode = _AccountingDocumentItem.CompanyCode and $projection.AccountingDocument = _AccountingDocumentItem.AccountingDocument and $projection.FiscalYear = _AccountingDocumentItem.FiscalYear and $projection.AccountingDocumentItem = _AccountingDocumentItem.AccountingDocumentItem
	association [0..1] to ZSNAP_F70G_SDDocItemPartner as _PayerSDIPartner on $projection.ReferenceDocument = _PayerSDIPartner.SDDocument and $projection.ReferenceDocumentItem = _PayerSDIPartner.SDDocumentItem and _PayerSDIPartner.PartnerFunction = 'RG' and $projection.ReferenceDocumentType = 'VBRK' and $projection.ActualPlanCode = 'A'
	association [0..1] to ZSNAP_F70G_SDDocItemPartner as _ShipToSDIPartner on $projection.ReferenceDocument = _ShipToSDIPartner.SDDocument and $projection.ReferenceDocumentItem = _ShipToSDIPartner.SDDocumentItem and _ShipToSDIPartner.PartnerFunction = 'WE' and $projection.ReferenceDocumentType = 'VBRK' and $projection.ActualPlanCode = 'A'
	association [0..1] to ZSNAP_F70G_SDDocPartner as _PayerSDPartner on $projection.ReferenceDocument = _PayerSDPartner.SDDocument and _PayerSDPartner.PartnerFunction = 'RG' and $projection.ReferenceDocumentType = 'VBRK' and $projection.ActualPlanCode = 'A'
	association [0..1] to ZSNAP_F70G_SDDocPartner as _ShipToSDPartner on $projection.ReferenceDocument = _ShipToSDPartner.SDDocument and _ShipToSDPartner.PartnerFunction = 'WE' and $projection.ReferenceDocumentType = 'VBRK' and $projection.ActualPlanCode = 'A'
{
	key main.AccountingDocument,
	key main.CompanyCode,
	key main.FiscalYear,
	key main.Ledger,
	key main.LedgerGLLineItem,
	key main.SourceLedger,
	main.AccountAssignmentNumber,
	main.AccountAssignmentType,
	main.AccountingDocumentStatus,
	main.AccountingDocCreatedByUser,
	main.AccountingDocumentType,
	main.ActualPlanCode,
	main.TransactionTypeDetermination,
	main.AssetTransactionType,
	main.BillToParty,
	main.BusinessTransactionType,
	main.ChartOfAccounts,
	main.ControllingArea,
	main.CostCenter,
	main.CostCtrActivityType,
	cast (case
		when main.FinancialAccountType = 'D' then main.Customer
		else _OffSetCust.Customer
	end as kunnr) as Customer,
	main.CustomerGroup,
	cast (case
		when main.FinancialAccountType = 'K' then main.Supplier
		else _OffsetSupplier.Supplier
	end as lifnr) as Supplier,
	cast (case
		when main.DistributionChannel = '' then '00'
		else main.DistributionChannel
	end as vtweg preserving type) as DistributionChannel,
	cast (case
		when main.OrganizationDivision = '' then '00'
		else main.OrganizationDivision
	end as spart preserving type) as OrganizationDivision,
	main.SalesDocument,
	main.SalesDocumentItem,
	main.SalesOrganization,
	main.ValuationArea,
	main.DebitCreditCode,
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
	cast (case
		when main.FinancialAccountType <> 'D' then _OffSetCust.Customer
		when main.Customer = '' or main.Customer is null then main.BillToParty
		else main.Customer
	end as kunnr) as OffsetCustomer,
	case
		when main.FinancialAccountType = 'K' then main.Supplier
		else _OffsetSupplier.Supplier
	end as OffsetSupplier,
	main.OffsettingAccount,
	main.OffsettingAccountType,
	main.OffsettingChartOfAccounts,
	main.PartnerCompany,
	cast (coalesce (_PayerSDPartner.Customer, _PayerSDIPartner.Customer) as kunrg preserving type) as PayerParty,
	main.Plant,
	main.SoldProduct as Product,
	main.ProfitCenter,
	main.ReferenceDocument,
	main.ReferenceDocumentItem,
	main.ReferenceDocumentItemGroup,
	main.ReferenceDocumentType,
	cast (case
		when main.ReferenceDocumentType = 'VBRK' then main.OriginalReferenceDocument
		else ''
	end as vbeln_vf) as BillingDocument,
	cast (case
		when main.ReferenceDocumentType = 'VBRK' and main.ActualPlanCode = 'A' then coalesce (_ShipToSDPartner.Customer, _ShipToSDIPartner.Customer)
		else main.ShipToParty
	end as kunwe preserving type) as ShipToParty,
	main.SoldProduct,
	main.Source,
	main.CreationDate,
	main.CreationDateTime,
	main.DocumentDate,
	main.NetDueDate,
	main.FiscalPeriod,
	main.SpecialPeriod,
	main.FiscalYearPeriod,
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
	case
		when main.FinancialAccountType = 'A' then main.MasterFixedAsset
		else _FixedAsset.FixedAsset
	end as MasterFixedAsset,
	main.FixedAssetSubNumber,
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
	main.AmountInFourthCurrency,
	main.FourthCurrency,
	
	@Semantics.quantity.unitOfMeasure: 'CostSourceUnit'
	main.ValuationQuantity,
	main.CostSourceUnit,
	
	@Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
	main.Quantity,
	main.UnitOfMeasure,
	main.NumberOfItems,
	_AccountingDocumentItem
}