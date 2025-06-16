@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZSNAP_F01G_P_BSEG_COM
	as select from ZSNAP_F01G_P_BSEG_COM1 as main
	
	left outer to one join t001 on main.bukrs = t001.bukrs
{
	key cast (main.bukrs as fis_bukrs preserving type) as bukrs,
	key cast (main.belnr as farp_belnr_d preserving type) as belnr,
	key cast (main.gjahr as fis_gjahr preserving type) as gjahr,
	key cast (main.buzei as fis_buzei preserving type) as buzei,
	cast (t001.ktopl as fis_ktopl preserving type) as ktopl,
	main.buzid,
	cast (main.augdt as fis_augdt preserving type) as augdt,
	cast (main.augcp as fis_augcp preserving type) as augcp,
	cast (main.augbl as fis_augbl preserving type) as augbl,
	cast (main.bschl as fis_bschl preserving type) as bschl,
	cast (main.koart as farp_koart preserving type) as koart,
	cast (main.umskz as fac_umskz preserving type) as umskz,
	cast (main.umsks as farp_umsks preserving type) as umsks,
	cast (main.gsber as fis_rbusa preserving type) as gsber,
	cast (main.pargb as fis_pargb preserving type) as pargb,
	main.tax_country,
	cast (main.mwskz as fis_mwskz preserving type) as mwskz,
	cast (main.qsskz as fac_qsskz preserving type) as qsskz,
	main.mwart,
	main.txgrp,
	cast (main.ktosl as fac_ktosl preserving type) as ktosl,
	main.valut,
	cast (main.zuonr as fis_zuonr preserving type) as zuonr,
	cast (main.sgtxt as farp_sgtxt preserving type) as sgtxt,
	cast (main.vbund as fis_rassc preserving type) as vbund,
	cast (main.bewar as fis_rmvct preserving type) as bewar,
	cast (main.altkt as fis_bilkt_ska1 preserving type) as altkt,
	main.fdlev,
	cast (main.kokrs as fis_kokrs preserving type) as kokrs,
	cast (main.kostl as fis_kostl preserving type) as kostl,
	cast (main.projn as ps_pspid) as projn,
	cast (main.aufnr as fis_aufnr preserving type) as aufnr,
	main.vbeln,
	main.vbel2,
	cast (main.posn2 as fis_posnr_va preserving type) as posn2,
	cast (main.eten2 as fis_etenr preserving type) as eten2,
	main.service_doc_type,
	main.service_doc_id,
	main.service_doc_item_id,
	cast (main.anln1 as fis_anln1 preserving type) as anln1,
	cast (main.anln2 as fis_anln2 preserving type) as anln2,
	main.anbwa,
	main.bzdat,
	main.pernr,
	cast (main.xumsw as fis_xumsw preserving type) as xumsw,
	main.xkres,
	cast (main.xopvw as fis_xopvw preserving type) as xopvw,
	main.xcpdd,
	main.xanet,
	cast (main.xskrl as fis_xskrl preserving type) as xskrl,
	cast (main.xauto as fis_xauto preserving type) as xauto,
	cast (main.xzahl as fis_xzahl preserving type) as xzahl,
	cast (main.saknr as fis_op_saknr preserving type) as saknr,
	cast (main.hkont as fis_racct preserving type) as hkont,
	cast (main.kunnr as kunnr preserving type) as kunnr,
	cast (main.lifnr as md_supplier preserving type) as lifnr,
	cast (main.filkd as fis_filkd preserving type) as filkd,
	cast (main.xbilk as fis_xbilk preserving type) as xbilk,
	cast (main.gvtyp as fis_gvtyp preserving type) as gvtyp,
	cast (main.hzuon as fins_hzuon preserving type) as hzuon,
	cast (main.zfbdt as fis_dzfbdt preserving type) as zfbdt,
	cast (main.zterm as farp_dzterm preserving type) as zterm,
	cast (main.zbd1t as farp_dzbd1t preserving type) as zbd1t,
	cast (main.zbd2t as farp_dzbd2t preserving type) as zbd2t,
	cast (main.zbd3t as farp_dzbd3t preserving type) as zbd3t,
	cast (main.zbd1p as dzbd1p_farp preserving type) as zbd1p,
	cast (main.zbd2p as dzbd2p_farp preserving type) as zbd2p,
	cast (main.zlsch as farp_schzw_bseg preserving type) as zlsch,
	cast (main.zlspr as fis_dzlspr preserving type) as zlspr,
	cast (main.zbfix as fis_dzbfix preserving type) as zbfix,
	cast (main.hbkid as farp_hbkid preserving type) as hbkid,
	cast (main.bvtyp as farp_bvtyp preserving type) as bvtyp,
	cast (main.mwsk1 as fis_mwsk1 preserving type) as mwsk1,
	cast (main.mwsk2 as fis_mwsk2 preserving type) as mwsk2,
	cast (main.mwsk3 as fis_mwsk3 preserving type) as mwsk3,
	cast (main.rebzg as fis_rebzg preserving type) as rebzg,
	cast (main.rebzj as fis_rebzj preserving type) as rebzj,
	cast (main.rebzz as fis_rebzz preserving type) as rebzz,
	cast (main.rebzt as farp_rebzt preserving type) as rebzt,
	main.lzbkz,
	cast (main.landl as fac_landl preserving type) as landl,
	cast (main.samnr as fis_samnr preserving type) as samnr,
	cast (main.wverw as farp_wverw preserving type) as wverw,
	cast (main.mschl as farp_mschl preserving type) as mschl,
	cast (main.mansp as fis_mansp preserving type) as mansp,
	cast (main.madat as farp_madat preserving type) as madat,
	cast (main.manst as farp_mahns_d preserving type) as manst,
	cast (main.maber as farp_maber preserving type) as maber,
	cast (main.qsznr as fis_wtcert preserving type) as qsznr,
	main.matnr,
	main.werks,
	cast (main.ebeln as fis_ebeln preserving type) as ebeln,
	cast (main.ebelp as fis_ebelp preserving type) as ebelp,
	main.zekkn,
	cast (main.elikz as fis_elikz preserving type) as elikz,
	main.vprsv,
	main.bwkey,
	main.bwtar,
	cast (main.stceg as fis_stceg preserving type) as stceg,
	main.egbld,
	cast (main.rstgr as fis_rstgr preserving type) as rstgr,
	cast (main.prctr as fis_prctr preserving type) as prctr,
	main.vname,
	main.recid,
	main.egrup,
	cast (main.vertt as fis_rantyp preserving type) as vertt,
	cast (main.vertn as fis_ranl preserving type) as vertn,
	cast (main.vbewa as farp_sbewart preserving type) as vbewa,
	cast (main.txjcd as fis_txjcd preserving type) as txjcd,
	cast (main.imkey as fis_imkey preserving type) as imkey,
	cast (main.dabrz as farp_dabrbez preserving type) as dabrz,
	cast (main.fipos as fis_fipos preserving type) as fipos,
	main.kstrg,
	main.nplnr,
	cast (main.aufpl as fis_ordintbillofops preserving type) as aufpl,
	cast (main.aplzl as fis_ordintbillofopitm preserving type) as aplzl,
	cast (main.projk as ps_posnr preserving type) as projk,
	main.paobjnr,
	main.etype,
	cast (main.xegdr as fis_xegdr preserving type) as xegdr,
	main.hrkft,
	cast (main.hwmet as fac_hwmet preserving type) as hwmet,
	cast (main.xragl as fis_xragl preserving type) as xragl,
	cast (main.uzawe as farp_uzawe preserving type) as uzawe,
	cast (main.lokkt as fis_altkt_skb1 preserving type) as lokkt,
	cast (main.fistl as farp_fistl preserving type) as fistl,
	main.geber,
	cast (main.pprct as fis_pprctr preserving type) as pprct,
	cast (main.xref1 as fis_xref1 preserving type) as xref1,
	cast (main.xref2 as fis_xref2 preserving type) as xref2,
	main.kblnr,
	main.kblpos,
	cast (main.xnegp as fis_xnegp preserving type) as xnegp,
	cast (main.rfzei as fis_rfzei_cc preserving type) as rfzei,
	cast (main.ccbtc as fis_ccbtc preserving type) as ccbtc,
	cast (main.kkber as farp_kkber preserving type) as kkber,
	cast (main.xref3 as fis_xref3 preserving type) as xref3,
	cast (main.dtws1 as fis_dtat16 preserving type) as dtws1,
	cast (main.dtws2 as fis_dtat17 preserving type) as dtws2,
	cast (main.dtws3 as fis_dtat18 preserving type) as dtws3,
	cast (main.dtws4 as fis_dtat19 preserving type) as dtws4,
	main.grirg,
	cast (main.xpypr as farp_xpypr preserving type) as xpypr,
	cast (main.kidno as farp_kidno preserving type) as kidno,
	cast (main.txdat as fis_txdat preserving type) as txdat,
	main.agzei,
	cast (main.bupla as farp_bupla preserving type) as bupla,
	cast (main.secco as fis_secco preserving type) as secco,
	main.lstar,
	cast (main.cession_kz as fis_cession_kz preserving type) as cession_kz,
	main.prznr,
	main.grant_nbr,
	cast (main.fkber_long as fm_farea preserving type) as fkber_long,
	cast (main.gmvkz as fis_gmvkzd preserving type) as gmvkz,
	main.measure,
	cast (main.auggj as fis_auggj preserving type) as auggj,
	cast (main.docln as fis_docln preserving type) as docln,
	main.segment,
	main.psegment,
	cast (main.pfkber as fis_sfkber preserving type) as pfkber,
	cast (main.hktid as fac_hktid preserving type) as hktid,
	main.kstar,
	main.taxps,
	cast (main.pays_prov as farp_payment_srv_provider preserving type) as pays_prov,
	cast (main.pays_tran as farp_fps_transaction preserving type) as pays_tran,
	cast (main.mndid as fis_sepa_mndid preserving type) as mndid,
	cast (main.awtyp as fis_awtyp preserving type) as awtyp,
	cast (main.awkey as fis_awkey preserving type) as awkey,
	cast (main.awsys as fis_awsys preserving type) as awsys,
	cast (main.posnr as fis_posnr_acc preserving type) as posnr,
	cast (main.h_monat as fins_fiscalperiod preserving type) as h_monat,
	cast (main.h_bstat as fis_bstat preserving type) as h_bstat,
	cast (main.h_budat as fis_budat preserving type) as h_budat,
	cast (main.h_bldat as fis_bldat preserving type) as h_bldat,
	cast (main.h_blart as farp_blart preserving type) as h_blart,
	cast (main.netdt as farp_netdt preserving type) as netdt,
	cast (main.sk1dt as farp_sk1dt preserving type) as sk1dt,
	cast (main.sk2dt as farp_sk2dt preserving type) as sk2dt,
	cast (main.gkont as fis_gkont preserving type) as gkont,
	cast (main.gkart as farp_gkoar preserving type) as gkart,
	cast (case main.gkart
		when 'D' then ' '
		when 'K' then ' '
		else t001.ktopl
	end as fis_offsettingktopl) as gktopl,
	cast (main.pgeber as bp_p_geber preserving type) as pgeber,
	main.pgrant_nbr,
	main.budget_pd,
	main.pbudget_pd,
	main.j_1tpbupl,
	main.glo_ref1,
	cast (main.re_bukrs as fis_re_bukrs preserving type) as re_bukrs,
	cast (main.re_account as fis_re_account preserving type) as re_account,
	main.bdgt_account_cocode,
	main.bdgt_account,
	main.gst_part,
	main.plc_sup,
	main.hsn_sac,
	cast (main.h_hwaer as fis_hwaer preserving type) as h_hwaer,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	cast (main.dmbtr_shl as fis_hsl preserving type) as dmbtr_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	main.txbhw_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	cast (main.mwsts_shl as fis_mwsts preserving type) as mwsts_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	cast (main.hwbas_shl as hwbas_shl preserving type) as hwbas_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	cast (main.bdiff_shl as fis_bdiff preserving type) as bdiff_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	cast (main.sknto_shl as fis_sknto preserving type) as sknto_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	cast (main.dmbt1_shl as fis_txw_dmbt1 preserving type) as dmbt1_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	cast (main.dmbt2_shl as fis_txw_dmbt2 preserving type) as dmbt2_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	cast (main.dmbt2_shl as fis_txw_dmbt3 preserving type) as dmbt3_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	cast (main.rewrt_shl as fis_reewr preserving type) as rewrt_shl,
	cast (main.h_waers as fis_rwcur) as h_waers,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.wrbtr_shl as fis_wsl preserving type) as wrbtr_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.txbfw_shl as txbfw_shl preserving type) as txbfw_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.wmwst_shl as wmwst_shl preserving type) as wmwst_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.fwbas_shl as fwbas_shl preserving type) as fwbas_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.qsshb_shl as fis_qsshb preserving type) as qsshb_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.fdwbt_shl as fis_fdwbt preserving type) as fdwbt_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.skfbt_shl as fis_skfbt preserving type) as skfbt_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.wskto_shl as fis_wskto preserving type) as wskto_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.nebtr_shl as fis_nebtr preserving type) as nebtr_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.qbshb_shl as fis_qbshb preserving type) as qbshb_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.qsfbt_shl as fis_qsfbt preserving type) as qsfbt_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	cast (main.rewwr_shl as fis_refwr preserving type) as rewwr_shl,
	cast (main.pswsl as fis_rtcur) as pswsl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'pswsl'
	cast (main.pswbt_shl as fis_tsl preserving type) as pswbt_shl,
	cast (main.h_hwae2 as fis_hwae2) as h_hwae2,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae2'
	cast (main.bdif2_shl as fis_bdif2 preserving type) as bdif2_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae2'
	cast (main.dmbe2_shl as fis_dmbe2 preserving type) as dmbe2_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae2'
	cast (main.mwst2_shl as fis_mwst2 preserving type) as mwst2_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae2'
	main.txbh2_shl,
	cast (main.h_hwae3 as fis_hwae3) as h_hwae3,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae3'
	cast (main.dmbe3_shl as fis_dmbe3 preserving type) as dmbe3_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae3'
	cast (main.mwst3_shl as fis_mwst3 preserving type) as mwst3_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae3'
	cast (main.bdif3_shl as fis_bdif3 preserving type) as bdif3_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae3'
	main.txbh3_shl,
	cast (main.pycur as farp_pycur) as pycur,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'pycur'
	cast (main.pyamt_shl as fis_pyamt preserving type) as pyamt_shl,
	cast (main.t014_waers as fis_kkbwr) as t014_waers,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 't014_waers'
	cast (main.absbt_shl as absbt_farp preserving type) as absbt_shl,
	main.meins,
	
	@DefaultAggregation: #SUM
	@Semantics.quantity.unitOfMeasure: 'meins'
	cast (cast (main.menge as abap.quan (23, 3)) as quan1_12) as menge,
	main.erfme,
	
	@DefaultAggregation: #SUM
	@Semantics.quantity.unitOfMeasure: 'meins'
	cast (cast (main.erfmg as abap.quan (23, 3)) as fis_quantityinentryunit) as erfmg,
	main.bprme,
	
	@DefaultAggregation: #SUM
	@Semantics.quantity.unitOfMeasure: 'meins'
	cast (cast (main.bpmng as abap.quan (23, 3)) as fis_bpmng_long) as bpmng,
	main.peinh,
	cast (main.shkzg_calc as fis_shkzg preserving type) as shkzg,
	main.nbritm
}
where (main.h_bstat <> 'D')
	and (main.h_bstat <> 'M')