@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Payment Terms'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PaymentTerms'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_PaymentTerms
	as select distinct from ZSNAP_F01G_PmtTermsCnds as main
	
	association [0..1] to ZSNAP_F01G_PaymentTermsText as _Text on $projection.PaymentTerms = _Text.PaymentTerms
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Terms of Payment'
	key main.PaymentTerms,
	
	@EndUserText.label: 'Payment Terms Fin. Account Type'
	main.PaymentTermsFinAccountType,
	
	@EndUserText.label: 'Cash Discount 1 Days'
	main.CashDiscount1Days,
	
	@EndUserText.label: 'Cash Discount 2 Days'
	main.CashDiscount2Days,
	
	@EndUserText.label: 'Net Payment Days'
	main.NetPaymentDays,
	
	@EndUserText.label: 'Cash Discount 1 Percent'
	main.CashDiscount1Percent,
	
	@EndUserText.label: 'Cash Discount 2 Percent'
	main.CashDiscount2Percent,
	
	@Consumption.hidden: true
	@EndUserText.label: 'Days Net'
	cast (main.NetPaymentDays as abap.int4) as PaymentTermsDays,
	_Text
}