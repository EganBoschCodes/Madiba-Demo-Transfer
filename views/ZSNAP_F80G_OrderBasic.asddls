@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Order Header Basic'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F80G_OrderBasic
	as select from aufk as main
{
	@ObjectModel.text.element: ['OrderDescription']
	key main.aufnr as OrderID,
	cast (main.autyp as pph_autyp preserving type) as OrderCategory,
	cast (main.auart as aufart preserving type) as OrderType,
	
	@Semantics.text: true
	cast (main.ktext as pph_auftext preserving type) as OrderDescription,
	main.astkz as IsStatisticalOrder,
	main.werks as Plant,
	main.bukrs as CompanyCode,
	main.kokrs as ControllingArea,
	main.prctr as ProfitCenter,
	cast (main.objnr as pph_objnr preserving type) as ObjectInternalID
}