@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP F01: Additional Field Derivation'

define view entity ZSNAP_F01S_305	
	with parameters
		P_Signage: abap.char(1),
		P_KeyDate: sydate,
		P_ClearedDate: sydate,
		P_NetDueInterval1InDays: abap.int4,
		P_NetDueInterval2InDays: abap.int4,
		P_NetDueInterval3InDays: abap.int4,
		P_NetDueInterval4InDays: abap.int4,
		P_DisplayCurrency: abap.cuky,
		P_ExchangeRateType: kurst,
		P_IncludeSpecialGL: abap.char(1),
		P_EarlyPaymentToleranceDays: abap.int4
	
	as select from ZSNAP_F01S_303 (P_KeyDate: $parameters.P_KeyDate, P_ClearedDate: $parameters.P_ClearedDate, P_NetDueInterval1InDays: $parameters.P_NetDueInterval1InDays, P_NetDueInterval2InDays: $parameters.P_NetDueInterval2InDays, P_NetDueInterval3InDays: $parameters.P_NetDueInterval3InDays, P_NetDueInterval4InDays: $parameters.P_NetDueInterval4InDays, P_DisplayCurrency: $parameters.P_DisplayCurrency, P_ExchangeRateType: $parameters.P_ExchangeRateType, P_EarlyPaymentToleranceDays: $parameters.P_EarlyPaymentToleranceDays) as main
	
	association [0..*] to ZSNAP_F01G_AccngDocTypeText as _AccountingDocumentTypeText on $projection.AccountingDocumentType = _AccountingDocumentTypeText.AccountingDocumentType and _AccountingDocumentTypeText.Language = $session.system_language
	association [0..1] to ZSNAP_F01G_CalendarDate as _CalendarDate on $projection.PostingDate = _CalendarDate.CalendarDate
	association [0..1] to ZSNAP_F01G_FiscCalendarDate as _ClearingFiscalCalendarDate on $projection.FiscalYearVariant = _ClearingFiscalCalendarDate.FiscalYearVariant and $projection.ClearingDate = _ClearingFiscalCalendarDate.CalendarDate
	association [0..1] to ZSNAP_F01G_FiscCalendarDate as _FiscalCalendarDate on $projection.FiscalYearVariant = _FiscalCalendarDate.FiscalYearVariant and $projection.PostingDate = _FiscalCalendarDate.CalendarDate
	association [0..1] to ZSNAP_F01G_GLAccountInCOA as _GLAccount on $projection.GLAccount = _GLAccount.GLAccount and $projection.ChartOfAccounts = _GLAccount.ChartOfAccounts
	association [1..1] to ZSNAP_F01G_JournalEntry as _JournalEntry on $projection.CompanyCode = _JournalEntry.CompanyCode and $projection.FiscalYear = _JournalEntry.FiscalYear and $projection.AccountingDocument = _JournalEntry.AccountingDocument
	association [0..1] to ZSNAP_F01G_PmtBlockingRsnT as _PaymentBlockingReasonText on $projection.PaymentBlockingReason = _PaymentBlockingReasonText.PaymentBlockingReason and _PaymentBlockingReasonText.Language = $session.system_language
	association [0..1] to ZSNAP_F01G_PostingKeyText as _PostingKeyText on $projection.PostingKey = _PostingKeyText.PostingKey and _PostingKeyText.Language = $session.system_language
	association [0..1] to ZSNAP_F01G_PurchasingDoc as _PurchaseOrder on _PurchaseOrder.PurchasingDocument = main.PurchasingDocument
	association [0..1] to ZSNAP_F01G_Supplier as _Supplier on _Supplier.Supplier = $projection.Supplier
	association [0..1] to ZSNAP_F01G_SupplierCompany as _SupplierCompany on _SupplierCompany.CompanyCode = $projection.CompanyCode and _SupplierCompany.Supplier = $projection.Supplier
{
	key main.CompanyCode,
	key main.FiscalYear,
	key main.AccountingDocument,
	key main.AccountingDocumentItem,
	main.DocumentItemText,
	main.AccountingDocumentCategory,
	main.AccountingDocumentType,
	_AccountingDocumentTypeText.AccountingDocumentTypeName,
	main.InvoiceReference,
	main.InvoiceReferenceType,
	main.InvoiceItemReference,
	main.InvoiceReferenceFiscalYear,
	main.DebitCreditCode,
	main.ClearingAccountingDocument,
	_JournalEntry.AccountingDocumentHeaderText,
	_JournalEntry.DocumentReferenceID,
	_JournalEntry.AccountingDocumentCreationDate,
	_JournalEntry.LastChangeDate,
	main.FinancialAccountType,
	main.PostingDate,
	_CalendarDate.CalendarMonth,
	_CalendarDate.CalendarQuarter,
	_CalendarDate.CalendarWeek,
	_CalendarDate.CalendarYear,
	_FiscalCalendarDate.FiscalPeriod,
	_FiscalCalendarDate.FiscalQuarter,
	_FiscalCalendarDate.FiscalYearPeriod,
	_FiscalCalendarDate.FiscalYearQuarter,
	_ClearingFiscalCalendarDate.FiscalYear as ClearingFiscalYear,
	_ClearingFiscalCalendarDate.FiscalPeriod as ClearingFiscalPeriod,
	_ClearingFiscalCalendarDate.FiscalQuarter as ClearingFiscalQuarter,
	_ClearingFiscalCalendarDate.FiscalYearPeriod as ClearingFiscalYearPeriod,
	_ClearingFiscalCalendarDate.FiscalYearQuarter as ClearingFiscalYearQuarter,
	main.ClearingDate,
	main.DocumentDate,
	main.DueCalculationBaseDate,
	main.CashDiscount1Days,
	main.CashDiscount1Percent,
	main.CashDiscount1Date,
	main.CashDiscount2Days,
	main.CashDiscount2Percent,
	main.CashDiscount2Date,
	main.PaymentTerms,
	main.PaymentBlockingReason,
	_PaymentBlockingReasonText.PaymentBlockingReasonName,
	main.PaymentMethod,
	main.IsUsedInPaymentTransaction,
	main.PostingKey,
	_PostingKeyText.PostingKeyName,
	main.NetDueArrearsDays,
	main.NetDueArrearsDaysInt,
	main.NetDueDate,
	main.GLAccount,
	_GLAccount.CorporateGroupAccount as GroupAccount,
	_GLAccount.CorporateGroupChartOfAccounts as GroupChartOfAccounts,
	main.SpecialGLCode,
	main.CostCenter,
	main.ProfitCenter,
	main.BusinessArea,
	main.FunctionalArea,
	main.Segment,
	main.PurchasingDocument,
	_PurchaseOrder.PaymentTerms as POPaymentTerms,
	case
		when _PurchaseOrder.PaymentTerms <> main.PaymentTerms then 'X'
		else ''
	end as POPaymentTermsDiffer,
	main.AssignmentReference,
	main.Supplier,
	_Supplier.OrganizationBPName1 as SupplierName,
	_Supplier._StandardAddress.Country as SupplierCountry,
	_Supplier._StandardAddress.Region as SupplierRegion,
	_SupplierCompany.AccountingClerk,
	_SupplierCompany.ReconciliationAccount,
	_Supplier.AuthorizationGroup as SupplierBasicAuthorizationGrp,
	_SupplierCompany.AuthorizationGroup as SupplierFinsAuthorizationGrp,
	_SupplierCompany.WithholdingTaxCode,
	_Supplier.SupplierAccountGroup,
	case main.PartnerCompany
		when '' then ''
		else 'X'
	end as SupplierIsIntercompany,
	main.PartnerCompany,
	case
		when _Supplier.PartnerCompanyCode = '' then ''
		when main.CompanyCode < _Supplier.PartnerCompanyCode then concat (main.CompanyCode, concat ('-', _Supplier.PartnerCompanyCode))
		else concat (_Supplier.PartnerCompanyCode, concat ('-', main.CompanyCode))
	end as IntercompanyPairing,
	main.ChartOfAccounts,
	main.ControllingArea,
	main.FiscalYearVariant,
	main.ClearingDateVsDueDateOffset,
	main.PaymentTimingCategory,
	main.IsOverdue,
	main.DaysOverdue,
	main.DaysOverdueInt,
	main.IsCleared,
	main.NetDueIntervalText,
	case
		when main.AmountInDisplayCurrency is null and main.AmountInCompanyCodeCurrency <> 0 then 'X'
		else ''
	end as IsConversionBroken,
	$parameters.P_IncludeSpecialGL as IncludeSpecialGL,
	$parameters.P_Signage as Signage,
	main.Title,
	
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	case $parameters.P_Signage
		when 'A' then main.AmountInCompanyCodeCurrency
		else -main.AmountInCompanyCodeCurrency
	end as AmountInCompanyCodeCurrency,
	main.CompanyCodeCurrency,
	
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	case $parameters.P_Signage
		when 'A' then main.AmountInGlobalCurrency
		else -main.AmountInGlobalCurrency
	end as AmountInGlobalCurrency,
	main.GlobalCurrency,
	
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	case $parameters.P_Signage
		when 'A' then main.AmountInTransactionCurrency
		else -main.AmountInTransactionCurrency
	end as AmountInTransactionCurrency,
	main.TransactionCurrency,
	
	@Semantics.amount.currencyCode: 'DisplayCurrency'
	case $parameters.P_Signage
		when 'A' then main.AmountInDisplayCurrency
		else -main.AmountInDisplayCurrency
	end as AmountInDisplayCurrency,
	main.DisplayCurrency,
	_AccountingDocumentTypeText,
	_CalendarDate,
	_FiscalCalendarDate,
	_JournalEntry,
	_PaymentBlockingReasonText,
	_PostingKeyText,
	_Supplier,
	_SupplierCompany
}