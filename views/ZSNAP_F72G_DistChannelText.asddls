@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Distribution Channel - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'DistributionChannel'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_DistChannelText
	as select from tvtwt as main
{
	key main.vtweg as DistributionChannel,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	cast (main.vtext as distributionchannelname preserving type) as DistributionChannelName
}
where main.spras = $session.system_language