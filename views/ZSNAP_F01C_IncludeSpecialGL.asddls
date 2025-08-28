@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F01: Include Special GL Transactions Values'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'IncludeSpecialGL'

define view entity ZSNAP_F01C_IncludeSpecialGL
	as select from t000 as main
{
	@EndUserText.label: 'Include Special GL Transactions'
	@ObjectModel.text.element: ['Description']
	key 'Y' as IncludeSpecialGL,
	
	@EndUserText.label: 'Include Special GL Transactions Description'
	@Semantics.text: true
	cast ('Yes' as abap.char(3)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key 'N' as IncludeSpecialGL,
	cast ('No' as abap.char(3)) as Description
}
where main.mandt = $session.client