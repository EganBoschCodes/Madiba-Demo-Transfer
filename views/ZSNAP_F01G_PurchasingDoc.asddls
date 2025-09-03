@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Purchasing Document'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PurchasingDocument'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F01G_PurchasingDoc
	as select from ekko as main
{
	@ObjectModel.text.element: ['PurchasingDocumentName']
	@EndUserText.label: 'Purchasing Document'
	key main.ebeln as PurchasingDocument,
	
	@EndUserText.label: 'Purch. Doc. Category'
	main.bstyp as PurchasingDocumentCategory,
	
	@EndUserText.label: 'Purchasing Doc. Type'
	main.bsart as PurchasingDocumentType,
	
	@EndUserText.label: 'Control Indicator'
	main.bsakz as PurchasingDocumentSubtype,
	
	@EndUserText.label: 'Company Code'
	main.bukrs as CompanyCode,
	
	@EndUserText.label: 'Deletion Indicator'
	main.loekz as PurchasingDocumentDeletionCode,
	
	@EndUserText.label: 'Document Is Aged'
	main.isaged as PurchasingDocumentIsAged,
	
	@EndUserText.label: 'Item Number Interval'
	main.pincr as ItemNumberInterval,
	
	@EndUserText.label: 'Subitem Interval'
	main.upinc as ItemNumberIntervalForSubItems,
	
	@EndUserText.label: 'Status'
	main.statu as PurchasingDocumentOrigin,
	
	@EndUserText.label: 'Subject To Release'
	main.frgrl as ReleaseIsNotCompleted,
	
	@EndUserText.label: 'Release Indicator'
	main.frgke as ReleaseCode,
	
	@EndUserText.label: 'Release Strategy'
	main.frgsx as PurchasingReleaseStrategy,
	
	@EndUserText.label: 'Release State'
	main.frgzu as PurgReleaseSequenceStatus,
	
	@EndUserText.label: 'C/R For Tax Report'
	main.lands as TaxReturnCountry,
	
	@EndUserText.label: 'Created On'
	main.aedat as CreationDate,
	
	@EndUserText.label: 'Last Changed'
	main.lastchangedatetime as LastChangeDateTime,
	
	@Semantics.user.createdBy: true
	@EndUserText.label: 'Created By'
	main.ernam as CreatedByUser,
	
	@EndUserText.label: 'Supplier'
	cast (main.lifnr as md_supplier preserving type) as Supplier,
	
	@EndUserText.label: 'Salesperson'
	main.verkf as SupplierRespSalesPersonName,
	
	@EndUserText.label: 'Telephone'
	main.telf1 as SupplierPhoneNumber,
	
	@EndUserText.label: 'Address Number'
	main.adrnr as SupplierAddressID,
	
	@EndUserText.label: 'Address Number'
	main.adrnr as ManualSupplierAddressID,
	
	@EndUserText.label: 'Your Reference'
	main.ihrez as CorrespncExternalReference,
	
	@EndUserText.label: 'Our Reference'
	main.unsez as CorrespncInternalReference,
	
	@EndUserText.label: 'Purch. Organization'
	main.ekorg as PurchasingOrganization,
	
	@EndUserText.label: 'Purchasing Group'
	main.ekgrp as PurchasingGroup,
	
	@EndUserText.label: 'Currency'
	main.waers as DocumentCurrency,
	
	@EndUserText.label: 'Exchange Rate'
	main.wkurs as ExchangeRate,
	
	@Semantics.businessDate.at
	@EndUserText.label: 'Document Date'
	main.bedat as PurchasingDocumentOrderDate,
	
	@EndUserText.label: 'Goods Supplier'
	main.llief as SupplyingSupplier,
	
	@EndUserText.label: 'Supplying Plant'
	main.reswk as SupplyingPlant,
	
	@EndUserText.label: 'Invoicing Party'
	main.lifre as InvoicingParty,
	
	@EndUserText.label: 'Customer'
	main.kunnr as Customer,
	
	@EndUserText.label: 'Outline Agreement'
	main.konnr as PurchaseContract,
	
	@Semantics.language: true
	@EndUserText.label: 'Language Key'
	main.spras as Language,
	
	@EndUserText.label: 'Reason For Canc.'
	main.absgr as PurgReasonForDocCancellation,
	
	@EndUserText.label: 'Incomplete'
	main.memory as PurchasingCompletenessStatus,
	
	@EndUserText.label: 'Incoterms'
	main.inco1 as IncotermsClassification,
	
	@EndUserText.label: 'Incoterms (Part 2)'
	main.inco2 as IncotermsTransferLocation,
	
	@EndUserText.label: 'Terms of Payment'
	cast (main.zterm as farp_dzterm preserving type) as PaymentTerms,
	
	@EndUserText.label: 'Days 1'
	cast (main.zbd1t as dzbd1t preserving type) as CashDiscount1Days,
	
	@EndUserText.label: 'Days 2'
	cast (main.zbd2t as dzbd2t preserving type) as CashDiscount2Days,
	
	@EndUserText.label: 'Days Net'
	cast (main.zbd3t as dzbd3t preserving type) as NetPaymentDays,
	
	@EndUserText.label: 'Cd Percentage 1'
	main.zbd1p as CashDiscount1Percent,
	
	@EndUserText.label: 'Cd Percentage 2'
	main.zbd2p as CashDiscount2Percent,
	
	@EndUserText.label: 'Procedure'
	main.kalsm as PricingProcedure,
	
	@DefaultAggregation: #NONE
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Target Value'
	main.ktwrt as TargetAmount,
	
	@EndUserText.label: 'Distribution Type For Purchasing Doc.'
	main.distributiontype as PurgDocumentDistributionType,
	
	@EndUserText.label: 'Doc. Condition No.'
	main.knumv as PurchasingDocumentCondition,
	
	@EndUserText.label: 'Validity Per. Start'
	main.kdatb as ValidityStartDate,
	
	@EndUserText.label: 'Validity Period End'
	main.kdate as ValidityEndDate,
	
	@EndUserText.label: 'Rel. Documentation'
	main.lphis as ScheduleAgreementHasReleaseDoc,
	
	@EndUserText.label: 'Quotation Deadline'
	main.angdt as QuotationLatestSubmissionDate,
	
	@EndUserText.label: 'Binding Period'
	main.bnddt as BindingPeriodValidityEndDate,
	
	@EndUserText.label: 'Quotation Date'
	main.ihran as QuotationSubmissionDate,
	
	@EndUserText.label: 'Quotation'
	main.angnr as SupplierQuotationExternalID,
	
	@EndUserText.label: 'Bid Invitation'
	main.ausnr as RequestForQuotation,
	
	@EndUserText.label: 'Fixed Exchange Rate'
	main.kufix as ExchangeRateIsFixed,
	
	@EndUserText.label: 'Incoterms Version'
	main.incov as IncotermsVersion,
	
	@EndUserText.label: 'Incoterms Location 1'
	main.inco2_l as IncotermsLocation1,
	
	@EndUserText.label: 'Incoterms Location 2'
	main.inco3_l as IncotermsLocation2,
	
	@EndUserText.label: 'Purch. Doc. Proc. State'
	main.procstat as PurchasingProcessingStatus,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Total Val. Upon Release'
	main.rlwrt as PurgReleaseTimeTotalAmount,
	
	@EndUserText.label: 'Down Payment'
	main.dptyp as DownPaymentType,
	
	@EndUserText.label: 'Down Payt Percentage'
	main.dppct as DownPaymentPercentageOfTotAmt,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Down Payment Amount'
	main.dpamt as DownPaymentAmount,
	
	@EndUserText.label: 'Due Date For Down Payment'
	main.dpdat as DownPaymentDueDate,
	
	@EndUserText.label: 'Purchasing Document Name'
	cast (main.description as vdm_purgdoc_name preserving type) as PurchasingDocumentName,
	
	@EndUserText.label: 'Quotation Start Date'
	main.qtn_erlst_submsn_date as QuotationEarliestSubmsnDate,
	
	@EndUserText.label: 'Application Close'
	main.bwbdt as LatestRegistrationDate,
	
	@EndUserText.label: 'Follow-On Document Category'
	main.followon_doc_cat as FollowOnDocumentCategory,
	
	@EndUserText.label: 'Follow-On Document Type'
	main.followon_doc_type as FollowOnDocumentType,
	
	@EndUserText.label: 'Vat Registration No.'
	main.stceg as VATRegistration,
	
	@EndUserText.label: 'Ctry/Rgn Sls Tax No.'
	main.stceg_l as VATRegistrationCountry,
	
	@EndUserText.label: 'Intrastat Relevance'
	main.intra_rel as IsIntrastatReportingRelevant,
	
	@EndUserText.label: 'Intrastat Exclusion'
	main.intra_excl as IsIntrastatReportingExcluded,
	
	@Semantics.booleanIndicator: true
	@EndUserText.label: 'Business Purpose Completed'
	main.iseopblocked as IsEndOfPurposeBlocked,
	
	@EndUserText.label: 'Id Of The Parent Document'
	main.parent_id as PurchasingParentDocument,
	
	@EndUserText.label: 'Grouping Id For Company Codes'
	main.grouping_id as ProcmtHubCompanyCodeGroupingID
}