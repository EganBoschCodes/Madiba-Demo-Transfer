@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F01: Signage Values'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'Signage'

define view entity ZSNAP_F01C_Signage
	as select from t000 as main
{
	@EndUserText.label: 'Signage'
	@ObjectModel.text.element: ['Description']
	key 'A' as Signage,
	
	@EndUserText.label: 'Signage Description'
	@Semantics.text: true
	cast ('Payments Are Positive' as abap.char (21)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key 'R' as Signage,
	cast ('Open AP is Positive' as abap.char (21)) as Description
}
where main.mandt = $session.client