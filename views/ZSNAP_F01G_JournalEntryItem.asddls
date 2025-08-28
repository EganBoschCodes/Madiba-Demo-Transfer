@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Journal Entry Item'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'LedgerGLLineItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F01G_JournalEntryItem
	as select from acdoca as main
{
	key cast (main.rldnr as fins_ledger_pers preserving type) as SourceLedger,
	key cast (main.rbukrs as fis_bukrs preserving type) as CompanyCode,
	key cast (main.gjahr as fis_gjahr_no_conv preserving type) as FiscalYear,
	key cast (main.belnr as fis_belnr preserving type) as AccountingDocument,
	key cast (main.docln as fis_docln preserving type) as LedgerGLLineItem,
	key cast (main.rldnr as fins_ledger_pers preserving type) as Ledger,
	cast (main.ktopl as fis_ktopl preserving type) as ChartOfAccounts,
	cast (main.kokrs as fis_kokrs preserving type) as ControllingArea,
	cast (main.racct as fis_racct preserving type) as GLAccount,
	cast (main.rcntr as fis_kostl preserving type) as CostCenter,
	cast (main.prctr as fis_prctr preserving type) as ProfitCenter,
	cast (main.rfarea as fm_farea preserving type) as FunctionalArea,
	cast (main.rbusa as fis_rbusa preserving type) as BusinessArea,
	main.segment as Segment,
	cast (main.rassc as fis_rassc preserving type) as PartnerCompany,
	cast (main.rwcur as fis_rwcur preserving type) as TransactionCurrency,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	cast (main.wsl as fis_wsl preserving type) as AmountInTransactionCurrency,
	cast (main.rhcur as fis_hwaer preserving type) as CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	cast (main.hsl as fis_hsl preserving type) as AmountInCompanyCodeCurrency,
	cast (main.rkcur as fis_rkcur preserving type) as GlobalCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	cast (main.ksl as fis_ksl preserving type) as AmountInGlobalCurrency,
	cast (main.drcrk as fis_shkzg preserving type) as DebitCreditCode,
	
	@Semantics.fiscal.yearVariant: true
	cast (main.periv as fis_periv preserving type) as FiscalYearVariant,
	cast (main.budat as fis_budat preserving type) as PostingDate,
	cast (main.bldat as fis_bldat preserving type) as DocumentDate,
	cast (main.blart as fis_blart preserving type) as AccountingDocumentType,
	cast (main.buzei as fis_buzei preserving type) as AccountingDocumentItem,
	cast (main.zuonr as fis_zuonr preserving type) as AssignmentReference,
	cast (main.bstat as fis_bstat preserving type) as AccountingDocumentCategory,
	cast (main.bschl as fis_bschl preserving type) as PostingKey,
	cast (main.rebzg as fis_rebzg preserving type) as InvoiceReference,
	cast (main.rebzj as fis_rebzj_no_conv preserving type) as InvoiceReferenceFiscalYear,
	cast (main.rebzt as fis_rebzt preserving type) as FollowOnDocumentType,
	cast (main.rebzz as fis_rebzz preserving type) as InvoiceItemReference,
	cast (main.ebeln as fis_ebeln preserving type) as PurchasingDocument,
	cast (main.lifnr as md_supplier preserving type) as Supplier,
	cast (main.koart as farp_koart preserving type) as FinancialAccountType,
	cast (main.umskz as fac_umskz preserving type) as SpecialGLCode,
	cast (main.augdt as fis_augdt preserving type) as ClearingDate,
	cast (main.netdt as faedt_fpos preserving type) as NetDueDate,
	cast (main.zztitle as zztitle preserving type) as Title
}
where (main.poper > '000' or (main.poper = '000' and (main.bstat = 'J' or main.bstat = 'L')))
	and main.rldnr = '0L'