@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Order Hierarchy Node Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F72G_OrderHierNodeTxt
	as select from hrrp_nodet as main
	
	inner join hrrp_directory on main.hryid = hrrp_directory.hryid and main.hryver = hrrp_directory.hryver and main.hryvalto = hrrp_directory.hryvalto
	
	association [0..*] to ZSNAP_F72G_OrderHierarchy as _Hierarchy on $projection.OrderHierarchy = _Hierarchy.OrderHierarchy
{
	@ObjectModel.foreignKey.association: '_Hierarchy'
	key main.hryid as OrderHierarchy,
	
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
where (hrrp_directory.hrytyp = '0103')
	and main.spras = $session.system_language