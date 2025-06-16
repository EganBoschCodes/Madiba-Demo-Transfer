@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchasing Document Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_PrchngDocItem
	as select from ekpo as main
{
	key main.ebeln as PurchasingDocument,
	
	@ObjectModel.text.element: ['PurchasingDocumentItemText']
	key main.ebelp as PurchasingDocumentItem,
	
	@Semantics.text: true
	main.txz01 as PurchasingDocumentItemText
}