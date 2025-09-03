@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: 1 Bucket Aging Labels'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F01M_NetDueIntervalT1	
	with parameters
		P_NetDueInterval1InDays: abap.int4
	
	as select from ZSNAP_F01G_SingleRow as main
{
	key cast (-2 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('F. More than', concat_with_space (cast ($parameters.P_NetDueInterval1InDays as abap.char(20)), 'Overdue', 1), 1) as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (-1 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('E. Less than ', concat_with_space (cast ($parameters.P_NetDueInterval1InDays as abap.char(20)), 'Overdue', 1), 1) as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (0 as abap.dec(2, 0)) as NetDueInterval,
	'D. Due on Key Date' as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (1 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('C. Due within', cast ($parameters.P_NetDueInterval1InDays as abap.char(20)), 1) as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (2 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('B. Due in over', cast ($parameters.P_NetDueInterval1InDays as abap.char(20)), 1) as NetDueIntervalText
}