@EndUserText.label: 'SNAP F80: Cash Flow Full Transactions'
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE

define table function ZSNAP_F80S_403	
	with parameters
		@Environment.systemField: #CLIENT
		P_Client: mandt,
		P_SystemDate: abap.dats,
		P_CashStartDate: abap.dats
	
	returns
{
	key mandt: mandt;
	key Ledger: fins_ledger_pers;
	key SourceLedger: fins_ledger_pers;
	key AccountingDocument: fis_belnr;
	key CompanyCode: fis_bukrs;
	key FiscalYear: fis_gjahr_no_conv;
	key LedgerGLLineItem: fis_docln;
	Source: abap.char (2);
	CashPostingDate: abap.dats;
	ResetFlag: abap.char (1);
	EntryCounter: abap.int4;
	AccountingDocumentItem: fis_buzei;
	AccountingDocumentType: fis_blart;
	ChartOfAccounts: fis_ktopl;
	AssignmentReference: fis_zuonr;
	TransactionTypeDetermination: fac_ktosl;
	OrderID: fis_aufnr;
	ClearingAccountingDocument: fis_augbl;
	ControllingArea: fis_kokrs;
	CostCenter: fis_kostl;
	Customer: kunnr;
	CustomerGroup: kdgrp;
	DebitCreditCode: fis_shkzg;
	DocumentItemText: farp_sgtxt;
	FinancialAccountType: farp_koart;
	FollowOnDocumentType: fis_rebzt;
	GLAccount: fis_racct;
	InvoiceItemReference: fis_rebzz;
	InvoiceReference: fis_rebzg;
	IsOpenItemManaged: fis_xopvw;
	IsReversal: fins_xreversing;
	IsReversed: fins_xreversed;
	PartnerCompany: fis_rassc;
	PostingKey: fis_bschl;
	Product: productnumber;
	ProfitCenter: fis_prctr;
	ReferenceDocument: awref;
	ReferenceDocumentItem: fis_awitem;
	SpecialGLCode: fac_umskz;
	Supplier: md_supplier;
	TaxCode: fis_mwskz;
	Material: productnumber;
	MaterialGroup: fins_matkl_pa;
	Project: fis_projectint_no_conv;
	WBSElement: fis_wbsint_no_conv;
	ClearingDate: fis_augdt;
	DocumentDate: fis_bldat;
	FiscalYearVariant: fis_periv;
	InvoiceReferenceFiscalYear: fis_rebzj_no_conv;
	PostingDate: fis_budat;
	Title: zztitle;
	AmountInTransactionCurrency: fis_wsl;
	TransactionCurrency: fis_rwcur;
	AmountInCompanyCodeCurrency: fis_hsl;
	CompanyCodeCurrency: fis_hwaer;
	AmountInGlobalCurrency: fis_ksl;
	GlobalCurrency: fis_rkcur;
	AmountInFourthCurrency: fis_osl;
	FourthCurrency: fis_rocur;
}
implemented by method
	zcsnap_f80s_403=>get_data;