@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Operational Accounting Document Item'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'AccountingDocumentItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F72G_OplAcctgDocItem
	as select from ZSNAP_F72G_P_BSEG_COM as main
	
	association [1..1] to ZSNAP_F72G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [0..1] to ZSNAP_F72G_FiscalYear as _FiscalYear on $projection.FiscalYear = _FiscalYear.FiscalYear and $projection.FiscalYearVariant = _FiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_JournalEntry as _JournalEntry on $projection.CompanyCode = _JournalEntry.CompanyCode and $projection.FiscalYear = _JournalEntry.FiscalYear and $projection.AccountingDocument = _JournalEntry.AccountingDocument and $projection.FiscalYearVariant = _JournalEntry.FiscalYearVariant
{
	@EndUserText.label: 'Company Code'
	@ObjectModel.foreignKey.association: '_CompanyCode'
	key main.bukrs as CompanyCode,
	
	@EndUserText.label: 'Accounting Document'
	@ObjectModel.foreignKey.association: '_JournalEntry'
	key main.belnr as AccountingDocument,
	
	@EndUserText.label: 'Fiscal Year'
	@ObjectModel.foreignKey.association: '_FiscalYear'
	key main.gjahr as FiscalYear,
	
	@EndUserText.label: 'Fiscal Year Variant'
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	key _CompanyCode.FiscalYearVariant,
	
	@EndUserText.label: 'Accounting Document Item'
	@ObjectModel.text.element: ['DocumentItemText']
	key main.buzei as AccountingDocumentItem,
	
	@EndUserText.label: 'Chart Of Accounts'
	main.ktopl as ChartOfAccounts,
	
	@EndUserText.label: 'Accounting Document Item Type'
	main.buzid as AccountingDocumentItemType,
	
	@EndUserText.label: 'Clearing Date'
	main.augdt as ClearingDate,
	
	@EndUserText.label: 'Clearing Creation Date'
	main.augcp as ClearingCreationDate,
	
	@EndUserText.label: 'Clearing Accounting Document'
	main.augbl as ClearingAccountingDocument,
	
	@EndUserText.label: 'Posting Key'
	main.bschl as PostingKey,
	
	@EndUserText.label: 'Financial Account Type'
	main.koart as FinancialAccountType,
	
	@EndUserText.label: 'Special GLCode'
	main.umskz as SpecialGLCode,
	
	@EndUserText.label: 'Special GLTransaction Type'
	main.umsks as SpecialGLTransactionType,
	
	@EndUserText.label: 'Debit Credit Code'
	main.shkzg as DebitCreditCode,
	
	@EndUserText.label: 'Business Area'
	main.gsber as BusinessArea,
	
	@EndUserText.label: 'Partner Business Area'
	main.pargb as PartnerBusinessArea,
	
	@EndUserText.label: 'Tax Code'
	main.mwskz as TaxCode,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Tax Country'
	main.tax_country as TaxCountry,
	
	@EndUserText.label: 'Withholding Tax Code'
	main.qsskz as WithholdingTaxCode,
	
	@EndUserText.label: 'Tax Type'
	main.mwart as TaxType,
	
	@EndUserText.label: 'Tax Item Group'
	main.txgrp as TaxItemGroup,
	
	@EndUserText.label: 'Transaction Type Determination'
	main.ktosl as TransactionTypeDetermination,
	
	@EndUserText.label: 'Value Date'
	main.valut as ValueDate,
	
	@EndUserText.label: 'Assignment Reference'
	main.zuonr as AssignmentReference,
	
	@EndUserText.label: 'Document Item Text'
	main.sgtxt as DocumentItemText,
	
	@EndUserText.label: 'Partner Company'
	main.vbund as PartnerCompany,
	
	@EndUserText.label: 'Financial Transaction Type'
	main.bewar as FinancialTransactionType,
	
	@EndUserText.label: 'Corporate Group Account'
	main.altkt as CorporateGroupAccount,
	
	@EndUserText.label: 'Planning Level'
	main.fdlev as PlanningLevel,
	
	@EndUserText.label: 'Controlling Area'
	main.kokrs as ControllingArea,
	
	@EndUserText.label: 'Cost Center'
	main.kostl as CostCenter,
	
	@API.element.releaseState: #DEPRECATED
	@EndUserText.label: 'Project'
	@VDM.lifecycle.status: #DEPRECATED
	main.projn as Project,
	
	@EndUserText.label: 'Order ID'
	main.aufnr as OrderID,
	
	@EndUserText.label: 'Billing Document'
	main.vbeln as BillingDocument,
	
	@EndUserText.label: 'Sales Document'
	main.vbel2 as SalesDocument,
	
	@EndUserText.label: 'Sales Document Item'
	main.posn2 as SalesDocumentItem,
	
	@EndUserText.label: 'Schedule Line'
	main.eten2 as ScheduleLine,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Service Document Type'
	main.service_doc_type as ServiceDocumentType,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Service Document'
	main.service_doc_id as ServiceDocument,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Service Document Item'
	main.service_doc_item_id as ServiceDocumentItem,
	
	@EndUserText.label: 'Master Fixed Asset'
	main.anln1 as MasterFixedAsset,
	
	@EndUserText.label: 'Fixed Asset'
	main.anln2 as FixedAsset,
	
	@EndUserText.label: 'Asset Transaction Type'
	main.anbwa as AssetTransactionType,
	
	@EndUserText.label: 'Asset Value Date'
	main.bzdat as AssetValueDate,
	
	@EndUserText.label: 'Personnel Number'
	main.pernr as PersonnelNumber,
	
	@EndUserText.label: 'Is Sales Related'
	main.xumsw as IsSalesRelated,
	
	@EndUserText.label: 'Line Item Display Is Enabled'
	main.xkres as LineItemDisplayIsEnabled,
	
	@EndUserText.label: 'Is Open Item Managed'
	main.xopvw as IsOpenItemManaged,
	
	@EndUserText.label: 'Address And Bank Is Set Manually'
	cast (main.xcpdd as farp_xcpdd) as AddressAndBankIsSetManually,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Down Payment Is Net Procedure'
	main.xanet as DownPaymentIsNetProcedure,
	
	@EndUserText.label: 'Is Not Cash Discount Liable'
	main.xskrl as IsNotCashDiscountLiable,
	
	@EndUserText.label: 'Is Automatically Created'
	main.xauto as IsAutomaticallyCreated,
	
	@EndUserText.label: 'Is Used In Payment Transaction'
	main.xzahl as IsUsedInPaymentTransaction,
	
	@EndUserText.label: 'Operational GL Account'
	main.saknr as OperationalGLAccount,
	
	@EndUserText.label: 'GL Account'
	main.hkont as GLAccount,
	
	@EndUserText.label: 'Customer'
	main.kunnr as Customer,
	
	@EndUserText.label: 'Supplier'
	main.lifnr as Supplier,
	
	@EndUserText.label: 'Branch Account'
	main.filkd as BranchAccount,
	
	@EndUserText.label: 'Is Balance Sheet Account'
	main.xbilk as IsBalanceSheetAccount,
	
	@EndUserText.label: 'Profit Loss Account Type'
	main.gvtyp as ProfitLossAccountType,
	
	@EndUserText.label: 'Special GL Account Assignment'
	main.hzuon as SpecialGLAccountAssignment,
	
	@EndUserText.label: 'Baseline Date'
	main.zfbdt as DueCalculationBaseDate,
	
	@EndUserText.label: 'Payment Terms'
	main.zterm as PaymentTerms,
	
	@EndUserText.label: 'Cash Discount 1 Days'
	main.zbd1t as CashDiscount1Days,
	
	@EndUserText.label: 'Cash Discount 1 Date'
	case
		when main.zbd1p <> 0 then dats_add_days (main.zfbdt, cast (main.zbd1t as abap.int4), 'UNCHANGED')
		else main.netdt
	end as CashDiscount1Date,
	
	@EndUserText.label: 'Cash Discount 2 Days'
	main.zbd2t as CashDiscount2Days,
	
	@EndUserText.label: 'Cash Discount 2 Date'
	case
		when main.zbd2p <> 0 then dats_add_days (main.zfbdt, cast (main.zbd2t as abap.int4), 'UNCHANGED')
		else main.netdt
	end as CashDiscount2Date,
	
	@EndUserText.label: 'Net Payment Days'
	main.zbd3t as NetPaymentDays,
	
	@EndUserText.label: 'Cash Discount 1 Percent'
	main.zbd1p as CashDiscount1Percent,
	
	@EndUserText.label: 'Cash Discount 2 Percent'
	main.zbd2p as CashDiscount2Percent,
	
	@EndUserText.label: 'Payment Method'
	main.zlsch as PaymentMethod,
	
	@EndUserText.label: 'Payment Blocking Reason'
	main.zlspr as PaymentBlockingReason,
	
	@EndUserText.label: 'Fixed Cash Discount'
	main.zbfix as FixedCashDiscount,
	
	@EndUserText.label: 'House Bank'
	main.hbkid as HouseBank,
	
	@EndUserText.label: 'BPBank Account Internal ID'
	main.bvtyp as BPBankAccountInternalID,
	
	@EndUserText.label: 'Tax Distribution Code 1'
	main.mwsk1 as TaxDistributionCode1,
	
	@EndUserText.label: 'Tax Distribution Code 2'
	main.mwsk2 as TaxDistributionCode2,
	
	@EndUserText.label: 'Tax Distribution Code 3'
	main.mwsk3 as TaxDistributionCode3,
	
	@EndUserText.label: 'Invoice Reference'
	main.rebzg as InvoiceReference,
	
	@EndUserText.label: 'Invoice Reference Fiscal Year'
	main.rebzj as InvoiceReferenceFiscalYear,
	
	@EndUserText.label: 'Invoice Item Reference'
	main.rebzz as InvoiceItemReference,
	
	@EndUserText.label: 'Follow On Document Type'
	main.rebzt as FollowOnDocumentType,
	
	@EndUserText.label: 'State Central Bank Payment Reason'
	main.lzbkz as StateCentralBankPaymentReason,
	
	@EndUserText.label: 'Supplying Country'
	main.landl as SupplyingCountry,
	
	@EndUserText.label: 'Invoice List'
	main.samnr as InvoiceList,
	
	@EndUserText.label: 'Bill Of Exchange Usage'
	main.wverw as BillOfExchangeUsage,
	
	@EndUserText.label: 'Dunning Key'
	main.mschl as DunningKey,
	
	@EndUserText.label: 'Dunning Blocking Reason'
	main.mansp as DunningBlockingReason,
	
	@EndUserText.label: 'Last Dunning Date'
	main.madat as LastDunningDate,
	
	@EndUserText.label: 'Dunning Level'
	main.manst as DunningLevel,
	
	@EndUserText.label: 'Dunning Area'
	main.maber as DunningArea,
	
	@EndUserText.label: 'Withholding Tax Certificate'
	main.qsznr as WithholdingTaxCertificate,
	
	@API.element.releaseState: #DEPRECATED
	@API.element.successor: 'Product'
	@EndUserText.label: 'Material'
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'Product'
	main.matnr as Material,
	
	@EndUserText.label: 'Product'
	cast (main.matnr as productnumber) as Product,
	
	@EndUserText.label: 'Plant'
	main.werks as Plant,
	
	@EndUserText.label: 'Purchasing Document'
	main.ebeln as PurchasingDocument,
	
	@EndUserText.label: 'Purchasing Document Item'
	main.ebelp as PurchasingDocumentItem,
	
	@EndUserText.label: 'Account Assignment Number'
	main.zekkn as AccountAssignmentNumber,
	
	@EndUserText.label: 'Is Completely Delivered'
	main.elikz as IsCompletelyDelivered,
	
	@EndUserText.label: 'Material Price Control'
	main.vprsv as MaterialPriceControl,
	
	@EndUserText.label: 'Valuation Area'
	main.bwkey as ValuationArea,
	
	@EndUserText.label: 'Inventory Valuation Type'
	main.bwtar as InventoryValuationType,
	
	@EndUserText.label: 'VATRegistration'
	main.stceg as VATRegistration,
	
	@EndUserText.label: 'Deliv Of Goods Dest Country'
	main.egbld as DelivOfGoodsDestCountry,
	
	@EndUserText.label: 'Payment Difference Reason'
	main.rstgr as PaymentDifferenceReason,
	
	@EndUserText.label: 'Profit Center'
	main.prctr as ProfitCenter,
	
	@EndUserText.label: 'Joint Venture'
	main.vname as JointVenture,
	
	@EndUserText.label: 'Joint Venture Cost Recovery Code'
	main.recid as JointVentureCostRecoveryCode,
	
	@EndUserText.label: 'Joint Venture Equity Group'
	main.egrup as JointVentureEquityGroup,
	
	@EndUserText.label: 'Treasury Contract Type'
	main.vertt as TreasuryContractType,
	
	@EndUserText.label: 'Asset Contract'
	main.vertn as AssetContract,
	
	@EndUserText.label: 'Cash Flow Type'
	main.vbewa as CashFlowType,
	
	@EndUserText.label: 'Tax Jurisdiction'
	main.txjcd as TaxJurisdiction,
	
	@EndUserText.label: 'Real Estate Object'
	main.imkey as RealEstateObject,
	
	@EndUserText.label: 'Settlement Reference Date'
	main.dabrz as SettlementReferenceDate,
	
	@API.element.releaseState: #DEPRECATED
	@API.element.successor: 'CommitmentItemShortID'
	@EndUserText.label: 'Commitment Item'
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'CommitmentItemShortID'
	main.fipos as CommitmentItem,
	
	@EndUserText.label: 'Commitment Item Short ID'
	cast (main.fipos as fis_fipos_shortid preserving type) as CommitmentItemShortID,
	
	@EndUserText.label: 'Cost Object'
	main.kstrg as CostObject,
	
	@EndUserText.label: 'Project Network'
	main.nplnr as ProjectNetwork,
	
	@EndUserText.label: 'Order Internal Bill Of Operations'
	main.aufpl as OrderInternalBillOfOperations,
	
	@EndUserText.label: 'Order Int Bill Of Operations Item'
	main.aplzl as OrderIntBillOfOperationsItem,
	
	@EndUserText.label: 'WBSElement Internal ID'
	cast (main.projk as fis_wbsint_no_conv preserving type) as WBSElementInternalID,
	
	@EndUserText.label: 'Profitability Segment'
	cast (main.paobjnr as rkeobjnr_char) as ProfitabilitySegment,
	
	@EndUserText.label: 'Joint Venture Equity Type'
	main.etype as JointVentureEquityType,
	
	@EndUserText.label: 'Is EUTriangular Deal'
	main.xegdr as IsEUTriangularDeal,
	
	@EndUserText.label: 'Cost Origin Group'
	main.hrkft as CostOriginGroup,
	
	@EndUserText.label: 'Company Code Currency Detn Method'
	main.hwmet as CompanyCodeCurrencyDetnMethod,
	
	@EndUserText.label: 'Clearing Is Reversed'
	main.xragl as ClearingIsReversed,
	
	@EndUserText.label: 'Payment Method Supplement'
	main.uzawe as PaymentMethodSupplement,
	
	@EndUserText.label: 'Alternative GLAccount'
	main.lokkt as AlternativeGLAccount,
	
	@EndUserText.label: 'Funds Center'
	main.fistl as FundsCenter,
	
	@EndUserText.label: 'Fund'
	main.geber as Fund,
	
	@EndUserText.label: 'Partner Profit Center'
	main.pprct as PartnerProfitCenter,
	
	@EndUserText.label: 'Reference 1IDBy Business Partner'
	main.xref1 as Reference1IDByBusinessPartner,
	
	@EndUserText.label: 'Reference 2IDBy Business Partner'
	main.xref2 as Reference2IDByBusinessPartner,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Earmarked Funds Document'
	main.kblnr as EarmarkedFundsDocument,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Earmarked Funds Document Item'
	main.kblpos as EarmarkedFundsDocumentItem,
	
	@EndUserText.label: 'Is Negative Posting'
	main.xnegp as IsNegativePosting,
	
	@EndUserText.label: 'Payment Card Item'
	main.rfzei as PaymentCardItem,
	
	@EndUserText.label: 'Payment Card Payment Settlement'
	main.ccbtc as PaymentCardPaymentSettlement,
	
	@EndUserText.label: 'Credit Control Area'
	main.kkber as CreditControlArea,
	
	@EndUserText.label: 'Reference 3IDBy Business Partner'
	main.xref3 as Reference3IDByBusinessPartner,
	
	@EndUserText.label: 'Data Exchange Instruction 1'
	main.dtws1 as DataExchangeInstruction1,
	
	@EndUserText.label: 'Data Exchange Instruction 2'
	main.dtws2 as DataExchangeInstruction2,
	
	@EndUserText.label: 'Data Exchange Instruction 3'
	main.dtws3 as DataExchangeInstruction3,
	
	@EndUserText.label: 'Data Exchange Instruction 4'
	main.dtws4 as DataExchangeInstruction4,
	
	@EndUserText.label: 'Region'
	main.grirg as Region,
	
	@EndUserText.label: 'Has Payment Order'
	main.xpypr as HasPaymentOrder,
	
	@EndUserText.label: 'Payment Reference'
	main.kidno as PaymentReference,
	
	@EndUserText.label: 'Tax Determination Date'
	main.txdat as TaxDeterminationDate,
	
	@EndUserText.label: 'Clearing Item'
	main.agzei as ClearingItem,
	
	@EndUserText.label: 'Business Place'
	main.bupla as BusinessPlace,
	
	@EndUserText.label: 'Tax Section'
	main.secco as TaxSection,
	
	@EndUserText.label: 'Cost Ctr Activity Type'
	main.lstar as CostCtrActivityType,
	
	@API.element.releaseState: #DEPRECATED
	@API.element.successor: 'AcctsReceivablePledgingCode'
	@EndUserText.label: 'Accounts Receivable Is Pledged'
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'AcctsReceivablePledgingCode'
	main.cession_kz as AccountsReceivableIsPledged,
	
	@EndUserText.label: 'Accts Receivable Pledging Code'
	cast (main.cession_kz as fis_cession_kz_code preserving type) as AcctsReceivablePledgingCode,
	
	@EndUserText.label: 'Business Process'
	main.prznr as BusinessProcess,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Grant ID'
	main.grant_nbr as GrantID,
	
	@EndUserText.label: 'Functional Area'
	main.fkber_long as FunctionalArea,
	
	@EndUserText.label: 'Customer Is In Execution'
	main.gmvkz as CustomerIsInExecution,
	
	@EndUserText.label: 'Funded Program'
	main.measure as FundedProgram,
	
	@EndUserText.label: 'Clearing Doc Fiscal Year'
	main.auggj as ClearingDocFiscalYear,
	
	@EndUserText.label: 'Ledger GLLine Item'
	main.docln as LedgerGLLineItem,
	
	@EndUserText.label: 'Segment'
	main.segment as Segment,
	
	@EndUserText.label: 'Partner Segment'
	main.psegment as PartnerSegment,
	
	@EndUserText.label: 'Partner Functional Area'
	main.pfkber as PartnerFunctionalArea,
	
	@EndUserText.label: 'House Bank Account'
	main.hktid as HouseBankAccount,
	
	@EndUserText.label: 'Cost Element'
	main.kstar as CostElement,
	
	@EndUserText.label: 'Tax Item Acctg Doc Item Ref'
	main.taxps as TaxItemAcctgDocItemRef,
	
	@EndUserText.label: 'Payment Service Provider'
	main.pays_prov as PaymentServiceProvider,
	
	@EndUserText.label: 'Payment Ref By Payt Srvc Provider'
	main.pays_tran as PaymentRefByPaytSrvcProvider,
	
	@EndUserText.label: 'SEPAMandate'
	main.mndid as SEPAMandate,
	
	@EndUserText.label: 'Reference Document Type'
	main.awtyp as ReferenceDocumentType,
	
	@EndUserText.label: 'Original Reference Document'
	main.awkey as OriginalReferenceDocument,
	
	@EndUserText.label: 'Reference Document Logical System'
	main.awsys as ReferenceDocumentLogicalSystem,
	
	@EndUserText.label: 'Accounting Document Item Ref'
	main.posnr as AccountingDocumentItemRef,
	
	@EndUserText.label: 'Fiscal Period'
	main.h_monat as FiscalPeriod,
	
	@EndUserText.label: 'Accounting Document Category'
	main.h_bstat as AccountingDocumentCategory,
	
	@EndUserText.label: 'Posting Date'
	main.h_budat as PostingDate,
	
	@EndUserText.label: 'Document Date'
	main.h_bldat as DocumentDate,
	
	@EndUserText.label: 'Accounting Document Type'
	main.h_blart as AccountingDocumentType,
	
	@EndUserText.label: 'Net Due Date'
	main.netdt as NetDueDate,
	
	@EndUserText.label: 'Cash Discount 1 Due Date'
	main.sk1dt as CashDiscount1DueDate,
	
	@EndUserText.label: 'Cash Discount 2 Due Date'
	main.sk2dt as CashDiscount2DueDate,
	
	@EndUserText.label: 'Offsetting Account'
	main.gkont as OffsettingAccount,
	
	@EndUserText.label: 'Offsetting Account Type'
	main.gkart as OffsettingAccountType,
	
	@EndUserText.label: 'Offsetting Chart Of Accounts'
	main.gktopl as OffsettingChartOfAccounts,
	
	@EndUserText.label: 'Partner Fund'
	main.pgeber as PartnerFund,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Partner Grant'
	main.pgrant_nbr as PartnerGrant,
	
	@EndUserText.label: 'Budget Period'
	main.budget_pd as BudgetPeriod,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Partner Budget Period'
	main.pbudget_pd as PartnerBudgetPeriod,
	
	@EndUserText.label: 'Branch Code'
	main.j_1tpbupl as BranchCode,
	
	@EndUserText.label: 'Opl Acctg Doc Itm Cntry Spcfc Ref 1'
	main.glo_ref1 as OplAcctgDocItmCntrySpcfcRef1,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Cash Ledger Company Code'
	main.re_bukrs as CashLedgerCompanyCode,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Cash Ledger Account'
	main.re_account as CashLedgerAccount,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Pub Sec Budget Account Co Code'
	main.bdgt_account_cocode as PubSecBudgetAccountCoCode,
	
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'Pub Sec Budget Account'
	main.bdgt_account as PubSecBudgetAccount,
	
	@EndUserText.label: 'Company Code Currency'
	main.h_hwaer as CompanyCodeCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amount In Company Code Currency'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.dmbtr_shl as AmountInCompanyCodeCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Tax Amount In Co Code Crcy'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.mwsts_shl as TaxAmountInCoCodeCrcy,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Tax Base Amount In Co Code Crcy'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.hwbas_shl as TaxBaseAmountInCoCodeCrcy,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Valuation Diff Amt In Co Code Crcy'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.bdiff_shl as ValuationDiffAmtInCoCodeCrcy,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Cash Discount Amt In Co Code Crcy'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.sknto_shl as CashDiscountAmtInCoCodeCrcy,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Tax Brkdwn Amount 1In Co Code Crcy'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.dmbt1_shl as TaxBrkdwnAmount1InCoCodeCrcy,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Tax Brkdwn Amount 2In Co Code Crcy'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.dmbt2_shl as TaxBrkdwnAmount2InCoCodeCrcy,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Tax Brkdwn Amount 3In Co Code Crcy'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.dmbt3_shl as TaxBrkdwnAmount3InCoCodeCrcy,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Invoice Amt In Co Code Crcy'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.rewrt_shl as InvoiceAmtInCoCodeCrcy,
	
	@EndUserText.label: 'Transaction Currency'
	main.h_waers as TransactionCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amount In Transaction Currency'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.wrbtr_shl as AmountInTransactionCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Original Tax Base Amount'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.txbfw_shl as OriginalTaxBaseAmount,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Tax Amount'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.wmwst_shl as TaxAmount,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Tax Base Amount In Trans Crcy'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.fwbas_shl as TaxBaseAmountInTransCrcy,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Withholding Tax Base Amount'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.qsshb_shl as WithholdingTaxBaseAmount,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Planned Amt In Transaction Crcy'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.fdwbt_shl as PlannedAmtInTransactionCrcy,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Cash Discount Base Amount'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.skfbt_shl as CashDiscountBaseAmount,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Cash Discount Amount'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.wskto_shl as CashDiscountAmount,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Net Payment Amount'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.nebtr_shl as NetPaymentAmount,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Withholding Tax Amount'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.qbshb_shl as WithholdingTaxAmount,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Withholding Tax Exemption Amt'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.qsfbt_shl as WithholdingTaxExemptionAmt,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Invoice Amount In Frgn Currency'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.rewwr_shl as InvoiceAmountInFrgnCurrency,
	
	@EndUserText.label: 'Balance Transaction Currency'
	main.pswsl as BalanceTransactionCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amount In Balance Transac Crcy'
	@Semantics.amount.currencyCode: 'BalanceTransactionCurrency'
	main.pswbt_shl as AmountInBalanceTransacCrcy,
	
	@EndUserText.label: 'Additional Currency 1'
	main.h_hwae2 as AdditionalCurrency1,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Valuation Diff Amt In Addl Crcy 1'
	@Semantics.amount.currencyCode: 'AdditionalCurrency1'
	main.bdif2_shl as ValuationDiffAmtInAddlCrcy1,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amount In Additional Currency 1'
	@Semantics.amount.currencyCode: 'AdditionalCurrency1'
	main.dmbe2_shl as AmountInAdditionalCurrency1,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Tax Amount In Additional Currency 1'
	@Semantics.amount.currencyCode: 'AdditionalCurrency1'
	main.mwst2_shl as TaxAmountInAdditionalCurrency1,
	
	@EndUserText.label: 'Additional Currency 2'
	main.h_hwae3 as AdditionalCurrency2,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amount In Additional Currency 2'
	@Semantics.amount.currencyCode: 'AdditionalCurrency2'
	main.dmbe3_shl as AmountInAdditionalCurrency2,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Tax Amount In Additional Currency 2'
	@Semantics.amount.currencyCode: 'AdditionalCurrency2'
	main.mwst3_shl as TaxAmountInAdditionalCurrency2,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Valuation Diff Amt In Addl Crcy 2'
	@Semantics.amount.currencyCode: 'AdditionalCurrency2'
	main.bdif3_shl as ValuationDiffAmtInAddlCrcy2,
	
	@EndUserText.label: 'Payment Currency'
	main.pycur as PaymentCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amount In Payment Currency'
	@Semantics.amount.currencyCode: 'PaymentCurrency'
	main.pyamt_shl as AmountInPaymentCurrency,
	
	@EndUserText.label: 'Credit Control Area Currency'
	main.t014_waers as CreditControlAreaCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Hedged Amount'
	@Semantics.amount.currencyCode: 'CreditControlAreaCurrency'
	main.absbt_shl as HedgedAmount,
	
	@EndUserText.label: 'Base Unit'
	main.meins as BaseUnit,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Quantity'
	@Semantics.quantity.unitOfMeasure: 'BaseUnit'
	main.menge as Quantity,
	
	@EndUserText.label: 'Goods Movement Entry Unit'
	main.erfme as GoodsMovementEntryUnit,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Quantity In Entry Unit'
	@Semantics.quantity.unitOfMeasure: 'GoodsMovementEntryUnit'
	main.erfmg as QuantityInEntryUnit,
	
	@EndUserText.label: 'Purchasing Document Price Unit'
	main.bprme as PurchasingDocumentPriceUnit,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Purchase Order Qty'
	@Semantics.quantity.unitOfMeasure: 'PurchasingDocumentPriceUnit'
	main.bpmng as PurchaseOrderQty,
	
	@EndUserText.label: 'Material Price Unit Qty'
	@Semantics.quantity.unitOfMeasure: 'BaseUnit'
	main.peinh as MaterialPriceUnitQty,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Number Of Items'
	main.nbritm as NumberOfItems,
	
	@API.element.releaseState: #DEPRECATED
	@API.element.successor: 'EarmarkedFundsDocument'
	@EndUserText.label: 'Earmarked Funds'
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'EarmarkedFundsDocument'
	main.kblnr as EarmarkedFunds,
	
	@API.element.releaseState: #DEPRECATED
	@API.element.successor: 'EarmarkedFundsDocumentItem'
	@EndUserText.label: 'Earmarked Funds Item'
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'EarmarkedFundsDocumentItem'
	main.kblpos as EarmarkedFundsItem,
	
	@EndUserText.label: 'IN_GSTPartner'
	main.gst_part as IN_GSTPartner,
	
	@EndUserText.label: 'IN_GSTPlace Of Supply'
	main.plc_sup as IN_GSTPlaceOfSupply,
	
	@EndUserText.label: 'IN_HSNOr SACCode'
	main.hsn_sac as IN_HSNOrSACCode,
	
	@EndUserText.label: 'Origl Tax Base Amount In Co Code Crcy'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.txbhw_shl as OriglTaxBaseAmountInCoCodeCrcy,
	
	@EndUserText.label: 'Original Tax Base Amt In Addl Crcy 1'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.txbh2_shl as OriginalTaxBaseAmtInAddlCrcy1,
	
	@EndUserText.label: 'Original Tax Base Amt In Addl Crcy 2'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.txbh3_shl as OriginalTaxBaseAmtInAddlCrcy2,
	
	@API.element.releaseState: #DEPRECATED
	@EndUserText.label: 'GLAccount Authorization Group'
	@VDM.lifecycle.status: #DEPRECATED
	cast ('' as brgru) as GLAccountAuthorizationGroup,
	
	@API.element.releaseState: #DEPRECATED
	@EndUserText.label: 'Supplier Basic Authorization Grp'
	@VDM.lifecycle.status: #DEPRECATED
	cast ('' as brgru) as SupplierBasicAuthorizationGrp,
	
	@API.element.releaseState: #DEPRECATED
	@EndUserText.label: 'Customer Basic Authorization Grp'
	@VDM.lifecycle.status: #DEPRECATED
	cast ('' as brgru) as CustomerBasicAuthorizationGrp,
	
	@API.element.releaseState: #DEPRECATED
	@EndUserText.label: 'Acctg Doc Type Authorization Group'
	@VDM.lifecycle.status: #DEPRECATED
	cast ('' as brgru) as AcctgDocTypeAuthorizationGroup,
	
	@API.element.releaseState: #DEPRECATED
	@EndUserText.label: 'Order Type'
	@VDM.lifecycle.status: #DEPRECATED
	cast ('' as aufart) as OrderType,
	
	@API.element.releaseState: #DEPRECATED
	@EndUserText.label: 'Sales Order Type'
	@VDM.lifecycle.status: #DEPRECATED
	cast ('' as auart) as SalesOrderType,
	
	@API.element.releaseState: #DEPRECATED
	@EndUserText.label: 'Asset Class'
	@VDM.lifecycle.status: #DEPRECATED
	cast ('' as anlkl) as AssetClass,
	_CompanyCode,
	_FiscalYear,
	_FiscalYearVariant,
	_JournalEntry
}