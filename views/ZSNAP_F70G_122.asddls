@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'SNAP: GL Account Hier Level'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_122
	as select from ZSNAP_F70G_GLAccHierNode as main
	
	association [0..*] to ZSNAP_F70G_121 as _Text on $projection.HierarchyNode = _Text.HierarchyNode and $projection.GLAccountHierarchy = _Text.GLAccountHierarchy
	association [0..1] to ZSNAP_F70G_GLAccHierarchy as _Hierarchy on $projection.GLAccountHierarchy = _Hierarchy.GLAccountHierarchy
{
	@ObjectModel.foreignKey.association: '_Hierarchy'
	@EndUserText.label: 'Hierarchy Id'
	key main.GLAccountHierarchy,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Hierarchy Node'
	key main.HierarchyNode,
	
	@EndUserText.label: 'Chart of Accounts'
	main.ChartOfAccounts,
	
	@EndUserText.label: 'GL Account'
	main.GLAccount,
	
	@EndUserText.label: 'Hierarchy Level'
	main.HierarchyNodeLevel,
	
	@EndUserText.label: 'Hierarchy Version'
	main.HierarchyVersion,
	
	@EndUserText.label: 'Node Length'
	length (main.ParentNode) as NodeLength,
	
	@EndUserText.label: 'Node Value'
	main.HierarchyNodeVal as NodeValue,
	
	@EndUserText.label: 'Hierarchy Parent Node'
	main.ParentNode,
	
	@EndUserText.label: 'Sequence Number'
	main.SequenceNumber,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Validity Start Date'
	main.ValidityStartDate,
	
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Validity End Date'
	main.ValidityEndDate,
	_Hierarchy,
	_Text
}
where main.ValidityEndDate = '99991231'
	and (main.ChartOfAccounts = '1000' or main.ChartOfAccounts = '')