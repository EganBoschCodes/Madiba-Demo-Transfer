@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP: Profit Center Hierarchy Flattening'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #X
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_109
	as select from ZSNAP_F70G_108 as LeafNode
	
	left outer to one join ZSNAP_F70G_108 as Parent1 on LeafNode.ParentNode = Parent1.HierarchyNode and LeafNode.ProfitCenterHierarchy = Parent1.ProfitCenterHierarchy
	left outer to one join ZSNAP_F70G_108 as Parent2 on Parent1.ParentNode = Parent2.HierarchyNode and Parent1.ProfitCenterHierarchy = Parent2.ProfitCenterHierarchy
	left outer to one join ZSNAP_F70G_108 as Parent3 on Parent2.ParentNode = Parent3.HierarchyNode and Parent2.ProfitCenterHierarchy = Parent3.ProfitCenterHierarchy
	left outer to one join ZSNAP_F70G_108 as Parent4 on Parent3.ParentNode = Parent4.HierarchyNode and Parent3.ProfitCenterHierarchy = Parent4.ProfitCenterHierarchy
	left outer to one join ZSNAP_F70G_108 as Parent5 on Parent4.ParentNode = Parent5.HierarchyNode and Parent4.ProfitCenterHierarchy = Parent5.ProfitCenterHierarchy
	left outer to one join ZSNAP_F70G_108 as Parent6 on Parent5.ParentNode = Parent6.HierarchyNode and Parent5.ProfitCenterHierarchy = Parent6.ProfitCenterHierarchy
	left outer to one join ZSNAP_F70G_108 as Parent7 on Parent6.ParentNode = Parent7.HierarchyNode and Parent6.ProfitCenterHierarchy = Parent7.ProfitCenterHierarchy
	left outer to one join ZSNAP_F70G_108 as Parent8 on Parent7.ParentNode = Parent8.HierarchyNode and Parent7.ProfitCenterHierarchy = Parent8.ProfitCenterHierarchy
	left outer to one join ZSNAP_F70G_108 as Parent9 on Parent8.ParentNode = Parent9.HierarchyNode and Parent8.ProfitCenterHierarchy = Parent9.ProfitCenterHierarchy
	left outer to one join ZSNAP_F70G_108 as Parent10 on Parent9.ParentNode = Parent10.HierarchyNode and Parent9.ProfitCenterHierarchy = Parent10.ProfitCenterHierarchy
	left outer to one join ZSNAP_F70G_108 as Parent11 on Parent10.ParentNode = Parent11.HierarchyNode and Parent10.ProfitCenterHierarchy = Parent11.ProfitCenterHierarchy
	left outer to one join ZSNAP_F70G_108 as Parent12 on Parent11.ParentNode = Parent12.HierarchyNode and Parent11.ProfitCenterHierarchy = Parent12.ProfitCenterHierarchy
{
	key LeafNode.ControllingArea,
	key cast (LeafNode.ProfitCenter as prctr preserving type) as ProfitCenter,
	
	@Semantics.businessDate.to: true
	key LeafNode.ValidityEndDate,
	cast (case
		when LeafNode.HierarchyNodeLevel = '000002' then LeafNode.ParentNode
		when Parent1.HierarchyNodeLevel = '000002' then Parent1.ParentNode
		when Parent2.HierarchyNodeLevel = '000002' then Parent2.ParentNode
		when Parent3.HierarchyNodeLevel = '000002' then Parent3.ParentNode
		when Parent4.HierarchyNodeLevel = '000002' then Parent4.ParentNode
		when Parent5.HierarchyNodeLevel = '000002' then Parent5.ParentNode
		when Parent6.HierarchyNodeLevel = '000002' then Parent6.ParentNode
		when Parent7.HierarchyNodeLevel = '000002' then Parent7.ParentNode
		when Parent8.HierarchyNodeLevel = '000002' then Parent8.ParentNode
		when Parent9.HierarchyNodeLevel = '000002' then Parent9.ParentNode
		when Parent10.HierarchyNodeLevel = '000002' then Parent10.ParentNode
		when Parent11.HierarchyNodeLevel = '000002' then Parent11.ParentNode
		when Parent12.HierarchyNodeLevel = '000002' then Parent12.ParentNode
		else concat ('1', LeafNode.ProfitCenter)
	end as hrynode preserving type) as ProfCtrLevel1,
	cast (case
		when LeafNode.HierarchyNodeLevel = '000003' then LeafNode.ParentNode
		when Parent1.HierarchyNodeLevel = '000003' then Parent1.ParentNode
		when Parent2.HierarchyNodeLevel = '000003' then Parent2.ParentNode
		when Parent3.HierarchyNodeLevel = '000003' then Parent3.ParentNode
		when Parent4.HierarchyNodeLevel = '000003' then Parent4.ParentNode
		when Parent5.HierarchyNodeLevel = '000003' then Parent5.ParentNode
		when Parent6.HierarchyNodeLevel = '000003' then Parent6.ParentNode
		when Parent7.HierarchyNodeLevel = '000003' then Parent7.ParentNode
		when Parent8.HierarchyNodeLevel = '000003' then Parent8.ParentNode
		when Parent9.HierarchyNodeLevel = '000003' then Parent9.ParentNode
		when Parent10.HierarchyNodeLevel = '000003' then Parent10.ParentNode
		when Parent11.HierarchyNodeLevel = '000003' then Parent11.ParentNode
		when Parent12.HierarchyNodeLevel = '000003' then Parent12.ParentNode
		else concat ('1', LeafNode.ProfitCenter)
	end as hrynode preserving type) as ProfCtrLevel2,
	cast (case
		when LeafNode.HierarchyNodeLevel = '000004' then LeafNode.ParentNode
		when Parent1.HierarchyNodeLevel = '000004' then Parent1.ParentNode
		when Parent2.HierarchyNodeLevel = '000004' then Parent2.ParentNode
		when Parent3.HierarchyNodeLevel = '000004' then Parent3.ParentNode
		when Parent4.HierarchyNodeLevel = '000004' then Parent4.ParentNode
		when Parent5.HierarchyNodeLevel = '000004' then Parent5.ParentNode
		when Parent6.HierarchyNodeLevel = '000004' then Parent6.ParentNode
		when Parent7.HierarchyNodeLevel = '000004' then Parent7.ParentNode
		when Parent8.HierarchyNodeLevel = '000004' then Parent8.ParentNode
		when Parent9.HierarchyNodeLevel = '000004' then Parent9.ParentNode
		when Parent10.HierarchyNodeLevel = '000004' then Parent10.ParentNode
		when Parent11.HierarchyNodeLevel = '000004' then Parent11.ParentNode
		when Parent12.HierarchyNodeLevel = '000004' then Parent12.ParentNode
		else concat ('1', LeafNode.ProfitCenter)
	end as hrynode preserving type) as ProfCtrLevel3,
	cast (case
		when LeafNode.HierarchyNodeLevel = '000005' then LeafNode.ParentNode
		when Parent1.HierarchyNodeLevel = '000005' then Parent1.ParentNode
		when Parent2.HierarchyNodeLevel = '000005' then Parent2.ParentNode
		when Parent3.HierarchyNodeLevel = '000005' then Parent3.ParentNode
		when Parent4.HierarchyNodeLevel = '000005' then Parent4.ParentNode
		when Parent5.HierarchyNodeLevel = '000005' then Parent5.ParentNode
		when Parent6.HierarchyNodeLevel = '000005' then Parent6.ParentNode
		when Parent7.HierarchyNodeLevel = '000005' then Parent7.ParentNode
		when Parent8.HierarchyNodeLevel = '000005' then Parent8.ParentNode
		when Parent9.HierarchyNodeLevel = '000005' then Parent9.ParentNode
		when Parent10.HierarchyNodeLevel = '000005' then Parent10.ParentNode
		when Parent11.HierarchyNodeLevel = '000005' then Parent11.ParentNode
		when Parent12.HierarchyNodeLevel = '000005' then Parent12.ParentNode
		else concat ('1', LeafNode.ProfitCenter)
	end as hrynode preserving type) as ProfCtrLevel4,
	cast (case
		when LeafNode.HierarchyNodeLevel = '000006' then LeafNode.ParentNode
		when Parent1.HierarchyNodeLevel = '000006' then Parent1.ParentNode
		when Parent2.HierarchyNodeLevel = '000006' then Parent2.ParentNode
		when Parent3.HierarchyNodeLevel = '000006' then Parent3.ParentNode
		when Parent4.HierarchyNodeLevel = '000006' then Parent4.ParentNode
		when Parent5.HierarchyNodeLevel = '000006' then Parent5.ParentNode
		when Parent6.HierarchyNodeLevel = '000006' then Parent6.ParentNode
		when Parent7.HierarchyNodeLevel = '000006' then Parent7.ParentNode
		when Parent8.HierarchyNodeLevel = '000006' then Parent8.ParentNode
		when Parent9.HierarchyNodeLevel = '000006' then Parent9.ParentNode
		when Parent10.HierarchyNodeLevel = '000006' then Parent10.ParentNode
		when Parent11.HierarchyNodeLevel = '000006' then Parent11.ParentNode
		when Parent12.HierarchyNodeLevel = '000006' then Parent12.ParentNode
		else concat ('1', LeafNode.ProfitCenter)
	end as hrynode preserving type) as ProfCtrLevel5,
	cast (case
		when LeafNode.HierarchyNodeLevel = '000007' then LeafNode.ParentNode
		when Parent1.HierarchyNodeLevel = '000007' then Parent1.ParentNode
		when Parent2.HierarchyNodeLevel = '000007' then Parent2.ParentNode
		when Parent3.HierarchyNodeLevel = '000007' then Parent3.ParentNode
		when Parent4.HierarchyNodeLevel = '000007' then Parent4.ParentNode
		when Parent5.HierarchyNodeLevel = '000007' then Parent5.ParentNode
		when Parent6.HierarchyNodeLevel = '000007' then Parent6.ParentNode
		when Parent7.HierarchyNodeLevel = '000007' then Parent7.ParentNode
		when Parent8.HierarchyNodeLevel = '000007' then Parent8.ParentNode
		when Parent9.HierarchyNodeLevel = '000007' then Parent9.ParentNode
		when Parent10.HierarchyNodeLevel = '000007' then Parent10.ParentNode
		when Parent11.HierarchyNodeLevel = '000007' then Parent11.ParentNode
		when Parent12.HierarchyNodeLevel = '000007' then Parent12.ParentNode
		else concat ('1', LeafNode.ProfitCenter)
	end as hrynode preserving type) as ProfCtrLevel6
}
where LeafNode.NodeType = 'L'
	and LeafNode.ValidityEndDate = '99991231'