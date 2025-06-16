@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Cost Center Activity Type'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CostCtrActivityType'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_CCActivityType
	as select from csla as main
	
	association [1] to ZSNAP_F70G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
	association [0..*] to ZSNAP_F70G_CCActivityTpText as _Text on $projection.ControllingArea = _Text.ControllingArea and $projection.CostCtrActivityType = _Text.CostCtrActivityType and $projection.ValidityEndDate = _Text.ValidityEndDate
{
	@EndUserText.label: 'Controlling Area'
	@ObjectModel.foreignKey.association: '_ControllingArea'
	key cast (main.kokrs as fis_kokrs preserving type) as ControllingArea,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Activity Type'
	key main.lstar as CostCtrActivityType,
	
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Valid To'
	key main.datbi as ValidityEndDate,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Valid From'
	main.datab as ValidityStartDate,
	
	@EndUserText.label: 'Activity Unit'
	main.leinh as CostCtrActivityTypeQtyUnit,
	
	@EndUserText.label: 'Atyp Category'
	main.latyp as CostCtrActivityTypeCategory,
	
	@EndUserText.label: 'Allocation Cost Elem'
	main.vksta as AllocationCostElement,
	
	@EndUserText.label: 'Output Unit'
	main.auseh as CostCtrActivityTypeOutpQtyUnit,
	
	@EndUserText.label: 'Entered On'
	main.ersda as CreationDate,
	
	@EndUserText.label: 'Created By'
	main.usnam as EnteredByUser,
	
	@EndUserText.label: 'Origin Group'
	main.hrkft as CostOriginGroup,
	
	@EndUserText.label: 'Actl Acty Type Cat.'
	main.latypi as ActlPostgCostCenterActyTypeCat,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Output Factor'
	main.ausfk as OutputQuantityFactor,
	
	@EndUserText.label: 'Lock Indicator'
	main.sprkz as ActivityTypeIsBlocked,
	
	@EndUserText.label: 'Predistribfixedcosts'
	main.fixvo as FixedCostIsPredistributed,
	
	@EndUserText.label: 'Price Indicator'
	main.tarkz as PriceAllocationMethod,
	
	@EndUserText.label: 'Average Price'
	main.yrate as PeriodPriceIsAverage,
	
	@EndUserText.label: 'Act. Price Indicator'
	main.tarkz_i as ActualPriceAllocationMethod,
	
	@EndUserText.label: 'Actual Qty Set'
	main.manist as ActualQuantityIsSetManually,
	
	@EndUserText.label: 'Plan Qty Set'
	main.manplan as PlanQuantityIsSetManually,
	
	@EndUserText.label: 'Cctr Categories'
	main.kstty as CostCtrActivityTypeValidCat,
	
	@EndUserText.label: 'Comp.Relevanceco'
	main.lark1 as CostCtrActyTypeIsCtrlgRlvtComp,
	
	@EndUserText.label: 'Comp. Relevance: Hr'
	main.lark2 as CostCtrActyTypeIsHumRsceRlvt,
	_ControllingArea,
	_Text
}