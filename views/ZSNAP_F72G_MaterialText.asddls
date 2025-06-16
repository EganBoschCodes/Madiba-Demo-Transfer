@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Material Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'Material'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F72G_MaterialText
	as select from makt as main
{
	key main.matnr as Material,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.maktx as MaterialName
}
where main.spras = $session.system_language