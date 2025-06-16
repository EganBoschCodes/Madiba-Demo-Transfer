@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Ledger - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'Ledger'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_LedgerText
	as select from finsc_ledger_t as main
{
	key main.rldnr as Ledger,
	
	@Semantics.language
	key main.langu as Language,
	
	@Semantics.text
	main.name as LedgerName
}
where main.langu = $session.system_language