@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Asset Transaction Type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'AssetTransactionType'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_AssetTransact_L0
	as select from tabw as main
	
	association [0..*] to ZSNAP_F72G_AssetTransact_B5 as _Text on $projection.AssetTransactionType = _Text.AssetTransactionType
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Transaction Type'
	key main.bwasl as AssetTransactionType,
	
	@EndUserText.label: 'Transaction Type Grp'
	main.bwagrp as AssetTransactionTypeGroup,
	_Text
}