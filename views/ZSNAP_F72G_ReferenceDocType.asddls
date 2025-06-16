@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Reference Document Type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ReferenceDocumentType'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_ReferenceDocType
	as select from ttyp as main
	
	association [0..*] to ZSNAP_F72G_ReferenceDocTpT as _Text on $projection.ReferenceDocumentType = _Text.ReferenceDocumentType
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Reference Document Type'
	key cast (main.awtyp as fis_awtyp) as ReferenceDocumentType,
	_Text
}