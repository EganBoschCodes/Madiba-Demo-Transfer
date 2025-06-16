@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP F80: Historical Snapshot Load'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F80S_L01	
	with parameters
		P_CashStartDate: abap.dats
	
	as select from ZSNAP_F80S_315 (P_Client: $session.client, P_SystemDate: $session.system_date, P_CashStartDate: $parameters.P_CashStartDate) as main
{
	@EndUserText.label: 'Abap.Char (4)'
	key main.CompanyCode,
	
	@EndUserText.label: 'Abap.Char (10)'
	key main.AccountingDocument,
	
	@EndUserText.label: 'Abap.Numc (4)'
	key main.FiscalYear,
	
	@EndUserText.label: 'Abap.Numc (3)'
	key main.AccountingDocumentItem,
	
	@EndUserText.label: 'Abap.Int4'
	key main.EntryCounter,
	
	@EndUserText.label: 'Abap.Dats (8)'
	main.ClearingDate,
	
	@EndUserText.label: 'Abap.Char (10)'
	main.ClearingAccountingDocument,
	
	@EndUserText.label: 'Abap.Char (1)'
	main.FinancialAccountType,
	
	@EndUserText.label: 'Abap.Char (1)'
	main.ResetFlag,
	
	@EndUserText.label: 'Abap.Char (1)'
	main.MostRecentFlag
}