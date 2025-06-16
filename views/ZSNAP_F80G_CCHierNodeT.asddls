@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cost Center Hierarchy Node - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F80G_CCHierNodeT
	as select from hrrp_nodet as main
	
	inner join hrrp_directory as HierarchyDirectory on main.hryid = HierarchyDirectory.hryid and main.hryver = HierarchyDirectory.hryver and main.hryvalto = HierarchyDirectory.hryvalto
	
	association [0..1] to ZSNAP_F80G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
	association [1..*] to ZSNAP_F80G_CostCenterHier as _Hierarchy on $projection.CostCenterHierarchy = _Hierarchy.CostCenterHierarchy and $projection.ControllingArea = _Hierarchy.ControllingArea
{
	@ObjectModel.foreignKey.association: '_ControllingArea'
	key cast (main.nodecls as fis_kokrs) as ControllingArea,
	
	@ObjectModel.foreignKey.association: '_Hierarchy'
	key cast (main.hryid as fis_hryid_cctr) as CostCenterHierarchy,
	
	@ObjectModel.text.element: ['HierarchyNodeText']
	key main.hrynode as HierarchyNode,
	
	@Semantics.businessDate.to: true
	key main.hryvalto as ValidityEndDate,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.nodetxt as HierarchyNodeText,
	
	@Semantics.text: true
	substring (main.nodetxt, 1, 20) as HierarchyNodeShortText,
	
	@Semantics.businessDate.from: true
	main.hryvalfrom as ValidityStartDate,
	_ControllingArea,
	_Hierarchy
}
where (HierarchyDirectory.hrytyp = '0101')
	and main.spras = $session.system_language