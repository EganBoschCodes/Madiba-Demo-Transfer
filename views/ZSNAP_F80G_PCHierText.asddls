@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Profit Center Hierarchy - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'ProfitCenterHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F80G_PCHierText
	as select from hrrp_directoryt as main
	
	inner join hrrp_node on main.hryid = hrrp_node.hryid and main.hryver = hrrp_node.hryver and main.hryvalto = hrrp_node.hryvalto and hrrp_node.nodetype = 'R'
	
	association [0..1] to ZSNAP_F80G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
{
	@ObjectModel.foreignKey.association: '_ControllingArea'
	key hrrp_node.nodecls as ControllingArea,
	key cast (main.hryid as fis_hryid_prctr) as ProfitCenterHierarchy,
	
	@Semantics.businessDate.to: true
	key main.hryvalto as ValidityEndDate,
	
	@Semantics.language
	key main.spras as Language,
	
	@Semantics.businessDate.from: true
	main.hryvalfrom as ValidityStartDate,
	
	@Semantics.text: true
	main.hrytxt as ProfitCenterHierarchyName,
	_ControllingArea
}
where main.spras = $session.system_language