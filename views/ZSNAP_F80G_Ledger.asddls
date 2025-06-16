@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Ledger'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Ledger'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F80G_Ledger
	as select from finsc_ledger as main
	
	inner join finsc_actve_appl on main.appl = finsc_actve_appl.appl and main.subappl = finsc_actve_appl.subappl
	
	association [0..*] to ZSNAP_F80G_LedgerText as _Text on $projection.Ledger = _Text.Ledger
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Ledger'
	key main.rldnr as Ledger,
	
	@EndUserText.label: 'Leading Ledger'
	main.xleading as IsLeadingLedger,
	
	@EndUserText.label: 'Application'
	main.appl as LedgerApplication,
	
	@EndUserText.label: 'Subapplication'
	main.subappl as LedgerSubApplication,
	
	@EndUserText.label: 'Ledger Type'
	main.ledger_type as LedgerType,
	
	@EndUserText.label: 'Extension Ledger Type'
	main.ext_ledger_type as ExtensionLedgerType,
	
	@EndUserText.label: 'Fallback Ledger'
	main.fallback_ledger as ReferenceLedger,
	
	@Consumption.hidden: true
	@EndUserText.label: 'Technical Ledger'
	main.tech_ledger as TechnicalLedger,
	_Text
}