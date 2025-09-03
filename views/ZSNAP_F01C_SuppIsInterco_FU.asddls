@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F01: Supplier Is Intercompany Values'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'SupplierIsIntercompany'

define view entity ZSNAP_F01C_SuppIsInterco_FU
	as select from t000 as main
{
	@EndUserText.label: 'Supplier Is Intercompany'
	@ObjectModel.text.element: ['Description']
	key 'X' as SupplierIsIntercompany,
	
	@EndUserText.label: 'Supplier Is Intercompany Description'
	@Semantics.text: true
	cast ('Intercompany' as abap.char(12)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key '' as SupplierIsIntercompany,
	cast ('External' as abap.char(12)) as Description
}
where main.mandt = $session.client