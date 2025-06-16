@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Business Area'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'BusinessArea'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_BusinessArea
	as select from tgsb as main
	
	association [0..*] to ZSNAP_F70G_BusAreaHierNode as _BusinessAreaHierNode on $projection.BusinessArea = _BusinessAreaHierNode.BusinessArea
	association [0..*] to ZSNAP_F70G_BusinessAreaText as _Text on $projection.BusinessArea = _Text.BusinessArea
{
	@ObjectModel.hierarchy.association: '_BusinessAreaHierNode'
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Business Area'
	key main.gsber as BusinessArea,
	_BusinessAreaHierNode,
	_Text
}