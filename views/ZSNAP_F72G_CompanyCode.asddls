@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Company Code'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CompanyCode'
@ObjectModel.usageType.dataClass: #ORGANIZATIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_CompanyCode
	as select from t001 as main
	
	left outer to one join tka02 on tka02.bukrs = main.bukrs
	
	association [0..*] to ZSNAP_F72G_CoCodeHierNode as _CompanyCodeHierNode on $projection.CompanyCode = _CompanyCodeHierNode.CompanyCode
	association [0..1] to ZSNAP_F72G_CtrllingAreaText as _ControllingAreaText on $projection.ControllingArea = _ControllingAreaText.ControllingArea
	association [0..*] to ZSNAP_F72G_CreditCtrlAreaT as _CreditControlAreaText on $projection.CreditControlArea = _CreditControlAreaText.CreditControlArea
{
	@ObjectModel.hierarchy.association: '_CompanyCodeHierNode'
	@ObjectModel.text.element: ['CompanyCodeName']
	@EndUserText.label: 'Company Code'
	key main.bukrs as CompanyCode,
	
	@Semantics.text: true
	@EndUserText.label: 'Company Name'
	main.butxt as CompanyCodeName,
	
	@EndUserText.label: 'Currency'
	main.waers as Currency,
	
	@EndUserText.label: 'Chart Of Accounts'
	main.ktopl as ChartOfAccounts,
	
	@ObjectModel.text.association: '_ControllingAreaText'
	@EndUserText.label: 'Controlling Area'
	tka02.kokrs as ControllingArea,
	
	@EndUserText.label: 'Fiscal Year Variant'
	main.periv as FiscalYearVariant,
	
	@EndUserText.label: 'Company'
	main.rcomp as Company,
	
	@EndUserText.label: 'City'
	main.ort01 as CityName,
	
	@EndUserText.label: 'Country/Region Key'
	main.land1 as Country,
	
	@EndUserText.label: 'Tax Determ.With Doc.Date'
	main.xstdt as DocDateIsUsedForTaxDetn,
	
	@EndUserText.label: 'Tax Reporting Date Active'
	main.xvatdate as TaxRptgDateIsActive,
	
	@EndUserText.label: 'Discount Base Is Net Value'
	main.xskfn as CashDiscountBaseAmtIsNetAmt,
	
	@EndUserText.label: 'Language Key'
	main.spras as Language,
	
	@ObjectModel.text.association: '_CreditControlAreaText'
	@EndUserText.label: 'Credit Control Area'
	main.kkber as CreditControlArea,
	
	@EndUserText.label: 'Alternative Coa'
	main.ktop2 as CountryChartOfAccounts,
	
	@EndUserText.label: 'Fm Area'
	main.fikrs as FinancialManagementArea,
	
	@EndUserText.label: 'Address'
	main.adrnr as AddressID,
	
	@EndUserText.label: 'Taxes On Sls/Purc.'
	main.umkrs as TaxableEntity,
	
	@EndUserText.label: 'Vat Registration No.'
	main.stceg as VATRegistration,
	
	@EndUserText.label: 'Extended Withholding Tax Active'
	main.wt_newwt as ExtendedWhldgTaxIsActive,
	
	@EndUserText.label: 'Field Status Variant'
	main.fstva as FieldStatusVariant,
	
	@EndUserText.label: 'Output Tax Code'
	main.mwska as NonTaxableTransactionTaxCode,
	_CompanyCodeHierNode,
	_ControllingAreaText,
	_CreditControlAreaText
}