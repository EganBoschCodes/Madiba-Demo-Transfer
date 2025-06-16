@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Purchasing Document Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PurchasingDocumentItem'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F72G_PrchngDocItem
	as select from ekpo as main
	
	association [1..1] to ZSNAP_F72G_PurchasingDoc as _PurchasingDocument on $projection.PurchasingDocument = _PurchasingDocument.PurchasingDocument
{
	@ObjectModel.foreignKey.association: '_PurchasingDocument'
	@EndUserText.label: 'Purchasing Document'
	key main.ebeln as PurchasingDocument,
	
	@ObjectModel.text.element: ['PurchasingDocumentItemText']
	@EndUserText.label: 'Item'
	key main.ebelp as PurchasingDocumentItem,
	
	@EndUserText.label: 'Document Item'
	main.uniqueid as PurchasingDocumentItemUniqueID,
	
	@EndUserText.label: 'Purch. Doc. Category'
	main.bstyp as PurchasingDocumentCategory,
	
	@EndUserText.label: 'Deletion Indicator'
	main.loekz as PurchasingDocumentDeletionCode,
	
	@EndUserText.label: 'Material'
	main.matnr as Material,
	
	@EndUserText.label: 'Supplier Mat. No.'
	main.idnlf as SupplierMaterialNumber,
	
	@EndUserText.label: 'Material'
	main.ematn as ManufacturerMaterial,
	
	@EndUserText.label: 'Manufacturer Part No.'
	main.mfrpn as ManufacturerPartNmbr,
	
	@EndUserText.label: 'Manufacturer'
	main.mfrnr as Manufacturer,
	
	@Semantics.text: true
	@EndUserText.label: 'Short Text'
	main.txz01 as PurchasingDocumentItemText,
	
	@EndUserText.label: 'Company Code'
	main.bukrs as CompanyCode,
	
	@EndUserText.label: 'Plant'
	main.werks as Plant,
	
	@EndUserText.label: 'Address'
	main.adrnr as ManualDeliveryAddressID,
	
	@EndUserText.label: 'Address'
	main.adrn2 as ReferenceDeliveryAddressID,
	
	@EndUserText.label: 'Customer'
	main.kunnr as Customer,
	
	@EndUserText.label: 'Supplier'
	main.emlif as Subcontractor,
	
	@EndUserText.label: 'Sc Supplier'
	main.lblkz as SupplierIsSubcontractor,
	
	@EndUserText.label: 'Cross-Plant Cm'
	main.satnr as CrossPlantConfigurableProduct,
	
	@EndUserText.label: 'Material Category'
	main.attyp as ArticleCategory,
	
	@EndUserText.label: 'Kanban Indicator'
	main.kanba as PlndOrderReplnmtElmntType,
	
	@EndUserText.label: 'Points Unit'
	main.punei as ProductPurchasePointsQtyUnit,
	
	@Semantics.quantity.unitOfMeasure: 'ProductPurchasePointsQtyUnit'
	@EndUserText.label: 'Points'
	main.anzpu as ProductPurchasePointsQty,
	
	@EndUserText.label: 'Storage Location'
	cast (main.lgort as vdm_storage_location preserving type) as StorageLocation,
	
	@EndUserText.label: 'Material Group'
	main.matkl as MaterialGroup,
	
	@EndUserText.label: 'Order Unit'
	main.meins as OrderQuantityUnit,
	
	@EndUserText.label: 'Equal To'
	main.umrez as OrderItemQtyToBaseQtyNmrtr,
	
	@EndUserText.label: 'Denominator'
	main.umren as OrderItemQtyToBaseQtyDnmntr,
	
	@Semantics.quantity.unitOfMeasure: 'OrderPriceUnit'
	@EndUserText.label: 'Price Unit'
	cast (main.peinh as vdm_price_unit preserving type) as NetPriceQuantity,
	
	@EndUserText.label: 'Delivery Completed'
	main.elikz as IsCompletelyDelivered,
	
	@EndUserText.label: 'Final Invoice'
	main.erekz as IsFinallyInvoiced,
	
	@EndUserText.label: 'Goods Receipt'
	main.wepos as GoodsReceiptIsExpected,
	
	@EndUserText.label: 'Invoice Receipt'
	main.repos as InvoiceIsExpected,
	
	@EndUserText.label: 'Final Delivery'
	main.eglkz as OutwardDeliveryIsComplete,
	
	@EndUserText.label: 'Gr-Based Inv. Verif.'
	main.webre as InvoiceIsGoodsReceiptBased,
	
	@EndUserText.label: 'Gr Non-Valuated'
	main.weunb as GoodsReceiptIsNonValuated,
	
	@EndUserText.label: 'Purchase Requisition'
	main.banfn as PurchaseRequisition,
	
	@EndUserText.label: 'Item Of Requisition'
	main.bnfpo as PurchaseRequisitionItem,
	
	@EndUserText.label: 'Package Number'
	main.packno as ServicePackage,
	
	@EndUserText.label: 'Service Performer'
	main.serviceperformer as ServicePerformer,
	
	@EndUserText.label: 'Product Type Group'
	main.producttype as ProductType,
	
	@EndUserText.label: 'Material Type'
	main.mtart as MaterialType,
	
	@EndUserText.label: 'Princ. Agreement Item'
	main.ktpnr as PurchaseContractItem,
	
	@EndUserText.label: 'Outline Agreement'
	main.konnr as PurchaseContract,
	
	@EndUserText.label: 'Req. For Quotation'
	main.requestforquotation as RequestForQuotation,
	
	@EndUserText.label: 'Item Number For Rfq'
	main.requestforquotationitem as RequestForQuotationItem,
	
	@EndUserText.label: 'Eval. Receipt Sett.'
	main.xersy as EvaldRcptSettlmtIsAllowed,
	
	@EndUserText.label: 'Unltd Overdelivery'
	main.uebtk as UnlimitedOverdeliveryIsAllowed,
	
	@EndUserText.label: 'Overdeliv. Tolerance'
	main.uebto as OverdelivTolrtdLmtRatioInPct,
	
	@EndUserText.label: 'Underdel. Tolerance'
	main.untto as UnderdelivTolrtdLmtRatioInPct,
	
	@EndUserText.label: 'Requisitioner'
	main.afnam as RequisitionerName,
	
	@EndUserText.label: 'Mrp Area'
	main.berid as MRPArea,
	
	@EndUserText.label: 'Incoterms'
	main.inco1 as IncotermsClassification,
	
	@EndUserText.label: 'Incoterms (Part 2)'
	main.inco2 as IncotermsTransferLocation,
	
	@EndUserText.label: 'Incoterms Location 1'
	main.inco2_l as IncotermsLocation1,
	
	@EndUserText.label: 'Incoterms Location 2'
	main.inco3_l as IncotermsLocation2,
	
	@EndUserText.label: 'Prior Supplier'
	main.kolif as PriorSupplier,
	
	@EndUserText.label: 'Ean/Upc'
	main.ean11 as InternationalArticleNumber,
	
	@EndUserText.label: 'Confirmation Control'
	main.bstae as SupplierConfirmationControlKey,
	
	@EndUserText.label: 'Print Price'
	main.prsdr as PriceIsToBePrinted,
	
	@EndUserText.label: 'Base Unit Of Measure'
	main.lmein as BaseUnit,
	
	@EndUserText.label: 'Item Category'
	main.pstyp as PurchasingDocumentItemCategory,
	
	@EndUserText.label: 'Profit Center'
	main.ko_prctr as ProfitCenter,
	
	@EndUserText.label: 'Order Price Unit'
	main.bprme as OrderPriceUnit,
	
	@EndUserText.label: 'Volume Unit'
	main.voleh as VolumeUnit,
	
	@EndUserText.label: 'Unit Of Weight'
	main.gewei as WeightUnit,
	
	@EndUserText.label: 'Distrib. Indicator'
	main.vrtkz as MultipleAcctAssgmtDistribution,
	
	@EndUserText.label: 'Partial Invoice'
	main.twrkz as PartialInvoiceDistribution,
	
	@EndUserText.label: 'Pricing Date Control'
	main.meprf as PricingDateControl,
	
	@EndUserText.label: 'Statistical'
	main.stapo as IsStatisticalItem,
	
	@EndUserText.label: 'Higher-Level Item'
	main.uebpo as PurchasingParentItem,
	
	@EndUserText.label: 'Latest Gr Date'
	main.lewed as GoodsReceiptLatestCreationDate,
	
	@EndUserText.label: 'Returns Item'
	main.retpo as IsReturnsItem,
	
	@EndUserText.label: 'Reason For Ordering'
	main.bsgru as PurchasingOrderReason,
	
	@EndUserText.label: 'Acct Assignment Cat.'
	main.knttp as AccountAssignmentCategory,
	
	@EndUserText.label: 'Purchasing Info Rec.'
	main.infnr as PurchasingInfoRecord,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Net Order Value'
	main.netwr as NetAmount,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Gross Order Value'
	main.brtwr as GrossAmount,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Effective Value'
	main.effwr as EffectiveAmount,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Subtotal 1'
	main.kzwi1 as Subtotal1Amount,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Subtotal 2'
	main.kzwi2 as Subtotal2Amount,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Subtotal 3'
	main.kzwi3 as Subtotal3Amount,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Subtotal 4'
	main.kzwi4 as Subtotal4Amount,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Subtotal 5'
	main.kzwi5 as Subtotal5Amount,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Subtotal 6'
	main.kzwi6 as Subtotal6Amount,
	
	@Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
	@EndUserText.label: 'Target Quantity'
	main.ktmng as TargetQuantity,
	
	@Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
	@EndUserText.label: 'Order Quantity'
	main.menge as OrderQuantity,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Net Order Price'
	main.netpr as NetPriceAmount,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Oa Target Value'
	main.zwert as TargetAmount,
	
	@Semantics.quantity.unitOfMeasure: 'VolumeUnit'
	@EndUserText.label: 'Volume'
	main.volum as ItemVolume,
	
	@Semantics.quantity.unitOfMeasure: 'WeightUnit'
	@EndUserText.label: 'Gross Weight'
	main.brgew as ItemGrossWeight,
	
	@Semantics.quantity.unitOfMeasure: 'WeightUnit'
	@EndUserText.label: 'Net Weight'
	main.ntgew as ItemNetWeight,
	
	@EndUserText.label: 'Quantity Conversion'
	main.bpumz as OrderPriceUnitToOrderUnitNmrtr,
	
	@EndUserText.label: 'Quantity Conversion'
	main.bpumn as OrdPriceUnitToOrderUnitDnmntr,
	
	@EndUserText.label: 'Reconciliation Date'
	main.abdat as SchedAgrmtCumQtyReconcileDate,
	
	@Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
	@EndUserText.label: 'Agr. Cumulative Qty'
	main.abftz as SchedAgrmtAgreedCumQty,
	
	@EndUserText.label: 'Date Of Last Transmitted Change'
	main.drdat as ItemLastTransmissionDate,
	
	@EndUserText.label: 'Firm Zone'
	main.etfz1 as ScheduleLineFirmOrderInDays,
	
	@EndUserText.label: 'Trade-Off Zone'
	main.etfz2 as SchedLineSemiFirmOrderInDays,
	
	@EndUserText.label: '1St Reminder/Exped.'
	main.mahn1 as NoDaysReminder1,
	
	@EndUserText.label: '2Nd Reminder/Exped.'
	main.mahn2 as NoDaysReminder2,
	
	@EndUserText.label: '3Rd Reminder/Exped.'
	main.mahn3 as NoDaysReminder3,
	
	@EndUserText.label: 'Req. Tracking Number'
	main.bednr as RequirementTracking,
	
	@EndUserText.label: 'Acknowledgment Reqd.'
	main.kzabs as IsOrderAcknRqd,
	
	@EndUserText.label: 'Stock Type'
	main.insmk as StockType,
	
	@EndUserText.label: 'Tax Code'
	main.mwskz as TaxCode,
	
	@EndUserText.label: 'Tax Jurisdiction'
	main.txjcd as TaxJurisdiction,
	
	@EndUserText.label: 'Shipping Instr.'
	main.evers as ShippingInstruction,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Non-Deductible'
	main.navnw as NonDeductibleInputTaxAmount,
	
	@EndUserText.label: 'Valuation Type'
	main.bwtar as ValuationType,
	
	@EndUserText.label: 'Valuation Category'
	main.bwtty as ValuationCategory,
	
	@EndUserText.label: 'Rejection Indicator'
	main.abskz as ItemIsRejectedBySupplier,
	
	@EndUserText.label: 'Price Date'
	main.prdat as PurgDocPriceDate,
	
	@EndUserText.label: 'Info Record Update'
	main.spinf as IsInfoRecordUpdated,
	
	@Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
	@EndUserText.label: 'Stand.Rel.Order.Qty.'
	main.abmng as PurgDocReleaseOrderQuantity,
	
	@EndUserText.label: 'Order Acknowledgment'
	main.labnr as PurgDocOrderAcknNumber,
	
	@EndUserText.label: 'Estimated Price'
	main.schpr as PurgDocEstimatedPrice,
	
	@Semantics.booleanIndicator: true
	@EndUserText.label: 'Info At Registration'
	main.borgr_miss as IsInfoAtRegistration,
	
	@EndUserText.label: 'Supplier Subrange'
	main.ltsnr as SupplierSubrange,
	
	@EndUserText.label: 'Cost Center'
	main.kostl as CostCenter,
	
	@EndUserText.label: 'G/L Account'
	main.sakto as GLAccount,
	
	@EndUserText.label: 'Wbs Element'
	main.ps_psp_pnr as WBSElementInternalID,
	
	@EndUserText.label: 'Fund'
	main.geber as Fund,
	
	@EndUserText.label: 'Budget Period'
	main.budget_pd as BudgetPeriod,
	
	@EndUserText.label: 'Funds Center'
	main.fistl as FundsCenter,
	
	@EndUserText.label: 'Commitment Item'
	main.fipos as CommitmentItem,
	
	@EndUserText.label: 'Functional Area'
	main.fkber as FunctionalArea,
	
	@EndUserText.label: 'Grant'
	main.grant_nbr as GrantID,
	
	@EndUserText.label: 'Earmarked Funds'
	main.kblnr as EarmarkedFunds,
	
	@EndUserText.label: 'Earmarked Funds'
	main.kblnr as EarmarkedFundsDocument,
	
	@EndUserText.label: 'Document Item'
	main.kblpos as EarmarkedFundsItem,
	
	@EndUserText.label: 'Document Item'
	main.kblpos as EarmarkedFundsDocumentItem,
	
	@EndUserText.label: 'Planned Deliv. Time'
	main.plifz as PlannedDeliveryDurationInDays,
	
	@EndUserText.label: 'Gr Processing Time'
	main.webaz as GoodsReceiptDurationInDays,
	
	@EndUserText.label: 'Partial Deliv./Item'
	main.kztlf as PartialDeliveryIsAllowed,
	
	@EndUserText.label: 'Consumption'
	main.kzvbr as ConsumptionPosting,
	
	@EndUserText.label: 'Release Creation Profile'
	main.abueb as SchedgAgrmtRelCreationProfile,
	
	@EndUserText.label: 'Control Type'
	main.spe_cq_ctrltype as SchedAgrmtCumulativeQtyControl,
	
	@EndUserText.label: 'No Transmission Of Cqs In Sa Release'
	main.spe_cq_nocq as CumulativeQuantityIsNotSent,
	
	@EndUserText.label: 'Min. Rem. Shelf Life'
	main.mhdrz as MinRemainingShelfLife,
	
	@EndUserText.label: 'Period Indicator for SLED'
	cast (main.iprkz as vdm_dattp preserving type) as ShelfLifeExpirationDatePeriod,
	
	@EndUserText.label: 'Qm Control Key'
	main.ssqss as QualityMgmtCtrlKey,
	
	@EndUserText.label: 'Special Stock'
	main.sobkz as InventorySpecialStockType,
	
	@EndUserText.label: 'Jit Delivery'
	main.fabkz as IsRelevantForJITDelivSchedule,
	
	@EndUserText.label: 'Next Jit Delivery Schedule Transmission'
	main.nfabd as NextJITDelivSchedSendingDate,
	
	@EndUserText.label: 'Next Forecast Delivery Schedule Transm.'
	main.nlabd as NextFcstDelivSchedSendingDate,
	
	@EndUserText.label: 'Binding On Mrp'
	main.kzstu as FirmTradeOffZoneBindMRP,
	
	@EndUserText.label: 'Certificate Type'
	main.zgtyp as QualityCertificateType,
	
	@EndUserText.label: 'Rfq'
	main.anfnr as SupplierQuotation,
	
	@EndUserText.label: 'Item'
	main.anfps as SupplierQuotationItem,
	
	@EndUserText.label: 'Intrastat Service Code'
	main.isvco as IntrastatServiceCode,
	
	@EndUserText.label: 'Commodity Code'
	main.stawn as CommodityCode,
	
	@EndUserText.label: 'Del. Type F. Returns'
	main.lfret as DeliveryDocumentType,
	
	@EndUserText.label: 'Material Freight Grp'
	main.mfrgr as MaterialFreightGroup,
	
	@EndUserText.label: 'Qual.F.Freegoodsdis.'
	main.nrfhg as DiscountInKindEligibility,
	
	@EndUserText.label: 'Shipping Block'
	main.novet as PurgItemIsBlockedForDelivery,
	
	@EndUserText.label: 'Issuing Storage Loc.'
	main.reslo as IssuingStorageLocation,
	
	@EndUserText.label: 'Allocation Table'
	main.abeln as AllocationTable,
	
	@EndUserText.label: 'Item'
	main.abelp as AllocationTableItem,
	
	@EndUserText.label: 'Retail Promotion'
	main.aktnr as RetailPromotion,
	
	@EndUserText.label: 'Down Payment'
	main.dptyp as DownPaymentType,
	
	@EndUserText.label: 'Down Payt Percentage'
	main.dppct as DownPaymentPercentageOfTotAmt,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Down Payment Amount'
	main.dpamt as DownPaymentAmount,
	
	@EndUserText.label: 'Due Date For Down Payment'
	main.dpdat as DownPaymentDueDate,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Expected Value'
	main.expected_value as ExpectedOverallLimitAmount,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Overall Limit'
	main.limit_amount as OverallLimitAmount,
	
	@EndUserText.label: 'Purchase Contract For Limit'
	main.contract_for_limit as PurContractForOverallLimit,
	
	@EndUserText.label: 'Requirement Segment'
	main.sgt_rcat as RequirementSegment,
	
	@EndUserText.label: 'Material Origin'
	main.j_1bmatorg as BR_MaterialOrigin,
	
	@EndUserText.label: 'Material Usage'
	main.j_1bmatuse as BR_MaterialUsage,
	
	@EndUserText.label: 'Mat. Cfop Category'
	main.j_1bindust as BR_CFOPCategory,
	
	@EndUserText.label: 'Ncm Code'
	main.j_1bnbm as BR_NCM,
	
	@EndUserText.label: 'Ncm Code'
	main.j_1bnbm as ConsumptionTaxCtrlCode,
	
	@EndUserText.label: 'Produced In-House'
	main.j_1bownpro as BR_IsProducedInHouse,
	
	@EndUserText.label: 'Material'
	main.extmaterialforpurg as PurchasingCentralMaterial,
	
	@Semantics.amount.currencyCode: 'DocumentCurrency'
	@EndUserText.label: 'Item Target Value'
	main.target_value as PurgDocItmTargetAmount,
	
	@EndUserText.label: 'Crm Ref  Order Number For Tpop Process'
	main.spe_crm_ref_so as ThirdPtyOrdProcgExtReference,
	
	@EndUserText.label: 'Crm Reference  Item Number In Tpop Proc'
	main.spe_crm_ref_item as ThirdPtyOrdProcgExtRefItem,
	
	@EndUserText.label: 'Blocking Reason - Id'
	main.blk_reason_id as PurgDocItmBlkRsnCode,
	
	@EndUserText.label: 'Business Purpose Completed'
	_PurchasingDocument.IsEndOfPurposeBlocked,
	
	@EndUserText.label: 'Currency'
	_PurchasingDocument.DocumentCurrency,
	_PurchasingDocument
}