@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Controlling Area'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ControllingArea'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F80G_ControllingArea
	as select from tka01 as main
	
	cross join ZSNAP_F80G_SAPClient as SAPClient
	
	association [0..*] to ZSNAP_F80G_FinStmntHierT as _FinancialStatementVersionText on $projection.CtrlgStdFinStatementVersion = _FinancialStatementVersionText.FinancialStatementHierarchy
{
	@ObjectModel.text.element: ['ControllingAreaName']
	@EndUserText.label: 'Controlling Area'
	key cast (main.kokrs as fis_kokrs preserving type) as ControllingArea,
	
	@EndUserText.label: 'Fiscal Year Variant'
	cast (main.lmona as fis_periv preserving type) as FiscalYearVariant,
	
	@Semantics.text: true
	@EndUserText.label: 'Controlling Area Name'
	cast (main.bezei as fis_kokrs_name preserving type) as ControllingAreaName,
	
	@EndUserText.label: 'Controlling Area Currency'
	cast (main.waers as fis_kwaer preserving type) as ControllingAreaCurrency,
	
	@EndUserText.label: 'Chart of Accounts'
	cast (main.ktopl as fis_ktopl preserving type) as ChartOfAccounts,
	
	@EndUserText.label: 'Cost Center Standard Hierarchy'
	cast (main.khinr as fis_ksthi preserving type) as CostCenterStandardHierarchy,
	
	@EndUserText.label: 'Operating Concern'
	main.erkrs as OperatingConcern,
	
	@EndUserText.label: 'Profit Center Standard Hierarchy'
	cast (main.phinr as fis_prctr_std_hier preserving type) as ProfitCenterStandardHierarchy,
	
	@EndUserText.label: 'Business Process Standard Hierarchy Area'
	cast (main.bphinr as fis_co_bphinr preserving type) as BusinessProcessStandardHier,
	
	@EndUserText.label: 'G/L Account for Supplier Down Payments'
	cast (main.kstar_fin as fis_kstar_fin preserving type) as CreditDownPaymentDefaultGLAcct,
	
	@EndUserText.label: 'G/L Account for Customer Down Payments'
	cast (main.kstar_fid as fis_kstar_fid preserving type) as DebitDownPaymentDefaultGLAcct,
	
	@EndUserText.label: 'Currency Type for Controlling Area'
	cast (main.ctyp as fis_co_ctyp preserving type) as ControllingAreaCurrencyRole,
	
	@EndUserText.label: 'Fm Area'
	main.fikrs as FinancialManagementArea,
	
	@EndUserText.label: 'Responsible User of Controlling Area'
	cast (main.vname as fis_co_vname preserving type) as ControllingAreaResponsibleUser,
	
	@EndUserText.label: 'Default Profit Center'
	cast (main.defprctr as fis_defprctr preserving type) as DefaultProfitCenter,
	
	@ObjectModel.text.association: '_FinancialStatementVersionText'
	@EndUserText.label: 'Leading Ctrlg Financial Stmnt Version'
	cast (main.leading_fsv as fis_leading_fsv preserving type) as CtrlgStdFinStatementVersion,
	case main.pcacurtp
		when '20' then cast (main.waers as fis_pcacur preserving type)
		when '30' then cast (SAPClient.GroupCurrency as fis_pcacur preserving type)
		else cast (main.pcacur as fis_pcacur preserving type)
	end as ProfitCenterAccountingCurrency,
	
	@Consumption.filter.businessDate.at: true
	_FinancialStatementVersionText
}