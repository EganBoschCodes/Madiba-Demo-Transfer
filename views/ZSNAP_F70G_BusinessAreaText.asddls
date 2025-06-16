@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Business Area - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'BusinessArea'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_BusinessAreaText
	as select from tgsbt as main
{
	key main.gsber as BusinessArea,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	cast (main.gtext as farp_gtext preserving type) as BusinessAreaName
}
where main.spras = $session.system_language