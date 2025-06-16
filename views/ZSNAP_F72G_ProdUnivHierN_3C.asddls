@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Hierarchy Node'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F72G_ProdUnivHierN_3C
	as select from hrrp_node as node
	
	inner join hrrp_directory as dir on dir.hryid = node.hryid and dir.hryvalto = node.hryvalto and dir.hryver = node.hryver
{
	key cast (substring (node.hryid, 6, 26) as prod_hier_id) as ProdUnivHierarchy,
	key node.hrynode as HierarchyNode,
	
	@Semantics.businessDate.to: true
	key cast (node.hryvalto as prodhierarchyvalidityenddate preserving type) as ProdHierarchyValidityEndDate,
	
	@Semantics.businessDate.from: true
	cast (node.hryvalfrom as prodhierarchyvaliditystartdate preserving type) as ProdHierarchyValidityStartDate,
	node.parnode as ParentNode,
	cast (case node.nodetype
		when 'L' then node.nodevalue
		else ''
	end as productnumber) as Product,
	node.hryseqnbr as HierarchyNodeSequence,
	node.nodetype as NodeType,
	node.hrylevel as HierarchyNodeLevel
}
where node.nodetype = 'L'
	or node.nodetype = 'N'
	or node.nodetype = 'R'