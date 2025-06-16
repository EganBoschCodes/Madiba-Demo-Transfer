@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Material'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Material'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F72G_Material
	as select from mara as main
	
	association [0..*] to ZSNAP_F72G_MaterialText as _Text on $projection.Material = _Text.Material
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Material'
	key main.matnr as Material,
	
	@EndUserText.label: 'Material Type'
	main.mtart as MaterialType,
	
	@EndUserText.label: 'Material Group'
	main.matkl as MaterialGroup,
	
	@EndUserText.label: 'Ext. Material Group'
	main.extwg as ExternalMaterialGroup,
	
	@EndUserText.label: 'Period Ind. For Sled'
	main.iprkz as PeriodIndicator,
	
	@EndUserText.label: 'Product Hierarchy'
	substring (main.prdha, 8, 3) as ProductFamily,
	
	@EndUserText.label: 'Product Hierarchy'
	main.prdha as ProductHierarchy,
	
	@EndUserText.label: 'Total Shelf Life'
	main.mhdhb as TotalShelfLife,
	
	@EndUserText.label: 'Min. Rem. Shelf Life'
	main.mhdrz as MinimumRemainingShelfLife,
	
	@EndUserText.label: 'Base Unit Of Measure'
	main.meins as MaterialBaseUnit,
	
	@Semantics.quantity.unitOfMeasure: 'MaterialWeightUnit'
	@EndUserText.label: 'Gross Weight'
	main.brgew as MaterialGrossWeight,
	
	@Semantics.quantity.unitOfMeasure: 'MaterialWeightUnit'
	@EndUserText.label: 'Net Weight'
	main.ntgew as MaterialNetWeight,
	
	@EndUserText.label: 'Unit Of Weight'
	main.gewei as MaterialWeightUnit,
	
	@EndUserText.label: 'Manufacturer'
	main.mfrnr as MaterialManufacturerNumber,
	
	@EndUserText.label: 'Manufacturer Part No.'
	main.mfrpn as MaterialManufacturerPartNumber,
	
	@EndUserText.label: 'Batch Management'
	main.xchpf as IsBatchManagementRequired,
	
	@EndUserText.label: 'Authorization Group'
	main.begru as AuthorizationGroup,
	_Text
}