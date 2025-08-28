@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: Aging Bucket Text Labels'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F01M_NetDueIntervalT	
	with parameters
		P_NetDueInterval1InDays: abap.int4,
		P_NetDueInterval2InDays: abap.int4,
		P_NetDueInterval3InDays: abap.int4,
		P_NetDueInterval4InDays: abap.int4
	
	as select from ZSNAP_F01M_NetDueIntervalT0 as main
{
	key main.NetDueInterval,
	main.NetDueIntervalText
}
where $parameters.P_NetDueInterval1InDays = 0

union all select from ZSNAP_F01M_NetDueIntervalT1 (P_NetDueInterval1InDays: $parameters.P_NetDueInterval1InDays) as main
{
	key main.NetDueInterval,
	main.NetDueIntervalText
}
where $parameters.P_NetDueInterval1InDays <> 0
	and $parameters.P_NetDueInterval2InDays = 0

union all select from ZSNAP_F01M_NetDueIntervalT2 (P_NetDueInterval1InDays: $parameters.P_NetDueInterval1InDays, P_NetDueInterval2InDays: $parameters.P_NetDueInterval2InDays) as main
{
	key main.NetDueInterval,
	main.NetDueIntervalText
}
where $parameters.P_NetDueInterval2InDays <> 0
	and $parameters.P_NetDueInterval3InDays = 0

union all select from ZSNAP_F01M_NetDueIntervalT3 (P_NetDueInterval1InDays: $parameters.P_NetDueInterval1InDays, P_NetDueInterval2InDays: $parameters.P_NetDueInterval2InDays, P_NetDueInterval3InDays: $parameters.P_NetDueInterval3InDays) as main
{
	key main.NetDueInterval,
	main.NetDueIntervalText
}
where $parameters.P_NetDueInterval3InDays <> 0
	and $parameters.P_NetDueInterval4InDays = 0

union all select from ZSNAP_F01M_NetDueIntervalT4 (P_NetDueInterval1InDays: $parameters.P_NetDueInterval1InDays, P_NetDueInterval2InDays: $parameters.P_NetDueInterval2InDays, P_NetDueInterval3InDays: $parameters.P_NetDueInterval3InDays, P_NetDueInterval4InDays: $parameters.P_NetDueInterval4InDays) as main
{
	key main.NetDueInterval,
	main.NetDueIntervalText
}
where $parameters.P_NetDueInterval4InDays <> 0