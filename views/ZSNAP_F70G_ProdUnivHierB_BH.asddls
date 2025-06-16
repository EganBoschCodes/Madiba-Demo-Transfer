@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Product Hierarchy Directory'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ProdUnivHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F70G_ProdUnivHierB_BH
	as select from hrrp_directory as main
	
	association [0..*] to ZSNAP_F70G_ProdUnivHierT_2 as _Text on $projection.ProdUnivHierarchy = _Text.ProdUnivHierarchy
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Product Hierarchy'
	key cast (substring (main.hryid, 6, 26) as prod_hier_id) as ProdUnivHierarchy,
	
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Validity End Date'
	key cast (main.hryvalto as prodhierarchyvalidityenddate preserving type) as ProdHierarchyValidityEndDate,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Validity Start Date'
	cast (main.hryvalfrom as prodhierarchyvaliditystartdate preserving type) as ProdHierarchyValidityStartDate,
	
	@Semantics.user.lastChangedBy: true
	@EndUserText.label: 'Last Changed By'
	main.upduser as LastChangedByUser,
	
	@Semantics.systemDateTime.lastChangedAt: true
	@EndUserText.label: 'Last Updated At'
	main.updtime as ProdUnivHierLastChangeDateTime,
	_Text
}