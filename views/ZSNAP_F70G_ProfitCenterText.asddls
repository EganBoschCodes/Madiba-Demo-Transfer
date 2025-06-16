@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Profit Center - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'ProfitCenter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_ProfitCenterText
	as select from cepct as main
	
	inner join cepc as md on main.prctr = md.prctr and main.kokrs = md.kokrs and main.datbi = md.datbi
	
	association [0..1] to ZSNAP_F70G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
{
	@Semantics.language: true
	key main.spras as Language,
	
	@ObjectModel.foreignKey.association: '_ControllingArea'
	key main.kokrs as ControllingArea,
	
	@ObjectModel.text.element: ['ProfitCenterLongName']
	key main.prctr as ProfitCenter,
	
	@Semantics.businessDate.to: true
	key main.datbi as ValidityEndDate,
	
	@Semantics.businessDate.from: true
	md.datab as ValidityStartDate,
	
	@Semantics.text: true
	cast (main.ktext as fis_prctr_shorttext preserving type) as ProfitCenterName,
	
	@Semantics.text: true
	cast (main.ltext as fac_prctr_ltext preserving type) as ProfitCenterLongName,
	_ControllingArea
}
where main.spras = $session.system_language