@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Customer Group'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CustomerGroup'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_CustomerGroup
	as select from t151 as main
	
	association [0..*] to ZSNAP_F70G_CustGroupText as _Text on $projection.CustomerGroup = _Text.CustomerGroup
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Customer Group'
	key main.kdgrp as CustomerGroup,
	_Text
}