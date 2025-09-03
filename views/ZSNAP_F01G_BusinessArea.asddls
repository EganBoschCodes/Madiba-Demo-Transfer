@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Business Area'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'BusinessArea'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F01G_BusinessArea
	as select from tgsb as main
	
	association [0..*] to ZSNAP_F01G_BusinessAreaText as _Text on $projection.BusinessArea = _Text.BusinessArea
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Business Area'
	key main.gsber as BusinessArea,
	_Text
}