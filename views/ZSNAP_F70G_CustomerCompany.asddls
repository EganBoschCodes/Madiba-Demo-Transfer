@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #FACT
@EndUserText.label: 'Customer Company'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CompanyCode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F70G_CustomerCompany
	as select from knb1 as main
{
	key main.kunnr as Customer,
	key main.bukrs as CompanyCode,
	main.akont as ReconciliationAccount
}