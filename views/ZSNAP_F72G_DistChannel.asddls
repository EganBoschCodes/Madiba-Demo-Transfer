@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Distribution Channel'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'DistributionChannel'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_DistChannel
	as select from tvtw as main
	
	association [0..*] to ZSNAP_F72G_DistChannelText as _Text on $projection.DistributionChannel = _Text.DistributionChannel
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Distribution Channel'
	key main.vtweg as DistributionChannel,
	_Text
}