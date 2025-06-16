@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Fixed Asset'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FixedAsset'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F70G_FixedAsset
	as select from ZSNAP_F70G_P_FixedAsset as main
	
	association [0..1] to ZSNAP_F70G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [0..1] to ZSNAP_F70G_MasterFixedAsset as _MasterFixedAsset on $projection.CompanyCode = _MasterFixedAsset.CompanyCode and $projection.MasterFixedAsset = _MasterFixedAsset.MasterFixedAsset
{
	@ObjectModel.foreignKey.association: '_CompanyCode'
	@EndUserText.label: 'Company Code'
	key main.CompanyCode,
	
	@ObjectModel.foreignKey.association: '_MasterFixedAsset'
	@EndUserText.label: 'Asset'
	key main.MasterFixedAsset,
	
	@ObjectModel.text.element: ['FixedAssetDescription']
	@EndUserText.label: 'Sub-number'
	key main.FixedAsset,
	case
		when main.FixedAsset = '0000' then cast (concat (ltrim (main.MasterFixedAsset, '0'), '-0') as fis_fixedasset_ext_id)
		when main.FixedAsset <> '0000' then cast (concat (concat (ltrim (main.MasterFixedAsset, '0'), '-'), ltrim (main.FixedAsset, '0')) as fis_fixedasset_ext_id)
	end as FixedAssetExternalID,
	
	@EndUserText.label: 'Asset Class'
	main.AssetClass,
	
	@EndUserText.label: 'Serial Number'
	main.AssetSerialNumber,
	
	@Semantics.quantity.unitOfMeasure: 'BaseUnit'
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Quantity'
	main.Quantity,
	
	@EndUserText.label: 'Base Unit Of Measure'
	main.BaseUnit,
	
	@EndUserText.label: 'Inventory Number'
	main.Inventory,
	
	@Semantics.text: true
	@EndUserText.label: 'Description'
	main.FixedAssetDescription,
	
	@Semantics.text: true
	@EndUserText.label: 'Additional Description'
	main.AssetAdditionalDescription,
	
	@EndUserText.label: 'Currency'
	main.Currency,
	
	@Semantics.amount.currencyCode: 'Currency'
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Original Value'
	main.OriglAcqnAmtInCoCodeCrcy,
	
	@EndUserText.label: 'Trading Partner No.'
	main.PartnerCompany,
	
	@EndUserText.label: 'Manufacturer'
	main.AssetManufacturerName,
	
	@EndUserText.label: 'In-House Prod. Perc.'
	main.InHouseProdnPercent,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Supplier Name'
	main.AssetSupplierName,
	
	@EndUserText.label: 'Inventory Note'
	main.InventoryNote,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Evaluation Group 1'
	main.Group1AssetEvaluationKey,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Evaluation Group 2'
	main.Group2AssetEvaluationKey,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Evaluation Group 3'
	main.Group3AssetEvaluationKey,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Evaluation Group 4'
	main.Group4AssetEvaluationKey,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Evaluation Group 5'
	main.Group5AssetEvaluationKey,
	
	@EndUserText.label: 'Account Determination'
	main.AssetAccountDetermination,
	
	@EndUserText.label: 'Manage Historically'
	main.HasHistory,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Capitalized On'
	main.AssetCapitalizationDate,
	
	@Semantics.fiscal.year: true
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Acquisition Year'
	main.FirstAcquisitionFiscalYear,
	
	@Semantics.fiscal.period: true
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'First Acquis. Period'
	main.FirstAcquisitionFiscalPeriod,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Deactivation On'
	main.AssetDeactivationDate,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Plnd Retirement On'
	main.PlannedRetirementDate,
	
	@EndUserText.label: 'Ordered On'
	main.FixedAssetOrderDate,
	
	@EndUserText.label: 'Original Asset'
	main.OriginalMasterFixedAsset,
	
	@EndUserText.label: 'Asset Super Number'
	main.FixedAssetGroup,
	
	@EndUserText.label: 'Investment Reason'
	main.InvestmentReason,
	
	@EndUserText.label: 'Connection To Sap Real Estate Management'
	main.AssetIsRealEstate,
	
	@EndUserText.label: 'Area Unit'
	main.AreaSizeUnit,
	
	@EndUserText.label: 'Investment Order'
	main.InvestmentOrder,
	
	@EndUserText.label: 'WBS Element Internal ID'
	main.InvestmentProjectWBSElement_2,
	
	@API.element.releaseState: #DEPRECATED
	@API.element.successor: 'InvestmentProjectWBSElement_2'
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'InvestmentProjectWBSElement_2'
	@EndUserText.label: 'Wbs Element'
	main.InvestmentProjectWBSElement,
	
	@EndUserText.label: 'Include Asset'
	main.InventoryIsCounted,
	
	@EndUserText.label: 'Last Inventory On'
	main.LastInventoryDate,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Change Asset Master Record From Equipmen'
	main.AssetSynchronizationRule,
	
	@Semantics.fiscal.year: true
	@EndUserText.label: 'Org.Acquisition Year'
	main.OriginalAcquisitionFiscalYear,
	
	@EndUserText.label: 'Type Name'
	main.AssetTypeName,
	
	@EndUserText.label: 'Vendor'
	main.Supplier,
	
	@EndUserText.label: 'Ctry/Reg. Of Origin'
	main.AssetCountryOfOrigin,
	
	@EndUserText.label: 'Assmt Notice Tax No.'
	main.NoticeOfAssessmentTaxID,
	
	@EndUserText.label: 'Notice On'
	main.LastAssessmentNoticeDate,
	
	@EndUserText.label: 'Envir. Investment'
	main.EnvrnmtlInvestmentReason,
	
	@Semantics.businessDate.at: true
	@EndUserText.label: 'Changed On'
	main.LastChangeDate,
	
	@EndUserText.label: 'Complete.'
	main.FixedAssetFinDataCmpltns,
	
	@EndUserText.label: 'Mark For Deletion'
	main.AccountIsMarkedForDeletion,
	
	@EndUserText.label: 'Locked To Acquis.'
	main.AccountIsBlockedForPosting,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'First Acquisition On'
	main.AcquisitionValueDate,
	
	@EndUserText.label: 'Acq. Orig. Asset On'
	main.OriginalFixedAssetValueDate,
	
	@EndUserText.label: 'Investment Measure'
	main.AssetUnderConstIsInvmtMsr,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Last Retmt. On'
	main.LastRetirementValueDate,
	
	@EndUserText.label: 'Changed By'
	main.LastChangedByUser,
	
	@EndUserText.label: 'Property Indicator'
	main.FixedAssetPropertyType,
	
	@Semantics.businessDate.at: true
	@EndUserText.label: 'Created On'
	main.CreationDate,
	
	@EndUserText.label: 'Created By'
	main.CreatedByUser,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Reason For Man. Val.'
	main.ManualDepreciationReason,
	
	@EndUserText.label: 'Reorganization Date'
	main.LastReorganizationDate,
	
	@EndUserText.label: 'Legacy Data Transfer Date'
	main.LegacyDataTransferDate,
	
	@VDM.lifecycle.status: #DEPRECATED
	@EndUserText.label: 'Group Asset'
	main.IsGroupAsset,
	
	@EndUserText.label: 'Line Item Settlement'
	main.IsLineItemSettled,
	
	@EndUserText.label: 'Asset Subnumber Auc'
	main.OriginalFixedAsset,
	
	@EndUserText.label: 'Description'
	main.MasterFixedAssetSearchTerm,
	
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'AssetIsAcquiredUsed'
	case
		when main.AssetStatusAtPurchase = 'X' then cast ('X' as fis_asset_purchased_new_or_usd)
		when main.AssetStatusAtPurchase = 'Y' then cast ('Y' as fis_asset_purchased_new_or_usd)
		when not ((main.AssetStatusAtPurchase = 'X' or main.AssetStatusAtPurchase = 'Y')) then cast ('N' as fis_asset_purchased_new_or_usd)
	end as AssetStatusAtPurchase,
	
	@EndUserText.label: 'Purchased used'
	main.AssetIsAcquiredUsed,
	
	@EndUserText.label: 'Main Asset'
	main.IsMainAsset,
	
	@EndUserText.label: 'Asset Lifecycle Status'
	main.AssetLifecycleStatus,
	
	@EndUserText.label: 'Asset Completeness Status'
	main.AssetCompletenessStatus,
	
	@EndUserText.label: 'Asset Under Construction Status'
	main.AssetUnderConstructionStatus,
	
	@EndUserText.label: 'Validity Date'
	main.AssetCreationValidityDate,
	
	@EndUserText.label: 'Time Stamp'
	main.CreationDateTime,
	
	@EndUserText.label: 'Time Stamp'
	main.LastChangeDateTime,
	
	@EndUserText.label: 'Master Data Layout'
	main.AssetScreenLayout,
	
	@Semantics.amount.currencyCode: 'OriginalAcquisitionCurrency'
	@EndUserText.label: 'Original Value'
	main.OriginalAcquisitionAmount,
	
	@EndUserText.label: 'Original Acquisition Currency'
	main.OriginalAcquisitionCurrency,
	
	@EndUserText.label: 'Classification Key'
	main.PropertyClass,
	
	@EndUserText.label: 'Tax Office'
	main.LocalTaxOffice,
	
	@EndUserText.label: 'Municipality'
	main.Municipality,
	
	@EndUserText.label: 'Land Register Of'
	main.LandRegisterDate,
	
	@EndUserText.label: 'Landregentry Seqno.'
	main.LandRegisterEntrySequence,
	
	@EndUserText.label: 'Entry By'
	main.LandRegisterEntryDate,
	
	@EndUserText.label: 'Vol./Page/Ser.No'
	main.LandRegisterVolume,
	
	@EndUserText.label: 'Land Register Page'
	main.LandRegisterPage,
	
	@EndUserText.label: 'Ld.Reg.Map/Plot'
	main.LandRegisterMap,
	
	@EndUserText.label: 'Plot Number'
	main.LandPlot,
	
	@EndUserText.label: 'Conveyance From'
	main.ConveyanceDate,
	
	@Semantics.quantity.unitOfMeasure: 'AreaSizeUnit'
	@EndUserText.label: 'Area'
	main.AreaSize,
	
	@EndUserText.label: 'Leasing Company'
	main.LeaseSupplier,
	
	@EndUserText.label: 'Agreement Number'
	main.LeaseAgreement,
	
	@EndUserText.label: 'Agreement Date'
	main.LeaseAgreementDate,
	
	@EndUserText.label: 'Notice Date'
	main.LeaseTermEndDate,
	
	@EndUserText.label: 'Lease Start Date'
	main.LeaseTermStartDate,
	
	@EndUserText.label: 'Lease Length'
	main.LeaseDurationInFiscalYears,
	
	@EndUserText.label: 'Lease In Periods'
	main.LeaseDurationInFiscalPeriods,
	
	@EndUserText.label: 'Type'
	main.LeaseType,
	
	@EndUserText.label: 'Supplementary Text'
	main.LeasedAssetNote,
	
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'LegacyMasterFixedAsset'
	@EndUserText.label: 'Legacy Asset Number'
	main.LegacyAsset,
	
	@EndUserText.label: 'Legacy Fixed Asset Company Code'
	main.LegacyFixedAssetCompanyCode,
	
	@EndUserText.label: 'Legacy Main Asset Number'
	main.LegacyMasterFixedAsset,
	
	@EndUserText.label: 'Legacy Asset Subnumber'
	main.LegacyFixedAsset,
	
	@EndUserText.label: 'Ldt Sequence Number'
	main.LegacyDataTransferSequence,
	
	@EndUserText.label: 'Post-capitalization'
	main.AssetIsForPostCapitalization,
	
	@Consumption.hidden: true
	main.AssetAuthorizationContext,
	
	@Consumption.hidden: true
	@EndUserText.label: 'Object Number'
	main.ObjectInternalID,
	_CompanyCode,
	_MasterFixedAsset
}