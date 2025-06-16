@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'General Ledger Account in Company Code'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_GLAccInCoCode
	as select from skb1 as main
{
	key main.saknr as GLAccount,
	key main.bukrs as CompanyCode,
	main.mitkz as ReconciliationAccountType
}