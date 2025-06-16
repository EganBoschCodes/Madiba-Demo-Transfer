@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Business Transaction Type - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'BusinessTransactionType'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_BusTransactio_OO
	as select from finsc_custbttypt as main
{
	@Semantics.language
	key main.langu as Language,
	key main.cbttype as BusinessTransactionType,
	
	@Semantics.text
	main.txt as BusinessTransactionTypeName
}
where main.langu = $session.system_language