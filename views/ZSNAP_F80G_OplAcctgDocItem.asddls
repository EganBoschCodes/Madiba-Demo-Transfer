@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Operational Accounting Document Item'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F80G_OplAcctgDocItem
	as select from ZSNAP_F80G_P_BSEG_COM as main
	
	association [1..1] to ZSNAP_F80G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
{
	@EndUserText.label: 'Company Code'
	@ObjectModel.foreignKey.association: '_CompanyCode'
	key main.bukrs as CompanyCode,
	
	@EndUserText.label: 'Accounting Document'
	key main.belnr as AccountingDocument,
	
	@EndUserText.label: 'Fiscal Year'
	key main.gjahr as FiscalYear,
	
	@EndUserText.label: 'Fiscal Year Variant'
	key _CompanyCode.FiscalYearVariant,
	
	@EndUserText.label: 'Accounting Document Item'
	@ObjectModel.text.element: ['DocumentItemText']
	key main.buzei as AccountingDocumentItem,
	
	@EndUserText.label: 'Document Item Text'
	main.sgtxt as DocumentItemText,
	
	@EndUserText.label: 'Is Automatically Created'
	main.xauto as IsAutomaticallyCreated,
	
	@EndUserText.label: 'Is Used In Payment Transaction'
	main.xzahl as IsUsedInPaymentTransaction,
	
	@EndUserText.label: 'Baseline Date'
	main.zfbdt as DueCalculationBaseDate,
	_CompanyCode
}