@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Region'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Region'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_Region
	as select from t005s as main
	
	association [1..1] to ZSNAP_F01G_Country as _Country on $projection.Country = _Country.Country
	association [0..*] to ZSNAP_F01G_RegionText as _RegionText on $projection.Region = _RegionText.Region and $projection.Country = _RegionText.Country
{
	@ObjectModel.foreignKey.association: '_Country'
	@EndUserText.label: 'Country/Region Key'
	key main.land1 as Country,
	
	@ObjectModel.text.association: '_RegionText'
	@EndUserText.label: 'Region'
	key main.bland as Region,
	_Country,
	_RegionText
}