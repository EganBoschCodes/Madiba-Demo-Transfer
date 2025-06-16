@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Payment Term Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'PaymentTerms'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_PaymentTermsText
	as select from tvzbt as main
{
	@ObjectModel.text.element: ['PaymentTermsName']
	key cast (main.zterm as farp_dzterm) as PaymentTerms,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.vtext as PaymentTermsName
}
where main.spras = $session.system_language