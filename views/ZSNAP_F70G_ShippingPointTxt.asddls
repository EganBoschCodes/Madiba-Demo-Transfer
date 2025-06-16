@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Shipping Point - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'ShippingPoint'
@ObjectModel.usageType.dataClass: #ORGANIZATIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_ShippingPointTxt
	as select from tvstt as main
{
	key main.vstel as ShippingPoint,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.vtext as ShippingPointName
}
where main.spras = $session.system_language