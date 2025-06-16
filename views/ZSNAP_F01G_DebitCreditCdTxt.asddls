@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Debit Credit Code - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'DebitCreditCode'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F01G_DebitCreditCdTxt
	as select from dd07t as main
{
	@Semantics.language
	key cast (main.ddlanguage as spras) as Language,
	key cast (main.domvalue_l as fis_shkzg) as DebitCreditCode,
	
	@Semantics.text
	cast (main.ddtext as fis_shkzg_name) as DebitCreditCodeName
}
where (main.domname = 'SHKZG' and main.as4local = 'A')
	and main.ddlanguage = $session.system_language