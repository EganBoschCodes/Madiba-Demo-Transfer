@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F01: Is Cleared Flag Values'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'IsCleared'

define view entity ZSNAP_F01C_IsCleared
	as select from t000 as main
{
	@EndUserText.label: 'Is Cleared Flag'
	@ObjectModel.text.element: ['Description']
	key 'C' as IsCleared,
	
	@EndUserText.label: 'Is Cleared Flag Description'
	@Semantics.text: true
	cast ('Cleared' as abap.char(7)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key 'O' as IsCleared,
	cast ('Open' as abap.char(7)) as Description
}
where main.mandt = $session.client