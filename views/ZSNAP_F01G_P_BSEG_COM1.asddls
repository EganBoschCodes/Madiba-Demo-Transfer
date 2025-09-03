@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZSNAP_F01G_P_BSEG_COM1
	as select from bseg as main
	
	left outer to one join t014 on main.kkber = t014.kkber
{
	key main.bukrs,
	key main.belnr,
	key main.gjahr,
	key main.buzei,
	main.buzid,
	main.augdt,
	main.augcp,
	main.augbl,
	main.bschl,
	main.koart,
	main.umskz,
	main.umsks,
	main.gsber,
	main.pargb,
	main.tax_country,
	main.mwskz,
	main.qsskz,
	main.mwart,
	main.txgrp,
	main.ktosl,
	main.valut,
	main.zuonr,
	main.sgtxt,
	main.vbund,
	main.bewar,
	main.altkt,
	main.fdlev,
	main.kokrs,
	main.kostl,
	main.projn,
	main.aufnr,
	main.vbeln,
	main.vbel2,
	main.posn2,
	main.eten2,
	main.service_doc_type,
	main.service_doc_id,
	main.service_doc_item_id,
	main.anln1,
	main.anln2,
	main.anbwa,
	main.bzdat,
	main.pernr,
	main.xumsw,
	main.xkres,
	main.xopvw,
	main.xcpdd,
	main.xanet,
	main.xskrl,
	main.xauto,
	main.xzahl,
	main.saknr,
	main.hkont,
	main.kunnr,
	main.lifnr,
	main.filkd,
	main.xbilk,
	main.gvtyp,
	main.hzuon,
	main.zfbdt,
	main.zterm,
	main.zbd1t,
	main.zbd2t,
	main.zbd3t,
	main.zbd1p,
	main.zbd2p,
	main.zlsch,
	main.zlspr,
	main.zbfix,
	main.hbkid,
	main.bvtyp,
	main.mwsk1,
	main.mwsk2,
	main.mwsk3,
	main.rebzg,
	main.rebzj,
	main.rebzz,
	main.rebzt,
	main.lzbkz,
	main.landl,
	main.samnr,
	main.wverw,
	main.mschl,
	main.mansp,
	main.madat,
	main.manst,
	main.maber,
	main.qsznr,
	main.matnr,
	main.werks,
	main.ebeln,
	main.ebelp,
	main.zekkn,
	main.elikz,
	main.vprsv,
	main.bwkey,
	main.bwtar,
	main.stceg,
	main.egbld,
	main.rstgr,
	main.prctr,
	main.vname,
	main.recid,
	main.egrup,
	main.vertt,
	main.vertn,
	main.vbewa,
	main.txjcd,
	main.imkey,
	main.dabrz,
	main.fipos,
	main.kstrg,
	main.nplnr,
	main.aufpl,
	main.aplzl,
	main.projk,
	main.paobjnr,
	main.etype,
	main.xegdr,
	main.hrkft,
	main.hwmet,
	main.xragl,
	main.uzawe,
	main.lokkt,
	main.fistl,
	main.geber,
	main.pprct,
	main.xref1,
	main.xref2,
	main.kblnr,
	main.kblpos,
	main.xnegp,
	main.rfzei,
	main.ccbtc,
	main.kkber,
	main.xref3,
	main.dtws1,
	main.dtws2,
	main.dtws3,
	main.dtws4,
	main.grirg,
	main.xpypr,
	main.kidno,
	main.txdat,
	main.agzei,
	main.bupla,
	main.secco,
	main.lstar,
	main.cession_kz,
	main.prznr,
	main.grant_nbr,
	main.fkber_long,
	main.gmvkz,
	main.measure,
	main.auggj,
	main.docln,
	main.segment,
	main.psegment,
	main.pfkber,
	main.hktid,
	main.kstar,
	main.taxps,
	main.pays_prov,
	main.pays_tran,
	main.mndid,
	main.awtyp,
	main.awkey,
	main.awsys,
	main.posnr,
	cast (concat ('0', main.h_monat) as abap.numc(3)) as h_monat,
	main.h_bstat,
	main.h_budat,
	main.h_bldat,
	main.h_blart,
	main.netdt,
	main.sk1dt,
	main.sk2dt,
	main.gkont,
	main.gkart,
	main.pgeber,
	main.pgrant_nbr,
	main.budget_pd,
	main.pbudget_pd,
	main.j_1tpbupl,
	main.glo_ref1,
	main.re_bukrs,
	main.re_account,
	main.bdgt_account_cocode,
	main.bdgt_account,
	main.h_hwaer,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	case main.shkzg
		when 'H' then cast (-main.dmbtr as abap.curr(23, 2))
		when 'S' then cast (main.dmbtr as abap.curr(23, 2))
		else cast (main.dmbtr as abap.curr(23, 2))
	end as dmbtr_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	case main.shkzg
		when 'H' then cast (-main.txbhw as abap.curr(23, 2))
		when 'S' then cast (main.txbhw as abap.curr(23, 2))
		else cast (main.txbhw as abap.curr(23, 2))
	end as txbhw_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	case main.shkzg
		when 'H' then cast (-main.mwsts as abap.curr(23, 2))
		when 'S' then cast (main.mwsts as abap.curr(23, 2))
		else cast (main.mwsts as abap.curr(23, 2))
	end as mwsts_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	case main.shkzg
		when 'H' then cast (-main.hwbas as abap.curr(23, 2))
		when 'S' then cast (main.hwbas as abap.curr(23, 2))
		else cast (main.hwbas as abap.curr(23, 2))
	end as hwbas_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	case main.shkzg
		when 'H' then cast (-main.bdiff as abap.curr(23, 2))
		when 'S' then cast (main.bdiff as abap.curr(23, 2))
		else cast (main.bdiff as abap.curr(23, 2))
	end as bdiff_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	case main.shkzg
		when 'H' then cast (-main.sknto as abap.curr(23, 2))
		when 'S' then cast (main.sknto as abap.curr(23, 2))
		else cast (main.sknto as abap.curr(23, 2))
	end as sknto_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	case main.shkzg
		when 'H' then cast (-main.dmbt1 as abap.curr(23, 2))
		when 'S' then cast (main.dmbt1 as abap.curr(23, 2))
		else cast (main.dmbt1 as abap.curr(23, 2))
	end as dmbt1_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	case main.shkzg
		when 'H' then cast (-main.dmbt2 as abap.curr(23, 2))
		when 'S' then cast (main.dmbt2 as abap.curr(23, 2))
		else cast (main.dmbt2 as abap.curr(23, 2))
	end as dmbt2_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwaer'
	case main.shkzg
		when 'H' then cast (-main.rewrt as abap.curr(23, 2))
		when 'S' then cast (main.rewrt as abap.curr(23, 2))
		else cast (main.rewrt as abap.curr(23, 2))
	end as rewrt_shl,
	main.h_waers,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.wrbtr as abap.curr(23, 2))
		when 'S' then cast (main.wrbtr as abap.curr(23, 2))
		else cast (main.wrbtr as abap.curr(23, 2))
	end as wrbtr_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.txbfw as abap.curr(23, 2))
		when 'S' then cast (main.txbfw as abap.curr(23, 2))
		else cast (main.txbfw as abap.curr(23, 2))
	end as txbfw_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.wmwst as abap.curr(23, 2))
		when 'S' then cast (main.wmwst as abap.curr(23, 2))
		else cast (main.wmwst as abap.curr(23, 2))
	end as wmwst_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.fwbas as abap.curr(23, 2))
		when 'S' then cast (main.fwbas as abap.curr(23, 2))
		else cast (main.fwbas as abap.curr(23, 2))
	end as fwbas_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.qsshb as abap.curr(23, 2))
		when 'S' then cast (main.qsshb as abap.curr(23, 2))
		else cast (main.qsshb as abap.curr(23, 2))
	end as qsshb_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.fdwbt as abap.curr(23, 2))
		when 'S' then cast (main.fdwbt as abap.curr(23, 2))
		else cast (main.fdwbt as abap.curr(23, 2))
	end as fdwbt_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.skfbt as abap.curr(23, 2))
		when 'S' then cast (main.skfbt as abap.curr(23, 2))
		else cast (main.skfbt as abap.curr(23, 2))
	end as skfbt_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.wskto as abap.curr(23, 2))
		when 'S' then cast (main.wskto as abap.curr(23, 2))
		else cast (main.wskto as abap.curr(23, 2))
	end as wskto_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.nebtr as abap.curr(23, 2))
		when 'S' then cast (main.nebtr as abap.curr(23, 2))
		else cast (main.nebtr as abap.curr(23, 2))
	end as nebtr_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.qbshb as abap.curr(23, 2))
		when 'S' then cast (main.qbshb as abap.curr(23, 2))
		else cast (main.qbshb as abap.curr(23, 2))
	end as qbshb_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.qsfbt as abap.curr(23, 2))
		when 'S' then cast (main.qsfbt as abap.curr(23, 2))
		else cast (main.qsfbt as abap.curr(23, 2))
	end as qsfbt_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_waers'
	case main.shkzg
		when 'H' then cast (-main.rewwr as abap.curr(23, 2))
		when 'S' then cast (main.rewwr as abap.curr(23, 2))
		else cast (main.rewwr as abap.curr(23, 2))
	end as rewwr_shl,
	main.pswsl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'pswsl'
	case main.shkzg
		when 'H' then cast (-main.pswbt as abap.curr(23, 2))
		when 'S' then cast (main.pswbt as abap.curr(23, 2))
		else cast (main.pswbt as abap.curr(23, 2))
	end as pswbt_shl,
	main.h_hwae2,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae2'
	case main.shkzg
		when 'H' then cast (-main.bdif2 as abap.curr(23, 2))
		when 'S' then cast (main.bdif2 as abap.curr(23, 2))
		else cast (main.bdif2 as abap.curr(23, 2))
	end as bdif2_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae2'
	case main.shkzg
		when 'H' then cast (-main.dmbe2 as abap.curr(23, 2))
		when 'S' then cast (main.dmbe2 as abap.curr(23, 2))
		else cast (main.dmbe2 as abap.curr(23, 2))
	end as dmbe2_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae2'
	case main.shkzg
		when 'H' then cast (-main.mwst2 as abap.curr(23, 2))
		when 'S' then cast (main.mwst2 as abap.curr(23, 2))
		else cast (main.mwst2 as abap.curr(23, 2))
	end as mwst2_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae2'
	case main.shkzg
		when 'H' then cast (-main.txbh2 as abap.curr(23, 2))
		when 'S' then cast (main.txbh2 as abap.curr(23, 2))
		else cast (main.txbh2 as abap.curr(23, 2))
	end as txbh2_shl,
	main.h_hwae3,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae3'
	case main.shkzg
		when 'H' then cast (-main.dmbe3 as abap.curr(23, 2))
		when 'S' then cast (main.dmbe3 as abap.curr(23, 2))
		else cast (main.dmbe3 as abap.curr(23, 2))
	end as dmbe3_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae3'
	case main.shkzg
		when 'H' then cast (-main.mwst3 as abap.curr(23, 2))
		when 'S' then cast (main.mwst3 as abap.curr(23, 2))
		else cast (main.mwst3 as abap.curr(23, 2))
	end as mwst3_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae3'
	case main.shkzg
		when 'H' then cast (-main.bdif3 as abap.curr(23, 2))
		when 'S' then cast (main.bdif3 as abap.curr(23, 2))
		else cast (main.bdif3 as abap.curr(23, 2))
	end as bdif3_shl,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'h_hwae3'
	case main.shkzg
		when 'H' then cast (-main.txbh3 as abap.curr(23, 2))
		when 'S' then cast (main.txbh3 as abap.curr(23, 2))
		else cast (main.txbh3 as abap.curr(23, 2))
	end as txbh3_shl,
	main.pycur,
	
	@DefaultAggregation: #SUM
	@Semantics.amount.currencyCode: 'pycur'
	case main.shkzg
		when 'H' then cast (-main.pyamt as abap.curr(23, 2))
		when 'S' then cast (main.pyamt as abap.curr(23, 2))
		else cast (main.pyamt as abap.curr(23, 2))
	end as pyamt_shl,
	t014.waers as t014_waers,
	
	@Semantics.amount.currencyCode: 't014_waers'
	case main.shkzg
		when 'H' then cast (-main.absbt as abap.curr(23, 2))
		when 'S' then cast (main.absbt as abap.curr(23, 2))
		else cast (main.absbt as abap.curr(23, 2))
	end as absbt_shl,
	main.meins,
	
	@DefaultAggregation: #SUM
	@Semantics.quantity.unitOfMeasure: 'meins'
	main.menge,
	main.erfme,
	
	@DefaultAggregation: #SUM
	@Semantics.quantity.unitOfMeasure: 'erfme'
	main.erfmg,
	main.bprme,
	
	@DefaultAggregation: #SUM
	@Semantics.quantity.unitOfMeasure: 'bprme'
	main.bpmng,
	main.peinh,
	case main.xnegp
		when 'X' then case main.shkzg
			when 'S' then 'H'
			when 'H' then 'S'
		end
		when ' ' then main.shkzg
		else main.shkzg
	end as shkzg_calc,
	
	@DefaultAggregation: #SUM
	cast (cast (1 as abap.dec(12, 0)) as fis_nbritm) as nbritm,
	main.gst_part,
	main.plc_sup,
	main.hsn_sac
}