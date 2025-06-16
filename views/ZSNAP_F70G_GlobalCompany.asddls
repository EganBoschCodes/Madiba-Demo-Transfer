@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Global Company'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'Company'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_GlobalCompany
	as select from t880 as main
	
	association [0..*] to ZSNAP_F70G_GlobalCoHierNode as _GlobalCompanyHierNode on $projection.Company = _GlobalCompanyHierNode.Company
{
	@ObjectModel.hierarchy.association: '_GlobalCompanyHierNode'
	@ObjectModel.text.element: ['CompanyName']
	@EndUserText.label: 'Company'
	key cast (main.rcomp as rcomp_d preserving type) as Company,
	
	@Semantics.text: true
	@EndUserText.label: 'Name Of The Company'
	main.name1 as CompanyName,
	
	@EndUserText.label: 'Currency'
	main.curr as CompanyCurrency,
	
	@EndUserText.label: 'Language Key'
	main.langu as CompanyLanguage,
	_GlobalCompanyHierNode
}