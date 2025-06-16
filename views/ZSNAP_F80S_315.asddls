@EndUserText.label: 'SNAP F80: Final AR/AP Line Items'
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE

define table function ZSNAP_F80S_315	
	with parameters
		@Environment.systemField: #CLIENT
		P_Client: mandt,
		P_SystemDate: abap.dats,
		P_CashStartDate: abap.dats
	
	returns
{
	key mandt: mandt;
	key CompanyCode: abap.char (4);
	key AccountingDocument: belnr_d;
	key FiscalYear: gjahr;
	key AccountingDocumentItem: abap.numc (3);
	key EntryCounter: abap.int4;
	ClearingDate: augdt;
	ClearingAccountingDocument: belnr_d;
	FinancialAccountType: koart;
	Source: abap.char (2);
	ResetFlag: abap.char (1);
	MostRecentFlag: abap.char (1);
}
implemented by method
	zcsnap_f80s_315=>get_data;