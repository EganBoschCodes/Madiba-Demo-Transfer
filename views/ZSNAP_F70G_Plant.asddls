@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Plant'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Plant'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_Plant
	as select from t001w as main
{
	@ObjectModel.text.element: ['PlantName']
	@EndUserText.label: 'Plant'
	key main.werks as Plant,
	
	@Semantics.text: true
	@EndUserText.label: 'Plant Name'
	cast (main.name1 as werks_name preserving type) as PlantName,
	
	@EndUserText.label: 'Valuation Area'
	main.bwkey as ValuationArea,
	
	@EndUserText.label: 'Customer Number Of Plant'
	main.kunnr as PlantCustomer,
	
	@EndUserText.label: 'Supplier Number Of Plant'
	main.lifnr as PlantSupplier,
	
	@EndUserText.label: 'Factory Calendar'
	main.fabkl as FactoryCalendar,
	
	@EndUserText.label: 'Purch. Organization'
	main.ekorg as DefaultPurchasingOrganization,
	
	@EndUserText.label: 'Sls Organization Icb'
	main.vkorg as SalesOrganization,
	
	@EndUserText.label: 'Address'
	main.adrnr as AddressID,
	
	@EndUserText.label: 'Plant Cat.'
	main.vlfkz as PlantCategory,
	
	@EndUserText.label: 'Distrib.Channel'
	main.vtweg as DistributionChannel,
	
	@EndUserText.label: 'Int.Co Billing Div.'
	main.spart as Division,
	
	@EndUserText.label: 'Language Key'
	main.spras as Language,
	
	@EndUserText.label: 'Archiving Marker'
	main.achvm as IsMarkedForArchiving,
	
	@EndUserText.label: 'Country/Region Key'
	main.land1 as Country
}