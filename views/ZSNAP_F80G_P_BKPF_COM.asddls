@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'P: BKPF'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F80G_P_BKPF_COM
	as select from bkpf as main
{
	key cast (main.bukrs as fis_bukrs preserving type) as bukrs,
	key cast (main.belnr as farp_belnr_d preserving type) as belnr,
	key cast (main.gjahr as fis_gjahr_no_conv preserving type) as gjahr,
	cast (main.usnam as fis_usnam preserving type) as usnam,
	main.tcode,
	cast (main.bvorg as fac_bvorg preserving type) as bvorg,
	cast (main.xblnr as fis_xblnr1 preserving type) as xblnr,
	cast (main.stblg as fis_stblg preserving type) as stblg,
	cast (main.stjah as fis_stjah_no_conv preserving type) as stjah,
	main.bktxt
}