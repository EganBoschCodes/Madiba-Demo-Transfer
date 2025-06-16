@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Payment Terms and Conditions 1'

define view entity ZSNAP_F70G_P_PmtTermsCnds1
	as select from t052 as main
	
	left outer to one join t052u as Text on Text.spras = $session.system_language and Text.zterm = main.zterm and Text.ztagg = main.ztagg
{
	key main.zterm as PaymentTerms,
	key main.ztagg as PaymentTermsValidityMonthDay,
	Text.text1 as PaymentTermsDescription,
	main.ztag1 as CashDiscount1Days,
	main.zprz1 as CashDiscount1Percent,
	main.ztag2 as CashDiscount2Days,
	main.zprz2 as CashDiscount2Percent,
	main.ztag3 as NetPaymentDays,
	main.koart as PaymentTermsFinAccountType,
	length (main.ztag1) as ztag1_length,
	length (main.ztag2) as ztag2_length,
	length (main.ztag3) as ztag3_length
}