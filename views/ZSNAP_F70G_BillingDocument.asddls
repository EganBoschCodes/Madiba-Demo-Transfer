@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Billing Document'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'BillingDocument'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_BillingDocument
	as select from ZSNAP_F70G_BillingDocBasic as main
{
	@EndUserText.label: 'Billing Document'
	key main.BillingDocument,
	
	@EndUserText.label: 'SD Document Category'
	main.SDDocumentCategory,
	
	@EndUserText.label: 'Billing Category'
	main.BillingDocumentCategory,
	
	@EndUserText.label: 'Billing Type'
	main.BillingDocumentType,
	
	@Semantics.user.createdBy: true
	@EndUserText.label: 'Created By'
	main.CreatedByUser,
	
	@Semantics.systemDate.createdAt: true
	@EndUserText.label: 'Created On'
	main.CreationDate,
	
	@Semantics.systemTime.createdAt
	@EndUserText.label: 'Time'
	main.CreationTime,
	
	@Semantics.systemDate.lastChangedAt: true
	@EndUserText.label: 'Changed On'
	main.LastChangeDate,
	
	@Semantics.systemDateTime.lastChangedAt: true
	@EndUserText.label: 'Time Stamp'
	main.LastChangeDateTime,
	
	@EndUserText.label: 'Logical System'
	main.LogicalSystem,
	
	@EndUserText.label: 'Sales Organization'
	main.SalesOrganization,
	
	@EndUserText.label: 'Distribution Channel'
	main.DistributionChannel,
	
	@EndUserText.label: 'Division'
	main.Division,
	
	@EndUserText.label: 'Billing Date'
	main.BillingDocumentDate,
	
	@EndUserText.label: 'Canceled'
	main.BillingDocumentIsCancelled,
	
	@EndUserText.label: 'Canceled Bill. Doc.'
	main.CancelledBillingDocument,
	
	@EndUserText.label: 'Combination Criteria'
	main.BillingDocCombinationCriteria,
	
	@EndUserText.label: 'Man. Invoice Maint.'
	main.ManualInvoiceMaintIsRelevant,
	
	@EndUserText.label: 'Number Of Pages'
	main.NmbrOfPages,
	
	@EndUserText.label: 'Intrastat Relevance'
	main.IsIntrastatReportingRelevant,
	
	@EndUserText.label: 'Intrastat Exclusion'
	main.IsIntrastatReportingExcluded,
	
	@EndUserText.label: 'Draft Indicator'
	main.BillingDocumentIsTemporary,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	@EndUserText.label: 'Net Value'
	main.TotalNetAmount,
	
	@EndUserText.label: 'Document Currency'
	main.TransactionCurrency,
	
	@EndUserText.label: 'Statistics Currency'
	main.StatisticsCurrency,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	@EndUserText.label: 'Tax Amount'
	main.TotalTaxAmount,
	
	@EndUserText.label: 'Customer Price Group'
	main.CustomerPriceGroup,
	
	@EndUserText.label: 'Price List Type'
	main.PriceListType,
	
	@EndUserText.label: 'Tax Departure C/R'
	main.TaxDepartureCountry,
	
	@EndUserText.label: 'Vat Registration No.'
	main.VATRegistration,
	
	@EndUserText.label: 'Origin Sales Tax No.'
	main.VATRegistrationOrigin,
	
	@EndUserText.label: 'Ctry/Rgn Sls Tax No.'
	main.VATRegistrationCountry,
	
	@EndUserText.label: 'Hierarchytypepricing'
	main.HierarchyTypePricing,
	
	@EndUserText.label: 'Tax Class.1 Customer'
	main.CustomerTaxClassification1,
	
	@EndUserText.label: 'Tax Class.2 Customer'
	main.CustomerTaxClassification2,
	
	@EndUserText.label: 'Tax Class.3 Customer'
	main.CustomerTaxClassification3,
	
	@EndUserText.label: 'Tax Class.4 Customer'
	main.CustomerTaxClassification4,
	
	@EndUserText.label: 'Tax Class.5 Customer'
	main.CustomerTaxClassification5,
	
	@EndUserText.label: 'Tax Class.6 Customer'
	main.CustomerTaxClassification6,
	
	@EndUserText.label: 'Tax Class.7 Customer'
	main.CustomerTaxClassification7,
	
	@EndUserText.label: 'Tax Class.8 Customer'
	main.CustomerTaxClassification8,
	
	@EndUserText.label: 'Tax Class.9 Customer'
	main.CustomerTaxClassification9,
	
	@EndUserText.label: 'Eu Triangular Deal'
	main.IsEUTriangularDeal,
	
	@EndUserText.label: 'Pricing Procedure'
	main.SDPricingProcedure,
	
	@EndUserText.label: 'Shipping Conditions'
	main.ShippingCondition,
	
	@EndUserText.label: 'Supplier Number Of Plant'
	main.PlantSupplier,
	
	@EndUserText.label: 'Incoterms Version'
	main.IncotermsVersion,
	
	@EndUserText.label: 'Incoterms'
	main.IncotermsClassification,
	
	@EndUserText.label: 'Incoterms (Part 2)'
	main.IncotermsTransferLocation,
	
	@EndUserText.label: 'Incoterms Location 1'
	main.IncotermsLocation1,
	
	@EndUserText.label: 'Incoterms Location 2'
	main.IncotermsLocation2,
	
	@EndUserText.label: 'Payer'
	main.PayerParty,
	
	@EndUserText.label: 'Contract Account'
	main.ContractAccount,
	
	@EndUserText.label: 'Terms Of Payment'
	main.CustomerPaymentTerms,
	
	@EndUserText.label: 'Payment Method'
	main.PaymentMethod,
	
	@EndUserText.label: 'Payment Reference'
	main.PaymentReference,
	
	@EndUserText.label: 'Fixed Value Date'
	main.FixedValueDate,
	
	@EndUserText.label: 'Addit. Value Days'
	main.AdditionalValueDays,
	
	@EndUserText.label: 'Mandate Reference'
	main.SEPAMandate,
	
	@EndUserText.label: 'Company Code'
	main.CompanyCode,
	
	@EndUserText.label: 'Fiscal Year'
	main.FiscalYear,
	
	@EndUserText.label: 'Document Number'
	main.AccountingDocument,
	
	@EndUserText.label: 'Posting Period'
	main.FiscalPeriod,
	
	@EndUserText.label: 'Acct Assmt Grp Cust.'
	main.CustomerAccountAssignmentGroup,
	
	@EndUserText.label: 'Set Exchange Rate'
	main.AccountingExchangeRateIsSet,
	
	@EndUserText.label: 'Accounting Exchange Rate'
	main.AccountingExchangeRate,
	
	@EndUserText.label: 'Translation Date'
	main.ExchangeRateDate,
	
	@EndUserText.label: 'Exchange Rate Type'
	main.ExchangeRateType,
	
	@EndUserText.label: 'Reference'
	main.DocumentReferenceID,
	
	@EndUserText.label: 'Assignment'
	main.AssignmentReference,
	
	@EndUserText.label: 'Dunning Area'
	main.DunningArea,
	
	@EndUserText.label: 'Dunning Block'
	main.DunningBlockingReason,
	
	@EndUserText.label: 'Dunning Key'
	main.DunningKey,
	
	@EndUserText.label: 'Financial Doc. No.'
	main.InternalFinancialDocument,
	
	@EndUserText.label: 'Is Relevant For Accrual'
	main.IsRelevantForAccrual,
	
	@EndUserText.label: 'Sold-To Party'
	main.SoldToParty,
	
	@EndUserText.label: 'Trading Partner No.'
	main.PartnerCompany,
	
	@EndUserText.label: 'Customer Reference'
	main.PurchaseOrderByCustomer,
	
	@EndUserText.label: 'Customer Group'
	main.CustomerGroup,
	
	@EndUserText.label: 'Dest. Country/Region'
	main.Country,
	
	@EndUserText.label: 'City Code'
	main.CityCode,
	
	@EndUserText.label: 'Sales District'
	main.SalesDistrict,
	
	@EndUserText.label: 'Region'
	main.Region,
	
	@EndUserText.label: 'County Code'
	main.County,
	
	@EndUserText.label: 'Credit Control Area'
	main.CreditControlArea,
	
	@EndUserText.label: 'Agreement'
	main.CustomerRebateAgreement,
	
	@EndUserText.label: 'Doc. Condition No.'
	main.PricingDocument,
	
	@EndUserText.label: 'Overall Status'
	main.OverallSDProcessStatus,
	
	@EndUserText.label: 'Status'
	main.OverallBillingStatus,
	
	@EndUserText.label: 'Posting Status'
	main.AccountingPostingStatus,
	
	@EndUserText.label: 'Posting Status'
	main.AccountingTransferStatus,
	
	@EndUserText.label: 'Issue Type'
	main.BillingIssueType,
	
	@EndUserText.label: 'Invoice List Status'
	main.InvoiceListStatus,
	
	@EndUserText.label: 'All Items'
	main.OvrlItmGeneralIncompletionSts,
	
	@EndUserText.label: 'Pricing Â€“ All Items'
	main.OverallPricingIncompletionSts,
	
	@EndUserText.label: 'Clearing Status'
	main.InvoiceClearingStatus,
	
	@EndUserText.label: 'Invoice List Type'
	main.InvoiceListType,
	
	@EndUserText.label: 'Inv. List Bill. Date'
	main.InvoiceListBillingDate
}
where main.SDDocumentCategory = 'M'
	or main.SDDocumentCategory = 'N'
	or main.SDDocumentCategory = 'O'
	or main.SDDocumentCategory = 'P'
	or main.SDDocumentCategory = 'S'
	or main.SDDocumentCategory = 'U'
	or main.SDDocumentCategory = '5'
	or main.SDDocumentCategory = '6'