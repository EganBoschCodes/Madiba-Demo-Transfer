@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'P: GL Account in Default Language Text'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F80G_P_GLAcctInDfl_BC
	as select from skat as main
{
	key main.ktopl,
	key main.saknr,
	key main.spras as Language,
	main.txt20,
	main.txt50,
	main.last_changed_ts
}

union all select from t004 as main
	
	inner join skat as default on main.ktopl = default.ktopl and main.dspra = default.spras
	left outer to one join skat as logon on logon.ktopl = main.ktopl and logon.saknr = default.saknr and logon.spras = $session.system_language
{
	key main.ktopl,
	key default.saknr,
	key $session.system_language as Language,
	default.txt20,
	default.txt50,
	default.last_changed_ts
}
where logon.txt20 is null