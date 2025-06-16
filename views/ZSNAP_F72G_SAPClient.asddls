@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SAP Client'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F72G_SAPClient
	as select from t000 as main
{
	key main.mandt as SAPClient,
	main.mwaer as GroupCurrency
}
where main.mandt = $session.client