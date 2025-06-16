@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer Account Group - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'CustomerAccountGroup'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F72G_CustAccGroupText
	as select from t077x as main
{
	@Semantics.language
	key main.spras as Language,
	key main.ktokd as CustomerAccountGroup,
	
	@Semantics.text
	main.txt30 as AccountGroupName
}
where main.spras = $session.system_language