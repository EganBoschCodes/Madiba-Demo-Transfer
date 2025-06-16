@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Organization - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'SalesOrganization'
@ObjectModel.usageType.dataClass: #ORGANIZATIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_SalesOrganiza_B0
	as select from tvkot as main
{
	key main.vkorg as SalesOrganization,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	cast (main.vtext as salesorganizationname preserving type) as SalesOrganizationName
}
where main.spras = $session.system_language