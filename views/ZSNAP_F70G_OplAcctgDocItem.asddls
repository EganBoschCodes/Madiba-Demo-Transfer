@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Operational Accounting Document Item'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F70G_OplAcctgDocItem
	as select from ZSNAP_F70G_P_BSEG_COM as main
	
	association [1..1] to ZSNAP_F70G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
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
	
	@EndUserText.label: 'Clearing Date'
	main.augdt as ClearingDate,
	
	@EndUserText.label: 'Clearing Accounting Document'
	main.augbl as ClearingAccountingDocument,
	
	@EndUserText.label: 'Assignment Reference'
	main.zuonr as AssignmentReference,
	
	@EndUserText.label: 'Document Item Text'
	main.sgtxt as DocumentItemText,
	
	@EndUserText.label: 'Is Automatically Created'
	main.xauto as IsAutomaticallyCreated,
	
	@EndUserText.label: 'Is Used In Payment Transaction'
	main.xzahl as IsUsedInPaymentTransaction,
	
	@EndUserText.label: 'Baseline Date'
	main.zfbdt as DueCalculationBaseDate,
	
	@EndUserText.label: 'Payment Terms'
	main.zterm as PaymentTerms,
	
	@EndUserText.label: 'Purchasing Document'
	main.ebeln as PurchasingDocument,
	
	@EndUserText.label: 'Purchasing Document Item'
	main.ebelp as PurchasingDocumentItem,
	
	@EndUserText.label: 'Payment Difference Reason'
	main.rstgr as PaymentDifferenceReason,
	
	@EndUserText.label: 'Reference 1IDBy Business Partner'
	main.xref1 as Reference1IDByBusinessPartner,
	
	@EndUserText.label: 'Reference 2IDBy Business Partner'
	main.xref2 as Reference2IDByBusinessPartner,
	
	@EndUserText.label: 'Reference 3IDBy Business Partner'
	main.xref3 as Reference3IDByBusinessPartner,
	
	@EndUserText.label: 'Clearing Doc Fiscal Year'
	main.auggj as ClearingDocFiscalYear,
	_CompanyCode
}