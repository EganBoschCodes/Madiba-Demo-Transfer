@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'SNAP F01C01: Accounts Payable Cube'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F01S_C01	
	with parameters
		@Consumption.defaultValue: 'R'
		@EndUserText.label: 'Signage'
		P_Signage: abap.char (1),
		@EndUserText.label: 'Open Items As Of'
		@Environment.systemField: #SYSTEM_DATE
		P_KeyDate: abap.dats,
		@EndUserText.label: 'Cleared Items After'
		@Environment.systemField: #SYSTEM_DATE
		P_ClearedDate: abap.dats,
		@Consumption.defaultValue: '30'
		@EndUserText.label: 'Net Due Interval 1 in Days'
		P_NetDueInterval1InDays: abap.int4,
		@Consumption.defaultValue: '60'
		@EndUserText.label: 'Net Due Interval 2 in Days'
		P_NetDueInterval2InDays: abap.int4,
		@Consumption.defaultValue: '90'
		@EndUserText.label: 'Net Due Interval 3 in Days'
		P_NetDueInterval3InDays: abap.int4,
		@Consumption.defaultValue: '180'
		@EndUserText.label: 'Net Due Interval 4 in Days'
		P_NetDueInterval4InDays: abap.int4,
		@Consumption.defaultValue: 'USD'
		@EndUserText.label: 'Display Currency'
		P_DisplayCurrency: abap.cuky,
		@Consumption.defaultValue: 'M'
		@EndUserText.label: 'Exchange Rate Type'
		P_ExchangeRateType: kurst,
		@Consumption.defaultValue: 'N'
		@EndUserText.label: 'Include Special GL Transactions'
		P_IncludeSpecialGL: abap.char (1),
		@Consumption.defaultValue: '2'
		@EndUserText.label: 'Early Payment Tolerance Days'
		P_EarlyPaymentToleranceDays: abap.int4
	
	as select from ZSNAP_F01S_305 (P_Signage: $parameters.P_Signage, P_KeyDate: $parameters.P_KeyDate, P_ClearedDate: $parameters.P_ClearedDate, P_NetDueInterval1InDays: $parameters.P_NetDueInterval1InDays, P_NetDueInterval2InDays: $parameters.P_NetDueInterval2InDays, P_NetDueInterval3InDays: $parameters.P_NetDueInterval3InDays, P_NetDueInterval4InDays: $parameters.P_NetDueInterval4InDays, P_DisplayCurrency: $parameters.P_DisplayCurrency, P_ExchangeRateType: $parameters.P_ExchangeRateType, P_IncludeSpecialGL: $parameters.P_IncludeSpecialGL, P_EarlyPaymentToleranceDays: $parameters.P_EarlyPaymentToleranceDays) as main
	
	association [0..1] to ZSNAP_F01C_IncludeSpecialGL as _IncludeSpecialGL on _IncludeSpecialGL.IncludeSpecialGL = $projection.IncludeSpecialGL
	association [0..1] to ZSNAP_F01C_IsCleared as _IsCleared on _IsCleared.IsCleared = $projection.IsCleared
	association [0..1] to ZSNAP_F01C_IsConversionB_66 as _IsConversionBroken on _IsConversionBroken.IsConversionBroken = $projection.IsConversionBroken
	association [0..1] to ZSNAP_F01C_IsOverdue as _IsOverdue on _IsOverdue.IsOverdue = $projection.IsOverdue
	association [0..1] to ZSNAP_F01C_IsUsedInPmtTr_BA as _IsUsedInPaymentTransaction on _IsUsedInPaymentTransaction.IsUsedInPaymentTransaction = $projection.IsUsedInPaymentTransaction
	association [0..1] to ZSNAP_F01C_PmtTimingCate_BY as _PaymentTimingCategory on _PaymentTimingCategory.PaymentTimingCategory = $projection.PaymentTimingCategory
	association [0..1] to ZSNAP_F01C_Signage as _Signage on _Signage.Signage = $projection.Signage
	association [0..1] to ZSNAP_F01C_SuppIsInterco_FU as _SupplierIsIntercompany on _SupplierIsIntercompany.SupplierIsIntercompany = $projection.SupplierIsIntercompany
	association [0..1] to ZSNAP_F01G_AccountingClerk as _AccountingClerk on _AccountingClerk.CompanyCode = $projection.CompanyCode and _AccountingClerk.AccountingClerk = $projection.AccountingClerk
	association [0..1] to ZSNAP_F01G_AccngDocCategory as _AccountingDocumentCategory on $projection.AccountingDocumentCategory = _AccountingDocumentCategory.AccountingDocumentCategory
	association [0..1] to ZSNAP_F01G_AccngDocType as _AccountingDocumentType on $projection.AccountingDocumentType = _AccountingDocumentType.AccountingDocumentType
	association [0..1] to ZSNAP_F01G_BusinessArea as _BusinessArea on $projection.BusinessArea = _BusinessArea.BusinessArea
	association [0..1] to ZSNAP_F01G_CalendarDate as _BaselineDate on $projection.DueCalculationBaseDate = _BaselineDate.CalendarDate
	association [0..1] to ZSNAP_F01G_CalendarDate as _CashDiscount1Date on $projection.CashDiscount1Date = _CashDiscount1Date.CalendarDate
	association [0..1] to ZSNAP_F01G_CalendarDate as _CashDiscount2Date on $projection.CashDiscount2Date = _CashDiscount2Date.CalendarDate
	association [0..1] to ZSNAP_F01G_CalendarDate as _ClearingDate on $projection.ClearingDate = _ClearingDate.CalendarDate
	association [0..1] to ZSNAP_F01G_CalendarDate as _DocumentDate on $projection.DocumentDate = _DocumentDate.CalendarDate
	association [0..1] to ZSNAP_F01G_CalendarDate as _NetDueDate on $projection.NetDueDate = _NetDueDate.CalendarDate
	association [0..1] to ZSNAP_F01G_CalendarDate as _PostingDate on $projection.PostingDate = _PostingDate.CalendarDate
	association [1..1] to ZSNAP_F01G_CalendarMonth as _CalendarMonth on $projection.CalendarMonth = _CalendarMonth.CalendarMonth
	association [1..1] to ZSNAP_F01G_CalendarQuarter as _CalendarQuarter on $projection.CalendarQuarter = _CalendarQuarter.CalendarQuarter
	association [1..1] to ZSNAP_F01G_CalendarYear as _CalendarYear on $projection.CalendarYear = _CalendarYear.CalendarYear
	association [0..1] to ZSNAP_F01G_ChartOfAccounts as _ChartOfAccounts on _ChartOfAccounts.ChartOfAccounts = $projection.ChartOfAccounts
	association [0..1] to ZSNAP_F01G_ChartOfAccounts as _GroupChartOfAccounts on $projection.GroupChartOfAccounts = _GroupChartOfAccounts.ChartOfAccounts
	association [0..1] to ZSNAP_F01G_CompanyCode as _CompanyCode on _CompanyCode.CompanyCode = $projection.CompanyCode
	association [0..1] to ZSNAP_F01G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
	association [0..*] to ZSNAP_F01G_CostCenter as _CostCenter on $projection.ControllingArea = _CostCenter.ControllingArea and $projection.CostCenter = _CostCenter.CostCenter
	association [0..1] to ZSNAP_F01G_Country as _SupplierCountry on $projection.SupplierCountry = _SupplierCountry.Country
	association [0..1] to ZSNAP_F01G_DebitCreditCode as _DebitCreditCode on $projection.DebitCreditCode = _DebitCreditCode.DebitCreditCode
	association [0..1] to ZSNAP_F01G_FinancialAccType as _FinancialAccountType on _FinancialAccountType.FinancialAccountType = $projection.FinancialAccountType
	association [0..1] to ZSNAP_F01G_FiscalPeriod as _FiscalPeriod on $projection.FiscalYear = _FiscalPeriod.FiscalYear and $projection.FiscalPeriod = _FiscalPeriod.FiscalPeriod and $projection.FiscalYearVariant = _FiscalPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F01G_FiscalQuarter as _FiscalQuarter on $projection.FiscalYear = _FiscalQuarter.FiscalYear and $projection.FiscalYearVariant = _FiscalQuarter.FiscalYearVariant and $projection.FiscalQuarter = _FiscalQuarter.FiscalQuarter
	association [0..1] to ZSNAP_F01G_FiscalYear as _FiscalYear on $projection.FiscalYear = _FiscalYear.FiscalYear and $projection.FiscalYearVariant = _FiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F01G_FiscalYear as _ReferenceFiscalYear on $projection.InvoiceReferenceFiscalYear = _ReferenceFiscalYear.FiscalYear and $projection.FiscalYearVariant = _ReferenceFiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F01G_FiscalYearPeriod as _FiscalYearPeriod on $projection.FiscalYearPeriod = _FiscalYearPeriod.FiscalYearPeriod and $projection.FiscalYearVariant = _FiscalYearPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F01G_FiscYearQuarter as _FiscalYearQuarter on $projection.FiscalYearVariant = _FiscalYearQuarter.FiscalYearVariant and $projection.FiscalYearQuarter = _FiscalYearQuarter.FiscalYearQuarter
	association [0..1] to ZSNAP_F01G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
	association [0..1] to ZSNAP_F01G_FunctionalArea as _FunctionalArea on $projection.FunctionalArea = _FunctionalArea.FunctionalArea
	association [0..1] to ZSNAP_F01G_GLAccountInCOA as _GLAccountInChartOfAccounts on _GLAccountInChartOfAccounts.ChartOfAccounts = $projection.ChartOfAccounts and _GLAccountInChartOfAccounts.GLAccount = $projection.GLAccount
	association [0..1] to ZSNAP_F01G_GroupAccount as _GroupAccount on $projection.GroupChartOfAccounts = _GroupAccount.ChartOfAccounts and $projection.GroupAccount = _GroupAccount.GroupAccount
	association [1..1] to ZSNAP_F01G_JournalEntry as _ClearingDocument on $projection.CompanyCode = _ClearingDocument.CompanyCode and $projection.FiscalYear = _ClearingDocument.FiscalYear and $projection.ClearingAccountingDocument = _ClearingDocument.AccountingDocument and $projection.FiscalYearVariant = _ClearingDocument.FiscalYearVariant
	association [1..1] to ZSNAP_F01G_JournalEntry as _JournalEntry on $projection.CompanyCode = _JournalEntry.CompanyCode and $projection.FiscalYear = _JournalEntry.FiscalYear and $projection.AccountingDocument = _JournalEntry.AccountingDocument and $projection.FiscalYearVariant = _JournalEntry.FiscalYearVariant
	association [1..1] to ZSNAP_F01G_JournalEntry as _ReferenceDocument on $projection.CompanyCode = _ReferenceDocument.CompanyCode and $projection.InvoiceReferenceFiscalYear = _ReferenceDocument.FiscalYear and $projection.InvoiceReference = _ReferenceDocument.AccountingDocument and $projection.FiscalYearVariant = _ReferenceDocument.FiscalYearVariant
	association [1..1] to ZSNAP_F01G_OplAcctgDocItem as _AccountingDocumentItem on $projection.CompanyCode = _AccountingDocumentItem.CompanyCode and $projection.AccountingDocument = _AccountingDocumentItem.AccountingDocument and $projection.FiscalYear = _AccountingDocumentItem.FiscalYear and $projection.AccountingDocumentItem = _AccountingDocumentItem.AccountingDocumentItem and $projection.FiscalYearVariant = _AccountingDocumentItem.FiscalYearVariant
	association [1..1] to ZSNAP_F01G_OplAcctgDocItem as _ReferenceDocumentItem on $projection.CompanyCode = _ReferenceDocumentItem.CompanyCode and $projection.InvoiceReference = _ReferenceDocumentItem.AccountingDocument and $projection.InvoiceReferenceFiscalYear = _ReferenceDocumentItem.FiscalYear and $projection.InvoiceItemReference = _ReferenceDocumentItem.AccountingDocumentItem and $projection.FiscalYearVariant = _ReferenceDocumentItem.FiscalYearVariant
	association [0..1] to ZSNAP_F01G_Partnercompany as _PartnerCompany on $projection.PartnerCompany = _PartnerCompany.PartnerCompany
	association [0..1] to ZSNAP_F01G_PmtBlockingRsn as _PaymentBlockingReason on $projection.PaymentBlockingReason = _PaymentBlockingReason.PaymentBlockingReason
	association [0..1] to ZSNAP_F01G_PaymentMethod as _PaymentMethod on $projection.PaymentMethod = _PaymentMethod.PaymentMethod and $projection.SupplierCountry = _PaymentMethod.Country
	association [1..1] to ZSNAP_F01G_PaymentTerms as _PaymentTerms on $projection.PaymentTerms = _PaymentTerms.PaymentTerms
	association [0..1] to ZSNAP_F01G_PostingKey as _PostingKey on $projection.PostingKey = _PostingKey.PostingKey
	association [0..*] to ZSNAP_F01G_ProfitCenter as _ProfitCenter on $projection.ControllingArea = _ProfitCenter.ControllingArea and $projection.ProfitCenter = _ProfitCenter.ProfitCenter
	association [0..1] to ZSNAP_F01G_PurchasingDoc as _PurchasingDocument on $projection.PurchasingDocument = _PurchasingDocument.PurchasingDocument
	association [0..1] to ZSNAP_F01G_Region as _SupplierRegion on _SupplierRegion.Region = $projection.SupplierRegion and _SupplierRegion.Country = $projection.SupplierCountry
	association [0..1] to ZSNAP_F01G_Segment as _Segment on $projection.Segment = _Segment.Segment
	association [0..1] to ZSNAP_F01G_SpecialGLCode as _SpecialGLCode on _SpecialGLCode.SpecialGLCode = $projection.SpecialGLCode and _SpecialGLCode.FinancialAccountType = $projection.FinancialAccountType
	association [0..*] to ZSNAP_F01G_SpecialGLCdText as _SpecialGLCodeText on $projection.FinancialAccountType = _SpecialGLCodeText.FinancialAccountType and $projection.SpecialGLCode = _SpecialGLCodeText.SpecialGLCode
	association [0..1] to ZSNAP_F01G_Supplier as _Supplier on _Supplier.Supplier = $projection.Supplier
	association [0..1] to ZSNAP_F01G_SupplierAccGroup as _SupplierAccountGroup on _SupplierAccountGroup.SupplierAccountGroup = $projection.SupplierAccountGroup
	association [0..1] to ZSNAP_F01G_SupplierReconAcc as _ReconciliationAccount on _ReconciliationAccount.ChartOfAccounts = $projection.ChartOfAccounts and _ReconciliationAccount.ReconciliationAccount = $projection.ReconciliationAccount
	association [0..1] to ZSNAP_F01G_WithholdingTaxCd as _WithholdingTaxCode on $projection.WithholdingTaxCode = _WithholdingTaxCode.WithholdingTaxCode and _WithholdingTaxCode.Country = $projection.SupplierCountry
	association [0..1] to ZSNAP_F01M_IntercompanyP_SJ as _IntercompanyPairing on $projection.IntercompanyPairing = _IntercompanyPairing.IntercompanyPairing
{
	@EndUserText.label: 'Company Code'
	@ObjectModel.foreignKey.association: '_CompanyCode'
	key main.CompanyCode,
	
	@EndUserText.label: 'Fiscal Year'
	@ObjectModel.foreignKey.association: '_FiscalYear'
	key main.FiscalYear,
	
	@EndUserText.label: 'Accounting Document'
	@ObjectModel.foreignKey.association: '_JournalEntry'
	key main.AccountingDocument,
	
	@EndUserText.label: 'Accounting Document Item'
	@ObjectModel.foreignKey.association: '_AccountingDocumentItem'
	key main.AccountingDocumentItem,
	
	@EndUserText.label: 'Acc. Document Item Text'
	main.DocumentItemText,
	
	@EndUserText.label: 'Accounting Document Category'
	@ObjectModel.foreignKey.association: '_AccountingDocumentCategory'
	main.AccountingDocumentCategory,
	
	@EndUserText.label: 'Accounting Document Type'
	@ObjectModel.foreignKey.association: '_AccountingDocumentType'
	main.AccountingDocumentType,
	
	@EndUserText.label: 'Accounting Document Type Name'
	main.AccountingDocumentTypeName,
	
	@EndUserText.label: 'Acc. Document Header Text'
	main.AccountingDocumentHeaderText,
	
	@EndUserText.label: 'Creation Date'
	main.AccountingDocumentCreationDate,
	
	@EndUserText.label: 'Last Change Date'
	main.LastChangeDate,
	
	@EndUserText.label: 'Document Reference ID'
	main.DocumentReferenceID,
	
	@EndUserText.label: 'Invoice Reference'
	@ObjectModel.foreignKey.association: '_ReferenceDocument'
	main.InvoiceReference,
	
	@EndUserText.label: 'Invoice Reference Type'
	main.InvoiceReferenceType,
	
	@EndUserText.label: 'Invoice Reference Item'
	@ObjectModel.foreignKey.association: '_ReferenceDocumentItem'
	main.InvoiceItemReference,
	
	@EndUserText.label: 'Invoice Reference Fiscal Year'
	@ObjectModel.foreignKey.association: '_ReferenceFiscalYear'
	main.InvoiceReferenceFiscalYear,
	
	@EndUserText.label: 'Debit/Credit Indicator'
	@ObjectModel.foreignKey.association: '_DebitCreditCode'
	main.DebitCreditCode,
	
	@EndUserText.label: 'Clearing Document'
	@ObjectModel.foreignKey.association: '_ClearingDocument'
	main.ClearingAccountingDocument,
	
	@EndUserText.label: 'Financial Account Type'
	@ObjectModel.foreignKey.association: '_FinancialAccountType'
	main.FinancialAccountType,
	
	@EndUserText.label: 'Clearing Date'
	@ObjectModel.foreignKey.association: '_ClearingDate'
	main.ClearingDate,
	
	@EndUserText.label: 'Posting Date'
	@ObjectModel.foreignKey.association: '_PostingDate'
	main.PostingDate,
	
	@EndUserText.label: 'Document Date'
	@ObjectModel.foreignKey.association: '_DocumentDate'
	main.DocumentDate,
	
	@EndUserText.label: 'Open Items As Of Date'
	$parameters.P_KeyDate as ParamKeyDate,
	
	@EndUserText.label: 'Cleared Items After Date'
	$parameters.P_ClearedDate as ParamClearedDate,
	
	@EndUserText.label: 'Baseline Date'
	@ObjectModel.foreignKey.association: '_BaselineDate'
	main.DueCalculationBaseDate,
	
	@EndUserText.label: 'Terms Days 1'
	main.CashDiscount1Days,
	
	@EndUserText.label: 'Terms Discount Percent 1'
	main.CashDiscount1Percent,
	
	@EndUserText.label: 'Terms Discount Date 1'
	@ObjectModel.foreignKey.association: '_CashDiscount1Date'
	main.CashDiscount1Date,
	
	@EndUserText.label: 'Terms Days 2'
	main.CashDiscount2Days,
	
	@EndUserText.label: 'Terms Discount Percent 2'
	main.CashDiscount2Percent,
	
	@EndUserText.label: 'Terms Discount Date 2'
	@ObjectModel.foreignKey.association: '_CashDiscount2Date'
	main.CashDiscount2Date,
	
	@EndUserText.label: 'Payment Terms'
	@ObjectModel.foreignKey.association: '_PaymentTerms'
	main.PaymentTerms,
	
	@EndUserText.label: 'Payment Blocking Reason'
	@ObjectModel.foreignKey.association: '_PaymentBlockingReason'
	main.PaymentBlockingReason,
	
	@EndUserText.label: 'Payment Blocking Reason Text'
	main.PaymentBlockingReasonName,
	
	@EndUserText.label: 'Payment Method'
	@ObjectModel.foreignKey.association: '_PaymentMethod'
	main.PaymentMethod,
	
	@EndUserText.label: 'Is Payment Indicator'
	@ObjectModel.foreignKey.association: '_IsUsedInPaymentTransaction'
	main.IsUsedInPaymentTransaction,
	
	@EndUserText.label: 'Posting Key'
	@ObjectModel.foreignKey.association: '_PostingKey'
	main.PostingKey,
	
	@EndUserText.label: 'Posting Key Text'
	main.PostingKeyName,
	
	@EndUserText.label: 'Arrears by Net Due Date'
	main.NetDueArrearsDays,
	
	@EndUserText.label: 'Arrears by Net Due Date - Orderable'
	main.NetDueArrearsDaysInt,
	
	@EndUserText.label: 'Net Due Date'
	@ObjectModel.foreignKey.association: '_NetDueDate'
	main.NetDueDate,
	
	@EndUserText.label: 'GL Account'
	@ObjectModel.foreignKey.association: '_GLAccountInChartOfAccounts'
	main.GLAccount,
	
	@EnduserText.label: 'Group Account'
	@ObjectModel.foreignKey.association: '_GroupAccount'
	main.GroupAccount,
	
	@EnduserText.label: 'Group Chart of Accounts'
	@ObjectModel.foreignKey.association: '_GroupChartOfAccounts'
	main.GroupChartOfAccounts,
	
	@EndUserText.label: 'Special GL Code'
	@ObjectModel.foreignKey.association: '_SpecialGLCode'
	@ObjectModel.text.association: '_SpecialGLCodeText'
	main.SpecialGLCode,
	
	@EndUserText.label: 'Include Special GL Transactions'
	@ObjectModel.foreignKey.association: '_IncludeSpecialGL'
	main.IncludeSpecialGL,
	
	@EndUserText.label: 'Include Special GL Transactions Filter'
	case
		when main.SpecialGLCode = '' then 'Y'
		when main.IncludeSpecialGL = 'Y' then 'Y'
		else 'N'
	end as IncludeSpecialGLFilter,
	
	@EndUserText.label: 'Cost Center'
	@ObjectModel.foreignKey.association: '_CostCenter'
	main.CostCenter,
	
	@EndUserText.label: 'Profit Center'
	@ObjectModel.foreignKey.association: '_ProfitCenter'
	main.ProfitCenter,
	
	@EndUserText.label: 'Business Area'
	@ObjectModel.foreignKey.association: '_BusinessArea'
	main.BusinessArea,
	
	@EndUserText.label: 'Functional Area'
	@ObjectModel.foreignKey.association: '_FunctionalArea'
	main.FunctionalArea,
	
	@EndUserText.label: 'Segment'
	@ObjectModel.foreignKey.association: '_Segment'
	main.Segment,
	
	@EndUserText.label: 'Purchase Order'
	@ObjectModel.foreignKey.association: '_PurchasingDocument'
	main.PurchasingDocument,
	
	@EndUserText.label: 'Assignment Reference'
	main.AssignmentReference,
	
	@EndUserText.label: 'Accounting Clerk'
	@ObjectModel.foreignKey.association: '_AccountingClerk'
	main.AccountingClerk,
	
	@EndUserText.label: 'Chart of Accounts'
	@ObjectModel.foreignKey.association: '_ChartOfAccounts'
	main.ChartOfAccounts,
	
	@EndUserText.label: 'Controlling Area'
	@ObjectModel.foreignKey.association: '_ControllingArea'
	main.ControllingArea,
	
	@EndUserText.label: 'Reconciliation Account'
	@ObjectModel.foreignKey.association: '_ReconciliationAccount'
	main.ReconciliationAccount,
	
	@EndUserText.label: 'Supplier'
	@ObjectModel.foreignKey.association: '_Supplier'
	main.Supplier,
	
	@EndUserText.label: 'Supplier Name'
	main.SupplierName,
	
	@EndUserText.label: 'Supplier Basic Auth Group'
	main.SupplierBasicAuthorizationGrp,
	
	@EndUserText.label: 'Supplier FINS Auth Group'
	main.SupplierFinsAuthorizationGrp,
	
	@EndUserText.label: 'Withholding Tax Code'
	@ObjectModel.foreignKey.association: '_WithholdingTaxCode'
	main.WithholdingTaxCode,
	
	@EndUserText.label: 'Supplier Account Group'
	@ObjectModel.foreignKey.association: '_SupplierAccountGroup'
	main.SupplierAccountGroup,
	
	@EndUserText.label: 'Supplier Country'
	@ObjectModel.foreignKey.association: '_SupplierCountry'
	main.SupplierCountry,
	
	@EndUserText.label: 'Supplier Region'
	@ObjectModel.foreignKey.association: '_SupplierRegion'
	main.SupplierRegion,
	
	@EndUserText.label: 'Fiscal Year Variant'
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	main.FiscalYearVariant,
	
	@EndUserText.label: 'Calendar Month'
	@ObjectModel.foreignKey.association: '_CalendarMonth'
	main.CalendarMonth,
	
	@EndUserText.label: 'Calendar Quarter'
	@ObjectModel.foreignKey.association: '_CalendarQuarter'
	main.CalendarQuarter,
	
	@EndUserText.label: 'Calendar Week'
	main.CalendarWeek,
	
	@EndUserText.label: 'Calendar Year'
	@ObjectModel.foreignKey.association: '_CalendarYear'
	main.CalendarYear,
	
	@EndUserText.label: 'Fiscal Period'
	@ObjectModel.foreignKey.association: '_FiscalPeriod'
	main.FiscalPeriod,
	
	@EndUserText.label: 'Fiscal Quarter'
	@ObjectModel.foreignKey.association: '_FiscalQuarter'
	main.FiscalQuarter,
	
	@EndUserText.label: 'Fiscal Year Quarter'
	@ObjectModel.foreignKey.association: '_FiscalYearQuarter'
	main.FiscalYearQuarter,
	
	@EndUserText.label: 'Fiscal Year Period'
	@ObjectModel.foreignKey.association: '_FiscalYearPeriod'
	main.FiscalYearPeriod,
	
	@EndUserText.label: 'Clearing Fiscal Year'
	main.ClearingFiscalYear,
	
	@EndUserText.label: 'Clearing Fiscal Period'
	main.ClearingFiscalPeriod,
	
	@EndUserText.label: 'Clearing Fiscal Quarter'
	main.ClearingFiscalQuarter,
	
	@EndUserText.label: 'Clearing Fiscal Year Period'
	main.ClearingFiscalYearPeriod,
	
	@EndUserText.label: 'Clearing Fiscal Year Quarter'
	main.ClearingFiscalYearQuarter,
	
	@EndUserText.label: 'Signage'
	@ObjectModel.foreignKey.association: '_Signage'
	main.Signage,
	
	@EndUserText.label: 'Net Due Interval'
	main.NetDueIntervalText,
	
	@EndUserText.label: 'Is Overdue'
	@ObjectModel.foreignKey.association: '_IsOverdue'
	main.IsOverdue,
	
	@EndUserText.label: 'Days Overdue'
	main.DaysOverdue,
	
	@EndUserText.label: 'Is Cleared Flag'
	@ObjectModel.foreignKey.association: '_IsCleared'
	main.IsCleared,
	
	@EndUserText.label: 'Currency Conversion Error Flag'
	@ObjectModel.foreignKey.association: '_IsConversionBroken'
	main.IsConversionBroken,
	
	@EndUserText.label: 'Clearing Date vs. Due Date Offset'
	main.ClearingDateVsDueDateOffset,
	
	@EndUserText.label: 'Payment Timing Category'
	@ObjectModel.foreignKey.association: '_PaymentTimingCategory'
	main.PaymentTimingCategory,
	
	@EndUserText.label: 'Supplier Is Intercompany'
	@ObjectModel.foreignKey.association: '_SupplierIsIntercompany'
	main.SupplierIsIntercompany,
	
	@EndUserText.label: 'Trading Partner'
	@ObjectModel.foreignKey.association: '_PartnerCompany'
	main.PartnerCompany,
	
	@EndUserText.label: 'Pairing Key'
	@ObjectModel.foreignKey.association: '_IntercompanyPairing'
	main.IntercompanyPairing,
	
	@EndUserText.label: 'Title'
	main.Title,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amount in Trans. Crcy'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.AmountInTransactionCurrency,
	
	@EndUserText.label: 'Transaction Currency'
	main.TransactionCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amount in CC Crcy'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.AmountInCompanyCodeCurrency,
	
	@EndUserText.label: 'Company Code Currency'
	main.CompanyCodeCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amount in Global Crcy'
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	main.AmountInGlobalCurrency,
	
	@EndUserText.label: 'Global Currency'
	main.GlobalCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amount in Disp. Crcy'
	@Semantics.amount.currencyCode: 'DisplayCurrency'
	main.AmountInDisplayCurrency,
	
	@EndUserText.label: 'Display Currency'
	main.DisplayCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Number Of Rows'
	cast (1 as abap.dec (12, 0)) as NumberOfRows,
	_AccountingClerk,
	_AccountingDocumentCategory,
	_AccountingDocumentItem,
	_AccountingDocumentType,
	_BaselineDate,
	_BusinessArea,
	_CalendarMonth,
	_CalendarQuarter,
	_CalendarYear,
	_CashDiscount1Date,
	_CashDiscount2Date,
	_ChartOfAccounts,
	_ClearingDate,
	_ClearingDocument,
	_CompanyCode,
	_ControllingArea,
	_CostCenter,
	_DebitCreditCode,
	_DocumentDate,
	_FinancialAccountType,
	_FiscalPeriod,
	_FiscalQuarter,
	_FiscalYear,
	_FiscalYearPeriod,
	_FiscalYearQuarter,
	_FiscalYearVariant,
	_FunctionalArea,
	_GLAccountInChartOfAccounts,
	_GroupAccount,
	_GroupChartOfAccounts,
	_IncludeSpecialGL,
	_IntercompanyPairing,
	_IsCleared,
	_IsConversionBroken,
	_IsOverdue,
	_IsUsedInPaymentTransaction,
	_JournalEntry,
	_NetDueDate,
	_PartnerCompany,
	_PaymentBlockingReason,
	_PaymentMethod,
	_PaymentTerms,
	_PaymentTimingCategory,
	_PostingDate,
	_PostingKey,
	_ProfitCenter,
	_PurchasingDocument,
	_ReconciliationAccount,
	_ReferenceDocument,
	_ReferenceDocumentItem,
	_ReferenceFiscalYear,
	_Segment,
	_Signage,
	_SpecialGLCode,
	_SpecialGLCodeText,
	_Supplier,
	_SupplierAccountGroup,
	_SupplierCountry,
	_SupplierIsIntercompany,
	_SupplierRegion,
	_WithholdingTaxCode
}