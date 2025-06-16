@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Hierarchy Node - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F70G_ProdUnivHierN_BF
	as select from hrrp_nodet as nodet
	
	inner join hrrp_directory as dir on dir.hryid = nodet.hryid and dir.hryvalto = nodet.hryvalto and dir.hryver = nodet.hryver
	
	association [1..*] to ZSNAP_F70G_ProdUnivHierB_BH as _ProductHierarchy on $projection.ProdUnivHierarchy = _ProductHierarchy.ProdUnivHierarchy
{
	@Semantics.language: true
	key nodet.spras as Language,
	
	@ObjectModel.foreignKey.association: '_ProductHierarchy'
	key cast (substring (nodet.hryid, 6, 26) as prod_hier_id) as ProdUnivHierarchy,
	key nodet.hrynode as HierarchyNode,
	
	@Semantics.businessDate.to: true
	key cast (nodet.hryvalto as prodhierarchyvalidityenddate preserving type) as ProdHierarchyValidityEndDate,
	
	@Semantics.businessDate.from: true
	cast (nodet.hryvalfrom as prodhierarchyvaliditystartdate preserving type) as ProdHierarchyValidityStartDate,
	
	@Semantics.text: true
	cast (nodet.nodetxt as prod_hier_node_value_text) as ProdUnivHierarchyNodeText,
	_ProductHierarchy
}
where (dir.hrytyp = 'MD01' or dir.hrytyp = 'MD02')
	and nodet.spras = $session.system_language