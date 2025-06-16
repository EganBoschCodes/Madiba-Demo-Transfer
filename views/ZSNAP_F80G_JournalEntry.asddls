@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Journal Entry'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F80G_JournalEntry
	as select from ZSNAP_F80G_P_BKPF_COM as main
	
	association [0..1] to ZSNAP_F80G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
{
	@ObjectModel.foreignKey.association: '_CompanyCode'
	key main.bukrs as CompanyCode,
	key main.gjahr as FiscalYear,
	key _CompanyCode.FiscalYearVariant,
	
	@ObjectModel.text.element: ['AccountingDocumentHeaderText']
	key main.belnr as AccountingDocument,
	main.usnam as AccountingDocCreatedByUser,
	main.tcode as TransactionCode,
	main.bvorg as IntercompanyTransaction,
	main.xblnr as DocumentReferenceID,
	main.stblg as ReverseDocument,
	main.stjah as ReverseDocumentFiscalYear,
	main.bktxt as AccountingDocumentHeaderText,
	_CompanyCode
}