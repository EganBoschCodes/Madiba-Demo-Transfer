@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'SNAP: Company Code Pairings'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'IntercompanyPairing'

define view entity ZSNAP_F01M_IntercompanyP_SJ
	as select from t001 as main
	
	left outer to many join t880 as OffsettingCompanyCode on main.bukrs < lpad (ltrim (OffsettingCompanyCode.rcomp, '0'), 4, '0') and length (ltrim (OffsettingCompanyCode.rcomp, '0')) <= 4
{
	@EndUserText.label: 'Pairing Key'
	@ObjectModel.text.element: ['Description']
	key concat (main.bukrs, concat ('-', substring (OffsettingCompanyCode.rcomp, 3, 4))) as IntercompanyPairing,
	
	@EndUserText.label: 'Description'
	@Semantics.text: true
	concat_with_space (main.butxt, concat_with_space ('<=>', OffsettingCompanyCode.name1, 1), 1) as Description
}