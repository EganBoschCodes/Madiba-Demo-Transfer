@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Billing Document Basic'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_BillingDocBasic
	as select from vbrk as main
{
	key main.vbeln as BillingDocument,
	
	@EndUserText.label: 'SD Document Category'
	main.vbtyp as SDDocumentCategory,
	main.fktyp as BillingDocumentCategory,
	main.fkart as BillingDocumentType,
	
	@Semantics.user.createdBy: true
	main.ernam as CreatedByUser,
	
	@Semantics.systemDate.createdAt: true
	main.erdat as CreationDate,
	
	@Semantics.systemTime.createdAt
	main.erzet as CreationTime,
	
	@Semantics.systemDate.lastChangedAt: true
	main.aedat as LastChangeDate,
	
	@Semantics.systemDateTime.lastChangedAt: true
	main.changed_on as LastChangeDateTime,
	main.logsys as LogicalSystem,
	main.vkorg as SalesOrganization,
	main.vtweg as DistributionChannel,
	main.spart as Division,
	main.fkdat as BillingDocumentDate,
	main.fksto as BillingDocumentIsCancelled,
	main.sfakn as CancelledBillingDocument,
	main.zukri as BillingDocCombinationCriteria,
	main.mrnkz as ManualInvoiceMaintIsRelevant,
	main.numpg as NmbrOfPages,
	main.intra_rel as IsIntrastatReportingRelevant,
	main.intra_excl as IsIntrastatReportingExcluded,
	main.draft as BillingDocumentIsTemporary,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.netwr as TotalNetAmount,
	main.waerk as TransactionCurrency,
	main.stwae as StatisticsCurrency,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.mwsbk as TotalTaxAmount,
	main.konda as CustomerPriceGroup,
	main.pltyp as PriceListType,
	main.landtx as TaxDepartureCountry,
	main.stceg as VATRegistration,
	main.stceg_h as VATRegistrationOrigin,
	main.stceg_l as VATRegistrationCountry,
	main.hityp_pr as HierarchyTypePricing,
	main.taxk1 as CustomerTaxClassification1,
	main.taxk2 as CustomerTaxClassification2,
	main.taxk3 as CustomerTaxClassification3,
	main.taxk4 as CustomerTaxClassification4,
	main.taxk5 as CustomerTaxClassification5,
	main.taxk6 as CustomerTaxClassification6,
	main.taxk7 as CustomerTaxClassification7,
	main.taxk8 as CustomerTaxClassification8,
	main.taxk9 as CustomerTaxClassification9,
	main.xegdr as IsEUTriangularDeal,
	main.kalsm as SDPricingProcedure,
	main.vsbed as ShippingCondition,
	main.ico_lifnr as PlantSupplier,
	main.incov as IncotermsVersion,
	main.inco1 as IncotermsClassification,
	main.inco2 as IncotermsTransferLocation,
	main.inco2_l as IncotermsLocation1,
	main.inco3_l as IncotermsLocation2,
	main.kunrg as PayerParty,
	main.vkont as ContractAccount,
	main.zterm as CustomerPaymentTerms,
	main.zlsch as PaymentMethod,
	main.kidno as PaymentReference,
	main.valdt as FixedValueDate,
	main.valtg as AdditionalValueDays,
	main.mndid as SEPAMandate,
	main.bukrs as CompanyCode,
	main.gjahr as FiscalYear,
	main.belnr as AccountingDocument,
	main.poper as FiscalPeriod,
	main.ktgrd as CustomerAccountAssignmentGroup,
	main.cpkur as AccountingExchangeRateIsSet,
	cast (main.kurrf as kurrf_not_converted preserving type) as AccountingExchangeRate,
	main.kurrf_dat as ExchangeRateDate,
	main.kurst as ExchangeRateType,
	main.xblnr as DocumentReferenceID,
	main.zuonr as AssignmentReference,
	main.maber as DunningArea,
	main.mansp as DunningBlockingReason,
	main.mschl as DunningKey,
	main.lcnum as InternalFinancialDocument,
	main.accrrel as IsRelevantForAccrual,
	main.fkart_rl as InvoiceListType,
	main.fkdat_rl as InvoiceListBillingDate,
	main.kunag as SoldToParty,
	main.vbund as PartnerCompany,
	main.bstnk_vf as PurchaseOrderByCustomer,
	main.kdgrp as CustomerGroup,
	main.land1 as Country,
	main.cityc as CityCode,
	main.bzirk as SalesDistrict,
	main.regio as Region,
	main.counc as County,
	main.kkber as CreditControlArea,
	main.knuma as CustomerRebateAgreement,
	main.knumv as PricingDocument,
	main.gbstk as OverallSDProcessStatus,
	main.vf_status as OverallBillingStatus,
	main.buchk as AccountingPostingStatus,
	main.rfbsk as AccountingTransferStatus,
	main.vf_todo as BillingIssueType,
	main.relik as InvoiceListStatus,
	main.uvals as OvrlItmGeneralIncompletionSts,
	main.uvprs as OverallPricingIncompletionSts,
	main.clrst as InvoiceClearingStatus
}