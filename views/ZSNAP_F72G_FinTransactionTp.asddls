@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Financial Transaction Type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FinancialTransactionType'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_FinTransactionTp
	as select from t856 as main
	
	association [0..*] to ZSNAP_F72G_FinTransactio_BP as _Text on $projection.FinancialTransactionType = _Text.FinancialTransactionType
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Transaction Type'
	key main.trtyp as FinancialTransactionType,
	
	@EndUserText.label: 'Transaction Type Grp'
	main.ttgrp as FinancialTransactionTypeGroup,
	
	@EndUserText.label: 'Carryfwd Trans.Type'
	main.ttcfo as CarryForwardTransactionType,
	
	@EndUserText.label: 'Totals Transaction Type'
	main.toind as TransactionTypeIsDerived,
	
	@EndUserText.label: 'Totals Formula'
	main.sumru as TransacTypeTotalsFormulaText,
	
	@EndUserText.label: 'No Changes To Balance C/F'
	main.cfind as BalanceCarryForwardIsFixed,
	
	@EndUserText.label: 'Year Of Acq. Only Current Year'
	main.cyind as AcquisitionIsCurrentYearOnly,
	
	@EndUserText.label: 'Suppress Acquisition Yrs.'
	main.cydbi as BrkdwnByYearsIsNotApplicable,
	
	@EndUserText.label: 'Tty: Retirement'
	main.ttret as RetirementTransactionType,
	_Text
}