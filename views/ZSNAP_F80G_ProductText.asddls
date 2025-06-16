@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'Product'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F80G_ProductText
	as select from makt as main
{
	key main.matnr as Product,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	cast (main.maktx as productdescription preserving type) as ProductName
}
where main.spras = $session.system_language