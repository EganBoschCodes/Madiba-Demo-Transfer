@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Payment Blocking Reason'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PaymentBlockingReason'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F01G_PmtBlockingRsn
	as select from t008 as main
	
	association [0..*] to ZSNAP_F01G_PmtBlockingRsnT as _Text on $projection.PaymentBlockingReason = _Text.PaymentBlockingReason
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Item Payment Block'
	key cast (main.zahls as farp_dzlspr) as PaymentBlockingReason,
	_Text
}