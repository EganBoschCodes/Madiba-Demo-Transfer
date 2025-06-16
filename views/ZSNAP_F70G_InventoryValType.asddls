@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Inventory Valuation Type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'InventoryValuationType'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_InventoryValType
	as select from t149d as main
{
	@EndUserText.label: 'Valuation Type'
	key main.bwtar as InventoryValuationType,
	
	@EndUserText.label: 'Acct Cat. Reference'
	main.kkref as AcctCategoryRef,
	
	@EndUserText.label: 'Int. Purchase Orders'
	main.bsint as InternalPurchasingRule,
	
	@EndUserText.label: 'Ext. Purchase Orders'
	main.bsext as ExternalPurchasingRule
}