@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F01: Is Overdue Values'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'IsOverdue'

define view entity ZSNAP_F01C_IsOverdue
	as select from t000 as main
{
	@EndUserText.label: 'Is Overdue'
	@ObjectModel.text.element: ['Description']
	key 'X' as IsOverdue,
	
	@EndUserText.label: 'Is Overdue Description'
	@Semantics.text: true
	cast ('Overdue' as abap.char (11)) as Description
}
where main.mandt = $session.client

union all select from t000 as main
{
	key '' as IsOverdue,
	cast ('Not Overdue' as abap.char (11)) as Description
}
where main.mandt = $session.client