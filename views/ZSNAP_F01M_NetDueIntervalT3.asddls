@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: 3 Buckets Aging Labels'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F01M_NetDueIntervalT3	
	with parameters
		P_NetDueInterval1InDays: abap.int4,
		P_NetDueInterval2InDays: abap.int4,
		P_NetDueInterval3InDays: abap.int4
	
	as select from ZSNAP_F01G_SingleRow as main
{
	key cast (-4 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('J. More than', concat_with_space (cast ($parameters.P_NetDueInterval3InDays as abap.char(20)), 'Overdue', 1), 1) as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (-3 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('I. Overdue by', concat_with_space (concat_with_space (cast ($parameters.P_NetDueInterval2InDays + 1 as abap.char(20)), '-', 1), cast ($parameters.P_NetDueInterval3InDays as abap.char(20)), 1), 1) as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (-2 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('H. Overdue by', concat_with_space (concat_with_space (cast ($parameters.P_NetDueInterval1InDays + 1 as abap.char(20)), '-', 1), cast ($parameters.P_NetDueInterval2InDays as abap.char(20)), 1), 1) as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (-1 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('G. Less than', concat_with_space (cast ($parameters.P_NetDueInterval1InDays as abap.char(20)), 'Overdue', 1), 1) as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (0 as abap.dec(2, 0)) as NetDueInterval,
	'F. Due on Key Date' as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (1 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('E. Due within', cast ($parameters.P_NetDueInterval1InDays as abap.char(20)), 1) as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (2 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('D. Due between', concat_with_space (concat_with_space (cast ($parameters.P_NetDueInterval1InDays + 1 as abap.char(20)), '-', 1), cast ($parameters.P_NetDueInterval2InDays as abap.char(20)), 1), 1) as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (3 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('C. Due between', concat_with_space (concat_with_space (cast ($parameters.P_NetDueInterval2InDays + 1 as abap.char(20)), '-', 1), cast ($parameters.P_NetDueInterval3InDays as abap.char(20)), 1), 1) as NetDueIntervalText
}

union all select from ZSNAP_F01G_SingleRow as main
{
	key cast (4 as abap.dec(2, 0)) as NetDueInterval,
	concat_with_space ('B. Due in over', cast ($parameters.P_NetDueInterval3InDays as abap.char(20)), 1) as NetDueIntervalText
}