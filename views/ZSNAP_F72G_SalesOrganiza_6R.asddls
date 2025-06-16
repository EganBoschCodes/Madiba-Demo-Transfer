@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Sales Organization'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'SalesOrganization'
@ObjectModel.usageType.dataClass: #ORGANIZATIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_SalesOrganiza_6R
	as select from tvko as main
	
	association [0..*] to ZSNAP_F72G_SalesOrganiza_B0 as _Text on $projection.SalesOrganization = _Text.SalesOrganization
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Sales Organization'
	key main.vkorg as SalesOrganization,
	
	@EndUserText.label: 'Statistics Currency'
	main.waers as SalesOrganizationCurrency,
	
	@EndUserText.label: 'Company Code'
	main.bukrs as CompanyCode,
	
	@EndUserText.label: 'Cust.Inter-Co.Bill.'
	main.kunnr as IntercompanyBillingCustomer,
	
	@Consumption.hidden: true
	@EndUserText.label: 'Numbering Time'
	main.j_1anutime as ArgentinaDeliveryDateEvent,
	
	@Consumption.filter.hidden: true
	@EndUserText.label: 'Address'
	main.adrnr as AddressID,
	_Text
}