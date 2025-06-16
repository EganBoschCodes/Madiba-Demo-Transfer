@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: Looking for Duplicated Docs'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F80S_V01	
	with parameters
		P_Signage: abap.char (1),
		P_CashStartDate: abap.dats
	
	as select from ZSNAP_F80S_C01 (P_Signage: $parameters.P_Signage, P_CashStartDate: $parameters.P_CashStartDate) as main
{
	@EndUserText.label: 'Accounting Document'
	key main.AccountingDocument,
	
	@EndUserText.label: 'Company Code'
	key main.CompanyCode,
	
	@EndUserText.label: 'Fiscal Year'
	key main.FiscalYear,
	
	@EndUserText.label: 'Ledger GL Line Item'
	key main.LedgerGLLineItem,
	
	@EndUserText.label: 'Source'
	count (distinct main.Source) as NumSources
}
group by main.AccountingDocument,
	main.CompanyCode,
	main.FiscalYear,
	main.LedgerGLLineItem