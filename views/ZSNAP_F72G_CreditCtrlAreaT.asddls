@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Credit Control Area - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'CreditControlArea'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F72G_CreditCtrlAreaT
	as select from t014t as main
{
	key cast (main.kkber as farp_kkber preserving type) as CreditControlArea,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.kkbtx as CreditControlAreaName
}
where main.spras = $session.system_language