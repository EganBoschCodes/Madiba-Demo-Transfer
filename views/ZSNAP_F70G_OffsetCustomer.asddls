@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: Offset Customer'

define table function ZSNAP_F70G_OffsetCustomer
	returns
{
	key mandt: mandt;
	key AccountingDocument: belnr_d;
	key CompanyCode: bukrs;
	key FiscalYear: gjahr;
	Customer: kunnr;
}
implemented by method
	zcsnap_f70g_offsetcustomer=>get_data;