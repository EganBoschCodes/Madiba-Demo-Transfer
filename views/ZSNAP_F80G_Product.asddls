@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Product'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Product'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F80G_Product
	as select from mara as main
	
	association [0..*] to ZSNAP_F80G_ProdUnivHierNode as _ProdUnivHierarchyNode on $projection.Product = _ProdUnivHierarchyNode.Product
	association [0..*] to ZSNAP_F80G_ProductText as _Text on $projection.Product = _Text.Product
{
	@ObjectModel.hierarchy.association: '_ProdUnivHierarchyNode'
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Product'
	key cast (main.matnr as productnumber preserving type) as Product,
	
	@EndUserText.label: 'Product Type'
	cast (main.mtart as producttype preserving type) as ProductType,
	
	@EndUserText.label: 'Product Group'
	cast (main.matkl as productgroup preserving type) as ProductGroup,
	
	@EndUserText.label: 'Ext. Product Group'
	cast (main.extwg as externalproductgroup preserving type) as ExternalProductGroup,
	
	@EndUserText.label: 'Product Family'
	substring (main.prdha, 8, 3) as ProductFamily,
	
	@Semantics.systemDate.createdAt: true
	@EndUserText.label: 'Created On'
	main.ersda as CreationDate,
	
	@EndUserText.label: 'Base Unit Of Measure'
	main.meins as BaseUnit,
	
	@EndUserText.label: 'Old product number'
	cast (main.bismt as productoldid) as ProductOldID,
	
	@EndUserText.label: 'GTIN'
	cast (main.ean11 as globaltradeitemnumber) as ProductStandardID,
	
	@EndUserText.label: 'Ean Category'
	main.numtp as InternationalArticleNumberCat,
	
	@EndUserText.label: 'Marked for Deletion'
	cast (main.lvorm as ismarkedfordeletion) as IsMarkedForDeletion,
	
	@EndUserText.label: 'Unit Of Weight'
	main.gewei as WeightUnit,
	
	@EndUserText.label: 'Product Hierarchy'
	main.prdha as ProductHierarchy,
	
	@EndUserText.label: 'Product Category'
	cast (main.attyp as prodcategory preserving type) as ProductCategory,
	
	@EndUserText.label: 'Product Category'
	cast (main.attyp as prodcategory preserving type) as ArticleCategory,
	
	@EndUserText.label: 'Industry Sector'
	main.mbrsh as IndustrySector,
	
	@EndUserText.label: 'Is active Document'
	cast ('X' as sdraft_is_active preserving type) as IsActiveEntity,
	
	@Semantics.systemDateTime.lastChangedAt: true
	case
		when main.aenam <> '' then cast (dats_tims_to_tstmp (main.laeda, main.last_changed_time, abap_system_timezone ($session.client, 'NULL'), $session.client, 'NULL') as changedatetime)
		else cast (dats_tims_to_tstmp (main.ersda, main.last_changed_time, abap_system_timezone ($session.client, 'NULL'), $session.client, 'NULL') as changedatetime)
	end as LastChangeDateTime,
	
	@EndUserText.label: 'Division'
	main.spart as Division,
	
	@EndUserText.label: 'Transportation Group'
	main.tragr as TransportationGroup,
	
	@EndUserText.label: 'Brand'
	main.brand_id as Brand,
	
	@EndUserText.label: 'Industry Std Desc.'
	main.normt as IndustryStandardName,
	
	@EndUserText.label: 'Product is configurable'
	cast (main.kzkfg as productisconfigurable preserving type) as ProductIsConfigurable,
	
	@EndUserText.label: 'Batch Management'
	main.xchpf as IsBatchManagementRequired,
	
	@EndUserText.label: 'Manufacturer Part No.'
	main.mfrpn as ProductManufacturerNumber,
	
	@EndUserText.label: 'Manufacturer'
	main.mfrnr as ManufacturerNumber,
	
	@EndUserText.label: 'Qm In Procur. Active'
	main.qmpur as QltyMgmtInProcmtIsActive,
	
	@EndUserText.label: 'CrossPlantProdStatus'
	cast (main.mstae as crossplantstatus) as CrossPlantStatus,
	
	@EndUserText.label: 'Whse Stor. Condition'
	main.whstc as WarehouseStorageCondition,
	
	@Semantics.quantity.unitOfMeasure: 'ProductMeasurementUnit'
	@EndUserText.label: 'Length'
	main.laeng as BaseUnitSpecificProductLength,
	
	@Semantics.quantity.unitOfMeasure: 'ProductMeasurementUnit'
	@EndUserText.label: 'Width'
	main.breit as BaseUnitSpecificProductWidth,
	
	@Semantics.quantity.unitOfMeasure: 'ProductMeasurementUnit'
	@EndUserText.label: 'Height'
	main.hoehe as BaseUnitSpecificProductHeight,
	
	@EndUserText.label: 'Unit Of Dimension'
	main.meabm as ProductMeasurementUnit,
	
	@EndUserText.label: 'Content Unit'
	main.inhme as ContentUnit,
	
	@EndUserText.label: 'Change Number'
	cast ('' as changenumber) as ChangeNumber,
	
	@EndUserText.label: 'Dg Indicator Profile'
	main.profl as DangerousGoodsIndProfile,
	
	@EndUserText.label: 'Environmentally Rlvt'
	main.kzumw as ProdIsEnvironmentallyRelevant,
	
	@EndUserText.label: 'Chemical Compliance Relevance Indicator'
	cast (main.chml_cmplnc_rlvnce_ind as chml_cmplnc_rlvnce_ind_pm) as IsChemicalComplianceRelevant,
	
	@EndUserText.label: 'Material'
	main.matnr_external as ProductExternalID,
	
	@Semantics.systemTime.createdAt: true
	@EndUserText.label: 'Created At Time'
	main.created_at_time as CreationTime,
	
	@Semantics.systemDateTime.createdAt: true
	@EndUserText.label: 'Created On'
	cast (dats_tims_to_tstmp (main.ersda, main.created_at_time, abap_system_timezone ($session.client, 'NULL'), $session.client, 'NULL') as cmd_prd_creation_date_time) as CreationDateTime,
	
	@EndUserText.label: 'Created By'
	main.ernam as CreatedByUser,
	
	@Semantics.systemDate.lastChangedAt: true
	@EndUserText.label: 'Last Change'
	main.laeda as LastChangeDate,
	case
		when main.aenam <> '' then main.aenam
		else cast (main.ernam as aenam preserving type)
	end as LastChangedByUser,
	
	@EndUserText.label: 'Valid From'
	main.mstde as CrossPlantStatusValidityDate,
	
	@Semantics.quantity.unitOfMeasure: 'WeightUnit'
	@EndUserText.label: 'Gross Weight'
	main.brgew as GrossWeight,
	
	@EndUserText.label: 'Order Unit'
	main.bstme as PurchaseOrderQuantityUnit,
	
	@EndUserText.label: 'Source Of Supply'
	main.bwscl as SourceOfSupply,
	
	@EndUserText.label: 'Cntry/Reg Of Origin'
	main.herkl as CountryOfOrigin,
	
	@EndUserText.label: 'Competitor'
	main.kunnr as CompetitorID,
	
	@EndUserText.label: 'Gen. Item Cat. Grp'
	main.mtpos_mara as ItemCategoryGroup,
	
	@Semantics.quantity.unitOfMeasure: 'WeightUnit'
	@EndUserText.label: 'Net Weight'
	main.ntgew as NetWeight,
	
	@EndUserText.label: 'Variable Purchase Order Unit'
	main.vabme as VarblPurOrdUnitIsActive,
	
	@EndUserText.label: 'Volume Unit'
	main.voleh as VolumeUnit,
	
	@Semantics.quantity.unitOfMeasure: 'VolumeUnit'
	@EndUserText.label: 'Volume'
	cast (main.volum as materialvolume) as MaterialVolume,
	
	@EndUserText.label: 'X-Distr.Chain Status'
	main.mstav as SalesStatus,
	
	@EndUserText.label: 'Valid From'
	main.mstdv as SalesStatusValidityDate,
	
	@EndUserText.label: 'Authorization Group'
	main.begru as AuthorizationGroup,
	
	@EndUserText.label: 'Anp Code'
	main.anp as ANPCode,
	
	@EndUserText.label: 'Procurement Rule'
	main.bwvor as ProcurementRule,
	
	@EndUserText.label: 'Valid From'
	main.datab as ValidityStartDate,
	
	@EndUserText.label: 'Low-Level Code'
	main.disst as LowLevelCode,
	
	@EndUserText.label: 'Cross-plant CP'
	cast (main.satnr as crossplantconfigurableproduct preserving type) as CrossPlantConfigurableProduct,
	
	@EndUserText.label: 'Serialization Level'
	main.serlv as SerialNoExplicitnessLevel,
	
	@EndUserText.label: 'Mfr Part Profile'
	main.mprof as ManufacturerPartProfile,
	
	@EndUserText.label: 'Appr.Batch Recd Req.'
	main.xgchp as IsApprovedBatchRecordReqd,
	
	@EndUserText.label: 'Handling Indicator'
	main.hndlcode as HandlingIndicator,
	
	@EndUserText.label: 'Wh Material Group'
	main.whmatgr as WarehouseProductGroup,
	
	@EndUserText.label: 'Standard Hu Type'
	main.hutyp_dflt as StandardHandlingUnitType,
	
	@EndUserText.label: 'Serial No. Profile'
	main.serial as SerialNumberProfile,
	
	@EndUserText.label: 'Adjustment Profile'
	main.adprof as AdjustmentProfile,
	
	@EndUserText.label: 'Preferred Unit Of Measure'
	main.scm_puom as PreferredUnitOfMeasure,
	
	@EndUserText.label: 'Pilferable'
	main.pilferable as IsPilferable,
	
	@EndUserText.label: 'Relevant For Hs'
	main.hazmat as IsRelevantForHzdsSubstances,
	
	@Semantics.quantity.unitOfMeasure: 'TimeUnitForQuarantinePeriod'
	@EndUserText.label: 'Quarant. Per.'
	main.qqtime as QuarantinePeriod,
	
	@EndUserText.label: 'Time Unit'
	main.qqtimeuom as TimeUnitForQuarantinePeriod,
	
	@EndUserText.label: 'Quality Inspec. Grp'
	main.qgrp as QualityInspectionGroup,
	
	@EndUserText.label: 'Handling Unit Type'
	main.hutyp as HandlingUnitType,
	
	@EndUserText.label: 'Varb. Tare Weight'
	main.tare_var as HasVariableTareWeight,
	
	@Semantics.quantity.unitOfMeasure: 'UnitForMaxPackagingDimensions'
	@EndUserText.label: 'Max. Pack. Length'
	main.maxl as MaximumPackagingLength,
	
	@Semantics.quantity.unitOfMeasure: 'UnitForMaxPackagingDimensions'
	@EndUserText.label: 'Max. Pack. Width'
	main.maxb as MaximumPackagingWidth,
	
	@Semantics.quantity.unitOfMeasure: 'UnitForMaxPackagingDimensions'
	@EndUserText.label: 'Max. Pack. Height'
	main.maxh as MaximumPackagingHeight,
	
	@EndUserText.label: 'Maximum Capacity'
	main.maxc as MaximumCapacity,
	
	@EndUserText.label: 'Overcapacity Toler.'
	main.maxc_tol as OvercapacityTolerance,
	
	@EndUserText.label: 'Unit Of Measurement'
	main.maxdim_uom as UnitForMaxPackagingDimensions,
	
	@EndUserText.label: 'Valid From'
	main.datab as ProductValidStartDate,
	
	@Semantics.quantity.unitOfMeasure: 'ContentUnit'
	@EndUserText.label: 'Net Contents'
	main.inhal as NetContent,
	
	@Semantics.quantity.unitOfMeasure: 'ContentUnit'
	@EndUserText.label: 'Comparisonpriceunit'
	main.vpreh as ComparisonPriceQuantity,
	
	@Semantics.quantity.unitOfMeasure: 'ContentUnit'
	@EndUserText.label: 'Gross Contents'
	main.inhbr as GrossContent,
	
	@EndUserText.label: 'Valid To'
	main.liqdt as ProductValidEndDate,
	
	@EndUserText.label: 'Assortment List Type'
	main.bbtyp as AssortmentListType,
	
	@EndUserText.label: 'Cont. Non-Textile Parts Of Animal Origin'
	main.animal_origin as HasTextilePartsWthAnimalOrigin,
	
	@EndUserText.label: 'Season Usage'
	main.fsh_sealv as ProductSeasonUsageCategory,
	
	@EndUserText.label: 'Revision Level'
	cast ('' as productrevisionlevel) as MaterialRevisionLevel,
	
	@EndUserText.label: 'In Bulk/Liquid'
	main.iloos as TransportIsInBulk,
	
	@EndUserText.label: 'Assign Effect. Vals'
	main.kzeff as ProdEffctyParamValsAreAssigned,
	
	@EndUserText.label: 'Lab/Office'
	main.labor as LaboratoryOrDesignOffice,
	
	@EndUserText.label: 'Material Is Locked'
	main.matfi as ProductIsLocked,
	
	@EndUserText.label: 'Logistical Material Category'
	main.logistical_mat_category as LogisticalProductCategory,
	
	@EndUserText.label: 'Sales Material Number'
	main.sales_material as SalesProduct,
	
	@EndUserText.label: 'Int. Char. Number'
	main.color_atinn as ProdCharc1InternalNumber,
	
	@EndUserText.label: 'Int. Char. Number'
	main.size1_atinn as ProdCharc2InternalNumber,
	
	@EndUserText.label: 'Int. Char. Number'
	main.size2_atinn as ProdCharc3InternalNumber,
	
	@EndUserText.label: 'Color'
	main.color as ProductCharacteristic1,
	
	@EndUserText.label: 'Main Size'
	main.size1 as ProductCharacteristic2,
	
	@EndUserText.label: 'Second Size'
	main.size2 as ProductCharacteristic3,
	
	@EndUserText.label: 'Generic Material'
	main.gennr as ProdNoInGenProdInPrepackProd,
	
	@EndUserText.label: 'Serial No. Profile'
	main.serial as SerialIdentifierAssgmtProfile,
	
	@EndUserText.label: 'Size/Dimensions'
	main.groes as SizeOrDimensionText,
	
	@EndUserText.label: 'With Empties Bom'
	main.mlgut as HasEmptiesBOM,
	
	@Semantics.systemTime.lastChangedAt: true
	@EndUserText.label: 'Last Changed Time'
	main.last_changed_time as LastChangeTime,
	
	@EndUserText.label: 'Product'
	main.scm_matid_guid16 as ProductUUID,
	
	@EndUserText.label: 'Product Id'
	main.scm_matid_guid22 as ProdSupChnMgmtUUID22,
	
	@EndUserText.label: 'Document Change No.'
	main.aeszn as ProductDocumentChangeNumber,
	
	@EndUserText.label: 'Number Of Sheets'
	main.blanz as ProductDocumentPageCount,
	
	@EndUserText.label: 'Page Number'
	main.blatt as ProductDocumentPageNumber,
	
	@EndUserText.label: 'Int. Material Number'
	main.bmatn as OwnInventoryManagedProduct,
	
	@EndUserText.label: 'Cad Indicator'
	main.cadkz as DocumentIsCreatedByCAD,
	
	@EndUserText.label: 'Prod./Insp. Memo'
	main.ferth as ProductionOrInspectionMemoTxt,
	
	@EndUserText.label: 'Page Format'
	main.formt as ProductionMemoPageFormat,
	
	@EndUserText.label: 'Ean Variant'
	main.gtin_variant as GlobalTradeItemNumberVariant,
	
	@EndUserText.label: 'Highly Viscous'
	main.ihivi as ProductIsHighlyViscous,
	
	@EndUserText.label: 'Product Allocation'
	main.kosch as ProdAllocDetnProcedure,
	
	@EndUserText.label: 'Matl Grp Pack.Matls'
	main.magrv as PackagingMaterialGroup,
	
	@EndUserText.label: 'Qual.F.Freegoodsdis.'
	main.nrfhg as DiscountInKindEligibility,
	
	@EndUserText.label: 'Form Name'
	main.ps_smartform as SmartFormName,
	
	@EndUserText.label: 'Reference Matl For Packing'
	main.rmatp as PackingReferenceProduct,
	
	@EndUserText.label: 'Basic Material'
	main.wrkst as BasicMaterial,
	
	@EndUserText.label: 'Document'
	main.zeinr as ProductDocumentNumber,
	
	@EndUserText.label: 'Document Version'
	main.zeivr as ProductDocumentVersion,
	
	@EndUserText.label: 'Document Type'
	main.zeiar as ProductDocumentType,
	
	@EndUserText.label: 'Page Format'
	main.zeifo as ProductDocumentPageFormat,
	
	@EndUserText.label: 'Internal Object No.'
	main.cuobf as ProductConfiguration,
	
	@EndUserText.label: 'Segmentation Strategy'
	main.sgt_covsa as SegmentationStrategy,
	
	@EndUserText.label: 'Segmentation Relevant'
	main.sgt_rel as SegmentationIsRelevant,
	_ProdUnivHierarchyNode,
	_Text
}