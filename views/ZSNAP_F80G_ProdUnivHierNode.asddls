@AccessControl.authorizationCheck: #PRIVILEGED_ONLY
@EndUserText.label: 'Product Hierarchy Node View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #HIERARCHY
@ObjectModel.representativeKey: 'ProductHierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL
@Hierarchy.parentChild: [{ recurse: { parent: ['ProductHierarchyParentNode'], child: ['ProductHierarchyNode']}, siblingsOrder: [{ by: 'SequenceNumber', direction: #ASC }], directory: '_ProductHierarchy'}]

define view entity ZSNAP_F80G_ProdUnivHierNode
	as select from ZSNAP_F80G_ProdUnivHierN_BJ as node
	
	association [1..1] to ZSNAP_F80G_ProdUnivHierB_BN as _ProductHierarchy on $projection.ProductHierarchy = _ProductHierarchy.ProdUnivHierarchy and $projection.ProdHierarchyValidityEndDate = _ProductHierarchy.ProdHierarchyValidityEndDate
	association [0..*] to ZSNAP_F80G_ProdUnivHierN_BA as _Text on $projection.ProductHierarchy = _Text.ProdUnivHierarchy and $projection.ProductHierarchyNode = _Text.HierarchyNode and $projection.Product = ''
	association [1..1] to ZSNAP_F80G_Product as _Product on $projection.Product = _Product.Product
{
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@ObjectModel.foreignKey.association: '_ProductHierarchy'
	@EndUserText.label: 'Product Hierarchy'
	key node.ProdUnivHierarchy as ProductHierarchy,
	
	@EndUserText.label: 'Product Hierarchy Node'
	@ObjectModel.text.association: '_Text'
	key node.HierarchyNode as ProductHierarchyNode,
	
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Validity End Date'
	key node.ProdHierarchyValidityEndDate,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Validity Start Date'
	node.ProdHierarchyValidityStartDate,
	
	@EndUserText.label: 'Product Hierarchy Parent Node'
	@EndUserText.quickInfo: 'Product Hierarchy Parent Node'
	node.ParentNode as ProductHierarchyParentNode,
	
	@ObjectModel.foreignKey.association: '_Product'
	@EndUserText.label: 'Product'
	node.Product,
	
	@EndUserText.label: 'Hierarchy Sequence Number'
	node.HierarchyNodeSequence as SequenceNumber,
	
	@EndUserText.label: 'Hierarchy Node Type'
	node.NodeType,
	
	@EndUserText.label: 'Hierarchy Level'
	node.HierarchyNodeLevel,
	_ProductHierarchy,
	_Text,
	_Product
}