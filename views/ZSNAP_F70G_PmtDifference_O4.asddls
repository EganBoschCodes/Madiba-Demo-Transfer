@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Payment Difference Reason - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'PaymentDifferenceReason'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_PmtDifference_O4
	as select from t053s as main
	
	association [1..1] to ZSNAP_F70G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
{
	@ObjectModel.foreignKey.association: '_CompanyCode'
	key cast (main.bukrs as fis_bukrs) as CompanyCode,
	
	@ObjectModel.text.element: [ 'PaymentDifferenceReasonDesc' ]
	key cast (main.rstgr as farp_rstgr) as PaymentDifferenceReason,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.txt20 as PaymentDifferenceReasonName,
	
	@Semantics.text: true
	main.txt40 as PaymentDifferenceReasonDesc,
	_CompanyCode
}
where main.spras = $session.system_language