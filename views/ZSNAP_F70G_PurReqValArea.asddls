@AccessControl.authorizationCheck: #PRIVILEGED_ONLY
@EndUserText.label: 'Valuation Area'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ValuationArea'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F70G_PurReqValArea
	as select from t001k as main
	
	association [1..1] to ZSNAP_F70G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
{
	key main.bwkey as ValuationArea,
	main.bukrs as CompanyCode,
	
	@Semantics.text
	_CompanyCode.CompanyCodeName,
	_CompanyCode
}