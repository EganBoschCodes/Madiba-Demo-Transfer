@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Cost Center Hierarchy'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CostCenterHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F01G_CostCenterHier
	as select from hrrp_directory as main
	
	inner join hrrp_node on main.hryid = hrrp_node.hryid and main.hryver = hrrp_node.hryver and main.hryvalto = hrrp_node.hryvalto and hrrp_node.nodetype = 'R'
	
	association [0..1] to ZSNAP_F01G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
	association [0..1] to ZSNAP_F01G_ControllingArea as _ControllingAreaText on $projection.ControllingArea = _ControllingAreaText.ControllingArea
	association [1..*] to ZSNAP_F01G_CCHierText as _Text on $projection.CostCenterHierarchy = _Text.CostCenterHierarchy and $projection.ControllingArea = _Text.ControllingArea
{
	@ObjectModel.foreignKey.association: '_ControllingArea'
	@ObjectModel.text.association: '_ControllingAreaText'
	@EndUserText.label: 'Node Class'
	key hrrp_node.nodecls as ControllingArea,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Cost Center Hierarchy'
	key cast (main.hryid as fis_hryid_cctr) as CostCenterHierarchy,
	
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
	_ControllingArea,
	
	@Consumption.hidden: true
	_ControllingAreaText,
	_Text
}
where main.hrytyp = '0101'