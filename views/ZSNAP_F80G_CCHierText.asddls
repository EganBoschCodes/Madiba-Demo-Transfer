@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cost Center Hierarchy - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'CostCenterHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F80G_CCHierText
	as select from hrrp_directoryt as main
	
	inner join hrrp_node on hrrp_node.hryid = main.hryid and hrrp_node.hryvalto = main.hryvalto and hrrp_node.hryver = main.hryver and hrrp_node.nodetype = 'R'
	
	association [0..1] to ZSNAP_F80G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
{
	@ObjectModel.foreignKey.association: '_ControllingArea'
	key hrrp_node.nodecls as ControllingArea,
	key cast (main.hryid as fis_hryid_cctr) as CostCenterHierarchy,
	
	@Semantics.businessDate.to: true
	key main.hryvalto as ValidityEndDate,
	
	@Semantics.language
	key main.spras as Language,
	
	@Semantics.businessDate.from: true
	main.hryvalfrom as ValidityStartDate,
	
	@Semantics.text
	main.hrytxt as CostCenterHierarchyName,
	_ControllingArea
}
where main.spras = $session.system_language