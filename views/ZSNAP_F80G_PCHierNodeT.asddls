@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Profit Center Hierarchy Node - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F80G_PCHierNodeT
	as select from hrrp_nodet as main
	
	inner join hrrp_directory on main.hryid = hrrp_directory.hryid and main.hryver = hrrp_directory.hryver and main.hryvalto = hrrp_directory.hryvalto
	
	association [0..1] to ZSNAP_F80G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
	association [1..*] to ZSNAP_F80G_ProfitCenterHier as _Hierarchy on $projection.ProfitCenterHierarchy = _Hierarchy.ProfitCenterHierarchy and $projection.ControllingArea = _Hierarchy.ControllingArea
{
	@ObjectModel.foreignKey.association: '_ControllingArea'
	key cast (main.nodecls as fis_kokrs) as ControllingArea,
	
	@ObjectModel.foreignKey.association: '_Hierarchy'
	key cast (main.hryid as fis_hryid_prctr) as ProfitCenterHierarchy,
	
	@ObjectModel.text.element: ['HierarchyNodeText']
	key main.hrynode as HierarchyNode,
	
	@Semantics.businessDate.to: true
	key cast (main.hryvalto as fis_datbi) as ValidityEndDate,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.nodetxt as HierarchyNodeText,
	
	@Semantics.text: true
	substring (main.nodetxt, 1, 20) as HierarchyNodeShortText,
	
	@Semantics.businessDate.from: true
	cast (main.hryvalfrom as fis_datab) as ValidityStartDate,
	_ControllingArea,
	_Hierarchy
}
where (hrrp_directory.hrytyp = '0106')
	and main.spras = $session.system_language