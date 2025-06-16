@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #FACT
@EndUserText.label: 'Supplier Company'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CompanyCode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F01G_SupplierCompany
	as select from lfb1 as main
{
	key main.lifnr as Supplier,
	key main.bukrs as CompanyCode,
	main.begru as AuthorizationGroup,
	main.busab as AccountingClerk,
	main.akont as ReconciliationAccount,
	main.qsskz as WithholdingTaxCode
}