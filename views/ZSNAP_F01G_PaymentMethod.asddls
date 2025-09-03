@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Payment Method for Country/Region'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PaymentMethod'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_PaymentMethod
	as select from t042z as main
	
	left outer to one join t042zt on main.land1 = t042zt.land1 and main.zlsch = t042zt.zlsch and t042zt.spras = $session.system_language
	
	association [0..1] to ZSNAP_F01G_Country as _Country on $projection.Country = _Country.Country
{
	@ObjectModel.foreignKey.association: '_Country'
	@EndUserText.label: 'Country/Region Key'
	key main.land1 as Country,
	
	@ObjectModel.text.element: ['PaymentMethodName']
	@EndUserText.label: 'Payment Method'
	key cast (main.zlsch as farp_schzw_bseg) as PaymentMethod,
	
	@Semantics.text: true
	@EndUserText.label: 'Payment Method Name'
	cast (case
		when t042zt.text2 is null or t042zt.text2 = '' then main.text1
		else t042zt.text2
	end as farp_schzw_text) as PaymentMethodName,
	
	@EndUserText.label: 'Check Is Created'
	main.xschk as PaymentMethodIsUsedForCheck,
	
	@EndUserText.label: 'Bill Of Exchange Will Be Created'
	main.xwech as PaytMethIsUsdForBillOfExchange,
	
	@EndUserText.label: 'Check/Bill Of Exchange'
	main.xswec as PaytMethIsUsdForChkBillOfExch,
	
	@EndUserText.label: 'Payment Method For Incoming Pmnts'
	main.xeinz as IsPaytMethForIncomingPayments,
	_Country
}