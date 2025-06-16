@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'WBS Element'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'WBSElement'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F72G_WBSElementByE_32
	as select from prps as main
{
	@EndUserText.label: 'WBS Element'
	@ObjectModel.text.element: ['WBSDescription']
	key main.posid as WBSElement,
	
	@EndUserText.label: 'WBS Element Internal ID'
	cast (main.pspnr as ps_s4_pspnr preserving type) as WBSElementInternalID,
	
	@EndUserText.label: 'WBS Element External ID'
	main.posid_edit as WBSElementExternalID,
	
	@EndUserText.label: 'Short Id (Wbs Elem)'
	main.poski as WBSElementShortID,
	
	@Semantics.text: true
	@EndUserText.label: 'WBS Element Name'
	cast (main.post1 as ps_s4_post1 preserving type) as WBSDescription,
	
	@EndUserText.label: 'Company Code'
	cast (main.pbukr as bukrs preserving type) as CompanyCode,
	
	@EndUserText.label: 'Controlling Area'
	cast (main.pkokr as ps_s4_kokrs preserving type) as ControllingArea,
	
	@EndUserText.label: 'Functional Area'
	cast (main.func_area as fkber preserving type) as FunctionalArea,
	
	@EndUserText.label: 'Profit Center'
	main.prctr as ProfitCenter,
	
	@EndUserText.label: 'Responsible Cost Center'
	cast (main.fkstl as ps_s4_fkstl preserving type) as ResponsibleCostCenter,
	
	@EndUserText.label: 'Plant'
	main.werks as Plant,
	
	@EndUserText.label: 'Calendar'
	cast (main.fabkl as stkal preserving type) as FactoryCalendar,
	
	@EndUserText.label: 'Costing Sheet'
	main.kalsm as CostingSheet,
	
	@EndUserText.label: 'CCtr posted actual'
	cast (main.kostl as ps_kostl preserving type) as CostCenter,
	
	@EndUserText.label: 'Current internal project number'
	cast (main.psphi as ps_psphi preserving type) as ProjectInternalID,
	
	@EndUserText.label: 'Billing Element'
	cast (main.fakkz as ps_fakkz preserving type) as WBSElementIsBillingElement,
	
	@EndUserText.label: 'Object Number'
	main.objnr as WBSElementObject,
	
	@EndUserText.label: 'Investment Profile'
	main.imprf as InvestmentProfile,
	
	@EndUserText.label: 'Statistical'
	main.xstat as WBSIsStatisticalWBSElement,
	
	@EndUserText.label: 'Account Assignment Element'
	cast (main.belkz as ps_s4_belkz preserving type) as WBSIsAccountAssignmentElement,
	
	@EndUserText.label: 'Project Type'
	main.prart as ProjectType,
	
	@EndUserText.label: 'Joint Venture'
	main.vname as JointVenture,
	
	@EndUserText.label: 'Recovery Indicator'
	main.recid as JointVentureCostRecoveryCode,
	
	@EndUserText.label: 'Equity Type'
	main.etype as JointVentureEquityType,
	
	@EndUserText.label: 'Joint Venture Object Type'
	main.otype as JntVntrProjectType,
	
	@EndUserText.label: 'Jib/Jibe Class'
	main.jibcl as JntIntrstBillgClass,
	
	@EndUserText.label: 'Jib/Jibe Subclass A'
	main.jibsa as JntIntrstBillgSubClass,
	
	@EndUserText.label: 'Location'
	main.stort as Location,
	
	@EndUserText.label: 'Results Analysis Key'
	main.abgsl as ResultAnalysisInternalID,
	
	@EndUserText.label: 'Fund'
	main.rfund as Fund,
	
	@EndUserText.label: 'Grant'
	main.rgrant_nbr as GrantID,
	
	@EndUserText.label: 'Fund Fixed Assignment'
	main.fund_fix_assign as FundIsFixAssigned,
	
	@EndUserText.label: 'Functional Area Fixed Assignment'
	main.func_area_fix_assigned as FunctionalAreaIsFixAssigned,
	
	@EndUserText.label: 'Grant Fixed Assignment'
	main.grant_fix_assigned as GrantIsFixAssigned,
	
	@EndUserText.label: 'Sponsored Program'
	main.sponsoredprog as SponsoredProgram,
	
	@EndUserText.label: 'Tax Jurisdiction'
	main.txjcd as TaxJurisdiction,
	
	@EndUserText.label: 'Functional Location'
	main.tplnr as FunctionalLocation,
	
	@Semantics.user.createdBy: true
	@EndUserText.label: 'Created By'
	main.ernam as CreatedByUser,
	
	@Semantics.systemDate.createdAt: true
	@EndUserText.label: 'Created On'
	main.erdat as CreationDate,
	
	@Semantics.user.lastChangedBy: true
	@EndUserText.label: 'Changed By'
	main.aenam as LastChangedByUser,
	
	@Semantics.systemDate.lastChangedAt: true
	@EndUserText.label: 'Last Changed On'
	main.aedat as LastChangeDate,
	
	@EndUserText.label: 'Ca Resp. Cost Center'
	main.fkokr as RespCostCenterControllingArea,
	
	@EndUserText.label: 'Sales Document Item'
	main.posnr_prps as LeadingSalesOrderItem,
	
	@EndUserText.label: 'Sales Document'
	main.vbeln_prps as LeadingSalesOrder
}