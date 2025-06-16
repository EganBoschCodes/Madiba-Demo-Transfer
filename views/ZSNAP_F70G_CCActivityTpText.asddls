@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cost Center Activity Type - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'CostCtrActivityType'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_CCActivityTpText
	as select from cslt as main
	
	inner join csla as md on main.lstar = md.lstar and main.kokrs = md.kokrs and main.datbi = md.datbi
	
	association [1] to ZSNAP_F70G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
{
	@Semantics.businessDate.to: true
	key main.datbi as ValidityEndDate,
	
	@ObjectModel.foreignKey.association: '_ControllingArea'
	key cast (main.kokrs as fis_kokrs preserving type) as ControllingArea,
	key main.lstar as CostCtrActivityType,
	
	@Semantics.language
	key main.spras as Language,
	main.ktext as CostCtrActivityTypeName,
	
	@Semantics.text: true
	main.ltext as CostCtrActivityTypeDesc,
	
	@Semantics.businessDate.from: true
	md.datab as ValidityStartDate,
	main.mctxt as CostCtrActyTypeTxtSearchTerm,
	_ControllingArea
}
where main.spras = $session.system_language