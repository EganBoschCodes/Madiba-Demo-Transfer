@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Payment Blocking Reason - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'PaymentBlockingReason'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_PmtBlockingRsnT
	as select from t008t as main
{
	@Semantics.language: true
	key main.spras as Language,
	key cast (main.zahls as farp_dzlspr) as PaymentBlockingReason,
	
	@Semantics.text: true
	cast (main.textl as farp_payment_block_reason_name) as PaymentBlockingReasonName
}
where main.spras = $session.system_language