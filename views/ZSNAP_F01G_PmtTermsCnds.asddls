@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Payment Terms Conditions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_PmtTermsCnds
	as select from ZSNAP_F01G_P_PmtTermsCnds2 as main
{
	key cast (main.PaymentTerms as farp_dzterm) as PaymentTerms,
	
	@ObjectModel.text.element: ['PaymentTermsDescription']
	key main.PaymentTermsValidityMonthDay,
	main.PaymentTermsDescription,
	main.PaymentTermsFinAccountType,
	cast (cast (main.CashDiscount1Days as abap.dec(3, 0)) as farp_dzbd1t) as CashDiscount1Days,
	cast (cast (case
		when main.CashDiscount1Days > main.CashDiscount2Days then main.CashDiscount1Days
		else main.CashDiscount2Days
	end as abap.dec(3, 0)) as farp_dzbd2t) as CashDiscount2Days,
	cast (cast (case
		when main.CashDiscount2Days > main.NetPaymentDays then main.CashDiscount2Days
		when main.CashDiscount1Days > main.NetPaymentDays then main.CashDiscount1Days
		else main.NetPaymentDays
	end as abap.dec(3, 0)) as farp_dzbd3t) as NetPaymentDays,
	cast (main.CashDiscount1Percent as dzbd1p_farp) as CashDiscount1Percent,
	cast (main.CashDiscount2Percent as dzbd2p_farp) as CashDiscount2Percent
}