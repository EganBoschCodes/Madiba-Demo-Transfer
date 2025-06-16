@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F01: Is Payment Indicator Values'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'IsUsedInPaymentTransaction'

define view entity ZSNAP_F01C_IsUsedInPmtTr_BA
	as select from t000 as main
{
	@EndUserText.label: 'Is Payment Indicator'
	@ObjectModel.text.element: ['Description']
	key 'X' as IsUsedInPaymentTransaction,
	
	@EndUserText.label: 'Is Payment Indicator Description'
	@Semantics.text: true
	cast ('Payment' as abap.char (11)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key '' as IsUsedInPaymentTransaction,
	cast ('Non-Payment' as abap.char (11)) as Description
}
where main.mandt = $session.client