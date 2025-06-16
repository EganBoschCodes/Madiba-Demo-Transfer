@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'SNAP F80: Cash Source Options'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Source'

define view entity ZSNAP_F80M_CashSource
	as select from ZSNAP_F80G_SingleRow as main
{
	@ObjectModel.text.element: ['SourceDescription']
	key cast ('1A' as abap.char (2)) as Source,
	
	@Semantics.text: true
	cast ('Cash GL Account' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key cast ('1B' as abap.char (2)) as Source,
	cast ('Cash GL Account - IC' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key cast ('1D' as abap.char (2)) as Source,
	cast ('Cash GL Account - Reversals' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '2A' as Source,
	cast ('Cash JE Doc Type' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '2B' as Source,
	cast ('Cash JE Doc Type - IC' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '2D' as Source,
	cast ('Cash JE Doc Type - Reversals' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '3A' as Source,
	cast ('New Cleared AR' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '3B' as Source,
	cast ('New Cleared AR - IC' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '3D' as Source,
	cast ('New Cleared AR - Reversals' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '4A' as Source,
	cast ('New Cleared AP' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '4B' as Source,
	cast ('New Cleared AP - IC' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '4D' as Source,
	cast ('New Cleared AP - Reversals' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '5A' as Source,
	cast ('Historical Cleared AR' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '5B' as Source,
	cast ('Historical Cleared AR - IC' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '5C' as Source,
	cast ('Historical Cleared AR - Resets' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '5D' as Source,
	cast ('Historical Cleared AR - Reversals' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '6A' as Source,
	cast ('Historical Cleared AP' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '6B' as Source,
	cast ('Historical Cleared AP - IC' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '6C' as Source,
	cast ('Historical Cleared AP - Resets' as abap.char (40)) as SourceDescription
}

union all select from ZSNAP_F80G_SingleRow as main
{
	key '6D' as Source,
	cast ('Historical Cleared AP - Reversals' as abap.char (40)) as SourceDescription
}