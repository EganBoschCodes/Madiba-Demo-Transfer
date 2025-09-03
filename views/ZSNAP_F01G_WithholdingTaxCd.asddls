@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Withholding Tax Type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'WithholdingTaxCode'

define view entity ZSNAP_F01G_WithholdingTaxCd
	as select from t059q as main
	
	association [0..1] to ZSNAP_F01G_Country as _Country on $projection.Country = _Country.Country
	association [0..1] to ZSNAP_F01G_RegionText as _RegionText on $projection.Region = _RegionText.Region and _RegionText.Country = $projection.Country
{
	@ObjectModel.foreignKey.association: '_Country'
	@EndUserText.label: 'Country/Region Key'
	key main.land1 as Country,
	
	@ObjectModel.text.element: ['WithholdingTaxCodeDescription']
	@EndUserText.label: 'Withholding Tax Code'
	key main.qsskz as WithholdingTaxCode,
	
	@EndUserText.label: 'Official Withholding Tax Code'
	main.qscod as OfficialWitholdingTaxCode,
	
	@EndUserText.label: 'Description'
	main.qsbez as WithholdingTaxCodeDescription,
	
	@EndUserText.label: '% Subject to Withholding Tax'
	main.qproz as PerctSubjectToWithholdingTax,
	
	@EndUserText.label: 'Withholding Tax Rate'
	main.qsatz as WithholdingTaxRate,
	
	@EndUserText.label: 'Base for Calculation of Net Withholding Tax'
	main.xntto as BaseForCalcNetWTax,
	
	@EndUserText.label: 'Withholding Tax Posting with Payment'
	main.xqsbz as WithhTaxPostingWPayment,
	
	@EndUserText.label: 'Reduced Withholding Tax Rate for Exemption'
	main.qsatr as ReducedWithholdingTaxRate,
	
	@EndUserText.label: 'Calculate Withholding Tax with Formula'
	main.xqfor as CalcTaxWithFormula,
	
	@EndUserText.label: 'Minimum Amount for Withholding Tax'
	@Semantics.amount.currencyCode: 'CurrencyForMinAmount'
	main.qmind as MinAmountForWithholdingTax,
	
	@EndUserText.label: 'Curr. for Min. Amount'
	main.qmiwa as CurrencyForMinAmount,
	
	@EndUserText.label: 'Region'
	@ObjectModel.text.association: '_RegionText'
	main.bland as Region,
	
	@EndUserText.label: 'Fiscal Regional Code'
	main.fprcd as FiscalRegionalCode,
	
	@EndUserText.label: 'Income Type'
	main.qekar as IncomeType,
	
	@EndUserText.label: 'German Reunification Tax Code'
	main.qsats as GermanReunificationTax,
	
	@EndUserText.label: 'Tax Deduction Section'
	main.j_1isectio as TaxDeductionSection,
	
	@EndUserText.label: 'Vendor Type'
	main.j_1itxvnty as VendorType,
	
	@EndUserText.label: 'Vendor Type Description'
	main.j_1ixvnds as VendorTypeDescription,
	_Country,
	_RegionText
}