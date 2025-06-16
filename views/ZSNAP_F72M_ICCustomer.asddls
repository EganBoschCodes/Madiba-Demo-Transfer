@EndUserText.label: 'SNAP F04: IC Customers'
@ClientHandling.type: #CLIENT_INDEPENDENT

define table function ZSNAP_F72M_ICCustomer
	returns
{
	key Customer: kunnr;
	IsIntercompany: abap.char (1);
	PartnerCompany: rcomp_d;
}
implemented by method
	zcsnap_f72m_iccustomer=>get_data;