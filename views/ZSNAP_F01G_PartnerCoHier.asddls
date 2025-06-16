@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Global Company Hierarchy'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PartnerCompanyHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F01G_PartnerCoHier
	as select from hrrp_directory as main
	
	association [1..*] to ZSNAP_F01G_PartnerCoHierT as _Text on $projection.PartnerCompanyHierarchy = _Text.PartnerCompanyHierarchy and $projection.ValidityEndDate = _Text.ValidityEndDate
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Global Company Hierarchy'
	key cast (main.hryid as fis_hryid_company) as PartnerCompanyHierarchy,
	
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Validity End Date'
	key cast (main.hryvalto as fis_datbi preserving type) as ValidityEndDate,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Validity Start Date'
	cast (main.hryvalfrom as fis_datab preserving type) as ValidityStartDate,
	
	@Semantics.user.lastChangedBy: true
	@EndUserText.label: 'Last Changed By'
	main.upduser as LastChangedByUser,
	
	@Semantics.systemDateTime.lastChangedAt: true
	@EndUserText.label: 'Last Updated At'
	main.updtime as LastChangeDateTime,
	
	@EndUserText.label: 'Hierarchy Id'
	main.hrysid as HierarchyShortID,
	_Text
}
where main.hrytyp = 'CS20'