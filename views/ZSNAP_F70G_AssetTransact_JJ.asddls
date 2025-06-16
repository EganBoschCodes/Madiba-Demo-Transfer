@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Asset Transaction Type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'AssetTransactionType'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_AssetTransact_JJ
	as select from tabw as main
	
	association [0..*] to ZSNAP_F70G_AssetTransact_2R as _Text on $projection.AssetTransactionType = _Text.AssetTransactionType
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Transaction Type'
	key main.bwasl as AssetTransactionType,
	
	@EndUserText.label: 'Transaction Type Grp'
	main.bwagrp as AssetTransactionTypeGroup,
	_Text
}