@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'SNAP: Profit Center Hier Level'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F72G_103
	as select from ZSNAP_F72G_PCHierNode as main
	
	association [0..*] to ZSNAP_F72G_102 as _Text on $projection.HierarchyNode = _Text.HierarchyNode
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Hierarchy Node'
	key main.HierarchyNode,
	
	@EndUserText.label: 'Profit Center Hierarchy'
	main.ProfitCenterHierarchy,
	
	@EndUserText.label: 'Hierarchy Level'
	main.HierarchyNodeLevel,
	
	@EndUserText.label: 'Hierarchy Version'
	main.HierarchyVersion,
	
	@EndUserText.label: 'Node Value'
	main.HierarchyNodeVal as NodeValue,
	
	@EndUserText.label: 'Hierarchy Parent Node'
	main.ParentNode,
	
	@EndUserText.label: 'Profit Center'
	main.ProfitCenter,
	
	@EndUserText.label: 'Controlling Area'
	main.ControllingArea,
	main.SequenceNumber,
	
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Validity End Date'
	main.ValidityEndDate,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Validity Start Date'
	main.ValidityStartDate,
	_Text
}
where main.ProfitCenterHierarchy = '0106/1000/PCA-TOTAL'
	and main.ValidityEndDate = '99991231'