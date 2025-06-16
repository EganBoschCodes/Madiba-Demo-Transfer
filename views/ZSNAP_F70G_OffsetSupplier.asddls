@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: Offset Supplier'

define table function ZSNAP_F70G_OffsetSupplier
	returns
{
	key mandt: mandt;
	key AccountingDocument: belnr_d;
	key CompanyCode: bukrs;
	key FiscalYear: gjahr;
	Supplier: lifnr;
}
implemented by method
	zcsnap_f70g_offsetsupplier=>get_data;