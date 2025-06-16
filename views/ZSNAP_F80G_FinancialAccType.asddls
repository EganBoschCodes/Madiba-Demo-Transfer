@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Financial Account Type'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FinancialAccountType'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F80G_FinancialAccType
	as select from dd07l as main
	
	association [0..*] to ZSNAP_F80G_FinAccTpTxt as _Text on $projection.FinancialAccountType = _Text.FinancialAccountType
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Account Type'
	key cast (substring (main.domvalue_l, 1, 1) as farp_koart) as FinancialAccountType,
	
	@Analytics.hidden: true
	@Consumption.hidden: true
	@EndUserText.label: 'Lower Value'
	main.domvalue_l as DomainValue,
	_Text
}
where main.domname = 'FARP_KOART'
	and main.as4local = 'A'