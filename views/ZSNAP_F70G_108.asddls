@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP: Profit Center Hierarchy Flattening Node'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_108
	as select from hrrp_node as main
{
	key main.hrynode as HierarchyNode,
	key cast (left (main.hryid, 40) as fis_hryid_prctr preserving type) as ProfitCenterHierarchy,
	cast (substring (main.hryid, 6, 4) as fis_kokrs preserving type) as ControllingArea,
	main.hrylevel as HierarchyNodeLevel,
	main.nodetype as NodeType,
	main.parnode as ParentNode,
	case main.nodetype
		when 'L' then left (main.nodevalue, 10)
		else ''
	end as ProfitCenter,
	main.hryvalto as ValidityEndDate
}
where main.hryid = '0106/1000/PCA-TOTAL'
	and main.hryvalto = '99991231'
	and main.nodetype != 'D'