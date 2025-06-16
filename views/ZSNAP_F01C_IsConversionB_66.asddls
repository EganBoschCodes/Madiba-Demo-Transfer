@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F01: Currency Conversion Error Flag Values'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'IsConversionBroken'

define view entity ZSNAP_F01C_IsConversionB_66
	as select from t000 as main
{
	@EndUserText.label: 'Currency Conversion Error Flag'
	@ObjectModel.text.element: ['Description']
	key 'X' as IsConversionBroken,
	
	@EndUserText.label: 'Currency Conversion Error Flag Description'
	@Semantics.text: true
	cast ('ERROR' as abap.char (5)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key '' as IsConversionBroken,
	cast ('' as abap.char (5)) as Description
}
where main.mandt = $session.client