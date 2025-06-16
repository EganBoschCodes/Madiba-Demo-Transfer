@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: GL Account Hierarchy Flattening'

define view entity ZSNAP_F80G_129
	as select from ZSNAP_F80G_GLAccHierNode as LeafNode
	
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent1 on LeafNode.ParentNode = Parent1.HierarchyNode and LeafNode.GLAccountHierarchy = Parent1.GLAccountHierarchy and Parent1.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent2 on Parent1.ParentNode = Parent2.HierarchyNode and LeafNode.GLAccountHierarchy = Parent2.GLAccountHierarchy and Parent2.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent3 on Parent2.ParentNode = Parent3.HierarchyNode and LeafNode.GLAccountHierarchy = Parent3.GLAccountHierarchy and Parent3.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent4 on Parent3.ParentNode = Parent4.HierarchyNode and LeafNode.GLAccountHierarchy = Parent4.GLAccountHierarchy and Parent4.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent5 on Parent4.ParentNode = Parent5.HierarchyNode and LeafNode.GLAccountHierarchy = Parent5.GLAccountHierarchy and Parent5.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent6 on Parent5.ParentNode = Parent6.HierarchyNode and LeafNode.GLAccountHierarchy = Parent6.GLAccountHierarchy and Parent6.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent7 on Parent6.ParentNode = Parent7.HierarchyNode and LeafNode.GLAccountHierarchy = Parent7.GLAccountHierarchy and Parent7.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent8 on Parent7.ParentNode = Parent8.HierarchyNode and LeafNode.GLAccountHierarchy = Parent8.GLAccountHierarchy and Parent8.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent9 on Parent8.ParentNode = Parent9.HierarchyNode and LeafNode.GLAccountHierarchy = Parent9.GLAccountHierarchy and Parent9.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent10 on Parent9.ParentNode = Parent10.HierarchyNode and LeafNode.GLAccountHierarchy = Parent10.GLAccountHierarchy and Parent10.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent11 on Parent10.ParentNode = Parent11.HierarchyNode and LeafNode.GLAccountHierarchy = Parent11.GLAccountHierarchy and Parent11.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent12 on Parent11.ParentNode = Parent12.HierarchyNode and LeafNode.GLAccountHierarchy = Parent12.GLAccountHierarchy and Parent12.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent13 on Parent12.ParentNode = Parent13.HierarchyNode and LeafNode.GLAccountHierarchy = Parent13.GLAccountHierarchy and Parent13.ValidityEndDate = '99991231'
	left outer to one join ZSNAP_F80G_GLAccHierNode as Parent14 on Parent13.ParentNode = Parent14.HierarchyNode and LeafNode.GLAccountHierarchy = Parent14.GLAccountHierarchy and Parent14.ValidityEndDate = '99991231'
{
	key LeafNode.GLAccountHierarchy,
	key LeafNode.ChartOfAccounts,
	key LeafNode.GLAccount,
	
	@Semantics.businessDate.to: true
	LeafNode.ValidityEndDate,
	case
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
		when Parent13.HierarchyNodeLevel = '000002' then Parent13.ParentNode
		when Parent14.HierarchyNodeLevel = '000002' then Parent14.ParentNode
		else concat ('1', LeafNode.GLAccount)
	end as GLAcctLevel1,
	case
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
		when Parent13.HierarchyNodeLevel = '000003' then Parent13.ParentNode
		when Parent14.HierarchyNodeLevel = '000003' then Parent14.ParentNode
		else concat ('1', LeafNode.GLAccount)
	end as GLAcctLevel2,
	case
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
		when Parent13.HierarchyNodeLevel = '000004' then Parent13.ParentNode
		when Parent14.HierarchyNodeLevel = '000004' then Parent14.ParentNode
		else concat ('1', LeafNode.GLAccount)
	end as GLAcctLevel3,
	case
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
		when Parent13.HierarchyNodeLevel = '000005' then Parent13.ParentNode
		when Parent14.HierarchyNodeLevel = '000005' then Parent14.ParentNode
		else concat ('1', LeafNode.GLAccount)
	end as GLAcctLevel4,
	case
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
		when Parent13.HierarchyNodeLevel = '000006' then Parent13.ParentNode
		when Parent14.HierarchyNodeLevel = '000006' then Parent14.ParentNode
		else concat ('1', LeafNode.GLAccount)
	end as GLAcctLevel5,
	case
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
		when Parent13.HierarchyNodeLevel = '000007' then Parent13.ParentNode
		when Parent14.HierarchyNodeLevel = '000007' then Parent14.ParentNode
		else concat ('1', LeafNode.GLAccount)
	end as GLAcctLevel6
}
where LeafNode.NodeType = 'L'
	and LeafNode.ValidityEndDate = '99991231'