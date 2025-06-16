@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Group Account Hierarchy Node - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F01G_GroupAccHierN_8L
	as select from hrrp_nodet as main
	
	inner join hrrp_directory on main.hryid = hrrp_directory.hryid and main.hryver = hrrp_directory.hryver and main.hryvalto = hrrp_directory.hryvalto
	
	association [0..*] to ZSNAP_F01G_GroupAccHier as _Hierarchy on $projection.GroupAccountHierarchy = _Hierarchy.GroupAccountHierarchy
{
	@ObjectModel.foreignKey.association: '_Hierarchy'
	key main.hryid as GroupAccountHierarchy,
	
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
	_Hierarchy
}
where (hrrp_directory.hrytyp = 'FSVN')
	and main.spras = $session.system_language