@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'SNAP: Signage Options'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Signage'

define view entity ZSNAP_F72G_Signage
	as select from ZSNAP_F72G_SingleRow as main
{
	@ObjectModel.text.element: ['SignageDescription']
	key 'A' as Signage,
	
	@Semantics.text: true
	cast ('Accounting Sign' as abap.char (30)) as SignageDescription
}

union all select from ZSNAP_F72G_SingleRow as main
{
	key 'R' as Signage,
	cast ('Reporting Sign' as abap.char (30)) as SignageDescription
}