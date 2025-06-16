@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Order Header'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'OrderID'
@ObjectModel.semanticKey: ['OrderID']
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F72G_Order
	as select from ZSNAP_F72G_OrderBasic as aufk
	
	left outer to one join ZSNAP_F72G_LogisticsOrde_YB as afko on afko.OrderID = aufk.OrderID
	
	association [0..*] to ZSNAP_F72G_OrderHierNode as _OrderHierarchyNode on $projection.OrderID = _OrderHierarchyNode.OrderID
{
	@ObjectModel.hierarchy.association: '_OrderHierarchyNode'
	@ObjectModel.text.element: ['OrderDescription']
	@EndUserText.label: 'Order'
	key aufk.OrderID,
	
	@EndUserText.label: 'Order Category'
	aufk.OrderCategory,
	
	@EndUserText.label: 'Order Type'
	aufk.OrderType,
	
	@EndUserText.label: 'Order Internal ID'
	afko.OrderInternalID,
	
	@Semantics.text: true
	@EndUserText.label: 'Order Description'
	aufk.OrderDescription,
	
	@EndUserText.label: 'Plant'
	aufk.Plant,
	
	@EndUserText.label: 'MRP Controller'
	afko.MRPController,
	
	@EndUserText.label: 'Controlling Area'
	aufk.ControllingArea,
	
	@EndUserText.label: 'Company Code'
	aufk.CompanyCode,
	
	@EndUserText.label: 'Profit Center'
	aufk.ProfitCenter,
	
	@EndUserText.label: 'Object Number'
	aufk.ObjectInternalID,
	
	@EndUserText.label: 'Statistical'
	aufk.IsStatisticalOrder,
	_OrderHierarchyNode
}