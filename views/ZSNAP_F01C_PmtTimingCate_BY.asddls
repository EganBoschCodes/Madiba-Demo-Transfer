@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F01: Payment Timing Category Values'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'PaymentTimingCategory'

define view entity ZSNAP_F01C_PmtTimingCate_BY
	as select from t000 as main
{
	@EndUserText.label: 'Payment Timing Category'
	@ObjectModel.text.element: ['Description']
	key '' as PaymentTimingCategory,
	
	@EndUserText.label: 'Payment Timing Category Description'
	@Semantics.text: true
	cast ('Not Yet Paid' as abap.char(30)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key 'O' as PaymentTimingCategory,
	cast ('Paid On-Time' as abap.char(30)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key 'E' as PaymentTimingCategory,
	cast ('Paid Early' as abap.char(30)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key 'L' as PaymentTimingCategory,
	cast ('Paid Late' as abap.char(30)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key 'X' as PaymentTimingCategory,
	cast ('Not Applicable, Check Invoices' as abap.char(30)) as Description
}
where main.mandt = $session.client