@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'SNAP F80: Direct Cash Flow Cube'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F80S_C01	
	with parameters
		P_Signage: abap.char (1),
		P_CashStartDate: abap.dats
	
	as select from ZSNAP_F80S_405 (P_Signage: $parameters.P_Signage, P_CashStartDate: $parameters.P_CashStartDate) as main
	
	association [0..1] to ZSNAP_F80G_103 as _PCGrp1 on $projection.ProfCtrLevel1 = _PCGrp1.HierarchyNode
	association [0..1] to ZSNAP_F80G_103 as _PCGrp2 on $projection.ProfCtrLevel2 = _PCGrp2.HierarchyNode
	association [0..1] to ZSNAP_F80G_103 as _PCGrp3 on $projection.ProfCtrLevel3 = _PCGrp3.HierarchyNode
	association [0..1] to ZSNAP_F80G_103 as _PCGrp4 on $projection.ProfCtrLevel4 = _PCGrp4.HierarchyNode
	association [0..1] to ZSNAP_F80G_103 as _PCGrp5 on $projection.ProfCtrLevel5 = _PCGrp5.HierarchyNode
	association [0..1] to ZSNAP_F80G_122 as _GLGrp1 on $projection.GLAcctLevel1 = _GLGrp1.HierarchyNode and _GLGrp1.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F80G_122 as _GLGrp2 on $projection.GLAcctLevel2 = _GLGrp2.HierarchyNode and _GLGrp2.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F80G_122 as _GLGrp3 on $projection.GLAcctLevel3 = _GLGrp3.HierarchyNode and _GLGrp3.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F80G_122 as _GLGrp4 on $projection.GLAcctLevel4 = _GLGrp4.HierarchyNode and _GLGrp4.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F80G_122 as _GLGrp5 on $projection.GLAcctLevel5 = _GLGrp5.HierarchyNode and _GLGrp5.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F80G_AccngDocType as _AccountingDocumentType on $projection.AccountingDocumentType = _AccountingDocumentType.AccountingDocumentType
	association [0..1] to ZSNAP_F80G_ChartOfAccounts as _ChartOfAccounts on $projection.ChartOfAccounts = _ChartOfAccounts.ChartOfAccounts
	association [0..1] to ZSNAP_F80G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [0..1] to ZSNAP_F80G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
	association [0..*] to ZSNAP_F80G_CostCenter as _CostCenter on $projection.ControllingArea = _CostCenter.ControllingArea and $projection.CostCenter = _CostCenter.CostCenter
	association [0..1] to ZSNAP_F80G_Country as _Country on $projection.Country = _Country.Country
	association [0..1] to ZSNAP_F80G_Customer as _Customer on $projection.Customer = _Customer.Customer
	association [0..1] to ZSNAP_F80G_CustomerGroup as _CustomerGroup on $projection.CustomerGroup = _CustomerGroup.CustomerGroup
	association [0..1] to ZSNAP_F80G_DebitCreditCode as _DebitCreditCode on $projection.DebitCreditCode = _DebitCreditCode.DebitCreditCode
	association [0..1] to ZSNAP_F80G_FinancialAccType as _FinancialAccountType on $projection.FinancialAccountType = _FinancialAccountType.FinancialAccountType
	association [0..1] to ZSNAP_F80G_FiscCalendarDate as _CashPostingDate on $projection.FiscalYearVariant = _CashPostingDate.FiscalYearVariant and $projection.CashPostingDate = _CashPostingDate.CalendarDate
	association [0..1] to ZSNAP_F80G_FiscCalendarDate as _ClearingDate on $projection.FiscalYearVariant = _ClearingDate.FiscalYearVariant and $projection.ClearingDate = _ClearingDate.CalendarDate
	association [0..1] to ZSNAP_F80G_FiscCalendarDate as _DocumentDate on $projection.FiscalYearVariant = _DocumentDate.FiscalYearVariant and $projection.DocumentDate = _DocumentDate.CalendarDate
	association [0..1] to ZSNAP_F80G_FiscCalendarDate as _DueDate on $projection.FiscalYearVariant = _DueDate.FiscalYearVariant and $projection.DueCalculationBaseDate = _DueDate.CalendarDate
	association [0..1] to ZSNAP_F80G_FiscCalendarDate as _FiscalCalendarDate on $projection.FiscalYearVariant = _FiscalCalendarDate.FiscalYearVariant and $projection.PostingDate = _FiscalCalendarDate.CalendarDate
	association [0..1] to ZSNAP_F80G_FiscalPeriod as _CashPeriod on $projection.CashYear = _CashPeriod.FiscalYear and $projection.CashPeriod = _CashPeriod.FiscalPeriod and $projection.FiscalYearVariant = _CashPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F80G_FiscalPeriod as _PostingPeriod on $projection.PostYear = _PostingPeriod.FiscalYear and $projection.PostPeriod = _PostingPeriod.FiscalPeriod and $projection.FiscalYearVariant = _PostingPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F80G_FiscalQuarter as _CashQuarter on $projection.CashYear = _CashQuarter.FiscalYear and $projection.FiscalYearVariant = _CashQuarter.FiscalYearVariant and $projection.CashQuarter = _CashQuarter.FiscalQuarter
	association [0..1] to ZSNAP_F80G_FiscalQuarter as _PostingQuarter on $projection.PostYear = _PostingQuarter.FiscalYear and $projection.FiscalYearVariant = _PostingQuarter.FiscalYearVariant and $projection.PostQuarter = _PostingQuarter.FiscalQuarter
	association [0..1] to ZSNAP_F80G_FiscalYear as _CashYear on $projection.CashYear = _CashYear.FiscalYear and $projection.FiscalYearVariant = _CashYear.FiscalYearVariant
	association [0..1] to ZSNAP_F80G_FiscalYear as _FiscalYear on $projection.FiscalYear = _FiscalYear.FiscalYear and $projection.FiscalYearVariant = _FiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F80G_FiscalYear as _PostingYear on $projection.PostYear = _PostingYear.FiscalYear and $projection.FiscalYearVariant = _PostingYear.FiscalYearVariant
	association [0..1] to ZSNAP_F80G_FiscalYearPeriod as _CashYearPeriod on $projection.CashYearPeriod = _CashYearPeriod.FiscalYearPeriod and $projection.FiscalYearVariant = _CashYearPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F80G_FiscalYearPeriod as _PostingYearPeriod on $projection.PostYearPeriod = _PostingYearPeriod.FiscalYearPeriod and $projection.FiscalYearVariant = _PostingYearPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F80G_FiscYearQuarter as _CashYearQuarter on $projection.CashYearQuarter = _CashYearQuarter.FiscalYearQuarter and $projection.FiscalYearVariant = _CashYearQuarter.FiscalYearVariant
	association [0..1] to ZSNAP_F80G_FiscYearQuarter as _PostingYearQuarter on $projection.PostYearQuarter = _PostingYearQuarter.FiscalYearQuarter and $projection.FiscalYearVariant = _PostingYearQuarter.FiscalYearVariant
	association [0..1] to ZSNAP_F80G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
	association [0..1] to ZSNAP_F80G_GLAccountInCOA as _GLAccount2 on $projection.ChartOfAccounts = _GLAccount2.ChartOfAccounts and $projection.GLAccount2 = _GLAccount2.GLAccount
	association [0..1] to ZSNAP_F80G_GLAccountInCOA as _GLAccountInChartOfAccounts on $projection.ChartOfAccounts = _GLAccountInChartOfAccounts.ChartOfAccounts and $projection.GLAccount = _GLAccountInChartOfAccounts.GLAccount
	association [0..1] to ZSNAP_F80G_Ledger as _Ledger on $projection.Ledger = _Ledger.Ledger
	association [0..1] to ZSNAP_F80G_Ledger as _SourceLedger on $projection.SourceLedger = _SourceLedger.Ledger
	association [0..1] to ZSNAP_F80G_Material as _Material on $projection.Material = _Material.Material
	association [0..1] to ZSNAP_F80G_MaterialGroup as _MaterialGroup on $projection.MaterialGroup = _MaterialGroup.MaterialGroup
	association [0..1] to ZSNAP_F80G_Order as _Order on $projection.OrderID = _Order.OrderID
	association [0..1] to ZSNAP_F80G_Partnercompany as _PartnerCompany on $projection.PartnerCompany = _PartnerCompany.PartnerCompany
	association [0..1] to ZSNAP_F80G_Product as _Product on $projection.Product = _Product.Product
	association [0..*] to ZSNAP_F80G_ProfitCenter as _ProfitCenter on $projection.ControllingArea = _ProfitCenter.ControllingArea and $projection.ProfitCenter = _ProfitCenter.ProfitCenter
	association [0..1] to ZSNAP_F80G_Project as _Project on $projection.Project = _Project.Project
	association [0..1] to ZSNAP_F80G_SpecialGLCode as _SpecialGLCode on $projection.SpecialGLCode = _SpecialGLCode.SpecialGLCode and $projection.FinancialAccountType = _SpecialGLCode.FinancialAccountType
	association [0..1] to ZSNAP_F80G_Supplier as _Supplier on $projection.Supplier = _Supplier.Supplier
	association [0..1] to ZSNAP_F80G_WBSElementByE_KX as _WBSElement on $projection.WBSElement = _WBSElement.WBSElement
	association [0..1] to ZSNAP_F80M_CashSource as _CashSource on $projection.Source = _CashSource.Source
{
	@EndUserText.label: 'Ledger'
	@ObjectModel.foreignKey.association: '_Ledger'
	key main.Ledger,
	
	@EndUserText.label: 'Accounting Document'
	key main.AccountingDocument,
	
	@EndUserText.label: 'Company Code'
	@ObjectModel.foreignKey.association: '_CompanyCode'
	key main.CompanyCode,
	
	@EndUserText.label: 'Fiscal Year'
	@ObjectModel.foreignKey.association: '_FiscalYear'
	key main.FiscalYear,
	
	@EndUserText.label: 'Ledger GL Line Item'
	key main.LedgerGLLineItem,
	
	@EndUserText.label: 'Accounting Document Item'
	main.AccountingDocumentItem,
	
	@EndUserText.label: 'Accounting Document Type'
	@ObjectModel.foreignKey.association: '_AccountingDocumentType'
	main.AccountingDocumentType,
	
	@EndUserText.label: 'Chart of Accounts'
	@ObjectModel.foreignKey.association: '_ChartOfAccounts'
	main.ChartOfAccounts,
	
	@EndUserText.label: 'Assignment Reference'
	main.AssignmentReference,
	
	@EndUserText.label: 'Transaction Type Determination'
	main.TransactionTypeDetermination,
	
	@EndUserText.label: 'Document Reference ID'
	main.DocumentReferenceID,
	
	@EndUserText.label: 'Document Header Text'
	main.DocumentHeaderText,
	
	@EndUserText.label: 'Reversal Document'
	main.ReverseDocument,
	
	@EndUserText.label: 'Reversal Document Year'
	main.ReverseDocumentFiscalYear,
	
	@EndUserText.label: 'Internal Order'
	@ObjectModel.foreignKey.association: '_Order'
	main.OrderID,
	
	@EndUserText.label: 'Clearing Document'
	main.ClearingAccountingDocument,
	
	@EndUserText.label: 'Controlling Area'
	@ObjectModel.foreignKey.association: '_ControllingArea'
	main.ControllingArea,
	
	@EndUserText.label: 'Cost Center'
	@ObjectModel.foreignKey.association: '_CostCenter'
	main.CostCenter,
	
	@EndUserText.label: 'Country'
	@ObjectModel.foreignKey.association: '_Country'
	main.Country,
	
	@EndUserText.label: 'Customer'
	@ObjectModel.foreignKey.association: '_Customer'
	main.Customer,
	
	@EndUserText.label: 'Customer Group'
	@ObjectModel.foreignKey.association: '_CustomerGroup'
	main.CustomerGroup,
	
	@EndUserText.label: 'Debit/Credit Code'
	@ObjectModel.foreignKey.association: '_DebitCreditCode'
	main.DebitCreditCode,
	
	@EndUserText.label: 'Accounting Document Item Text'
	main.DocumentItemText,
	
	@EndUserText.label: 'Financial Account Type'
	@ObjectModel.foreignKey.association: '_FinancialAccountType'
	main.FinancialAccountType,
	
	@EndUserText.label: 'Follow-On Document Type'
	main.FollowOnDocumentType,
	
	@EndUserText.label: 'GL Account (w/Hierarchy)'
	@ObjectModel.foreignKey.association: '_GLAccountInChartOfAccounts'
	main.GLAccount,
	
	@EndUserText.label: 'GL Account'
	@ObjectModel.foreignKey.association: '_GLAccount2'
	main.GLAccount as GLAccount2,
	
	@EndUserText.label: 'GL Hierarchy L1'
	@ObjectModel.foreignKey.association: '_GLGrp1'
	main.GLAcctLevel1,
	
	@EndUserText.label: 'GL Hierarchy L2'
	@ObjectModel.foreignKey.association: '_GLGrp2'
	main.GLAcctLevel2,
	
	@EndUserText.label: 'GL Hierarchy L3'
	@ObjectModel.foreignKey.association: '_GLGrp3'
	main.GLAcctLevel3,
	
	@EndUserText.label: 'GL Hierarchy L4'
	@ObjectModel.foreignKey.association: '_GLGrp4'
	main.GLAcctLevel4,
	
	@EndUserText.label: 'GL Hierarchy L5'
	@ObjectModel.foreignKey.association: '_GLGrp5'
	main.GLAcctLevel5,
	
	@EndUserText.label: 'Invoice Item Reference'
	main.InvoiceItemReference,
	
	@EndUserText.label: 'Invoice Reference'
	main.InvoiceReference,
	
	@EndUserText.label: 'Invoice Reference Fiscal Year'
	main.InvoiceReferenceFiscalYear,
	
	@EndUserText.label: 'Is Automatically Created'
	main.IsAutomaticallyCreated,
	
	@EndUserText.label: 'Is Balance Sheet'
	main.IsBalanceSheetAccount,
	
	@EndUserText.label: 'Is Cleared'
	main.IsCleared,
	
	@EndUserText.label: 'Is Open Item Managed'
	main.IsOpenItemManaged,
	
	@EndUserText.label: 'Is P&L Account'
	main.IsProfitLossAccount,
	
	@EndUserText.label: 'Is Reversal'
	main.IsReversal,
	
	@EndUserText.label: 'Is Reversed'
	main.IsReversed,
	
	@EndUserText.label: 'Is Used In Payment Transaction'
	main.IsUsedInPaymentTransaction,
	
	@EndUserText.label: 'Cross-Company Document Number'
	main.IntercompanyTransaction,
	
	@EndUserText.label: 'Material'
	@ObjectModel.foreignKey.association: '_Material'
	main.Material,
	
	@EndUserText.label: 'Material Group'
	@ObjectModel.foreignKey.association: '_MaterialGroup'
	main.MaterialGroup,
	
	@EndUserText.label: 'Partner Company'
	@ObjectModel.foreignKey.association: '_PartnerCompany'
	main.PartnerCompany,
	
	@EndUserText.label: 'Posting Key'
	main.PostingKey,
	
	@EndUserText.label: 'Product'
	@ObjectModel.foreignKey.association: '_Product'
	main.Product,
	
	@EndUserText.label: 'PC Hierarchy L2'
	@ObjectModel.foreignKey.association: '_PCGrp1'
	main.ProfCtrLevel1,
	
	@EndUserText.label: 'PC Hierarchy L3'
	@ObjectModel.foreignKey.association: '_PCGrp2'
	main.ProfCtrLevel2,
	
	@EndUserText.label: 'PC Hierarchy L4'
	@ObjectModel.foreignKey.association: '_PCGrp3'
	main.ProfCtrLevel3,
	
	@EndUserText.label: 'PC Hierarchy L5'
	@ObjectModel.foreignKey.association: '_PCGrp4'
	main.ProfCtrLevel4,
	
	@EndUserText.label: 'PC Hierarchy L6'
	@ObjectModel.foreignKey.association: '_PCGrp5'
	main.ProfCtrLevel5,
	
	@EndUserText.label: 'Profit Center'
	@ObjectModel.foreignKey.association: '_ProfitCenter'
	main.ProfitCenter,
	
	@EndUserText.label: 'P&L Account Type'
	main.ProfitLossAccountType,
	
	@EndUserText.label: 'Project'
	@ObjectModel.foreignKey.association: '_Project'
	main.Project,
	
	@EndUserText.label: 'Reference Document'
	main.ReferenceDocument,
	
	@EndUserText.label: 'Reference Document Item'
	main.ReferenceDocumentItem,
	
	@EndUserText.label: 'Source'
	@ObjectModel.foreignKey.association: '_CashSource'
	main.Source,
	
	@EndUserText.label: 'Doc Appearance Counter'
	main.EntryCounter,
	
	@EndUserText.label: 'Clearing Reset'
	main.ResetFlag,
	
	@EndUserText.label: 'Source Ledger'
	@ObjectModel.foreignKey.association: '_SourceLedger'
	main.SourceLedger,
	
	@EndUserText.label: 'Special GL Code'
	@ObjectModel.foreignKey.association: '_SpecialGLCode'
	main.SpecialGLCode,
	
	@EndUserText.label: 'Tax Code'
	main.TaxCode,
	
	@EndUserText.label: 'Transaction Code'
	main.TransactionCode,
	
	@EndUserText.label: 'Vendor'
	@ObjectModel.foreignKey.association: '_Supplier'
	main.Supplier,
	
	@EndUserText.label: 'WBS Element'
	@ObjectModel.foreignKey.association: '_WBSElement'
	main.WBSElement,
	
	@EndUserText.label: 'Cash Year'
	@ObjectModel.foreignKey.association: '_CashYear'
	main.CashYear,
	
	@EndUserText.label: 'Cash Period'
	@ObjectModel.foreignKey.association: '_CashPeriod'
	main.CashPeriod,
	
	@EndUserText.label: 'Cash Post Date'
	@ObjectModel.foreignKey.association: '_CashPostingDate'
	main.CashPostingDate,
	
	@EndUserText.label: 'Cash Quarter'
	@ObjectModel.foreignKey.association: '_CashQuarter'
	main.CashQuarter,
	
	@EndUserText.label: 'Cash Year Period'
	@ObjectModel.foreignKey.association: '_CashYearPeriod'
	main.CashYearPeriod,
	
	@EndUserText.label: 'Cash Year Quarter'
	@ObjectModel.foreignKey.association: '_CashYearQuarter'
	main.CashYearQuarter,
	
	@EndUserText.label: 'Cash Year Week'
	main.CashYearWeek,
	
	@EndUserText.label: 'Clearing Date'
	@ObjectModel.foreignKey.association: '_ClearingDate'
	main.ClearingDate,
	
	@EndUserText.label: 'Created By'
	main.CreatedByUser,
	
	@EndUserText.label: 'Document Date'
	@ObjectModel.foreignKey.association: '_DocumentDate'
	main.DocumentDate,
	
	@EndUserText.label: 'Due Date'
	@ObjectModel.foreignKey.association: '_DueDate'
	main.DueCalculationBaseDate,
	
	@EndUserText.label: 'Fiscal Year Variant'
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	main.FiscalYearVariant,
	
	@EndUserText.label: 'Fiscal Calendar Date'
	@ObjectModel.foreignKey.association: '_FiscalCalendarDate'
	main.PostingDate,
	
	@EndUserText.label: 'Post Year'
	@ObjectModel.foreignKey.association: '_PostingYear'
	main.PostYear,
	
	@EndUserText.label: 'Post Period'
	@ObjectModel.foreignKey.association: '_PostingPeriod'
	main.PostPeriod,
	
	@EndUserText.label: 'Post Quarter'
	@ObjectModel.foreignKey.association: '_PostingQuarter'
	main.PostQuarter,
	
	@EndUserText.label: 'Post Year Period'
	@ObjectModel.foreignKey.association: '_PostingYearPeriod'
	main.PostYearPeriod,
	
	@EndUserText.label: 'Post Year Quarter'
	@ObjectModel.foreignKey.association: '_PostingYearQuarter'
	main.PostYearQuarter,
	
	@EndUserText.label: 'Post Year Week'
	main.PostYearWeek,
	
	@EndUserText.label: 'Title'
	main.Title,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amt in Glob. Crcy'
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	main.AmountInGlobalCurrency,
	
	@EndUserText.label: 'Global Currency'
	main.GlobalCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amt in CC Crcy'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.AmountInCompanyCodeCurrency,
	
	@EndUserText.label: 'Company Code Currency'
	main.CompanyCodeCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amt in 4th Crcy'
	@Semantics.amount.currencyCode: 'FourthCurrency'
	main.AmountInFourthCurrency,
	
	@EndUserText.label: 'Fourth Currency'
	main.FourthCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amt in Trans Crcy'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.AmountInTransactionCurrency,
	
	@EndUserText.label: 'Transaction Currency'
	main.TransactionCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Number of Rows'
	cast (1 as abap.dec (12, 0)) as NumberOfRows,
	_AccountingDocumentType,
	_CashPeriod,
	_CashPostingDate,
	_CashQuarter,
	_CashSource,
	_CashYear,
	_CashYearPeriod,
	_CashYearQuarter,
	_ChartOfAccounts,
	_ClearingDate,
	_CompanyCode,
	_ControllingArea,
	_CostCenter,
	_Country,
	_Customer,
	_CustomerGroup,
	_DebitCreditCode,
	_DocumentDate,
	_DueDate,
	_FinancialAccountType,
	_FiscalCalendarDate,
	_FiscalYear,
	_FiscalYearVariant,
	_GLAccount2,
	_GLAccountInChartOfAccounts,
	_GLGrp1,
	_GLGrp2,
	_GLGrp3,
	_GLGrp4,
	_GLGrp5,
	_Ledger,
	_Material,
	_MaterialGroup,
	_Order,
	_PCGrp1,
	_PCGrp2,
	_PCGrp3,
	_PCGrp4,
	_PCGrp5,
	_PartnerCompany,
	_PostingPeriod,
	_PostingQuarter,
	_PostingYear,
	_PostingYearPeriod,
	_PostingYearQuarter,
	_Product,
	_ProfitCenter,
	_Project,
	_SourceLedger,
	_SpecialGLCode,
	_Supplier,
	_WBSElement
}