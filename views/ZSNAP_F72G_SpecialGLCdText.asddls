@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Special GL Code - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'SpecialGLCode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F72G_SpecialGLCdText
	as select from t074t as main
	
	association [0..1] to ZSNAP_F72G_FinancialAccType as _FinancialAccountType on $projection.FinancialAccountType = _FinancialAccountType.FinancialAccountType
{
	@ObjectModel.foreignKey.association: '_FinancialAccountType'
	key main.koart as FinancialAccountType,
	
	@ObjectModel.text.element: ['SpecialGLCodeLongName']
	key main.shbkz as SpecialGLCode,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.text: true
	main.ktext as SpecialGLCodeName,
	
	@Semantics.text: true
	main.ltext as SpecialGLCodeLongName,
	_FinancialAccountType
}
where main.spras = $session.system_language