@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Customer Account Group'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CustomerAccountGroup'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_CustomerAccGroup
	as select from t077d as main
	
	association [0..*] to ZSNAP_F70G_CustAccGroupText as _CustomerAccountGroupText on $projection.CustomerAccountGroup = _CustomerAccountGroupText.CustomerAccountGroup
{
	@ObjectModel.text.association: '_CustomerAccountGroupText'
	@EndUserText.label: 'Account Group'
	key main.ktokd as CustomerAccountGroup,
	_CustomerAccountGroupText
}