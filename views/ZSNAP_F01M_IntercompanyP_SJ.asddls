@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'SNAP: Company Code Pairings'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'IntercompanyPairing'

define view entity ZSNAP_F01M_IntercompanyP_SJ
	as select from t880 as main
	
	left outer to many join t880 as OffsettingCompany on main.rcomp < OffsettingCompany.rcomp and 4 >= length (ltrim (OffsettingCompany.rcomp, '0'))
	left outer to one join t001 as MainCompanyCode on MainCompanyCode.rcomp = main.rcomp
	left outer to one join t001 as OffsettingCompanyCode on OffsettingCompanyCode.rcomp = OffsettingCompany.rcomp
{
	@EndUserText.label: 'Pairing Key'
	@ObjectModel.text.element: ['Description']
	key concat (coalesce (MainCompanyCode.bukrs, lpad (ltrim (main.rcomp, '0'), 4, '0')), concat ('-', coalesce (OffsettingCompanyCode.bukrs, lpad (ltrim (OffsettingCompany.rcomp, '0'), 4, '0')))) as IntercompanyPairing,
	
	@EndUserText.label: 'Description'
	@Semantics.text: true
	concat_with_space (main.name1, concat_with_space ('<=>', OffsettingCompany.name1, 1), 1) as Description
}
where 4 >= length (ltrim (main.rcomp, '0'))