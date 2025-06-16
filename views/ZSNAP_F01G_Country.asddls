@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Country/Region'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Country'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F01G_Country
	as select from t005 as main
	
	association [0..*] to ZSNAP_F01G_CountryText as _Text on $projection.Country = _Text.Country
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Country/Region Key'
	key main.land1 as Country,
	
	@EndUserText.label: 'Iso Code 3 Characters'
	main.intca3 as CountryThreeLetterISOCode,
	
	@EndUserText.label: 'Iso Code Numeric 3-Chars.'
	main.intcn3 as CountryThreeDigitISOCode,
	
	@EndUserText.label: 'Iso Code'
	main.intca as CountryISOCode,
	
	@ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
	_Text
}