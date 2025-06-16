@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Partner Company'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PartnerCompany'
@ObjectModel.usageType.dataClass: #ORGANIZATIONAL
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_Partnercompany
	as select from ZSNAP_F01G_GlobalCompany as PartnerCompany
	
	association [0..*] to ZSNAP_F01G_PartnerCoHier_EO as _PartnerCompanyHierNode on $projection.PartnerCompany = _PartnerCompanyHierNode.PartnerCompany
{
	@ObjectModel.hierarchy.association: '_PartnerCompanyHierNode'
	@ObjectModel.text.element: ['CompanyName']
	@EndUserText.label: 'Company'
	key PartnerCompany.Company as PartnerCompany,
	
	@Semantics.text
	@EndUserText.label: 'Name Of The Company'
	PartnerCompany.CompanyName,
	
	@EndUserText.label: 'Language Key'
	PartnerCompany.CompanyLanguage as Language,
	_PartnerCompanyHierNode
}