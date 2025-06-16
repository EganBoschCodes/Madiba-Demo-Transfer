@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Financial Transaction Type - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'FinancialTransactionType'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_FinTransactio_RT
	as select from t856t as main
{
	@Semantics.language: true
	key main.langu as Language,
	key main.trtyp as FinancialTransactionType,
	
	@Semantics.text: true
	main.txt as FinancialTransactionTypeName
}
where main.langu = $session.system_language