@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Global Company'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F01G_GlobalCompany
	as select from t880 as main
{
	@ObjectModel.text.element: ['CompanyName']
	key cast (main.rcomp as rcomp_d preserving type) as Company,
	
	@Semantics.text: true
	main.name1 as CompanyName,
	main.langu as CompanyLanguage
}