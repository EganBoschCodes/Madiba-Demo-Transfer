@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asset Transaction Type - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'AssetTransactionType'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_AssetTransact_B5
	as select from tabwt as main
{
	key main.bwasl as AssetTransactionType,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	cast (main.bwatxt as fis_bwatxt) as AssetTransactionTypeName
}
where main.spras = $session.system_language