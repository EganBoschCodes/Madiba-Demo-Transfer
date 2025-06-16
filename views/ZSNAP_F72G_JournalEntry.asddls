@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Journal Entry'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'AccountingDocument'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F72G_JournalEntry
	as select from ZSNAP_F72G_P_BKPF_COM as main
	
	association [0..*] to ZSNAP_F72G_AccngDocTypeText as _AccountingDocumentTypeText on $projection.AccountingDocumentType = _AccountingDocumentTypeText.AccountingDocumentType
	association [0..*] to ZSNAP_F72G_BusTransactio_BI as _BusinessTransactionTypeText on $projection.BusinessTransactionType = _BusinessTransactionTypeText.BusinessTransactionType
	association [0..1] to ZSNAP_F72G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [0..1] to ZSNAP_F72G_FiscalYear as _FiscalYear on $projection.FiscalYear = _FiscalYear.FiscalYear and $projection.FiscalYearVariant = _FiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
	association [0..*] to ZSNAP_F72G_LedgerText as _LedgerText on $projection.Ledger = _LedgerText.Ledger
{
	@ObjectModel.foreignKey.association: '_CompanyCode'
	@EndUserText.label: 'Company Code'
	key main.bukrs as CompanyCode,
	
	@ObjectModel.foreignKey.association: '_FiscalYear'
	@EndUserText.label: 'Fiscal Year'
	key main.gjahr as FiscalYear,
	
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	@EndUserText.label: 'Fiscal Year Variant'
	key _CompanyCode.FiscalYearVariant,
	
	@ObjectModel.text.element: ['AccountingDocumentHeaderText']
	@EndUserText.label: 'Journal Entry'
	key main.belnr as AccountingDocument,
	
	@ObjectModel.text.association: '_AccountingDocumentTypeText'
	@EndUserText.label: 'Journal Entry Type'
	main.blart as AccountingDocumentType,
	
	@EndUserText.label: 'Journal Entry Date'
	main.bldat as DocumentDate,
	
	@EndUserText.label: 'Posting Date'
	main.budat as PostingDate,
	
	@EndUserText.label: 'Fiscal Period'
	cast (main.monat as fins_fiscalperiod preserving type) as FiscalPeriod,
	
	@EndUserText.label: 'Entered On'
	main.cpudt as AccountingDocumentCreationDate,
	
	@EndUserText.label: 'Creation Time'
	main.cputm as CreationTime,
	
	@EndUserText.label: 'Last Manual Change Date'
	cast (main.aedat as fis_lastmanualchangedate preserving type) as LastManualChangeDate,
	
	@EndUserText.label: 'Last Automatic Change Date'
	cast (main.upddt as fis_lastautomaticchangedate preserving type) as LastAutomaticChangeDate,
	case
		when (main.upddt is not initial and main.upddt > main.aedat) then main.upddt
		when main.aedat is not initial then cast (main.aedat as ttet_dt_chg_date preserving type)
		else cast (main.cpudt as ttet_dt_chg_date preserving type)
	end as LastChangeDate,
	
	@EndUserText.label: 'Exchange Rate Date'
	main.wwert as ExchangeRateDate,
	
	@EndUserText.label: 'Journal Entry Created By'
	main.usnam as AccountingDocCreatedByUser,
	
	@EndUserText.label: 'Transaction Code'
	main.tcode as TransactionCode,
	
	@EndUserText.label: 'Intercompany Transaction'
	main.bvorg as IntercompanyTransaction,
	
	@EndUserText.label: 'Document Reference ID'
	main.xblnr as DocumentReferenceID,
	
	@EndUserText.label: 'Recurring Journal Entry'
	main.dbblg as RecurringAccountingDocument,
	
	@EndUserText.label: 'Reverse Document'
	main.stblg as ReverseDocument,
	
	@EndUserText.label: 'Reverse Document Fiscal Year'
	main.stjah as ReverseDocumentFiscalYear,
	
	@EndUserText.label: 'Document Header Text'
	main.bktxt as AccountingDocumentHeaderText,
	
	@EndUserText.label: 'Currency'
	main.waers as TransactionCurrency,
	
	@EndUserText.label: 'Exchange Rate'
	main.kursf as ExchangeRate,
	
	@EndUserText.label: 'Journal Entry Category'
	main.bstat as AccountingDocumentCategory,
	
	@ObjectModel.text.association: '_BusinessTransactionTypeText'
	@EndUserText.label: 'Business Transaction Category'
	main.glvor as BusinessTransactionType,
	
	@EndUserText.label: 'Batch Input Session'
	main.grpid as BatchInputSession,
	
	@EndUserText.label: 'Reference Document Type'
	main.awtyp as ReferenceDocumentType,
	
	@EndUserText.label: 'Object key'
	main.awkey as OriginalReferenceDocument,
	
	@EndUserText.label: 'Fm Area'
	main.fikrs as FinancialManagementArea,
	
	@EndUserText.label: 'Company Code Currency'
	main.hwaer as CompanyCodeCurrency,
	
	@EndUserText.label: 'Additional Currency 1'
	main.hwae2 as AdditionalCurrency1,
	
	@EndUserText.label: 'Additional Currency 2'
	main.hwae3 as AdditionalCurrency2,
	
	@EndUserText.label: 'Reversal Is Planned'
	main.xstov as ReversalIsPlanned,
	
	@EndUserText.label: 'Planned Reversal Date'
	main.stodt as PlannedReversalDate,
	
	@EndUserText.label: 'Tax Is Automatically Calculated'
	main.xmwst as TaxIsCalculatedAutomatically,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Lc2 Currency Type'
	main.curt2 as AdditionalCurrency1Role,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Lc3 Currency Type'
	main.curt3 as AdditionalCurrency2Role,
	
	@EndUserText.label: 'Tax Base Amount is Net Amount'
	main.xsnet as TaxBaseAmountIsNetAmount,
	
	@EndUserText.label: 'Source Company Code'
	main.ausbk as SourceCompanyCode,
	
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'ReferenceDocumentLogicalSystem'
	@EndUserText.label: 'Logical System'
	main.awsys as LogicalSystem,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Ref. Document Logical System'
	cast (main.awsys as fis_awsys preserving type) as ReferenceDocumentLogicalSystem,
	
	@EndUserText.label: 'Tax Exchange Rate'
	main.txkrs as TaxExchangeRate,
	
	@EndUserText.label: 'Reversal Reason'
	main.stgrd as ReversalReason,
	
	@EndUserText.label: 'Date Of Parking'
	main.ppdat as ParkingDate,
	
	@EndUserText.label: 'Time Of Parking'
	main.pptme as ParkingTime,
	
	@EndUserText.label: 'Branch'
	main.brnch as Branch,
	
	@EndUserText.label: 'Number Of Pages'
	main.numpg as NmbrOfPages,
	
	@EndUserText.label: 'Discount Document'
	main.adisc as IsDiscountDocument,
	
	@EndUserText.label: 'Reference 1 in Document Header'
	main.xref1_hd as Reference1InDocumentHeader,
	
	@EndUserText.label: 'Reference 2 in Document Header'
	main.xref2_hd as Reference2InDocumentHeader,
	
	@EndUserText.label: 'Invoice Receipt date'
	main.reindat as InvoiceReceiptDate,
	
	@ObjectModel.text.association: '_LedgerText'
	@EndUserText.label: 'Ledger'
	main.rldnr as Ledger,
	
	@EndUserText.label: 'Ledger Group'
	main.ldgrp as LedgerGroup,
	
	@EndUserText.label: 'Alternative Reference Document'
	main.xblnr_alt as AlternativeReferenceDocument,
	
	@EndUserText.label: 'Tax Reporting Date'
	main.vatdate as TaxReportingDate,
	
	@EndUserText.label: 'Accounting Document Class'
	main.doccat as AccountingDocumentClass,
	
	@EndUserText.label: 'Exchange Rate Type'
	main.kurst as ExchangeRateType,
	
	@EndUserText.label: 'Sender Logical System'
	main.logsystem_sender as SenderLogicalSystem,
	
	@EndUserText.label: 'Company Code In Sender System'
	main.bukrs_sender as SenderCompanyCode,
	
	@EndUserText.label: 'Sender Journal Entry'
	main.belnr_sender as SenderAccountingDocument,
	
	@EndUserText.label: 'Fiscal Year in Sender System'
	main.gjahr_sender as SenderFiscalYear,
	
	@EndUserText.label: 'Reversal Organizatns'
	main.aworg_rev as ReversalReferenceDocumentCntxt,
	
	@EndUserText.label: 'Reversal Ref. No.'
	main.awref_rev as ReversalReferenceDocument,
	
	@EndUserText.label: 'Late Payment Reason'
	main.penrc as LatePaymentReason,
	
	@EndUserText.label: 'Sales Document Condition'
	main.knumv as SalesDocumentCondition,
	
	@EndUserText.label: 'Is Reversing Another Item'
	main.xreversing as IsReversal,
	
	@EndUserText.label: 'Is Reversed'
	main.xreversed as IsReversed,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Valuation Date'
	main.co_valdt as CostAccountingValuationDate,
	
	@EndUserText.label: 'Country/Region Specific Reference 1'
	main.glo_ref1_hd as JrnlEntryCntrySpecificRef1,
	
	@EndUserText.label: 'Country/Region Specific Date 1'
	main.glo_dat1_hd as JrnlEntryCntrySpecificDate1,
	
	@EndUserText.label: 'Country/Region Specific Reference 2'
	main.glo_ref2_hd as JrnlEntryCntrySpecificRef2,
	
	@EndUserText.label: 'Country/Region Specific Date 2'
	main.glo_dat2_hd as JrnlEntryCntrySpecificDate2,
	
	@EndUserText.label: 'Country/Region Specific Reference 3'
	main.glo_ref3_hd as JrnlEntryCntrySpecificRef3,
	
	@EndUserText.label: 'Country/Region Specific Date 3'
	main.glo_dat3_hd as JrnlEntryCntrySpecificDate3,
	
	@EndUserText.label: 'Country/Region Specific Reference 4'
	main.glo_ref4_hd as JrnlEntryCntrySpecificRef4,
	
	@EndUserText.label: 'Country/Region Specific Date 4'
	main.glo_dat4_hd as JrnlEntryCntrySpecificDate4,
	
	@EndUserText.label: 'Country/Region Specific Reference 5'
	main.glo_ref5_hd as JrnlEntryCntrySpecificRef5,
	
	@EndUserText.label: 'Country/Region Specific Date 5'
	main.glo_dat5_hd as JrnlEntryCntrySpecificDate5,
	
	@EndUserText.label: 'Ctry/Reg. Specific Business Partner 1'
	main.glo_bp1_hd as JrnlEntryCntrySpecificBP1,
	
	@EndUserText.label: 'Ctry/Reg. Specific Business Partner 2'
	main.glo_bp2_hd as JrnlEntryCntrySpecificBP2,
	
	@Consumption.hidden: true
	_AccountingDocumentTypeText,
	
	@Consumption.hidden: true
	_BusinessTransactionTypeText,
	_CompanyCode,
	_FiscalYear,
	_FiscalYearVariant,
	
	@Consumption.hidden: true
	_LedgerText
}