@EndUserText.label: 'SNAP F04: IC Suppliers'
@ClientHandling.type: #CLIENT_INDEPENDENT

define table function ZSNAP_F72M_ICSupplier
	returns
{
	key Supplier: lifnr;
	IsIntercompany: abap.char (1);
	PartnerCompany: rcomp_d;
}
implemented by method
	zcsnap_f72m_icsupplier=>get_data;