@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Accounting Document Category'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'AccountingDocumentCategory'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_AccngDocCategory
	as select from dd07l as main
	
	association [0..*] to ZSNAP_F72G_AccngDocCateg_BH as _Text on $projection.AccountingDocumentCategory = _Text.AccountingDocumentCategory
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Document Status'
	key cast (main.domvalue_l as farp_bstat_d) as AccountingDocumentCategory,
	_Text
}
where main.domname = 'BSTAT'
	and main.as4local = 'A'