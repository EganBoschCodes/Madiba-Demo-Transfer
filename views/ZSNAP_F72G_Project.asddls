@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Project Definition Details'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Project'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F72G_Project
	as select from proj as main
{
	@EndUserText.label: 'Project'
	@ObjectModel.text.element: ['ProjectDescription']
	key main.pspid as Project,
	
	@EndUserText.label: 'Project with Coding Mask'
	main.pspid_edit as ProjectWithCodingMask,
	
	@EndUserText.label: 'Project Internal ID'
	cast (main.pspnr as ps_s4_proj_pspnr preserving type) as ProjectInternalID,
	
	@Semantics.text: true
	@EndUserText.label: 'Project Definition Name'
	cast (main.post1 as ps_s4_proj_post1) as ProjectDescription,
	
	@EndUserText.label: 'Object Number'
	main.objnr as ProjectObject,
	
	@EndUserText.label: 'Created By'
	cast (main.ernam as ernam) as CreatedByUser,
	
	@EndUserText.label: 'Created On'
	cast (main.erdat as erdat) as CreationDate,
	
	@EndUserText.label: 'Last Changed By'
	cast (main.aenam as ps_s4_aenam) as LastChangedByUser,
	
	@EndUserText.label: 'Last Changed On'
	cast (main.aedat as ps_s4_aedat) as LastChangeDate,
	
	@ObjectModel.text.element: ['ResponsiblePersonName']
	@EndUserText.label: 'Person Responsible Number'
	cast (main.vernr as ps_s4_vernr) as ResponsiblePerson,
	
	@Semantics.text: true
	@EndUserText.label: 'Person Responsible'
	cast (main.verna as ps_s4_verna) as ResponsiblePersonName,
	
	@ObjectModel.text.element: ['ApplicantCode']
	@EndUserText.label: 'Applicant Number'
	cast (main.astnr as ps_s4_astnr) as ApplicantCode,
	
	@Semantics.text: true
	@EndUserText.label: 'Applicant'
	main.astna as ApplicantName,
	
	@EndUserText.label: 'Company Code'
	cast (main.vbukr as bukrs) as CompanyCode,
	
	@EndUserText.label: 'Business Area'
	cast (main.vgsbr as gsber) as BusinessArea,
	
	@EndUserText.label: 'Controlling Area'
	cast (main.vkokr as kokrs) as ControllingArea,
	
	@EndUserText.label: 'Profit Center'
	main.prctr as ProfitCenter,
	
	@EndUserText.label: 'Project Currency'
	cast (main.pwhie as ps_pwhie) as Currency,
	
	@EndUserText.label: 'Network Asst'
	main.zuord as NetworkAssignmentType,
	
	@EndUserText.label: 'Activity Dates'
	main.trmeq as WBSElmntDatesIsDetailed,
	
	@Semantics.calendar.dayOfMonth: true
	@EndUserText.label: 'Start Date'
	cast (main.plfaz as bkk_odate_start) as PlannedStartDate,
	
	@Semantics.calendar.dayOfMonth: true
	@EndUserText.label: 'Finish Date'
	cast (main.plsez as ende_term) as PlannedEndDate,
	
	@EndUserText.label: 'Plant'
	main.werks as Plant,
	
	@EndUserText.label: 'Calendar'
	cast (main.kalid as appca) as FactoryCalendar,
	
	@EndUserText.label: 'Display Network Hdr'
	main.nzanz as NetworkHdrIsVisibleToUser,
	
	@EndUserText.label: 'Network Profile'
	main.vprof as NetworkProfile,
	
	@EndUserText.label: 'Project Profile'
	main.profl as ProjectProfileCode,
	
	@EndUserText.label: 'Budget Profile'
	main.bprof as BudgetProfile,
	
	@Semantics.language
	@EndUserText.label: 'Language Key'
	main.txtsp as Language,
	
	@EndUserText.label: 'Cost Center'
	cast (main.kostl as kostl) as CostCenter,
	
	@EndUserText.label: 'Cost Object'
	main.ktrg as CostObject,
	
	@Semantics.calendar.dayOfMonth: true
	@EndUserText.label: 'Last Basic Sched.'
	main.aedte as BasicDatesLastScheduledDate,
	
	@Semantics.calendar.dayOfMonth: true
	@EndUserText.label: 'Last forecast sched.'
	cast (main.aedtp as ps_aedtp) as FcstdDatesLastScheduledDate,
	
	@EndUserText.label: 'Project Stock'
	cast (main.besta as psb_stock) as ProjectHasOwnStock,
	
	@EndUserText.label: 'Object Class'
	cast (main.scope as ps_s4_scope_cv) as ControllingObjectClass,
	
	@EndUserText.label: 'Statistical'
	main.xstat as WBSIsStatisticalWBSElement,
	
	@EndUserText.label: 'Tax Jurisdiction Code'
	cast (main.txjcd as wb2_txjcd_busvol) as TaxJurisdiction,
	
	@EndUserText.label: 'Interest Profile'
	cast (main.zschm as ps_zschm) as ProjInterestCalcProfile,
	
	@EndUserText.label: 'Investment Profile'
	main.imprf as InvestmentProfile,
	
	@EndUserText.label: 'Payment Plan Profile'
	main.fmprf as PaymentPlanProfile,
	
	@EndUserText.label: 'Results Analysis Key'
	main.abgsl as ResultAnalysisInternalID,
	
	@EndUserText.label: 'Planning Profile'
	main.pprof as PlanningProfile,
	
	@EndUserText.label: 'Integrated Planning'
	main.plint as WBSIsMarkedForIntegratedPlng,
	
	@EndUserText.label: 'Flagged for Deletion'
	cast (main.loevm as ps_s4_loevm) as IsMarkedForDeletion,
	
	@EndUserText.label: 'Spec. Stk Valuation'
	main.kzbws as InventorySpecialStockValnType,
	
	@EndUserText.label: 'Automatic Reqmnts Grouping'
	main.grtop as WBSIsMarkedForAutomReqmtGrpg,
	
	@EndUserText.label: 'Location'
	cast (main.stort as ps_stort) as WorkCenterLocation,
	
	@EndUserText.label: 'Functional Area'
	cast (main.func_area as fkber) as FunctionalArea,
	
	@EndUserText.label: 'Sales Organization'
	main.vkorg as SalesOrganization,
	
	@EndUserText.label: 'Distribution Channel'
	main.vtweg as DistributionChannel,
	
	@EndUserText.label: 'Division'
	main.spart as Division,
	
	@EndUserText.label: 'Dip Profile'
	main.dppprof as DynItemProcessorPrfl,
	
	@EndUserText.label: 'Joint Venture'
	main.vname as JointVenture,
	
	@EndUserText.label: 'Recovery Indicator'
	main.recid as JointVentureCostRecoveryCode,
	
	@EndUserText.label: 'Equity Type'
	main.etype as JointVentureEquityType,
	
	@EndUserText.label: 'Joint Venture Object Type'
	main.otype as JointVentureObjectType,
	
	@EndUserText.label: 'Jib/Jibe Class'
	main.jibcl as JointVentureClass,
	
	@EndUserText.label: 'Jib/Jibe Subclass A'
	main.jibsa as JointVentureSubClass,
	
	@Semantics.calendar.dayOfMonth: true
	@EndUserText.label: 'Forecast Start Date'
	cast (main.sprog as pshlp_forecast_start_de) as ForecastedStartDate,
	
	@Semantics.calendar.dayOfMonth: true
	@EndUserText.label: 'Forecast Finish Date'
	cast (main.eprog as ps_s4_forecast_finish) as ForecastedEndDate,
	
	@EndUserText.label: 'Dates Planning Method'
	cast (main.vgplf as ps_s4_vgplf) as PlanningMethForProjBasicDate,
	
	@EndUserText.label: 'Forecast Dates Planning Method'
	cast (main.ewplf as ps_s4_ewplf) as PlanningMethForProjFcstdDate,
	
	@EndUserText.label: 'Time Unit'
	cast (main.zteht as cgpl_duration_unit) as SchedulingDurationUnit,
	
	@EndUserText.label: 'WBS Scheduling Profile'
	cast (main.scprf as ps_s4_schdprf) as WBSSchedulingProfile,
	
	@EndUserText.label: 'Field Key'
	main.slwid as FreeDefinedTableFieldSemantic,
	
	@EndUserText.label: 'User Free Defined Attr. 1'
	cast (main.usr00 as usr00prps preserving type) as FreeDefinedAttribute01,
	
	@EndUserText.label: 'User Free Defined Attr. 2'
	cast (main.usr01 as usr01prps preserving type) as FreeDefinedAttribute02,
	
	@EndUserText.label: 'User Free Defined Attr. 3'
	cast (main.usr02 as usr02prps preserving type) as FreeDefinedAttribute03,
	
	@EndUserText.label: 'User Free Defined Attr. 4'
	cast (main.usr03 as usr03prps preserving type) as FreeDefinedAttribute04,
	
	@EndUserText.label: 'User Free Defined Qty. 1'
	@Semantics.quantity.unitOfMeasure: 'FreeDefinedQuantity1Unit'
	cast (main.usr04 as usr04prps preserving type) as FreeDefinedQuantity1,
	
	@EndUserText.label: 'User Free Defined Qty. Unit 1'
	cast (main.use04 as use04prps preserving type) as FreeDefinedQuantity1Unit,
	
	@EndUserText.label: 'User Free Defined Qty. 2'
	@Semantics.quantity.unitOfMeasure: 'FreeDefinedQuantity2Unit'
	cast (main.usr05 as usr05prps preserving type) as FreeDefinedQuantity2,
	
	@EndUserText.label: 'User Free Defined Qty. Unit 2'
	cast (main.use05 as use05prps preserving type) as FreeDefinedQuantity2Unit,
	
	@EndUserText.label: 'User Free Defined Amt. 1'
	@Semantics.amount.currencyCode: 'FreeDefinedAmount1Currency'
	cast (main.usr06 as usr06prps preserving type) as FreeDefinedAmount1,
	
	@EndUserText.label: 'User Free Defined Amt. Curr. 1'
	cast (main.use06 as use06prps preserving type) as FreeDefinedAmount1Currency,
	
	@EndUserText.label: 'User Free Defined Amt. 2'
	@Semantics.amount.currencyCode: 'FreeDefinedAmount2Currency'
	cast (main.usr07 as usr07prps preserving type) as FreeDefinedAmount2,
	
	@EndUserText.label: 'User Free Defined Amt. Curr. 2'
	cast (main.use07 as use07prps preserving type) as FreeDefinedAmount2Currency,
	
	@EndUserText.label: 'User Free Defined Date 1'
	cast (main.usr08 as usr08prps preserving type) as FreeDefinedDate1,
	
	@EndUserText.label: 'User Free Defined Date 2'
	cast (main.usr09 as usr09prps preserving type) as FreeDefinedDate2,
	
	@EndUserText.label: 'User Free Defined Indicator 1'
	cast (main.usr10 as usr10prps preserving type) as FreeDefinedIndicator1,
	
	@EndUserText.label: 'User Free Defined Indicator 2'
	cast (main.usr11 as usr11prps preserving type) as FreeDefinedIndicator2
}