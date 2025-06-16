@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Group Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'MaterialGroup'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F80G_MatGroupText
	as select from t023t as main
{
	key cast (main.matkl as productgroup preserving type) as MaterialGroup,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	cast (main.wgbez as productgroupdescription preserving type) as MaterialGroupName,
	
	@Semantics.text: true
	main.wgbez60 as MaterialGroupText
}
where main.spras = $session.system_language