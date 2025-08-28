@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: Offset Purchase Order'

define table function ZSNAP_F01G_OffsetPO
	returns
{
	key mandt: mandt;
	key AccountingDocument: belnr_d;
	key CompanyCode: bukrs;
	key FiscalYear: gjahr;
	PurchaseOrder: ebeln;
}
implemented by method
	zcsnap_f01g_offsetpo=>get_data;