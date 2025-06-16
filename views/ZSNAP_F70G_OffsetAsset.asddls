@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: Offset Asset'

define table function ZSNAP_F70G_OffsetAsset
	returns
{
	key mandt: mandt;
	key AccountingDocument: belnr_d;
	key CompanyCode: bukrs;
	key FiscalYear: gjahr;
	FixedAsset: anln1;
}
implemented by method
	zcsnap_f70g_offsetasset=>get_data;