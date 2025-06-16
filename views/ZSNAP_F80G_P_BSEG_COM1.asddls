@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZSNAP_F80G_P_BSEG_COM1
	as select from bseg as main
	
	left outer to one join t014 on main.kkber = t014.kkber
{
	key main.bukrs,
	key main.belnr,
	key main.gjahr,
	key main.buzei,
	main.sgtxt,
	main.xauto,
	main.xzahl,
	main.zfbdt,
	main.h_bstat
}