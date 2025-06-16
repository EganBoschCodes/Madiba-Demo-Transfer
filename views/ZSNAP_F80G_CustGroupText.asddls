@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Group - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'CustomerGroup'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F80G_CustGroupText
	as select from t151t as main
{
	key main.kdgrp as CustomerGroup,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.ktext as CustomerGroupName
}
where main.spras = $session.system_language