@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Sales Document Basic'
@Metadata.allowExtensions: true
@ObjectModel.representativeKey: 'SalesDocument'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_SalesDocBasic
	as select from vbak as main
	
	association [0..*] to ZSNAP_F70G_BusinessAreaText as _BusinessAreaText on $projection.BusinessArea = _BusinessAreaText.BusinessArea
	association [0..*] to ZSNAP_F70G_BusinessAreaText as _CostCenterBusinessAreaText on $projection.CostCenterBusinessArea = _CostCenterBusinessAreaText.BusinessArea
	association [0..*] to ZSNAP_F70G_CreditCtrlAreaT as _CreditControlAreaText on $projection.CreditControlArea = _CreditControlAreaText.CreditControlArea
{
	@EndUserText.label: 'Sales Document'
	key main.vbeln as SalesDocument,
	
	@EndUserText.label: 'Sd Document Category'
	main.vbtyp as SDDocumentCategory,
	
	@EndUserText.label: 'Sales Document Type'
	main.auart as SalesDocumentType,
	
	@EndUserText.label: 'Indicator'
	main.vbklt as SalesDocumentProcessingType,
	
	@EndUserText.label: 'Created By'
	main.ernam as CreatedByUser,
	
	@EndUserText.label: 'Last Changed By'
	main.last_changed_by_user as LastChangedByUser,
	
	@Semantics.systemDate.createdAt: true
	@EndUserText.label: 'Created On'
	main.erdat as CreationDate,
	
	@EndUserText.label: 'Created At'
	cast (main.erzet as creation_time preserving type) as CreationTime,
	
	@Semantics.systemDate.lastChangedAt: true
	@EndUserText.label: 'Changed On'
	main.aedat as LastChangeDate,
	
	@Semantics.systemDateTime.lastChangedAt: true
	@EndUserText.label: 'Time Stamp'
	main.upd_tmstmp as LastChangeDateTime,
	
	@EndUserText.label: 'Last Contact Date'
	main.mahdt as LastCustomerContactDate,
	
	@EndUserText.label: 'External Business System Id'
	main.ext_bus_syst_id as SenderBusinessSystemName,
	
	@EndUserText.label: 'External Document Identifier'
	main.ext_ref_doc_id as ExternalDocumentID,
	
	@EndUserText.label: 'Timestamp Of External Revision'
	main.ext_rev_tmstmp as ExternalDocLastChangeDateTime,
	
	@EndUserText.label: 'Sales Organization'
	main.vkorg as SalesOrganization,
	
	@EndUserText.label: 'Distribution Channel'
	main.vtweg as DistributionChannel,
	
	@EndUserText.label: 'Division'
	main.spart as OrganizationDivision,
	
	@EndUserText.label: 'Sales Group'
	main.vkgrp as SalesGroup,
	
	@EndUserText.label: 'Sales Office'
	main.vkbur as SalesOffice,
	
	@EndUserText.label: 'Sold-To Party'
	main.kunnr as SoldToParty,
	
	@EndUserText.label: 'Customer Group 1'
	main.kvgr1 as AdditionalCustomerGroup1,
	
	@EndUserText.label: 'Customer Group 2'
	main.kvgr2 as AdditionalCustomerGroup2,
	
	@EndUserText.label: 'Customer Group 3'
	main.kvgr3 as AdditionalCustomerGroup3,
	
	@EndUserText.label: 'Customer Group 4'
	main.kvgr4 as AdditionalCustomerGroup4,
	
	@EndUserText.label: 'Customer Group 5'
	main.kvgr5 as AdditionalCustomerGroup5,
	
	@ObjectModel.text.association: '_CreditControlAreaText'
	@EndUserText.label: 'Credit Control Area'
	main.kkber as CreditControlArea,
	
	@EndUserText.label: 'Agreement'
	main.knuma as CustomerRebateAgreement,
	
	@EndUserText.label: 'Document Date'
	main.audat as SalesDocumentDate,
	
	@EndUserText.label: 'Order Reason'
	main.augru as SDDocumentReason,
	
	@EndUserText.label: 'Collective Number'
	main.submi as SDDocumentCollectiveNumber,
	
	@EndUserText.label: 'Purchase Order Type'
	main.bsark as CustomerPurchaseOrderType,
	
	@EndUserText.label: 'Customer Ref. Date'
	main.bstdk as CustomerPurchaseOrderDate,
	
	@EndUserText.label: 'Supplement'
	main.bstzd as CustomerPurchaseOrderSuplmnt,
	
	@EndUserText.label: 'Statistics Currency'
	main.stwae as StatisticsCurrency,
	
	@EndUserText.label: 'Process Id No.'
	main.msr_id as RetsMgmtProcess,
	
	@EndUserText.label: 'Next Credit Check'
	main.cmnup as NextCreditCheckDate,
	
	@EndUserText.label: 'Quotation Valid From'
	main.angdt as BindingPeriodValidityStartDate,
	
	@EndUserText.label: 'Quotation Valid To'
	main.bnddt as BindingPeriodValidityEndDate,
	
	@EndUserText.label: 'Probability'
	main.awahr as HdrOrderProbabilityInPercent,
	
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'DelivSchedTypeMRPRlvnceCode'
	@EndUserText.label: 'Mrp For Dlvschtype'
	main.abdis as SchedulingAgreementProfileCode,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Mrp For Dlvschtype'
	main.abdis as DelivSchedTypeMRPRlvnceCode,
	
	@EndUserText.label: 'Valid-From Date'
	main.guebg as AgrmtValdtyStartDate,
	
	@EndUserText.label: 'Valid-To Date'
	main.gueen as AgrmtValdtyEndDate,
	
	@EndUserText.label: 'Usage'
	main.abrvw as MatlUsageIndicator,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	@EndUserText.label: 'Net Value'
	main.netwr as TotalNetAmount,
	
	@EndUserText.label: 'Document Currency'
	main.waerk as TransactionCurrency,
	
	@EndUserText.label: 'Doc. Condition No.'
	main.knumv as SalesDocumentCondition,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Pricing Procedure'
	main.kalsm as SDPricingProcedure,
	
	@EndUserText.label: 'Alt.Tax Classific.'
	main.taxk1 as CustomerTaxClassification1,
	
	@EndUserText.label: 'Tax Class.2 Customer'
	main.taxk2 as CustomerTaxClassification2,
	
	@EndUserText.label: 'Tax Class.3 Customer'
	main.taxk3 as CustomerTaxClassification3,
	
	@EndUserText.label: 'Tax Class.4 Customer'
	main.taxk4 as CustomerTaxClassification4,
	
	@EndUserText.label: 'Tax Class.5 Customer'
	main.taxk5 as CustomerTaxClassification5,
	
	@EndUserText.label: 'Tax Class.6 Customer'
	main.taxk6 as CustomerTaxClassification6,
	
	@EndUserText.label: 'Tax Class.7 Customer'
	main.taxk7 as CustomerTaxClassification7,
	
	@EndUserText.label: 'Tax Class.8 Customer'
	main.taxk8 as CustomerTaxClassification8,
	
	@EndUserText.label: 'Tax Class.9 Customer'
	main.taxk9 as CustomerTaxClassification9,
	
	@EndUserText.label: 'Tax Departure C/R'
	main.landtx as TaxDepartureCountry,
	
	@EndUserText.label: 'Tax Dest. Ctry/Reg.'
	main.stceg_l as VATRegistrationCountry,
	
	@EndUserText.label: 'Requested Delivery Date'
	cast (main.vdatu as reqd_delivery_date preserving type) as RequestedDeliveryDate,
	
	@EndUserText.label: 'Shipping Conditions'
	main.vsbed as ShippingCondition,
	
	@EndUserText.label: 'Complete Delivery'
	main.autlf as CompleteDeliveryIsDefined,
	
	@EndUserText.label: 'Delivery Block'
	main.lifsk as DeliveryBlockReason,
	
	@EndUserText.label: 'Cancellation Date'
	main.fsh_candate as FashionCancelDate,
	
	@EndUserText.label: 'Ccode To Be Billed'
	main.bukrs_vf as BillingCompanyCode,
	
	@EndUserText.label: 'Billing Block'
	main.faksk as HeaderBillingBlockReason,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Approval Request Reason Id'
	main.apm_approval_reason as SalesDocApprovalReason,
	
	@EndUserText.label: 'Exchange Rate Type'
	main.kurst as ExchangeRateType,
	
	@ObjectModel.text.association: '_BusinessAreaText'
	@EndUserText.label: 'Business Area'
	main.gsber as BusinessArea,
	
	@ObjectModel.text.association: '_CostCenterBusinessAreaText'
	@EndUserText.label: 'Business Area'
	main.gskst as CostCenterBusinessArea,
	
	@EndUserText.label: 'Cost Center'
	main.kostl as CostCenter,
	
	@EndUserText.label: 'Controlling Area'
	main.kokrs as ControllingArea,
	
	@EndUserText.label: 'Order'
	main.aufnr as OrderID,
	
	@EndUserText.label: 'Object No. Header'
	main.objnr as ControllingObject,
	
	@EndUserText.label: 'Assignment'
	main.zuonr as AssignmentReference,
	
	@EndUserText.label: 'Paym. Card Plan No.'
	main.rplnr as PaymentPlan,
	
	@EndUserText.label: 'Credit Account'
	main.knkli as CustomerCreditAccount,
	
	@EndUserText.label: 'Currency'
	main.cmwae as ControllingAreaCurrency,
	
	@Semantics.amount.currencyCode: 'ControllingAreaCurrency'
	@EndUserText.label: 'Rel. Credit Value'
	main.amtbl as ReleasedCreditAmount,
	
	@EndUserText.label: 'Release Date'
	main.cmfre as CreditBlockReleaseDate,
	
	@EndUserText.label: 'Next Date'
	main.cmngv as NextShippingDate,
	
	@EndUserText.label: 'Reference Document'
	main.vgbel as ReferenceSDDocument,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Reference'
	main.xblnr as AccountingDocExternalReference,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Master Contract'
	main.vbeln_grp as MasterSalesContract,
	
	@EndUserText.label: 'Preceding Doc.Categ.'
	main.vgtyp as ReferenceSDDocumentCategory,
	
	@EndUserText.label: 'Description'
	main.ktext as SalesItemProposalDescription,
	
	@EndUserText.label: 'Your Reference'
	main.ihrez as CorrespncExternalReference,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Solution Order'
	main.solution_order_id as BusinessSolutionOrder,
	
	@EndUserText.label: 'Overall Status'
	main.gbstk as OverallSDProcessStatus,
	
	@EndUserText.label: 'Purchasing Conf. Sts'
	main.costa as OverallPurchaseConfStatus,
	
	@EndUserText.label: 'Rejection Status'
	main.abstk as OverallSDDocumentRejectionSts,
	
	@EndUserText.label: 'Overall Block Status'
	main.spstg as TotalBlockStatus,
	
	@EndUserText.label: 'Delivery Conf. Sts'
	main.bestk as OverallDelivConfStatus,
	
	@EndUserText.label: 'Ovrl Delivery Status'
	main.lfgsk as OverallTotalDeliveryStatus,
	
	@EndUserText.label: 'Delivery Status'
	main.lfstk as OverallDeliveryStatus,
	
	@EndUserText.label: 'Ovrl Deliv. Blk Sts'
	main.lsstk as OverallDeliveryBlockStatus,
	
	@EndUserText.label: 'Ord.-Rel. Billg Sts'
	main.fksak as OverallOrdReltdBillgStatus,
	
	@EndUserText.label: 'Billing Block Status'
	main.fsstk as OverallBillingBlockStatus,
	
	@EndUserText.label: 'Ovrl Reference Sts'
	main.rfgsk as OverallTotalSDDocRefStatus,
	
	@EndUserText.label: 'Reference Status'
	main.rfstk as OverallSDDocReferenceStatus,
	
	@EndUserText.label: 'Credit Status'
	main.cmgst as TotalCreditCheckStatus,
	
	@EndUserText.label: 'Maximum Value'
	main.cmpsc as MaxDocValueCreditCheckStatus,
	
	@EndUserText.label: 'Terms Of Payment'
	main.cmpsd as PaymentTermCreditCheckStatus,
	
	@EndUserText.label: 'Financial Document'
	main.cmpsi as FinDocCreditCheckStatus,
	
	@EndUserText.label: 'Expt Cred. Insurance'
	main.cmpsj as ExprtInsurCreditCheckStatus,
	
	@EndUserText.label: 'Payment Card Status'
	main.cmpsk as PaytAuthsnCreditCheckSts,
	
	@EndUserText.label: 'Sap Credit Management'
	main.cmps_cm as CentralCreditCheckStatus,
	
	@EndUserText.label: 'Credit Mgmt Te Status'
	main.cmps_te as CentralCreditChkTechErrSts,
	
	@EndUserText.label: 'Overall Header'
	main.uvall as HdrGeneralIncompletionStatus,
	
	@EndUserText.label: 'Pricing Â€“ All Items'
	main.uvprs as OverallPricingIncompletionSts,
	
	@EndUserText.label: 'Delivery Â€“ Header'
	main.uvvlk as HeaderDelivIncompletionStatus,
	
	@EndUserText.label: 'Billing Â€“ Header'
	main.uvfak as HeaderBillgIncompletionStatus,
	
	@EndUserText.label: 'All Items'
	main.uvals as OvrlItmGeneralIncompletionSts,
	
	@EndUserText.label: 'Billing Â€“ All Items'
	main.uvfas as OvrlItmBillingIncompletionSts,
	
	@EndUserText.label: 'Delivery Â€“ All Items'
	main.uvvls as OvrlItmDelivIncompletionSts,
	
	@EndUserText.label: 'Product Marketability Status'
	cast (main.total_pcsta as mon_tdd_total_pcsta preserving type) as OverallChmlCmplncStatus,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Dangerous Goods Status'
	cast (main.total_dgsta as mon_tdd_total_dgsta preserving type) as OverallDangerousGoodsStatus,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Safety Data Sheet Status'
	cast (main.total_sdssta as mon_tdd_total_sdssta preserving type) as OverallSafetyDataSheetStatus,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Approval Status'
	main.apm_approval_status as SalesDocApprovalStatus,
	
	@EndUserText.label: 'Manual Completion Of Contract'
	main.manek as ContractManualCompletion,
	
	@EndUserText.label: 'Down Payment Status'
	main.dp_clear_sta_hdr as ContractDownPaymentStatus,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Embargo Status'
	main.total_emcst as OverallTrdCmplncEmbargoSts,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Screening Status'
	main.total_slcst as OvrlTrdCmplncSnctndListChkSts,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Legal Control Status'
	main.total_lccst as OvrlTrdCmplncLegalCtrlChkSts,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Delivery Date Rule'
	main.delivery_date_type_rule as DeliveryDateTypeRule,
	
	@EndUserText.label: 'Cross-Item Pricing Date'
	main.crossitem_prc_date as AlternativePricingDate,
	
	@EndUserText.label: 'Omnichannel Sales Promotion Status'
	main.bob_status as OmniChnlSalesPromotionStatus,
	
	@EndUserText.label: 'Name'
	main.bname as OrdererName,
	
	@EndUserText.label: 'Telephone'
	main.telf1 as OrdererPhoneNumber,
	
	@Consumption.hidden: true
	_BusinessAreaText,
	
	@Consumption.hidden: true
	_CostCenterBusinessAreaText,
	
	@Consumption.hidden: true
	_CreditControlAreaText
}