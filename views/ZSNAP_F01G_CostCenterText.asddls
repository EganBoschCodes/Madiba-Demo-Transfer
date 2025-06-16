@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cost Center - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'CostCenter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_CostCenterText
	as select from cskt as main
	
	left outer to one join csks as md on main.kostl = md.kostl and main.kokrs = md.kokrs and main.datbi = md.datbi
	
	association [0..1] to ZSNAP_F01G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
{
	@ObjectModel.text.element: ['CostCenterDescription']
	key cast (main.kostl as kostl) as CostCenter,
	
	@ObjectModel.foreignKey.association: '_ControllingArea'
	key main.kokrs as ControllingArea,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.businessDate.to: true
	key main.datbi as ValidityEndDate,
	
	@Semantics.businessDate.from: true
	md.datab as ValidityStartDate,
	
	@Semantics.text: true
	cast (main.ktext as fis_kostl_name preserving type) as CostCenterName,
	
	@Semantics.text: true
	cast (main.ltext as fis_kostl_ltext preserving type) as CostCenterDescription,
	_ControllingArea
}
where main.spras = $session.system_language