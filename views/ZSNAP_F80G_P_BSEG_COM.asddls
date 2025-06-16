@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZSNAP_F80G_P_BSEG_COM
	as select from ZSNAP_F80G_P_BSEG_COM1 as main
	
	left outer to one join t001 on main.bukrs = t001.bukrs
{
	key cast (main.bukrs as fis_bukrs preserving type) as bukrs,
	key cast (main.belnr as farp_belnr_d preserving type) as belnr,
	key cast (main.gjahr as fis_gjahr preserving type) as gjahr,
	key cast (main.buzei as fis_buzei preserving type) as buzei,
	cast (main.sgtxt as farp_sgtxt preserving type) as sgtxt,
	cast (main.xauto as fis_xauto preserving type) as xauto,
	cast (main.xzahl as fis_xzahl preserving type) as xzahl,
	cast (main.zfbdt as fis_dzfbdt preserving type) as zfbdt
}
where (main.h_bstat <> 'D')
	and (main.h_bstat <> 'M')