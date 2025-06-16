@EndUserText.label: 'SNAP F80: All Cash Documents'
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE

define table function ZSNAP_F80S_335	
	with parameters
		@Environment.systemField: #CLIENT
		P_Client: mandt,
		P_SystemDate: abap.dats,
		P_CashStartDate: abap.dats
	
	returns
{
	key mandt: mandt;
	key CompanyCode: bukrs;
	key AccountingDocument: belnr_d;
	key FiscalYear: gjahr;
	key EntryCounter: abap.int4;
	CashPostingDate: budat;
	Source: abap.char (2);
	ResetFlag: abap.char (1);
}
implemented by method
	zcsnap_f80s_335=>get_data;