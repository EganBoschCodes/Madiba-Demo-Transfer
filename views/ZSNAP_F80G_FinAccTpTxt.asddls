@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Financial Account Type - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'FinancialAccountType'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F80G_FinAccTpTxt
	as select from dd07t as main
{
	key cast (substring (main.domvalue_l, 1, 1) as farp_koart) as FinancialAccountType,
	
	@Semantics.language: true
	key cast (main.ddlanguage as spras) as Language,
	
	@Semantics.text: true
	cast (main.ddtext as fis_fin_acc_type_name) as FinancialAccountTypeName,
	
	@Analytics.hidden: true
	@Consumption.hidden: true
	main.domvalue_l as DomainValue
}
where (main.domname = 'FARP_KOART' and main.as4local = 'A')
	and main.ddlanguage = $session.system_language