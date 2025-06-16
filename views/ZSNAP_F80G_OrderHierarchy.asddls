@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Order Hierarchy'
@Metadata.allowExtensions: true
@ObjectModel.representativeKey: 'OrderHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F80G_OrderHierarchy
	as select from hrrp_directory as main
	
	association [1..*] to ZSNAP_F80G_OrderHierText as _Text on $projection.OrderHierarchy = _Text.OrderHierarchy and $projection.ValidityEndDate = _Text.ValidityEndDate
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Hierarchy Id'
	key main.hryid as OrderHierarchy,
	
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Validity End Date'
	key cast (main.hryvalto as fis_datbi) as ValidityEndDate,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Validity Start Date'
	cast (main.hryvalfrom as fis_datab) as ValidityStartDate,
	
	@Semantics.user.lastChangedBy: true
	@EndUserText.label: 'Last Changed By'
	main.upduser as LastChangedByUser,
	
	@Semantics.systemDate.lastChangedAt: true
	@EndUserText.label: 'Last Updated At'
	main.updtime as LastChangeTime,
	
	@EndUserText.label: 'Hierarchy Id'
	main.hrysid as HierarchyShortID,
	_Text
}
where main.hrytyp = '0103'