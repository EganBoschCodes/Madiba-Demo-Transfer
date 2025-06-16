@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZSNAP_F70G_P_BSEG_COM1
	as select from bseg as main
	
	left outer to one join t014 on main.kkber = t014.kkber
{
	key main.bukrs,
	key main.belnr,
	key main.gjahr,
	key main.buzei,
	main.augdt,
	main.augbl,
	main.zuonr,
	main.sgtxt,
	main.xauto,
	main.xzahl,
	main.zfbdt,
	main.zterm,
	main.ebeln,
	main.ebelp,
	main.rstgr,
	main.xref1,
	main.xref2,
	main.xref3,
	main.auggj,
	main.h_bstat
}