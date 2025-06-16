@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'SNAP F70C01: Financial Activity Cube'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F70S_C01	
	with parameters
		P_Signage: abap.char (1)
	
	as select from ZSNAP_F70S_009 (P_Signage: $parameters.P_Signage) as main
	
	association [0..1] to ZSNAP_F70G_103 as _PCGrp1 on $projection.ProfCtrLevel1 = _PCGrp1.HierarchyNode
	association [0..1] to ZSNAP_F70G_103 as _PCGrp2 on $projection.ProfCtrLevel2 = _PCGrp2.HierarchyNode
	association [0..1] to ZSNAP_F70G_103 as _PCGrp3 on $projection.ProfCtrLevel3 = _PCGrp3.HierarchyNode
	association [0..1] to ZSNAP_F70G_103 as _PCGrp4 on $projection.ProfCtrLevel4 = _PCGrp4.HierarchyNode
	association [0..1] to ZSNAP_F70G_103 as _PCGrp5 on $projection.ProfCtrLevel5 = _PCGrp5.HierarchyNode
	association [0..1] to ZSNAP_F70G_103 as _PCGrp6 on $projection.ProfCtrLevel6 = _PCGrp6.HierarchyNode
	association [0..1] to ZSNAP_F70G_122 as _GLGrp1 on $projection.GLAcctLevel1 = _GLGrp1.HierarchyNode and _GLGrp1.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F70G_122 as _GLGrp2 on $projection.GLAcctLevel2 = _GLGrp2.HierarchyNode and _GLGrp2.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F70G_122 as _GLGrp3 on $projection.GLAcctLevel3 = _GLGrp3.HierarchyNode and _GLGrp3.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F70G_122 as _GLGrp4 on $projection.GLAcctLevel4 = _GLGrp4.HierarchyNode and _GLGrp4.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F70G_122 as _GLGrp5 on $projection.GLAcctLevel5 = _GLGrp5.HierarchyNode and _GLGrp5.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F70G_AccngDocType as _AccountingDocumentType on $projection.AccountingDocumentType = _AccountingDocumentType.AccountingDocumentType
	association [0..1] to ZSNAP_F70G_AssetTransact_JJ as _AssetTransactionType on $projection.AssetTransactionType = _AssetTransactionType.AssetTransactionType
	association [0..1] to ZSNAP_F70G_BillingDocument as _BillingDocument on $projection.BillingDocument = _BillingDocument.BillingDocument
	association [0..1] to ZSNAP_F70G_BusinessArea as _BusinessArea on $projection.BusinessArea = _BusinessArea.BusinessArea
	association [0..1] to ZSNAP_F70G_BusTransactionTp as _BusinessTransactionType on $projection.BusinessTransactionType = _BusinessTransactionType.BusinessTransactionType
	association [0..1] to ZSNAP_F70G_CalendarDate as _BaselineDate on $projection.BaselineDate = _BaselineDate.CalendarDate
	association [0..1] to ZSNAP_F70G_CalendarDate as _ClearingDate on $projection.ClearingDate = _ClearingDate.CalendarDate
	association [0..1] to ZSNAP_F70G_CalendarDate as _FiscalCalendarDate on $projection.PostingDate = _FiscalCalendarDate.CalendarDate
	association [0..1] to ZSNAP_F70G_CalendarDate as _NetDueDate on $projection.NetDueDate = _NetDueDate.CalendarDate
	association [0..1] to ZSNAP_F70G_CalendarMonth as _CalendarMonth on $projection.CalendarMonth = _CalendarMonth.CalendarMonth
	association [0..1] to ZSNAP_F70G_CalendarQuarter as _CalendarQuarter on $projection.CalendarQuarter = _CalendarQuarter.CalendarQuarter
	association [0..1] to ZSNAP_F70G_CalendarYear as _CalendarYear on $projection.CalendarYear = _CalendarYear.CalendarYear
	association [0..1] to ZSNAP_F70G_ChartOfAccounts as _ChartOfAccounts on $projection.ChartOfAccounts = _ChartOfAccounts.ChartOfAccounts
	association [0..1] to ZSNAP_F70G_ChartOfAccounts as _GroupChartOfAccounts on $projection.GroupChartOfAccounts = _GroupChartOfAccounts.ChartOfAccounts
	association [0..1] to ZSNAP_F70G_ChartOfAccounts as _OffsettingChartOfAccounts on $projection.OffsettingChartOfAccounts = _OffsettingChartOfAccounts.ChartOfAccounts
	association [0..1] to ZSNAP_F70G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [0..1] to ZSNAP_F70G_CompanyCode as _PartnerCompanyCode on $projection.PartnerCompanyCode = _PartnerCompanyCode.CompanyCode
	association [0..1] to ZSNAP_F70G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
	association [0..1] to ZSNAP_F70G_CtrllingObjectCl as _PartnerControllingObjectClass on $projection.PartnerControllingObjectClass = _PartnerControllingObjectClass.ControllingObjectClass
	association [0..*] to ZSNAP_F70G_CostCenter as _CostCenter on $projection.ControllingArea = _CostCenter.ControllingArea and $projection.CostCenter = _CostCenter.CostCenter
	association [0..*] to ZSNAP_F70G_CostCenter as _PartnerCostCenter on $projection.ControllingArea = _PartnerCostCenter.ControllingArea and $projection.PartnerCostCenter = _PartnerCostCenter.CostCenter
	association [0..*] to ZSNAP_F70G_CCActivityType as _CostCtrActivityType on $projection.ControllingArea = _CostCtrActivityType.ControllingArea and $projection.CostCtrActivityType = _CostCtrActivityType.CostCtrActivityType
	association [0..1] to ZSNAP_F70G_Country as _Country on $projection.Country = _Country.Country
	association [0..1] to ZSNAP_F70G_Customer as _BillToParty on $projection.BillToParty = _BillToParty.Customer
	association [0..1] to ZSNAP_F70G_Customer as _Customer on $projection.Customer = _Customer.Customer
	association [0..1] to ZSNAP_F70G_Customer as _OffsetCustomer on $projection.OffsetCustomer = _OffsetCustomer.Customer
	association [0..1] to ZSNAP_F70G_Customer as _OffsetSupplier on $projection.OffsetSupplier = _OffsetSupplier.Customer
	association [0..1] to ZSNAP_F70G_Customer as _PayerParty on $projection.PayerParty = _PayerParty.Customer
	association [0..1] to ZSNAP_F70G_Customer as _ShipToParty on $projection.ShipToParty = _ShipToParty.Customer
	association [0..1] to ZSNAP_F70G_CustomerAccGroup as _CustomerAccountGroup on $projection.CustomerAccountGroup = _CustomerAccountGroup.CustomerAccountGroup
	association [0..1] to ZSNAP_F70G_CustomerGroup as _CustomerGroup on $projection.CustomerGroup = _CustomerGroup.CustomerGroup
	association [0..1] to ZSNAP_F70G_CustomerReconAcc as _CustomerReconAccount on $projection.CustomerReconAccount = _CustomerReconAccount.ReconciliationAccount and $projection.ChartOfAccounts = _CustomerReconAccount.ChartOfAccounts
	association [0..1] to ZSNAP_F70G_DebitCreditCode as _DebitCreditCode on $projection.DebitCreditCode = _DebitCreditCode.DebitCreditCode
	association [0..1] to ZSNAP_F70G_DistChannel as _DistributionChannel on $projection.DistributionChannel = _DistributionChannel.DistributionChannel
	association [0..1] to ZSNAP_F70G_FinancialAccType as _FinancialAccountType on $projection.FinancialAccountType = _FinancialAccountType.FinancialAccountType
	association [0..1] to ZSNAP_F70G_FinancialAccType as _OffsettingAccountType on $projection.OffsettingAccountType = _OffsettingAccountType.FinancialAccountType
	association [0..1] to ZSNAP_F70G_FinTransactionTp as _FinancialTransactionType on $projection.FinancialTransactionType = _FinancialTransactionType.FinancialTransactionType
	association [0..1] to ZSNAP_F70G_FiscalPeriod as _FiscalPeriod on $projection.FiscalYear = _FiscalPeriod.FiscalYear and $projection.FiscalPeriod = _FiscalPeriod.FiscalPeriod and $projection.FiscalYearVariant = _FiscalPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F70G_FiscalPeriod as _SpecialPeriod on $projection.FiscalYear = _SpecialPeriod.FiscalYear and $projection.SpecialPeriod = _SpecialPeriod.FiscalPeriod and $projection.FiscalYearVariant = _SpecialPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F70G_FiscalQuarter as _FiscalQuarter on $projection.FiscalYear = _FiscalQuarter.FiscalYear and $projection.FiscalYearVariant = _FiscalQuarter.FiscalYearVariant and $projection.FiscalQuarter = _FiscalQuarter.FiscalQuarter
	association [0..1] to ZSNAP_F70G_FiscalYear as _FiscalYear on $projection.FiscalYear = _FiscalYear.FiscalYear and $projection.FiscalYearVariant = _FiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F70G_FiscalYear as _LedgerFiscalYear on $projection.LedgerFiscalYear = _LedgerFiscalYear.FiscalYear and $projection.FiscalYearVariant = _LedgerFiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F70G_FiscalYearPeriod as _FiscalYearPeriod on $projection.FiscalYearPeriod = _FiscalYearPeriod.FiscalYearPeriod and $projection.FiscalYearVariant = _FiscalYearPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F70G_FiscYearQuarter as _FiscalYearQuarter on $projection.FiscalYearVariant = _FiscalYearQuarter.FiscalYearVariant and $projection.FiscalYearQuarter = _FiscalYearQuarter.FiscalYearQuarter
	association [0..1] to ZSNAP_F70G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
	association [0..1] to ZSNAP_F70G_FixedAsset as _FixedAsset on $projection.CompanyCode = _FixedAsset.CompanyCode and $projection.MasterFixedAsset = _FixedAsset.MasterFixedAsset and $projection.FixedAssetSubNumber = _FixedAsset.FixedAsset
	association [0..1] to ZSNAP_F70G_FunctionalArea as _FunctionalArea on $projection.FunctionalArea = _FunctionalArea.FunctionalArea
	association [0..1] to ZSNAP_F70G_FunctionalArea as _PartnerFunctionalArea on $projection.PartnerFunctionalArea = _PartnerFunctionalArea.FunctionalArea
	association [0..1] to ZSNAP_F70G_GLAccountInCOA as _GLAccount on $projection.ChartOfAccounts = _GLAccount.ChartOfAccounts and $projection.GLAccount = _GLAccount.GLAccount
	association [0..1] to ZSNAP_F70G_GLAccountInCOA as _GLAccount2 on $projection.ChartOfAccounts = _GLAccount2.ChartOfAccounts and $projection.GLAccount2 = _GLAccount2.GLAccount
	association [0..1] to ZSNAP_F70G_GLAccountSeries as _GLAccountSeries on $projection.GLAccountSeries = _GLAccountSeries.GLAccountSeries
	association [0..1] to ZSNAP_F70G_GroupAccount as _CorporateGroupAccount on $projection.GroupChartOfAccounts = _CorporateGroupAccount.ChartOfAccounts and $projection.CorporateGroupAccount = _CorporateGroupAccount.GroupAccount
	association [0..1] to ZSNAP_F70G_HouseBankAccount as _HouseBankAccount on $projection.CompanyCode = _HouseBankAccount.CompanyCode and $projection.HouseBank = _HouseBankAccount.HouseBank and $projection.HouseBankAccount = _HouseBankAccount.HouseBankAccount
	association [0..1] to ZSNAP_F70G_Housebank as _HouseBank on $projection.CompanyCode = _HouseBank.CompanyCode and $projection.HouseBank = _HouseBank.HouseBank
	association [0..1] to ZSNAP_F70G_InventoryValType as _InventoryValuationType on $projection.InventoryValuationType = _InventoryValuationType.InventoryValuationType
	association [0..1] to ZSNAP_F70G_JournalEntry as _JournalEntry on $projection.CompanyCode = _JournalEntry.CompanyCode and $projection.FiscalYear = _JournalEntry.FiscalYear and $projection.AccountingDocument = _JournalEntry.AccountingDocument and $projection.FiscalYearVariant = _JournalEntry.FiscalYearVariant
	association [0..1] to ZSNAP_F70G_Ledger as _Ledger on $projection.Ledger = _Ledger.Ledger
	association [0..1] to ZSNAP_F70G_Ledger as _SourceLedger on $projection.SourceLedger = _SourceLedger.Ledger
	association [0..1] to ZSNAP_F70G_MasterFixedAsset as _MasterFixedAsset on $projection.CompanyCode = _MasterFixedAsset.CompanyCode and $projection.MasterFixedAsset = _MasterFixedAsset.MasterFixedAsset
	association [0..1] to ZSNAP_F70G_OffsettingAcc as _OffsettingAccountWithBP on $projection.OffsettingChartOfAccounts = _OffsettingAccountWithBP.ChartOfAccounts and $projection.OffsettingAccountType = _OffsettingAccountWithBP.OffsettingAccountType and $projection.OffsettingAccount = _OffsettingAccountWithBP.OffsettingAccount
	association [0..1] to ZSNAP_F70G_Order as _Order on $projection.OrderID = _Order.OrderID
	association [0..1] to ZSNAP_F70G_Order as _PartnerOrder on $projection.PartnerOrder = _PartnerOrder.OrderID
	association [0..1] to ZSNAP_F70G_Partnercompany as _PartnerCompany on $projection.PartnerCompany = _PartnerCompany.PartnerCompany
	association [0..1] to ZSNAP_F70G_PmtDifferenceRsn as _PaymentDifferenceReason on $projection.PaymentDifferenceReason = _PaymentDifferenceReason.PaymentDifferenceReason and $projection.CompanyCode = _PaymentDifferenceReason.CompanyCode
	association [0..1] to ZSNAP_F70G_PaymentTerms as _PaymentTerms on $projection.PaymentTerms = _PaymentTerms.PaymentTerms
	association [0..1] to ZSNAP_F70G_Plant as _Plant on $projection.Plant = _Plant.Plant
	association [0..1] to ZSNAP_F70G_Product as _Product on $projection.Product = _Product.Product
	association [0..1] to ZSNAP_F70G_Product as _Product2 on $projection.Product2 = _Product2.Product
	association [0..*] to ZSNAP_F70G_ProfitCenter as _PartnerProfitCenter on $projection.ControllingArea = _PartnerProfitCenter.ControllingArea and $projection.PartnerProfitCenter = _PartnerProfitCenter.ProfitCenter
	association [0..*] to ZSNAP_F70G_ProfitCenter as _ProfitCenter on $projection.ControllingArea = _ProfitCenter.ControllingArea and $projection.ProfitCenter = _ProfitCenter.ProfitCenter
	association [0..*] to ZSNAP_F70G_ProfitCenter as _ProfitCtr2 on $projection.ControllingArea = _ProfitCtr2.ControllingArea and $projection.ProfitCenter2 = _ProfitCtr2.ProfitCenter
	association [0..1] to ZSNAP_F70G_Project as _Project on $projection.Project = _Project.Project
	association [0..1] to ZSNAP_F70G_PurReqValArea as _PurReqValuationArea on $projection.ValuationArea = _PurReqValuationArea.ValuationArea
	association [0..1] to ZSNAP_F70G_PurchasingDoc as _PurchaseOrder on $projection.PurchasingDocument = _PurchaseOrder.PurchasingDocument
	association [0..1] to ZSNAP_F70G_ReferenceDocType as _ReferenceDocumentType on $projection.ReferenceDocumentType = _ReferenceDocumentType.ReferenceDocumentType
	association [0..1] to ZSNAP_F70G_SalesDocBasic as _SalesDocument on $projection.SalesDocument = _SalesDocument.SalesDocument
	association [0..1] to ZSNAP_F70G_SalesDocItemB_B2 as _SalesDocumentItem on $projection.SalesDocument = _SalesDocumentItem.SalesDocument and $projection.SalesDocumentItem = _SalesDocumentItem.SalesDocumentItem
	association [0..1] to ZSNAP_F70G_SalesOrganiza_88 as _SalesOrganization on $projection.SalesOrganization = _SalesOrganization.SalesOrganization
	association [0..1] to ZSNAP_F70G_Signage as _Signage on $projection.SignFactor = _Signage.Signage
	association [0..1] to ZSNAP_F70G_SpecialGLCode as _SpecialGLCode on $projection.SpecialGLCode = _SpecialGLCode.SpecialGLCode and $projection.FinancialAccountType = _SpecialGLCode.FinancialAccountType
	association [0..*] to ZSNAP_F70G_SpecialGLCdText as _SpecialGLCodeText on $projection.FinancialAccountType = _SpecialGLCodeText.FinancialAccountType and $projection.SpecialGLCode = _SpecialGLCodeText.SpecialGLCode
	association [0..1] to ZSNAP_F70G_Supplier as _Supplier on $projection.Supplier = _Supplier.Supplier
	association [0..1] to ZSNAP_F70G_SupplierAccGroup as _SupplierAccountGroup on $projection.SupplierAccountGroup = _SupplierAccountGroup.SupplierAccountGroup
	association [0..1] to ZSNAP_F70G_SupplierReconAcc as _SupplierReconAccount on $projection.SupplierReconAccount = _SupplierReconAccount.ReconciliationAccount and $projection.ChartOfAccounts = _SupplierReconAccount.ChartOfAccounts
	association [0..1] to ZSNAP_F70G_User as _AccountingDocCreatedByUser on $projection.AccountingDocCreatedByUser = _AccountingDocCreatedByUser.UserID
	association [0..1] to ZSNAP_F70G_WBSElementByE_O1 as _WBSElement on $projection.WBSElement = _WBSElement.WBSElement
	association [0..1] to ZSNAP_F70G_YearMonth as _YearMonth on $projection.YearMonth = _YearMonth.YearMonth
{
	@EndUserText.label: 'Accounting Document Number'
	@ObjectModel.foreignKey.association: '_JournalEntry'
	key main.AccountingDocument,
	
	@EndUserText.label: 'Company Code'
	@ObjectModel.foreignKey.association: '_CompanyCode'
	key main.CompanyCode,
	
	@EndUserText.label: 'Fiscal Year'
	@ObjectModel.foreignKey.association: '_FiscalYear'
	key main.FiscalYear,
	
	@EndUserText.label: 'Ledger'
	@ObjectModel.foreignKey.association: '_Ledger'
	key main.Ledger,
	
	@EndUserText.label: 'Accounting Document Line Item'
	key main.LedgerGLLineItem,
	
	@EndUserText.label: 'Source Ledger'
	@ObjectModel.foreignKey.association: '_SourceLedger'
	key main.SourceLedger,
	
	@EndUserText.label: 'Account Assignment Number'
	main.AccountAssignmentNumber,
	
	@EndUserText.label: 'Account Assignment Type'
	main.AccountAssignmentType,
	
	@EndUserText.label: 'Accounting Document Status'
	main.AccountingDocumentStatus,
	
	@EndUserText.label: 'Created By'
	@ObjectModel.foreignKey.association: '_AccountingDocCreatedByUser'
	main.AccountingDocCreatedByUser,
	
	@EndUserText.label: 'Accounting Document Type'
	@ObjectModel.foreignKey.association: '_AccountingDocumentType'
	main.AccountingDocumentType,
	
	@EndUserText.label: 'Reference 1 ID by BP'
	main.Reference1IDByBusinessPartner,
	
	@EndUserText.label: 'Reference 2 ID by BP'
	main.Reference2IDByBusinessPartner,
	
	@EndUserText.label: 'Reference 3 ID by BP'
	main.Reference3IDByBusinessPartner,
	
	@EndUserText.label: 'Actual vs Plan Indicator'
	main.ActualPlanCode,
	
	@EndUserText.label: 'Transaction Type Determination'
	main.TransactionTypeDetermination,
	
	@EndUserText.label: 'Asset Transaction Type'
	@ObjectModel.foreignKey.association: '_AssetTransactionType'
	main.AssetTransactionType,
	
	@EndUserText.label: 'Bill-to Party'
	@ObjectModel.foreignKey.association: '_BillToParty'
	main.BillToParty,
	
	@EndUserText.label: 'Business Transaction Type'
	@ObjectModel.foreignKey.association: '_BusinessTransactionType'
	main.BusinessTransactionType,
	
	@EndUserText.label: 'Financial Transaction Type'
	@ObjectModel.foreignKey.association: '_FinancialTransactionType'
	main.FinancialTransactionType,
	
	@EndUserText.label: 'Business Area'
	@ObjectModel.foreignKey.association: '_BusinessArea'
	main.BusinessArea,
	
	@EndUserText.label: 'Chart of Accounts'
	@ObjectModel.foreignKey.association: '_ChartOfAccounts'
	main.ChartOfAccounts,
	
	@EndUserText.label: 'Controlling Area'
	@ObjectModel.foreignKey.association: '_ControllingArea'
	main.ControllingArea,
	
	@EndUserText.label: 'Cost Center'
	@ObjectModel.foreignKey.association: '_CostCenter'
	main.CostCenter,
	
	@EndUserText.label: 'Country'
	@ObjectModel.foreignKey.association: '_Country'
	main.Country,
	
	@EndUserText.label: 'Activity Type'
	@ObjectModel.foreignKey.association: '_CostCtrActivityType'
	main.CostCtrActivityType,
	
	@EndUserText.label: 'Customer'
	@ObjectModel.foreignKey.association: '_Customer'
	main.Customer,
	
	@EndUserText.label: 'Customer Group'
	@ObjectModel.foreignKey.association: '_CustomerGroup'
	main.CustomerGroup,
	
	@EndUserText.label: 'Customer Account Group'
	@ObjectModel.foreignKey.association: '_CustomerAccountGroup'
	main.CustomerAccountGroup,
	
	@EndUserText.label: 'Customer Auth Group'
	main.CustomerAuthorizationGroup,
	
	@EndUserText.label: 'Customer Reconciliation Account'
	@ObjectModel.foreignKey.association: '_CustomerReconAccount'
	main.CustomerReconAccount,
	
	@EndUserText.label: 'Cost Origin Group'
	main.CostOriginGroup,
	
	@EndUserText.label: 'Supplier'
	@ObjectModel.foreignKey.association: '_Supplier'
	main.Supplier,
	
	@EndUserText.label: 'Supplier Account Group'
	@ObjectModel.foreignKey.association: '_SupplierAccountGroup'
	main.SupplierAccountGroup,
	
	@EndUserText.label: 'Supplier Auth Group'
	main.SupplierAuthorizationGroup,
	
	@EndUserText.label: 'Supplier Reconciliation Account'
	@ObjectModel.foreignKey.association: '_SupplierReconAccount'
	main.SupplierReconAccount,
	
	@EndUserText.label: 'Debit/Credit Indicator'
	@ObjectModel.foreignKey.association: '_DebitCreditCode'
	main.DebitCreditCode,
	
	@EndUserText.label: 'Distribution Channel'
	@ObjectModel.foreignKey.association: '_DistributionChannel'
	main.DistributionChannel,
	
	@EndUserText.label: 'Division'
	main.OrganizationDivision,
	
	@EndUserText.label: 'Sales Organization'
	@ObjectModel.foreignKey.association: '_SalesOrganization'
	main.SalesOrganization,
	
	@EndUserText.label: 'Sales Document'
	@ObjectModel.foreignKey.association: '_SalesDocument'
	main.SalesDocument,
	
	@EndUserText.label: 'Sales Document Item'
	@ObjectModel.foreignKey.association: '_SalesDocumentItem'
	main.SalesDocumentItem,
	
	@EndUserText.label: 'Valuation Area'
	@ObjectModel.foreignKey.association: '_PurReqValuationArea'
	main.ValuationArea,
	
	@EndUserText.label: 'Financial Account Type'
	@ObjectModel.foreignKey.association: '_FinancialAccountType'
	main.FinancialAccountType,
	
	@EndUserText.label: 'Functional Area'
	@ObjectModel.foreignKey.association: '_FunctionalArea'
	main.FunctionalArea,
	
	@EndUserText.label: 'Partner Functional Area'
	@ObjectModel.foreignKey.association: '_PartnerFunctionalArea'
	main.PartnerFunctionalArea,
	
	@EndUserText.label: 'GL Account (w/Hierarchy)'
	@ObjectModel.foreignKey.association: '_GLAccount'
	main.GLAccount,
	
	@EndUserText.label: 'GL Account'
	@ObjectModel.foreignKey.association: '_GLAccount2'
	main.GLAccount as GLAccount2,
	
	@EndUserText.label: 'GL Account Series'
	@ObjectModel.foreignKey.association: '_GLAccountSeries'
	main.GLAccountSeries,
	
	@EndUserText.label: 'GL Is Balance Sheet Account'
	main.IsBalanceSheetAccount,
	
	@EndUserText.label: 'GL Is P&L Account'
	main.IsProfitLossAccount,
	
	@EndUserText.label: 'GL P&L Account Type'
	main.ProfitLossAccountType,
	
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
	
	@EndUserText.label: 'House Bank'
	@ObjectModel.foreignKey.association: '_HouseBank'
	main.HouseBank,
	
	@EndUserText.label: 'House Bank Account'
	@ObjectModel.foreignKey.association: '_HouseBankAccount'
	main.HouseBankAccount,
	
	@EndUserText.label: 'Invoice Item Reference'
	main.InvoiceItemReference,
	
	@EndUserText.label: 'Invoice Reference'
	main.InvoiceReference,
	
	@EndUserText.label: 'Is Open-Item Managed'
	main.IsOpenItemManaged,
	
	@EndUserText.label: 'Is Reversal'
	main.IsReversal,
	
	@EndUserText.label: 'Is Reversed'
	main.IsReversed,
	
	@EndUserText.label: 'Is Settled'
	main.IsSettled,
	
	@EndUserText.label: 'Is Settlement'
	main.IsSettlement,
	
	@EndUserText.label: 'Posting Key'
	main.PostingKey,
	
	@EndUserText.label: 'Inventory Valuation Type'
	@ObjectModel.foreignKey.association: '_InventoryValuationType'
	main.InventoryValuationType,
	
	@EndUserText.label: 'Fixed Asset'
	@ObjectModel.foreignKey.association: '_MasterFixedAsset'
	main.MasterFixedAsset,
	
	@EndUserText.label: 'Fixed Asset Sub Num'
	@ObjectModel.foreignKey.association: '_FixedAsset'
	main.FixedAssetSubNumber,
	
	@EndUserText.label: 'GL Offset Customer'
	@ObjectModel.foreignKey.association: '_OffsetCustomer'
	main.OffsetCustomer,
	
	@EndUserText.label: 'GL Offset Supplier'
	@ObjectModel.foreignKey.association: '_OffsetSupplier'
	main.OffsetSupplier,
	
	@EndUserText.label: 'Offsetting Account'
	@ObjectModel.foreignKey.association: '_OffsettingAccountWithBP'
	main.OffsettingAccount,
	
	@EndUserText.label: 'Offsetting Account Type'
	@ObjectModel.foreignKey.association: '_OffsettingAccountType'
	main.OffsettingAccountType,
	
	@EndUserText.label: 'Offsetting Chart of Accounts'
	@ObjectModel.foreignKey.association: '_OffsettingChartOfAccounts'
	main.OffsettingChartOfAccounts,
	
	@EndUserText.label: 'Order'
	@ObjectModel.foreignKey.association: '_Order'
	main.OrderID,
	
	@EndUserText.label: 'Partner Order'
	@ObjectModel.foreignKey.association: '_PartnerOrder'
	main.PartnerOrder,
	
	@EndUserText.label: 'Trading Partner'
	@ObjectModel.foreignKey.association: '_PartnerCompany'
	main.PartnerCompany,
	
	@EndUserText.label: 'Partner Company Code'
	@ObjectModel.foreignKey.association: '_PartnerCompanyCode'
	main.PartnerCompanyCode,
	
	@EndUserText.label: 'Tax Code'
	main.TaxCode,
	
	@EndUserText.label: 'Partner Object Class'
	@ObjectModel.foreignKey.association: '_PartnerControllingObjectClass'
	main.PartnerControllingObjectClass,
	
	@EndUserText.label: 'Payer Party'
	@ObjectModel.foreignKey.association: '_PayerParty'
	main.PayerParty,
	
	@EndUserText.label: 'Plant'
	@ObjectModel.foreignKey.association: '_Plant'
	main.Plant,
	
	@EndUserText.label: 'Product'
	@ObjectModel.foreignKey.association: '_Product'
	main.Product,
	
	@EndUserText.label: 'Product 2'
	@ObjectModel.foreignKey.association: '_Product2'
	main.Product as Product2,
	
	@EndUserText.label: 'Profit Center L1'
	@ObjectModel.foreignKey.association: '_PCGrp1'
	main.ProfCtrLevel1,
	
	@EndUserText.label: 'Profit Center L2'
	@ObjectModel.foreignKey.association: '_PCGrp2'
	main.ProfCtrLevel2,
	
	@EndUserText.label: 'Profit Center L3'
	@ObjectModel.foreignKey.association: '_PCGrp3'
	main.ProfCtrLevel3,
	
	@EndUserText.label: 'Profit Center L4'
	@ObjectModel.foreignKey.association: '_PCGrp4'
	main.ProfCtrLevel4,
	
	@EndUserText.label: 'Profit Center L5'
	@ObjectModel.foreignKey.association: '_PCGrp5'
	main.ProfCtrLevel5,
	
	@EndUserText.label: 'Profit Center L6'
	@ObjectModel.foreignKey.association: '_PCGrp6'
	main.ProfCtrLevel6,
	
	@EndUserText.label: 'Profit Center'
	@ObjectModel.foreignKey.association: '_ProfitCenter'
	main.ProfitCenter,
	
	@EndUserText.label: 'Profit Center 2'
	@ObjectModel.foreignKey.association: '_ProfitCtr2'
	main.ProfitCenter as ProfitCenter2,
	
	@EndUserText.label: 'Project'
	@ObjectModel.foreignKey.association: '_Project'
	main.Project,
	
	@EndUserText.label: 'WBSE Project Type'
	main.ProjectType,
	
	@EndUserText.label: 'Project Profile'
	main.ProjectProfileCode,
	
	@EndUserText.label: 'Partner Profit Center'
	@ObjectModel.foreignKey.association: '_PartnerProfitCenter'
	main.PartnerProfitCenter,
	
	@EndUserText.label: 'Partner Cost Center'
	@ObjectModel.foreignKey.association: '_PartnerCostCenter'
	main.PartnerCostCenter,
	
	@EndUserText.label: 'Document Number'
	main.ReferenceDocument,
	
	@EndUserText.label: 'Reference Document Item'
	main.ReferenceDocumentItem,
	
	@EndUserText.label: 'Reference Document Item Group'
	main.ReferenceDocumentItemGroup,
	
	@EndUserText.label: 'Reference Document Type'
	@ObjectModel.foreignKey.association: '_ReferenceDocumentType'
	main.ReferenceDocumentType,
	
	@EndUserText.label: 'Billing Document'
	@ObjectModel.foreignKey.association: '_BillingDocument'
	main.BillingDocument,
	
	@EndUserText.label: 'Ship-To Party'
	@ObjectModel.foreignKey.association: '_ShipToParty'
	main.ShipToParty,
	
	@EndUserText.label: 'Sign Factor'
	@ObjectModel.foreignKey.association: '_Signage'
	main.SignFactor,
	
	@EndUserText.label: 'Product Sold'
	main.SoldProduct,
	
	@EndUserText.label: 'S4 Source'
	main.Source,
	
	@EndUserText.label: 'Special GL Indicator'
	@ObjectModel.foreignKey.association: '_SpecialGLCode'
	@ObjectModel.text.association: '_SpecialGLCodeText'
	main.SpecialGLCode,
	
	@EndUserText.label: 'WBS Element'
	@ObjectModel.foreignKey.association: '_WBSElement'
	main.WBSElement,
	
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
	
	@EndUserText.label: 'Accounting Document Created Date'
	main.CreationDate,
	
	@EndUserText.label: 'Accounting Document Created Timestamp'
	main.CreationDateTime,
	
	@EndUserText.label: 'Accounting Document Date'
	main.DocumentDate,
	
	@EndUserText.label: 'Fiscal Period'
	@ObjectModel.foreignKey.association: '_FiscalPeriod'
	main.FiscalPeriod,
	
	@EndUserText.label: 'Fiscal Special Period'
	@ObjectModel.foreignKey.association: '_SpecialPeriod'
	main.SpecialPeriod,
	
	@EndUserText.label: 'Fiscal Quarter'
	@ObjectModel.foreignKey.association: '_FiscalQuarter'
	main.FiscalQuarter,
	
	@EndUserText.label: 'Fiscal Week'
	main.FiscalWeek,
	
	@EndUserText.label: 'Fiscal Year Period'
	@ObjectModel.foreignKey.association: '_FiscalYearPeriod'
	main.FiscalYearPeriod,
	
	@EndUserText.label: 'Fiscal Year Quarter'
	@ObjectModel.foreignKey.association: '_FiscalYearQuarter'
	main.FiscalYearQuarter,
	
	@EndUserText.label: 'Fiscal Year Variant'
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	main.FiscalYearVariant,
	
	@EndUserText.label: 'Fiscal Year Week'
	main.FiscalYearWeek,
	
	@EndUserText.label: 'Ledger Fiscal Year'
	@ObjectModel.foreignKey.association: '_LedgerFiscalYear'
	main.LedgerFiscalYear,
	
	@EndUserText.label: 'Posting Date'
	@ObjectModel.foreignKey.association: '_FiscalCalendarDate'
	main.PostingDate,
	
	@EndUserText.label: 'Calendar Year Month'
	@ObjectModel.foreignKey.association: '_YearMonth'
	main.YearMonth,
	
	@EndUserText.label: 'Calendar Year Quarter'
	main.YearQuarter,
	
	@EndUserText.label: 'Cost Source Unit'
	main.CostSourceUnit,
	
	@EndUserText.label: 'Unit of Measure'
	main.UnitOfMeasure,
	
	@EndUserText.label: 'Accounting Document Item'
	main.AccountingDocumentItem,
	
	@EndUserText.label: 'Accounting Document Reversal Date'
	main.PlannedReversalDate,
	
	@EndUserText.label: 'Accounting Document Reversal Reason'
	main.ReversalReason,
	
	@EndUserText.label: 'Accounting Document Park Date'
	main.ParkingDate,
	
	@EndUserText.label: 'Original Reference Key'
	main.OriginalReferenceDocument,
	
	@EndUserText.label: 'Accounting Document Reference ID'
	main.DocumentReferenceID,
	
	@EndUserText.label: 'Accounting Document Header Text'
	main.DocumentHeaderText,
	
	@EndUserText.label: 'Accounting Document Header Ref1'
	main.Reference1InDocumentHeader,
	
	@EndUserText.label: 'Accounting Document Header Ref2'
	main.Reference2InDocumentHeader,
	
	@EndUserText.label: 'Accounting Reversal Doc'
	main.ReverseDocument,
	
	@EndUserText.label: 'Accounting Document Reversal Year'
	main.ReverseDocumentFiscalYear,
	
	@EndUserText.label: 'Cross-Company Document Number'
	main.IntercompanyTransaction,
	
	@EndUserText.label: 'Accounting Document Transaction Code'
	main.TransactionCode,
	
	@EndUserText.label: 'Is Automatic Indicator'
	main.IsAutomaticallyCreated,
	
	@EndUserText.label: 'Is Payment Indicator'
	main.IsUsedInPaymentTransaction,
	
	@EndUserText.label: 'Payment Terms'
	@ObjectModel.foreignKey.association: '_PaymentTerms'
	main.PaymentTerms,
	
	@EndUserText.label: 'Payment Difference Reason'
	@ObjectModel.foreignKey.association: '_PaymentDifferenceReason'
	main.PaymentDifferenceReason,
	
	@EndUserText.label: 'Net Due Date'
	@ObjectModel.foreignKey.association: '_NetDueDate'
	main.NetDueDate,
	
	@EndUserText.label: 'Baseline Date'
	@ObjectModel.foreignKey.association: '_BaselineDate'
	main.BaselineDate,
	
	@EndUserText.label: 'Assignment Reference'
	main.AssignmentReference,
	
	@EndUserText.label: 'Accounting Document Item Text'
	main.DocumentItemText,
	
	@EndUserText.label: 'Purchase Order'
	@ObjectModel.foreignKey.association: '_PurchaseOrder'
	main.PurchasingDocument,
	
	@EndUserText.label: 'PO Header Text'
	main.PurchasingDocumentItemText,
	
	@EndUserText.label: 'Clearing Document'
	main.ClearingAccountingDocument,
	
	@EndUserText.label: 'Clearing Doc Fiscal Year'
	main.ClearingDocFiscalYear,
	
	@EndUserText.label: 'Clearing Doc Fiscal Year Period'
	main.ClearingDocFiscalYearPeriod,
	
	@EndUserText.label: 'Clearing Date'
	@ObjectModel.foreignKey.association: '_ClearingDate'
	main.ClearingDate,
	
	@EndUserText.label: 'Group Account'
	@ObjectModel.foreignKey.association: '_CorporateGroupAccount'
	main.CorporateGroupAccount,
	
	@EndUserText.label: 'Group Chart of Accounts'
	@ObjectModel.foreignKey.association: '_GroupChartOfAccounts'
	main.GroupChartOfAccounts,
	
	@EndUserText.label: 'Title'
	main.Title,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amt in LC'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.AmountInCompanyCodeCurrency,
	
	@EndUserText.label: 'Local Currency'
	main.CompanyCodeCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amt in GC'
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	main.AmountInGlobalCurrency,
	
	@EndUserText.label: 'Group Currency'
	main.GlobalCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amt in TC'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.AmountInTransactionCurrency,
	
	@EndUserText.label: 'Transaction Currency'
	main.TransactionCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amt in FC'
	@Semantics.amount.currencyCode: 'FourthCurrency'
	main.AmountInFourthCurrency,
	
	@EndUserText.label: 'Fourth Currency'
	main.FourthCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Valuation quantity'
	@Semantics.quantity.unitOfMeasure: 'CostSourceUnit'
	main.ValuationQuantity,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Number of Rows'
	main.NumberOfItems,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Quantity'
	@Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
	main.Quantity,
	_AccountingDocCreatedByUser,
	_AccountingDocumentType,
	_AssetTransactionType,
	_BaselineDate,
	_BillToParty,
	_BillingDocument,
	_BusinessArea,
	_BusinessTransactionType,
	_CalendarMonth,
	_CalendarQuarter,
	_CalendarYear,
	_ChartOfAccounts,
	_ClearingDate,
	_CompanyCode,
	_ControllingArea,
	_CorporateGroupAccount,
	_CostCenter,
	_CostCtrActivityType,
	_Country,
	_Customer,
	_CustomerAccountGroup,
	_CustomerGroup,
	_CustomerReconAccount,
	_DebitCreditCode,
	_DistributionChannel,
	_FinancialAccountType,
	_FinancialTransactionType,
	_FiscalCalendarDate,
	_FiscalPeriod,
	_FiscalQuarter,
	_FiscalYear,
	_FiscalYearPeriod,
	_FiscalYearQuarter,
	_FiscalYearVariant,
	_FixedAsset,
	_FunctionalArea,
	_GLAccount,
	_GLAccount2,
	_GLAccountSeries,
	_GLGrp1,
	_GLGrp2,
	_GLGrp3,
	_GLGrp4,
	_GLGrp5,
	_GroupChartOfAccounts,
	_HouseBank,
	_HouseBankAccount,
	_InventoryValuationType,
	_JournalEntry,
	_Ledger,
	_LedgerFiscalYear,
	_MasterFixedAsset,
	_NetDueDate,
	_OffsetCustomer,
	_OffsetSupplier,
	_OffsettingAccountType,
	_OffsettingAccountWithBP,
	_OffsettingChartOfAccounts,
	_Order,
	_PCGrp1,
	_PCGrp2,
	_PCGrp3,
	_PCGrp4,
	_PCGrp5,
	_PCGrp6,
	_PartnerCompany,
	_PartnerCompanyCode,
	_PartnerControllingObjectClass,
	_PartnerCostCenter,
	_PartnerFunctionalArea,
	_PartnerOrder,
	_PartnerProfitCenter,
	_PayerParty,
	_PaymentDifferenceReason,
	_PaymentTerms,
	_Plant,
	_Product,
	_Product2,
	_ProfitCenter,
	_ProfitCtr2,
	_Project,
	_PurReqValuationArea,
	_PurchaseOrder,
	_ReferenceDocumentType,
	_SalesDocument,
	_SalesDocumentItem,
	_SalesOrganization,
	_ShipToParty,
	_Signage,
	_SourceLedger,
	_SpecialGLCode,
	_SpecialGLCodeText,
	_SpecialPeriod,
	_Supplier,
	_SupplierAccountGroup,
	_SupplierReconAccount,
	_WBSElement,
	_YearMonth
}