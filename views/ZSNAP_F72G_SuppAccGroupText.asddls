@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Supplier Account Group - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'SupplierAccountGroup'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F72G_SuppAccGroupText
	as select from t077y as main
{
	@Semantics.language: true
	key main.spras as Language,
	key main.ktokk as SupplierAccountGroup,
	
	@Consumption.filter.hidden: true
	@Semantics.text: true
	main.txt30 as AccountGroupName
}
where main.spras = $session.system_language