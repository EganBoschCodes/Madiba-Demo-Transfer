@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Group Account Hierarchy'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'GroupAccountHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F01G_GroupAccHier
	as select from hrrp_directory as main
	
	left outer to many join hrrp_attr_dir on main.hryid = hrrp_attr_dir.hryid and main.hryver = hrrp_attr_dir.hryver and main.hryvalto = hrrp_attr_dir.hryvalto and hrrp_attr_dir.hryattrname = 'AGING'
	
	association [0..*] to ZSNAP_F01G_GroupAccHierText as _Text on $projection.GroupAccountHierarchy = _Text.GroupAccountHierarchy and $projection.ValidityEndDate = _Text.ValidityEndDate
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Hierarchy Id'
	key main.hryid as GroupAccountHierarchy,
	
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Valid To'
	key main.hryvalto as ValidityEndDate,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Valid From'
	main.hryvalfrom as ValidityStartDate,
	
	@EndUserText.label: 'Hierarchy Type'
	main.hrytyp as HierarchyType,
	
	@Semantics.user.lastChangedBy: true
	@EndUserText.label: 'Last Changed By'
	main.upduser as LastChangedByUser,
	
	@API.element.releaseState: #DEPRECATED
	@API.element.successor: 'LastChangeDateTime'
	@Semantics.systemDate.lastChangedAt: true
	@VDM.lifecycle.status: #DEPRECATED
	@VDM.lifecycle.successor: 'LastChangeDateTime'
	@EndUserText.label: 'Last Updated At'
	main.updtime as LastChangeTime,
	
	@Semantics.systemDate.lastChangedAt: true
	@EndUserText.label: 'Last Updated At'
	main.updtime as LastChangeDateTime,
	
	@EndUserText.label: 'Hierarchy Id'
	main.hrysid as HierarchyShortID,
	_Text
}
where main.hrytyp = 'FSVN'
	and hrrp_attr_dir.hryattrvalue is null