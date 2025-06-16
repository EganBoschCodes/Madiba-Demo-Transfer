@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Material Group'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'MaterialGroup'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F80G_MaterialGroup
	as select from t023 as main
	
	association [0..*] to ZSNAP_F80G_MatGroupText as _Text on $projection.MaterialGroup = _Text.MaterialGroup
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Material Group'
	key cast (main.matkl as matkl preserving type) as MaterialGroup,
	
	@Consumption.hidden: true
	@EndUserText.label: 'Authorization Group'
	@UI.hidden: true
	main.begru as MaterialAuthorizationGroup,
	_Text
}