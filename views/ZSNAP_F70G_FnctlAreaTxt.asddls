@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Functional Area - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'FunctionalArea'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_FnctlAreaTxt
	as select from tfkbt as main
{
	@Semantics.language
	key main.spras as Language,
	key main.fkber as FunctionalArea,
	
	@Semantics.text
	cast (main.fkbtx as fis_fkbtx) as FunctionalAreaName
}
where main.spras = $session.system_language