@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Reference Document Type - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'ReferenceDocumentType'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_ReferenceDocTpT
	as select from ttypt as main
{
	key cast (main.awtyp as fis_awtyp) as ReferenceDocumentType,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.otext as ReferenceDocumentTypeName
}
where main.spras = $session.system_language