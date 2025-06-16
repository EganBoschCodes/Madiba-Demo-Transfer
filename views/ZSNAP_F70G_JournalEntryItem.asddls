@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Journal Entry Item'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'LedgerGLLineItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F70G_JournalEntryItem
	as select from acdoca as main
{
	key cast (main.rldnr as fins_ledger_pers preserving type) as SourceLedger,
	key cast (main.rbukrs as fis_bukrs preserving type) as CompanyCode,
	key cast (main.gjahr as fis_gjahr_no_conv preserving type) as FiscalYear,
	key cast (main.belnr as fis_belnr preserving type) as AccountingDocument,
	key cast (main.docln as fis_docln preserving type) as LedgerGLLineItem,
	key cast (main.rldnr as fins_ledger_pers preserving type) as Ledger,
	
	@Semantics.fiscal.year: true
	cast (main.ryear as fis_ryear_no_conv preserving type) as LedgerFiscalYear,
	cast (main.ktopl as fis_ktopl preserving type) as ChartOfAccounts,
	cast (main.kokrs as fis_kokrs preserving type) as ControllingArea,
	cast (main.rmvct as fis_rmvct preserving type) as FinancialTransactionType,
	cast (main.cbttype as fis_custbttype preserving type) as BusinessTransactionType,
	cast (main.awtyp as fis_awtyp preserving type) as ReferenceDocumentType,
	main.awref as ReferenceDocument,
	cast (main.awitem as fis_awitem preserving type) as ReferenceDocumentItem,
	cast (main.awitgrp as fis_awitgrp preserving type) as ReferenceDocumentItemGroup,
	main.xreversing as IsReversal,
	main.xreversed as IsReversed,
	main.xsettling as IsSettlement,
	main.xsettled as IsSettled,
	cast (main.racct as fis_racct preserving type) as GLAccount,
	cast (main.rcntr as fis_kostl preserving type) as CostCenter,
	cast (main.prctr as fis_prctr preserving type) as ProfitCenter,
	cast (main.rfarea as fm_farea preserving type) as FunctionalArea,
	cast (main.rbusa as fis_rbusa preserving type) as BusinessArea,
	cast (main.scntr as fis_skost preserving type) as PartnerCostCenter,
	cast (main.pprctr as fis_pprctr preserving type) as PartnerProfitCenter,
	cast (main.sfarea as fis_sfkber preserving type) as PartnerFunctionalArea,
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
	cast (main.rocur as fis_rocur preserving type) as FreeDefinedCurrency1,
	
	@Semantics.amount.currencyCode: 'FreeDefinedCurrency1'
	cast (main.osl as fis_osl preserving type) as AmountInFreeDefinedCurrency1,
	main.runit as BaseUnit,
	
	@Semantics.quantity.unitOfMeasure: 'BaseUnit'
	main.msl as Quantity,
	cast (main.rvunit as fis_co_meinh preserving type) as CostSourceUnit,
	
	@Semantics.quantity.unitOfMeasure: 'CostSourceUnit'
	cast (main.vmsl as fis_vquan1_12 preserving type) as ValuationQuantity,
	cast (main.drcrk as fis_shkzg preserving type) as DebitCreditCode,
	
	@Semantics.fiscal.period: true
	cast (main.poper as fins_fiscalperiod preserving type) as FiscalPeriod,
	
	@Semantics.fiscal.yearVariant: true
	cast (main.periv as fis_periv preserving type) as FiscalYearVariant,
	
	@Semantics.fiscal.yearPeriod: true
	cast (main.fiscyearper as fis_jahrper_conv preserving type) as FiscalYearPeriod,
	cast (main.budat as fis_budat preserving type) as PostingDate,
	cast (main.bldat as fis_bldat preserving type) as DocumentDate,
	cast (main.blart as fis_blart preserving type) as AccountingDocumentType,
	cast (main.buzei as fis_buzei preserving type) as AccountingDocumentItem,
	cast (main.bstat as fis_bstat preserving type) as AccountingDocumentCategory,
	cast (main.bschl as fis_bschl preserving type) as PostingKey,
	cast (main.ktosl as fac_ktosl preserving type) as TransactionTypeDetermination,
	cast (main.usnam as fis_usnam preserving type) as AccountingDocCreatedByUser,
	main.timestamp as CreationDateTime,
	cast (substring (cast (main.timestamp as abap.char (30)), 1, 8) as fis_cpdat) as CreationDate,
	cast (main.rebzg as fis_rebzg preserving type) as InvoiceReference,
	cast (main.rebzz as fis_rebzz preserving type) as InvoiceItemReference,
	cast (main.zekkn as fis_dzekkn preserving type) as AccountAssignmentNumber,
	cast (main.sgtxt as farp_sgtxt preserving type) as DocumentItemText,
	cast (main.kdauf as vbeln_va preserving type) as SalesDocument,
	cast (main.kdpos as posnr_va preserving type) as SalesDocumentItem,
	cast (main.matnr as productnumber) as Product,
	main.werks as Plant,
	cast (main.lifnr as md_supplier preserving type) as Supplier,
	cast (main.kunnr as kunnr preserving type) as Customer,
	cast (main.koart as farp_koart preserving type) as FinancialAccountType,
	cast (main.umskz as fac_umskz preserving type) as SpecialGLCode,
	cast (main.mwskz as fis_mwskz preserving type) as TaxCode,
	cast (main.hbkid as farp_hbkid preserving type) as HouseBank,
	cast (main.hktid as fac_hktid preserving type) as HouseBankAccount,
	cast (main.xopvw as fis_xopvw preserving type) as IsOpenItemManaged,
	cast (main.anln1 as fis_anln1 preserving type) as MasterFixedAsset,
	cast (main.anln2 as fis_anln2 preserving type) as FixedAsset,
	main.anbwa as AssetTransactionType,
	cast (main.bwtar as fis_bwtar_d preserving type) as InventoryValuationType,
	main.bwkey as ValuationArea,
	main.hkgrp as CostOriginGroup,
	cast (main.gkont as fis_gkont preserving type) as OffsettingAccount,
	cast (main.gkoar as fis_gkoar preserving type) as OffsettingAccountType,
	case main.gkoar
		when 'D' then cast ('    ' as fis_offsettingktopl preserving type)
		when 'K' then cast ('    ' as fis_offsettingktopl preserving type)
		else cast (main.ktopl as fis_offsettingktopl preserving type)
	end as OffsettingChartOfAccounts,
	cast (main.pbukrs as fis_pbukrs preserving type) as PartnerCompanyCode,
	main.pscope as PartnerControllingObjectClass,
	
	@Analytics.internalName: #LOCAL
	cast (main.accasty as fis_accasty preserving type) as AccountAssignmentType,
	main.lstar as CostCtrActivityType,
	cast (main.aufnr as fis_aufnr preserving type) as OrderID,
	cast (main.ps_posid as fis_wbs preserving type) as WBSElement,
	cast (main.ps_pspid as fis_project preserving type) as Project,
	
	@Analytics.internalName: #LOCAL
	cast (main.paufnr as fis_par_aufnr preserving type) as PartnerOrder,
	main.vkorg as SalesOrganization,
	main.vtweg as DistributionChannel,
	main.spart as OrganizationDivision,
	main.matnr_copa as SoldProduct,
	main.kdgrp as CustomerGroup,
	main.kunre as BillToParty,
	main.kunwe as ShipToParty,
	cast (main.netdt as faedt_fpos preserving type) as NetDueDate,
	cast (cast (1 as abap.dec (12, 0)) as fis_nbritm preserving type) as NumberOfItems,
	cast (main.zztitle as zztitle preserving type) as Title
}
where (main.poper > '000' or (main.poper = '000' and (main.bstat = 'J' or main.bstat = 'L')))
	and main.rldnr = '0L'