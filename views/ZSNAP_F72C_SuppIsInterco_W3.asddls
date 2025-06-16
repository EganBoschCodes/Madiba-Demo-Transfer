@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F72: Is Intercompany Supplier Values'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'SupplierIsIntercompany'

define view entity ZSNAP_F72C_SuppIsInterco_W3
	as select from t000 as main
{
	@EndUserText.label: 'Is Intercompany Supplier'
	@ObjectModel.text.element: ['Description']
	key 'X' as SupplierIsIntercompany,
	
	@EndUserText.label: 'Is Intercompany Supplier Description'
	@Semantics.text: true
	cast ('Intercompany' as abap.char (12)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key '' as SupplierIsIntercompany,
	cast ('External' as abap.char (12)) as Description
}
where main.mandt = $session.client