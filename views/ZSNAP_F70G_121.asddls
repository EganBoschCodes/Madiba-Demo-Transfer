@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP: GL Account Level Hier Node Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_121
	as select from ZSNAP_F70G_GLAccHierNodeT as main
	
	association [0..1] to ZSNAP_F70G_GLAccHierarchy as _Hierarchy on $projection.GLAccountHierarchy = _Hierarchy.GLAccountHierarchy
{
	@ObjectModel.foreignKey.association: '_Hierarchy'
	key main.GLAccountHierarchy,
	key main.HierarchyNode,
	
	@Semantics.language: true
	key main.Language,
	
	@Semantics.businessDate.to: true
	key main.ValidityEndDate,
	
	@Semantics.text: true
	main.HierarchyNodeShortText,
	
	@Semantics.text: true
	main.HierarchyNodeText,
	
	@Semantics.businessDate.from: true
	main.ValidityStartDate,
	_Hierarchy
}
where (main.GLAccountHierarchy = 'BASK' and main.ValidityEndDate = '99991231')
	and main.Language = $session.system_language

union all select from ZSNAP_F70G_GLAccountText as main
	
	association [0..1] to ZSNAP_F70G_GLAccHierarchy as _Hierarchy on $projection.GLAccountHierarchy = _Hierarchy.GLAccountHierarchy
{
	key 'BASK' as GLAccountHierarchy,
	key concat ('1', main.GLAccount) as HierarchyNode,
	key main.Language,
	key cast ('99991231' as datbi) as ValidityEndDate,
	main.GLAccountName as HierarchyNodeShortText,
	main.GLAccountLongName as HierarchyNodeText,
	cast ('19001231' as datab) as ValidityStartDate,
	_Hierarchy
}
where (main.ChartOfAccounts = '1000')
	and main.Language = $session.system_language