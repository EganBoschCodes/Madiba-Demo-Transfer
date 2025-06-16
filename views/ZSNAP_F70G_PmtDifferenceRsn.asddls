@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Payment Difference Reason'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PaymentDifferenceReason'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_PmtDifferenceRsn
	as select from t053r as main
	
	association [1..1] to ZSNAP_F70G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [0..*] to ZSNAP_F70G_PmtDifference_O4 as _Text on $projection.CompanyCode = _Text.CompanyCode and $projection.PaymentDifferenceReason = _Text.PaymentDifferenceReason
{
	@ObjectModel.foreignKey.association: '_CompanyCode'
	@EndUserText.label: 'Company Code'
	key cast (main.bukrs as fis_bukrs) as CompanyCode,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Reason Code'
	key cast (main.rstgr as farp_rstgr) as PaymentDifferenceReason,
	
	@EndUserText.label: 'Disputed Item'
	main.xstrp as IsDisputed,
	
	@EndUserText.label: 'Charge Off Diff.'
	main.xausb as PaytDiffIsChargedToSprtGLAcct,
	_CompanyCode,
	_Text
}