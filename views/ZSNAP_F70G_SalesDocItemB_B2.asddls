@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Sales Document Item Basic'
@Metadata.allowExtensions: true
@ObjectModel.representativeKey: 'SalesDocumentItem'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F70G_SalesDocItemB_B2
	as select from vbap as main
	
	association [0..*] to ZSNAP_F70G_BusinessAreaText as _BusinessAreaText on $projection.BusinessArea = _BusinessAreaText.BusinessArea
	association [0..*] to ZSNAP_F70G_ProductText as _OrigMaterialText on $projection.OriginallyRequestedMaterial = _OrigMaterialText.Product
	association [0..*] to ZSNAP_F70G_ProductText as _ProductText on $projection.Product = _ProductText.Product
	association [1..1] to ZSNAP_F70G_SalesDocBasic as _SalesDocumentBasic on $projection.SalesDocument = _SalesDocumentBasic.SalesDocument
	association [0..*] to ZSNAP_F70G_ShippingPointTxt as _ShippingPointText on $projection.ShippingPoint = _ShippingPointText.ShippingPoint
{
	@ObjectModel.foreignKey.association: '_SalesDocumentBasic'
	@EndUserText.label: 'Sales Document'
	key main.vbeln as SalesDocument,
	
	@ObjectModel.text.element: ['SalesDocumentItemText']
	@EndUserText.label: 'Sales Document Item'
	key main.posnr as SalesDocumentItem,
	
	@EndUserText.label: 'Guid 16'
	main.handle as SalesDocumentItemUUID,
	
	@EndUserText.label: 'Item Category'
	main.pstyv as SalesDocumentItemCategory,
	
	@EndUserText.label: 'Item Type'
	main.posar as SalesDocumentItemType,
	
	@EndUserText.label: 'Returns'
	main.shkzg as IsReturnsItem,
	
	@EndUserText.label: 'Completion Rule'
	main.erlre as CompletionRule,
	
	@EndUserText.label: 'Created By'
	main.ernam as CreatedByUser,
	
	@Semantics.systemDate.createdAt: true
	@EndUserText.label: 'Created On'
	main.erdat as CreationDate,
	
	@EndUserText.label: 'Created At'
	cast (main.erzet as creation_time preserving type) as CreationTime,
	
	@Semantics.systemDate.lastChangedAt: true
	@EndUserText.label: 'Changed On'
	main.aedat as LastChangeDate,
	
	@EndUserText.label: 'Division'
	main.spart as Division,
	
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'Product'
	@EndUserText.label: 'Material'
	main.matnr as Material,
	
	@Analytics.internalName: #LOCAL
	@ObjectModel.text.association: '_ProductText'
	@EndUserText.label: 'Product'
	cast (main.matnr as productnumber preserving type) as Product,
	
	@ObjectModel.text.association: '_OrigMaterialText'
	@EndUserText.label: 'Material Entered'
	main.matwa as OriginallyRequestedMaterial,
	
	@EndUserText.label: 'Customer Material'
	main.kdmat as MaterialByCustomer,
	
	@EndUserText.label: 'Ean/Upc'
	main.ean11 as InternationalArticleNumber,
	
	@EndUserText.label: 'Batch'
	main.charg as Batch,
	
	@EndUserText.label: 'Product Hierarchy'
	main.prodh as ProductHierarchyNode,
	
	@EndUserText.label: 'Substitution Reason'
	main.sugrd as MaterialSubstitutionReason,
	
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'ProductGroup'
	@EndUserText.label: 'Material Group'
	main.matkl as MaterialGroup,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Product Group'
	cast (main.matkl as productgroup preserving type) as ProductGroup,
	
	@EndUserText.label: 'Material Group 1'
	main.mvgr1 as AdditionalMaterialGroup1,
	
	@EndUserText.label: 'Material Group 2'
	main.mvgr2 as AdditionalMaterialGroup2,
	
	@EndUserText.label: 'Material Group 3'
	main.mvgr3 as AdditionalMaterialGroup3,
	
	@EndUserText.label: 'Material Group 4'
	main.mvgr4 as AdditionalMaterialGroup4,
	
	@EndUserText.label: 'Material Group 5'
	main.mvgr5 as AdditionalMaterialGroup5,
	
	@EndUserText.label: 'Configuration'
	main.cuobj as ProductConfiguration,
	
	@EndUserText.label: 'Mat.Determ.Active'
	main.prosa as MaterialDeterminationType,
	
	@EndUserText.label: 'Mrp Area'
	main.berid as MRPArea,
	
	@EndUserText.label: 'Bill Of Material'
	main.stlnr as BillOfMaterial,
	
	@EndUserText.label: 'Bom Key Date'
	main.stdat as BOMExplosionDate,
	
	@EndUserText.label: 'Availability Check'
	main.mtvfp as ProdAvailabilityCheckGroup,
	
	@Semantics.text: true
	@EndUserText.label: 'Item Description'
	main.arktx as SalesDocumentItemText,
	
	@EndUserText.label: 'Purchase Order Item'
	main.posex as UnderlyingPurchaseOrderItem,
	
	@EndUserText.label: 'Denominator'
	main.umvkn as OrderToBaseQuantityDnmntr,
	
	@EndUserText.label: 'Numerator'
	main.umvkz as OrderToBaseQuantityNmrtr,
	
	@EndUserText.label: 'Conversion Factor'
	main.umzin as TargetToBaseQuantityDnmntr,
	
	@EndUserText.label: 'Conversion Factor'
	main.umziz as TargetToBaseQuantityNmrtr,
	
	@EndUserText.label: 'Committed Delivery Creation Date'
	cast (main.cmtd_deliv_creadate as committeddelivcreationdate preserving type) as CommittedDelivCreationDate,
	
	@EndUserText.label: 'Committed Delivery Date'
	cast (main.cmtd_deliv_date as committeddeliverydate preserving type) as CommittedDeliveryDate,
	
	@EndUserText.label: 'Sales Deal'
	main.knuma_ag as SalesDeal,
	
	@EndUserText.label: 'Promotion'
	main.knuma_pi as SalesPromotion,
	
	@EndUserText.label: 'Reason For Rejection'
	main.abgru as SalesDocumentRjcnReason,
	
	@EndUserText.label: 'Alternative To Item'
	main.grpos as AlternativeToItem,
	
	@EndUserText.label: 'Return Reason'
	main.msr_ret_reason as ReturnReason,
	
	@EndUserText.label: 'Refund Code'
	main.msr_refund_code as ReturnsRefundExtent,
	
	@EndUserText.label: 'Approval'
	main.msr_approv_block as RetsMgmtProcessingBlock,
	
	@EndUserText.label: 'Requirement Segment'
	main.sgt_rcat as RequirementSegment,
	
	@EndUserText.label: 'Quantity Is Fixed'
	main.fmeng as QuantityIsFixed,
	
	@EndUserText.label: 'Order Probability'
	main.awahr as ItemOrderProbabilityInPercent,
	
	@EndUserText.label: 'Document Currency'
	main.waerk as TransactionCurrency,
	
	@EndUserText.label: 'Pricing Ref. Matl'
	main.pmatn as PricingReferenceMaterial,
	
	@EndUserText.label: 'Material Price Grp'
	main.kondm as MaterialPricingGroup,
	
	@EndUserText.label: 'Tax Classifc. Mat.'
	main.taxm1 as ProductTaxClassification1,
	
	@EndUserText.label: 'Tax Classifc. Mat.'
	main.taxm2 as ProductTaxClassification2,
	
	@EndUserText.label: 'Tax Classifc. Mat.'
	main.taxm3 as ProductTaxClassification3,
	
	@EndUserText.label: 'Tax Classifc. Mat.'
	main.taxm4 as ProductTaxClassification4,
	
	@EndUserText.label: 'Tax Classifc. Mat.'
	main.taxm5 as ProductTaxClassification5,
	
	@EndUserText.label: 'Tax Classifc. Mat.'
	main.taxm6 as ProductTaxClassification6,
	
	@EndUserText.label: 'Tax Classifc. Mat.'
	main.taxm7 as ProductTaxClassification7,
	
	@EndUserText.label: 'Tax Classifc. Mat.'
	main.taxm8 as ProductTaxClassification8,
	
	@EndUserText.label: 'Tax Classifc. Mat.'
	main.taxm9 as ProductTaxClassification9,
	
	@EndUserText.label: 'Acct Assmt Grp Mat.'
	main.ktgrm as MatlAccountAssignmentGroup,
	
	@EndUserText.label: 'Statistical Value'
	main.kowrr as StatisticalValueControl,
	
	@ObjectModel.text.association: '_ShippingPointText'
	@EndUserText.label: 'Shipping Point/Receiving Pt'
	main.vstel as ShippingPoint,
	
	@EndUserText.label: 'Special Stock'
	main.sobkz as InventorySpecialStockType,
	
	@EndUserText.label: 'Spec. Stk Valuation'
	main.kzbws as InventorySpecialStockValnType,
	
	@EndUserText.label: 'Delivery Priority'
	main.lprio as DeliveryPriority,
	
	@EndUserText.label: 'Plant'
	main.werks as Plant,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Transit Plant'
	main.transit_plant as TransitPlant,
	
	@EndUserText.label: 'Storage Location'
	main.lgort as StorageLocation,
	
	@EndUserText.label: 'Route'
	main.route as Route,
	
	@EndUserText.label: 'Delivery Group'
	main.grkor as DeliveryGroup,
	
	@EndUserText.label: 'Fixed Date And Qty'
	main.fixmg as DeliveryDateQuantityIsFixed,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Part.Dlv./Item'
	main.kztlf as PartialDeliveryIsAllowed,
	
	@EndUserText.label: 'Max.Part.Deliveries'
	main.antlf as MaxNmbrOfPartialDelivery,
	
	@EndUserText.label: 'Unlimited Tolerance'
	main.uebtk as UnlimitedOverdeliveryIsAllowed,
	
	@EndUserText.label: 'Overdeliv. Tolerance'
	main.uebto as OverdelivTolrtdLmtRatioInPct,
	
	@EndUserText.label: 'Underdel. Tolerance'
	main.untto as UnderdelivTolrtdLmtRatioInPct,
	
	@EndUserText.label: 'Leading Uom'
	main.kzfme as OpenDeliveryLeadingUnitCode,
	
	@EndUserText.label: 'Itm Relev.For Deliv.'
	main.lfrel as ItemIsDeliveryRelevant,
	
	@EndUserText.label: 'Season Year'
	main.fsh_season_year as ProductSeasonYear,
	
	@EndUserText.label: 'Season'
	main.fsh_season as ProductSeason,
	
	@EndUserText.label: 'Collection'
	main.fsh_collection as ProductCollection,
	
	@EndUserText.label: 'Theme'
	main.fsh_theme as ProductTheme,
	
	@EndUserText.label: 'Cancellation Date'
	main.fsh_candate as FashionCancelDate,
	
	@EndUserText.label: 'Characteristic Value 1'
	main.wrf_charstc1 as ProductCharacteristic1,
	
	@EndUserText.label: 'Characteristic Value 2'
	main.wrf_charstc2 as ProductCharacteristic2,
	
	@EndUserText.label: 'Characteristic Value 3'
	main.wrf_charstc3 as ProductCharacteristic3,
	
	@EndUserText.label: 'Psst Group'
	main.rfm_psst_group as ShippingGroupNumber,
	
	@EndUserText.label: 'Psst Grouping Rule'
	main.rfm_psst_rule as ShippingGroupRule,
	
	@EndUserText.label: 'Relevant For Billing'
	main.fkrel as ItemIsBillingRelevant,
	
	@EndUserText.label: 'Billing Block'
	main.faksp as ItemBillingBlockReason,
	
	@ObjectModel.text.association: '_BusinessAreaText'
	@EndUserText.label: 'Business Area'
	main.gsber as BusinessArea,
	
	@EndUserText.label: 'Profit Center'
	main.prctr as ProfitCenter,
	
	@EndUserText.label: 'Wbs Element'
	main.ps_psp_pnr as WBSElement,
	
	@EndUserText.label: 'Order'
	main.aufnr as OrderID,
	
	@EndUserText.label: 'Object No.Item'
	main.objnr as ControllingObject,
	
	@EndUserText.label: 'Profitab. Segmt No.'
	main.paobjnr as ProfitabilitySegment,
	
	@EndUserText.label: 'Originating Document'
	main.vbelv as OriginSDDocument,
	
	@EndUserText.label: 'Originating Item'
	main.posnv as OriginSDDocumentItem,
	
	@EndUserText.label: 'Reference Document'
	main.vgbel as ReferenceSDDocument,
	
	@EndUserText.label: 'Reference Item'
	main.vgpos as ReferenceSDDocumentItem,
	
	@EndUserText.label: 'Preceding Doc.Categ.'
	main.vgtyp as ReferenceSDDocumentCategory,
	
	@EndUserText.label: 'Higher-Level Item'
	main.uepos as HigherLevelItem,
	
	@EndUserText.label: 'Usage Of Hl Item'
	main.uepvw as HigherLevelItemUsage,
	
	@EndUserText.label: 'Value Contract No.'
	main.wktnr as ValueContract,
	
	@EndUserText.label: 'Value Contract Item'
	main.wktps as ValueContractItem,
	
	@EndUserText.label: 'Sales Document Item'
	main.vbkd_posnr as SlsDocBusinessDataItem,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Solution Order'
	main.solution_order_id as BusinessSolutionOrder,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Solution Order Item'
	main.solution_order_itm_id as BusinessSolutionOrderItem,
	
	@EndUserText.label: 'Overall Status'
	main.gbsta as SDProcessStatus,
	
	@EndUserText.label: 'Delivery Conf. Sts'
	main.besta as DeliveryConfirmationStatus,
	
	@EndUserText.label: 'Purchasing Conf. Sts'
	main.costa as PurchaseConfirmationStatus,
	
	@EndUserText.label: 'Ovrl Delivery Status'
	main.lfgsa as TotalDeliveryStatus,
	
	@EndUserText.label: 'Delivery Status'
	main.lfsta as DeliveryStatus,
	
	@EndUserText.label: 'Ovrl Deliv. Blk Sts'
	main.lssta as DeliveryBlockStatus,
	
	@EndUserText.label: 'Ord.-Rel. Billg Sts'
	main.fksaa as OrderRelatedBillingStatus,
	
	@EndUserText.label: 'Billing Block Status'
	main.fssta as BillingBlockStatus,
	
	@EndUserText.label: 'Item'
	main.uvall as ItemGeneralIncompletionStatus,
	
	@EndUserText.label: 'Billing Â€“ Item'
	main.uvfak as ItemBillingIncompletionStatus,
	
	@EndUserText.label: 'Pricing Â€“ Item'
	main.uvprs as PricingIncompletionStatus,
	
	@EndUserText.label: 'Delivery Â€“ Item'
	main.uvvlk as ItemDeliveryIncompletionStatus,
	
	@EndUserText.label: 'Rejection Status'
	main.absta as SDDocumentRejectionStatus,
	
	@EndUserText.label: 'Ovrl Reference Sts'
	main.rfgsa as TotalSDDocReferenceStatus,
	
	@EndUserText.label: 'Reference Status'
	main.rfsta as SDDocReferenceStatus,
	
	@EndUserText.label: 'Product Marketability Status'
	main.pcsta as ChmlCmplncStatus,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Dangerous Goods Status'
	main.dgsta as DangerousGoodsStatus,
	
	@EndUserText.label: 'Safety Data Sheet Status'
	main.sdssta as SafetyDataSheetStatus,
	
	@EndUserText.label: 'Embargo Status'
	main.emcst as TrdCmplncEmbargoSts,
	
	@EndUserText.label: 'Screening Status'
	main.slcst as TrdCmplncSnctndListChkSts,
	
	@EndUserText.label: 'Legal Control Status'
	main.total_lccst as OvrlTrdCmplncLegalCtrlChkSts,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Value Chain Category'
	main.vcm_chain_category as ValueChainCategory,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Sd Document Category'
	main.vbtyp_ana as SDDocumentCategory,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Sales Document Type'
	main.auart_ana as SalesDocumentType,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Sales Organization'
	main.vkorg_ana as SalesOrganization,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Distribution Channel'
	main.vtweg_ana as DistributionChannel,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Division'
	main.spart_ana as OrganizationDivision,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Sales Office'
	main.vkbur_ana as SalesOffice,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Sales Group'
	main.vkgrp_ana as SalesGroup,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Order Reason'
	main.augru_ana as SDDocumentReason,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Document Date'
	main.audat_ana as SalesDocumentDate,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Customer Group 1'
	main.kvgr1_ana as AdditionalCustomerGroup1,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Customer Group 2'
	main.kvgr2_ana as AdditionalCustomerGroup2,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Customer Group 3'
	main.kvgr3_ana as AdditionalCustomerGroup3,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Customer Group 4'
	main.kvgr4_ana as AdditionalCustomerGroup4,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Customer Group 5'
	main.kvgr5_ana as AdditionalCustomerGroup5,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Requested Delivery Date'
	cast (main.vdatu_ana as reqd_delivery_date preserving type) as RequestedDeliveryDate,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Shipping Conditions'
	main.vsbed_ana as ShippingCondition,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Sold-To Party'
	main.kunnr_ana as SoldToParty,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Doc. Condition No.'
	main.knumv_ana as SalesDocumentCondition,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Sales District'
	main.bzirk_ana as SalesDistrict,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Customer Reference'
	main.bstkd_ana as PurchaseOrderByCustomer,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Customer Group'
	main.kdgrp_ana as CustomerGroup,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Shipping Type'
	main.vsart_ana as ShippingType,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Billing Date'
	main.fkdat_ana as BillingDocumentDate,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Billing Plan Number'
	main.fplnr_ana as BillingPlan,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Ship-To Party'
	main.kunwe_ana as ShipToParty,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Bill-To Party'
	main.kunre_ana as BillToParty,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Sales Employee'
	main.perve_ana as SalesEmployee,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Employee Responsible'
	main.perzm_ana as ResponsibleEmployee,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Sales Employee'
	cast (main.perve_ana as sales_empl preserving type) as SalesEmployeeWorkAgreement,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Employee Responsible'
	cast (main.perzm_ana as resp_empl preserving type) as ResponsibleEmployeeWorkAgrmt,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Payer'
	main.kunrg_ana as PayerParty,
	
	@EndUserText.label: 'Consumption'
	main.kzvbr as ConsumptionPosting,
	
	@Consumption.hidden: true
	_BusinessAreaText,
	
	@Consumption.hidden: true
	_OrigMaterialText,
	
	@Consumption.hidden: true
	_ProductText,
	
	@ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
	_SalesDocumentBasic,
	
	@Consumption.hidden: true
	_ShippingPointText
}