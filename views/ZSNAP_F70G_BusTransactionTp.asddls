@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Business Transaction Type'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'BusinessTransactionType'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_BusTransactionTp
	as select from finsc_custbttype as main
	
	association [0..*] to ZSNAP_F70G_BusTransacTpH_E6 as _BusTransacTypeHierNode on $projection.BusinessTransactionType = _BusTransacTypeHierNode.BusinessTransactionType
	association [0..*] to ZSNAP_F70G_BusTransactio_OO as _Text on $projection.BusinessTransactionType = _Text.BusinessTransactionType
{
	@ObjectModel.hierarchy.association: '_BusTransacTypeHierNode'
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Business Transaction Type'
	key main.cbttype as BusinessTransactionType,
	
	@EndUserText.label: 'Business Transaction Category'
	main.bttype as BusinessTransactionCategory,
	
	@Semantics.booleanIndicator: true
	@EndUserText.label: 'Relevant For Period Control'
	main.xperiodcontrol as BusTransIsSubjToPerdControl,
	
	@Semantics.booleanIndicator: true
	@EndUserText.label: 'Period Control By Ledger'
	main.xperiodbyledger as PeriodControlIsLedgerSpecific,
	_BusTransacTypeHierNode,
	_Text
}