@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Region Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'Region'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_RegionText
	as select from t005u as main
	
	association [0..1] to ZSNAP_F01G_Country as _Country on $projection.Country = _Country.Country
{
	@ObjectModel.foreignKey.association: '_Country'
	key main.land1 as Country,
	key main.bland as Region,
	
	@Semantics.language
	key main.spras as Language,
	
	@Semantics.text
	main.bezei as RegionName,
	_Country
}
where main.spras = $session.system_language