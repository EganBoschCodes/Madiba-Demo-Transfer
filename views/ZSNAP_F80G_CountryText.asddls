@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country/Region Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'Country'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F80G_CountryText
	as select from t005t as main
{
	key main.land1 as Country,
	
	@Semantics.language
	key main.spras as Language,
	
	@Semantics.text: true
	main.landx50 as CountryName,
	main.natio as NationalityName,
	main.natio50 as NationalityLongName,
	main.landx as CountryShortName
}
where main.spras = $session.system_language