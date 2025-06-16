@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP: Profit Center Hier Node Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F80G_102
	as select from ZSNAP_F80G_PCHierNodeT as main
{
	key main.HierarchyNode,
	
	@Semantics.language: true
	key main.Language,
	
	@Semantics.businessDate.to: true
	key main.ValidityEndDate,
	
	@Semantics.text: true
	main.HierarchyNodeText,
	
	@EndUserText.label: 'Profit Center Hierarchy'
	main.ProfitCenterHierarchy,
	
	@Semantics.businessDate.from: true
	main.ValidityStartDate
}
where (main.ProfitCenterHierarchy = '0106/1000/PCA-TOTAL' and main.ValidityEndDate = '99991231')
	and main.Language = $session.system_language

union all select from ZSNAP_F80G_ProfitCenterText as main
{
	key concat ('1', main.ProfitCenter) as HierarchyNode,
	key main.Language,
	key '99991231' as ValidityEndDate,
	main.ProfitCenterLongName as HierarchyNodeText,
	'0106/1000/PCA-TOTAL' as ProfitCenterHierarchy,
	'19001231' as ValidityStartDate
}
where main.Language = $session.system_language