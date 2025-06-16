@EndUserText.label: 'SNAP F04: IC Suppliers'
@ClientHandling.type: #CLIENT_INDEPENDENT

define table function ZSNAP_F01M_ICSupplier
	returns
{
	key Supplier: lifnr;
	IsIntercompany: abap.char (1);
	PartnerCompanyCode: bukrs;
	PartnerCompany: rcomp_d;
}
implemented by method
	zcsnap_f01m_icsupplier=>get_data;