@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Hierarchy - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'ProdUnivHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F72G_ProdUnivHierT_2
	as select from hrrp_directoryt as text
	
	inner join hrrp_directory as dir on dir.hryid = text.hryid and dir.hryver = text.hryver and dir.hryvalto = text.hryvalto
{
	@Semantics.language: true
	key text.spras as Language,
	key cast (substring (text.hryid, 6, 26) as prod_hier_id) as ProdUnivHierarchy,
	
	@Semantics.businessDate.to: true
	key text.hryvalto as ProdHierarchyValidityEndDate,
	
	@Semantics.businessDate.from: true
	text.hryvalfrom as ProdHierarchyValidityStartDate,
	
	@Semantics.text: true
	text.hrytxt as ProdUnivHierarchyText
}
where (dir.hrytyp = 'MD01' or dir.hrytyp = 'MD02')
	and text.spras = $session.system_language