@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Debit Credit Code'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'DebitCreditCode'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F80G_DebitCreditCode
	as select from dd07l as main
	
	association [0..*] to ZSNAP_F80G_DebitCreditCdTxt as _Text on $projection.DebitCreditCode = _Text.DebitCreditCode
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Debit/Credit Code'
	key cast (main.domvalue_l as fis_shkzg) as DebitCreditCode,
	_Text
}
where main.domname = 'SHKZG'
	and main.as4local = 'A'
	and main.as4vers = '0000'