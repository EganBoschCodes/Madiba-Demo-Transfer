@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZSNAP_F70G_P_BSEG_COM
	as select from ZSNAP_F70G_P_BSEG_COM1 as main
	
	left outer to one join t001 on main.bukrs = t001.bukrs
{
	key cast (main.bukrs as fis_bukrs preserving type) as bukrs,
	key cast (main.belnr as farp_belnr_d preserving type) as belnr,
	key cast (main.gjahr as fis_gjahr preserving type) as gjahr,
	key cast (main.buzei as fis_buzei preserving type) as buzei,
	cast (main.augdt as fis_augdt preserving type) as augdt,
	cast (main.augbl as fis_augbl preserving type) as augbl,
	cast (main.zuonr as fis_zuonr preserving type) as zuonr,
	cast (main.sgtxt as farp_sgtxt preserving type) as sgtxt,
	cast (main.xauto as fis_xauto preserving type) as xauto,
	cast (main.xzahl as fis_xzahl preserving type) as xzahl,
	cast (main.zfbdt as fis_dzfbdt preserving type) as zfbdt,
	cast (main.zterm as farp_dzterm preserving type) as zterm,
	cast (main.ebeln as fis_ebeln preserving type) as ebeln,
	cast (main.ebelp as fis_ebelp preserving type) as ebelp,
	cast (main.rstgr as fis_rstgr preserving type) as rstgr,
	cast (main.xref1 as fis_xref1 preserving type) as xref1,
	cast (main.xref2 as fis_xref2 preserving type) as xref2,
	cast (main.xref3 as fis_xref3 preserving type) as xref3,
	cast (main.auggj as fis_auggj preserving type) as auggj
}
where (main.h_bstat <> 'D')
	and (main.h_bstat <> 'M')