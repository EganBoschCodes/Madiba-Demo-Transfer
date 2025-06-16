@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Accounting Document Category - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'AccountingDocumentCategory'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_AccngDocCateg_LZ
	as select from dd07t as main
{
	key cast (main.domvalue_l as farp_bstat_d) as AccountingDocumentCategory,
	
	@Semantics.language: true
	key cast (main.ddlanguage as spras) as Language,
	
	@Semantics.text: true
	cast (main.ddtext as fis_val_text) as AccountingDocumentCategoryName
}
where (main.domname = 'BSTAT' and main.as4local = 'A')
	and main.ddlanguage = $session.system_language