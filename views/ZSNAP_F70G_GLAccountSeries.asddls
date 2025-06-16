@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'SNAP: GL Account Series'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'GLAccountSeries'

define view entity ZSNAP_F70G_GLAccountSeries
	as select from ZSNAP_F70G_SingleRow as main
{
	@ObjectModel.text.element: ['Description']
	key '1' as GLAccountSeries,
	
	@Semantics.text: true
	cast ('Assets' as abap.char (30)) as Description
}

union all select from ZSNAP_F70G_SingleRow as main
{
	key '2' as GLAccountSeries,
	cast ('Liabilities' as abap.char (30)) as Description
}

union all select from ZSNAP_F70G_SingleRow as main
{
	key '3' as GLAccountSeries,
	cast ('Equity' as abap.char (30)) as Description
}

union all select from ZSNAP_F70G_SingleRow as main
{
	key '4' as GLAccountSeries,
	cast ('Revenue' as abap.char (30)) as Description
}

union all select from ZSNAP_F70G_SingleRow as main
{
	key '5' as GLAccountSeries,
	cast ('Cost of Goods Sold' as abap.char (30)) as Description
}

union all select from ZSNAP_F70G_SingleRow as main
{
	key '6' as GLAccountSeries,
	cast ('Expenses' as abap.char (30)) as Description
}

union all select from ZSNAP_F70G_SingleRow as main
{
	key '7' as GLAccountSeries,
	cast ('Expenses' as abap.char (30)) as Description
}

union all select from ZSNAP_F70G_SingleRow as main
{
	key '8' as GLAccountSeries,
	cast ('Expenses' as abap.char (30)) as Description
}

union all select from ZSNAP_F70G_SingleRow as main
{
	key '9' as GLAccountSeries,
	cast ('Reconciliation' as abap.char (30)) as Description
}