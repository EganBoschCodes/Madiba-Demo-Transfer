@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Functional Area'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FunctionalArea'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_FunctionalArea
	as select from tfkb as main
	
	association [0..*] to ZSNAP_F70G_FnctlAreaHier_HN as _FunctionalAreaHierarchyNode on $projection.FunctionalArea = _FunctionalAreaHierarchyNode.FunctionalArea
	association [0..*] to ZSNAP_F70G_FnctlAreaTxt as _Text on $projection.FunctionalArea = _Text.FunctionalArea
{
	@ObjectModel.hierarchy.association: '_FunctionalAreaHierarchyNode'
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Functional Area'
	key main.fkber as FunctionalArea,
	_FunctionalAreaHierarchyNode,
	_Text
}