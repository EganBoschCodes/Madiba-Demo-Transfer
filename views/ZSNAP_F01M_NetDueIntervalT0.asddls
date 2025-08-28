@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: 0 Buckets Aging Labels'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F01M_NetDueIntervalT0
	as select from ZSNAP_F01G_SingleRow as main
{
	key cast (-1 as abap.dec(2, 0)) as NetDueInterval,
	cast ('D. Overdue' as abap.char(40)) as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (0 as abap.dec(2, 0)) as NetDueInterval,
	'C. Due on Key Date' as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (1 as abap.dec(2, 0)) as NetDueInterval,
	'B. Not Overdue' as NetDueIntervalText
}