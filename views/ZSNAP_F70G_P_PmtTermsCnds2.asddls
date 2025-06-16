@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Payment Terms and Conditions 2'

define view entity ZSNAP_F70G_P_PmtTermsCnds2
	as select from ZSNAP_F70G_P_PmtTermsCnds1 as main
{
	key main.PaymentTerms,
	key main.PaymentTermsValidityMonthDay,
	main.PaymentTermsDescription,
	main.CashDiscount1Percent,
	main.CashDiscount2Percent,
	main.PaymentTermsFinAccountType,
	case
		when main.ztag1_length is null or main.ztag1_length = 0 then '000'
		else main.CashDiscount1Days
	end as CashDiscount1Days,
	case
		when main.ztag2_length is null or main.ztag2_length = 0 then '000'
		else main.CashDiscount2Days
	end as CashDiscount2Days,
	case
		when main.ztag3_length is null or main.ztag3_length = 0 then '000'
		else main.NetPaymentDays
	end as NetPaymentDays
}