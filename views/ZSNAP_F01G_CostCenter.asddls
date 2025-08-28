@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Cost Center'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CostCenter'
@ObjectModel.usageType.dataClass: #ORGANIZATIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F01G_CostCenter
	as select from csks as main
	
	association [0..1] to ZSNAP_F01G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
	association [0..1] to ZSNAP_F01G_CostCenterText as _Text on $projection.ControllingArea = _Text.ControllingArea and $projection.CostCenter = _Text.CostCenter
{
	@ObjectModel.foreignKey.association: '_ControllingArea'
	@EndUserText.label: 'Controlling Area'
	key main.kokrs as ControllingArea,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Cost Center'
	key cast (main.kostl as kostl preserving type) as CostCenter,
	
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Valid To'
	key main.datbi as ValidityEndDate,
	
	@EndUserText.label: 'Company Code'
	main.bukrs as CompanyCode,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Valid From'
	main.datab as ValidityStartDate,
	
	@EndUserText.label: 'Actual Primary Costs'
	main.bkzkp as IsBlkdForPrimaryCostsPosting,
	
	@EndUserText.label: 'Plan Primary Costs'
	main.pkzkp as IsBlockedForPlanPrimaryCosts,
	
	@EndUserText.label: 'Cost Center Category'
	main.kosar as CostCenterCategory,
	
	@EndUserText.label: 'Department'
	main.abtei as Department,
	
	@EndUserText.label: 'Person Responsible'
	main.verak as CostCtrResponsiblePersonName,
	
	@EndUserText.label: 'Currency'
	main.waers as CostCenterCurrency,
	
	@EndUserText.label: 'Profit Center'
	main.prctr as ProfitCenter,
	
	@EndUserText.label: 'Logical System'
	main.logsystem as LogicalSystem,
	
	@EndUserText.label: 'Actual Revenues'
	main.bkzer as IsBlockedForRevenuePosting,
	
	@EndUserText.label: 'Commitment Update'
	main.bkzob as IsBlockedForCommitmentPosting,
	
	@EndUserText.label: 'Record Quantity'
	main.mgefl as ConsumptionQtyIsRecorded,
	
	@EndUserText.label: 'Country/Region Key'
	main.land1 as Country,
	
	@EndUserText.label: 'Hierarchy Area'
	main.khinr as CostCenterStandardHierArea,
	
	@EndUserText.label: 'Object Number'
	main.objnr as ObjectInternalID,
	
	@EndUserText.label: 'Joint Venture'
	main.vname as JointVenture,
	
	@EndUserText.label: 'Business Area'
	main.gsber as BusinessArea,
	
	@EndUserText.label: 'User Responsible'
	main.verak_user as CostCtrResponsibleUser,
	
	@EndUserText.label: 'Tax Jurisdiction'
	main.txjcd as TaxJurisdiction,
	
	@EndUserText.label: 'Plant'
	main.werks as Plant,
	
	@EndUserText.label: 'Entered On'
	main.ersda as CostCenterCreationDate,
	
	@EndUserText.label: 'Created By'
	main.usnam as CostCenterCreatedByUser,
	
	@EndUserText.label: 'Actual Secondary Costs'
	main.bkzks as IsBlkdForSecondaryCostsPosting,
	
	@EndUserText.label: 'Lock Plan Secondary Costs'
	cast (main.pkzks as fis_pkzks preserving type) as IsBlockedForPlanSecondaryCosts,
	
	@EndUserText.label: 'Lock Planning Revenues'
	cast (main.pkzer as fis_pkzer preserving type) as IsBlockedForPlanRevenues,
	
	@EndUserText.label: 'Allocation Methods'
	main.vmeth as CostCenterAllocationMethod,
	
	@EndUserText.label: 'Subsequent Cost Ctr.'
	main.nkost as SubsequentCostCenter,
	
	@EndUserText.label: 'Usage'
	main.kvewe as ConditionUsage,
	
	@EndUserText.label: 'Application'
	main.kappl as ConditionApplication,
	
	@EndUserText.label: 'Overhead Key'
	main.koszschl as CostCenterAccountingOverhead,
	
	@EndUserText.label: 'Region'
	main.regio as Region,
	
	@EndUserText.label: 'Language Key'
	main.spras as Language,
	
	@EndUserText.label: 'Functional Area'
	main.func_area as FunctionalArea,
	
	@EndUserText.label: 'Recovery Indicator'
	main.recid as JointVentureRecoveryCode,
	
	@EndUserText.label: 'Equity Type'
	main.etype as JointVentureEquityType,
	
	@EndUserText.label: 'Joint Venture Object Type'
	main.jv_otype as JointVentureObjectType,
	
	@EndUserText.label: 'Jib/Jibe Class'
	main.jv_jibcl as JointVentureClass,
	
	@EndUserText.label: 'Jib/Jibe Subclass A'
	main.jv_jibsa as JointVentureSubClass,
	
	@EndUserText.label: 'Budget-Carrying Cost Center'
	main.budget_carrying_cost_ctr as BudgetCarryingCostCenter,
	
	@EndUserText.label: 'Budget Availability Ctrl Prfl'
	main.avc_profile as AvailabilityControlProfile,
	
	@EndUserText.label: 'Budget Availability Control Is Active'
	main.avc_active as AvailabilityControlIsActive,
	
	@EndUserText.label: 'Fund'
	main.fund as Fund,
	
	@EndUserText.label: 'Grant'
	main.grant_id as GrantID,
	
	@EndUserText.label: 'Fund Fixed Assignment'
	main.fund_fix_assigned as FundIsFixAssigned,
	
	@EndUserText.label: 'Grant Fixed Assignment'
	main.grant_fix_assigned as GrantIDIsFixAssigned,
	
	@EndUserText.label: 'Functional Area Fixed Assignment'
	main.func_area_fix_assigned as FunctionalAreaIsFixAssigned,
	
	@EndUserText.label: 'Costing Sheet'
	main.kalsm as CostingSheet,
	
	@EndUserText.label: 'Title'
	main.anred as FormOfAddress,
	
	@EndUserText.label: 'Name'
	main.name1 as AddressName,
	
	@EndUserText.label: 'Name 2'
	main.name2 as AddressAdditionalName,
	
	@EndUserText.label: 'Name 3'
	main.name3 as CostCenterAddrName3,
	
	@EndUserText.label: 'Name 4'
	main.name4 as CostCenterAddrName4,
	
	@EndUserText.label: 'City'
	main.ort01 as CityName,
	
	@EndUserText.label: 'District'
	main.ort02 as District,
	
	@EndUserText.label: 'Street'
	main.stras as StreetAddressName,
	
	@EndUserText.label: 'Po Box'
	main.pfach as POBox,
	
	@EndUserText.label: 'Postal Code'
	main.pstlz as PostalCode,
	
	@EndUserText.label: 'P.O. Box Postal Code'
	main.pstl2 as POBoxPostalCode,
	
	@EndUserText.label: 'Telebox Number'
	main.telbx as TeleboxNumber,
	
	@EndUserText.label: 'Telephone 1'
	main.telf1 as PhoneNumber1,
	
	@EndUserText.label: 'Telephone 2'
	main.telf2 as PhoneNumber2,
	
	@EndUserText.label: 'Fax Number'
	main.telfx as FaxNumber,
	
	@EndUserText.label: 'Teletex Number'
	main.teltx as TeletexNumber,
	
	@EndUserText.label: 'Telex Number'
	main.telx1 as TelexNumber,
	
	@EndUserText.label: 'Data Line'
	main.datlt as DataCommunicationPhoneNumber,
	
	@EndUserText.label: 'Printer Destination'
	main.drnam as CostCenterPrinterDestination,
	
	@EndUserText.label: 'Cost Collector Key'
	main.cckey as CostCollector,
	
	@EndUserText.label: 'Complete'
	main.kompl as CostCenterIsComplete,
	
	@EndUserText.label: 'Cost Center Is Statistical'
	cast (main.stakz as fins_xkostl_stat preserving type) as IsStatisticalCostCenter,
	
	@EndUserText.label: 'Function'
	main.funkt as CostCenterFunction,
	
	@EndUserText.label: 'Altern. Function'
	main.afunk as CostCenterAlternativeFunction,
	
	@EndUserText.label: 'Acty-Indep. Formplng Temp'
	main.cpi_templ as ActyIndepFormulaPlanningTmpl,
	
	@EndUserText.label: 'Acty-Dep. Form.Plng Temp.'
	main.cpd_templ as ActyDepdntFormulaPlanningTmpl,
	
	@EndUserText.label: 'Acty-Indep. Alloc. Temp.'
	main.sci_templ as ActyIndependentAllocationTmpl,
	
	@EndUserText.label: 'Acty-Dep. Alloc. Template'
	main.scd_templ as ActyDependentAllocationTmpl,
	
	@EndUserText.label: 'Templ.: Act. Stat. Key Figure'
	main.ski_templ as ActlIndepStatisticalKeyFigures,
	
	@EndUserText.label: 'Templ.: Act. Stat. Key Figure'
	main.skd_templ as ActlDepStatisticalKeyFigures,
	_ControllingArea,
	_Text
}