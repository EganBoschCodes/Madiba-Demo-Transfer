@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'SNAP F72C01: Financial Balances Cube'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F72S_C01	
	with parameters
		P_SFromFiscalYear: abap.numc (4),
		P_SToFiscalYearPeriod: abap.numc (7),
		P_Signage: abap.char (1)
	
	as select from ZSNAP_F72S_105 (P_SFromFiscalYear: $parameters.P_SFromFiscalYear, P_SToFiscalYearPeriod: $parameters.P_SToFiscalYearPeriod, P_Signage: $parameters.P_Signage) as main
	
	association [0..1] to ZSNAP_F72C_CustIsInterco_CS as _CustomerIsIntercompany on _CustomerIsIntercompany.CustomerIsIntercompany = $projection.CustomerIsIntercompany
	association [0..1] to ZSNAP_F72C_SuppIsInterco_W3 as _SupplierIsIntercompany on _SupplierIsIntercompany.SupplierIsIntercompany = $projection.SupplierIsIntercompany
	association [0..1] to ZSNAP_F72G_103 as _PCGrp1 on $projection.ProfCtrLevel1 = _PCGrp1.HierarchyNode
	association [0..1] to ZSNAP_F72G_103 as _PCGrp2 on $projection.ProfCtrLevel2 = _PCGrp2.HierarchyNode
	association [0..1] to ZSNAP_F72G_103 as _PCGrp3 on $projection.ProfCtrLevel3 = _PCGrp3.HierarchyNode
	association [0..1] to ZSNAP_F72G_103 as _PCGrp4 on $projection.ProfCtrLevel4 = _PCGrp4.HierarchyNode
	association [0..1] to ZSNAP_F72G_103 as _PCGrp5 on $projection.ProfCtrLevel5 = _PCGrp5.HierarchyNode
	association [0..1] to ZSNAP_F72G_103 as _PCGrp6 on $projection.ProfCtrLevel6 = _PCGrp6.HierarchyNode
	association [0..1] to ZSNAP_F72G_122 as _GLGrp1 on $projection.GLAcctLevel1 = _GLGrp1.HierarchyNode and _GLGrp1.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F72G_122 as _GLGrp2 on $projection.GLAcctLevel2 = _GLGrp2.HierarchyNode and _GLGrp2.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F72G_122 as _GLGrp3 on $projection.GLAcctLevel3 = _GLGrp3.HierarchyNode and _GLGrp3.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F72G_122 as _GLGrp4 on $projection.GLAcctLevel4 = _GLGrp4.HierarchyNode and _GLGrp4.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F72G_122 as _GLGrp5 on $projection.GLAcctLevel5 = _GLGrp5.HierarchyNode and _GLGrp5.GLAccountHierarchy = 'BASK'
	association [0..1] to ZSNAP_F72G_AccngDocCategory as _AccountingDocumentCategory on $projection.AccountingDocumentCategory = _AccountingDocumentCategory.AccountingDocumentCategory
	association [0..1] to ZSNAP_F72G_AccngDocType as _AccountingDocumentType on $projection.AccountingDocumentType = _AccountingDocumentType.AccountingDocumentType
	association [0..1] to ZSNAP_F72G_AssetTransact_L0 as _AssetTransactionType on $projection.AssetTransactionType = _AssetTransactionType.AssetTransactionType
	association [0..1] to ZSNAP_F72G_BusinessArea as _BusinessArea on $projection.BusinessArea = _BusinessArea.BusinessArea
	association [0..1] to ZSNAP_F72G_BusinessArea as _PartnerBusinessArea on $projection.PartnerBusinessArea = _PartnerBusinessArea.BusinessArea
	association [0..1] to ZSNAP_F72G_BusTransactionTp as _BusinessTransactionType on $projection.BusinessTransactionType = _BusinessTransactionType.BusinessTransactionType
	association [0..1] to ZSNAP_F72G_CalendarDate as _PostingDate on $projection.PostingDate = _PostingDate.CalendarDate
	association [0..1] to ZSNAP_F72G_CalendarYear as _CalendarYear on $projection.CalendarYear = _CalendarYear.CalendarYear
	association [0..1] to ZSNAP_F72G_ChartOfAccounts as _ChartOfAccounts on $projection.ChartOfAccounts = _ChartOfAccounts.ChartOfAccounts
	association [0..1] to ZSNAP_F72G_ChartOfAccounts as _CorporateGroupChartOfAccounts on $projection.CorporateGroupChartOfAccounts = _CorporateGroupChartOfAccounts.ChartOfAccounts
	association [0..1] to ZSNAP_F72G_ChartOfAccounts as _OffsettingChartOfAccounts on $projection.OffsettingChartOfAccounts = _OffsettingChartOfAccounts.ChartOfAccounts
	association [0..1] to ZSNAP_F72G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [0..1] to ZSNAP_F72G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
	association [0..*] to ZSNAP_F72G_CostCenter as _CostCenter on $projection.ControllingArea = _CostCenter.ControllingArea and $projection.CostCenter = _CostCenter.CostCenter
	association [0..*] to ZSNAP_F72G_CCActivityType as _CostCtrActivityType on $projection.ControllingArea = _CostCtrActivityType.ControllingArea and $projection.CostCtrActivityType = _CostCtrActivityType.CostCtrActivityType
	association [0..1] to ZSNAP_F72G_Customer as _BillToParty on $projection.BillToParty = _BillToParty.Customer
	association [0..1] to ZSNAP_F72G_Customer as _Customer on $projection.Customer = _Customer.Customer
	association [0..1] to ZSNAP_F72G_Customer as _ShipToParty on $projection.ShipToParty = _ShipToParty.Customer
	association [0..1] to ZSNAP_F72G_CustomerAccGroup as _CustomerAccountGroup on $projection.CustomerAccountGroup = _CustomerAccountGroup.CustomerAccountGroup
	association [0..1] to ZSNAP_F72G_CustomerGroup as _CustomerGroup on $projection.CustomerGroup = _CustomerGroup.CustomerGroup
	association [0..1] to ZSNAP_F72G_DebitCreditCode as _DebitCreditCode on $projection.DebitCreditCode = _DebitCreditCode.DebitCreditCode
	association [0..1] to ZSNAP_F72G_DistChannel as _DistributionChannel on $projection.DistributionChannel = _DistributionChannel.DistributionChannel
	association [0..1] to ZSNAP_F72G_FinancialAccType as _FinancialAccountType on $projection.FinancialAccountType = _FinancialAccountType.FinancialAccountType
	association [0..1] to ZSNAP_F72G_FinancialAccType as _OffsettingAccountType on $projection.OffsettingAccountType = _OffsettingAccountType.FinancialAccountType
	association [0..1] to ZSNAP_F72G_FinTransactionTp as _FinancialTransactionType on $projection.FinancialTransactionType = _FinancialTransactionType.FinancialTransactionType
	association [0..1] to ZSNAP_F72G_FiscalPeriod as _FiscalPeriod on $projection.FiscalYear = _FiscalPeriod.FiscalYear and $projection.FiscalPeriod = _FiscalPeriod.FiscalPeriod and $projection.FiscalYearVariant = _FiscalPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscalPeriod as _PostingPeriod on $projection.FiscalYear = _PostingPeriod.FiscalYear and $projection.PostingPeriod = _PostingPeriod.FiscalPeriod and $projection.FiscalYearVariant = _PostingPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscalPeriod as _SpecialPeriod on $projection.FiscalYear = _SpecialPeriod.FiscalYear and $projection.SpecialPeriod = _SpecialPeriod.FiscalPeriod and $projection.FiscalYearVariant = _SpecialPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscalQuarter as _FiscalQuarter on $projection.FiscalYear = _FiscalQuarter.FiscalYear and $projection.FiscalYearVariant = _FiscalQuarter.FiscalYearVariant and $projection.FiscalQuarter = _FiscalQuarter.FiscalQuarter
	association [0..1] to ZSNAP_F72G_FiscalYear as _ClearingFiscalYear on $projection.ClearingDocFiscalYear = _ClearingFiscalYear.FiscalYear and $projection.FiscalYearVariant = _ClearingFiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscalYear as _FiscalYear on $projection.FiscalYear = _FiscalYear.FiscalYear and $projection.FiscalYearVariant = _FiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscalYear as _LedgerFiscalYear on $projection.LedgerFiscalYear = _LedgerFiscalYear.FiscalYear and $projection.FiscalYearVariant = _LedgerFiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscalYear as _ReverseFiscalYear on $projection.ReverseDocumentFiscalYear = _ReverseFiscalYear.FiscalYear and $projection.FiscalYearVariant = _ReverseFiscalYear.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscalYearPeriod as _FiscalYearPeriod on $projection.FiscalYearPeriod = _FiscalYearPeriod.FiscalYearPeriod and $projection.FiscalYearVariant = _FiscalYearPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscalYearPeriod as _PostingYearPeriod on $projection.PostingYearPeriod = _PostingYearPeriod.FiscalYearPeriod and $projection.FiscalYearVariant = _PostingYearPeriod.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscYearQuarter as _FiscalYearQuarter on $projection.FiscalYearQuarter = _FiscalYearQuarter.FiscalYearQuarter and $projection.FiscalYearVariant = _FiscalYearQuarter.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FiscYearVariant as _FiscalYearVariant on $projection.FiscalYearVariant = _FiscalYearVariant.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_FunctionalArea as _FunctionalArea on $projection.FunctionalArea = _FunctionalArea.FunctionalArea
	association [0..1] to ZSNAP_F72G_FunctionalArea as _PartnerFunctionalArea on $projection.PartnerFunctionalArea = _PartnerFunctionalArea.FunctionalArea
	association [0..1] to ZSNAP_F72G_GLAccountGroup as _GLAccountGroup on $projection.GLAccountGroup = _GLAccountGroup.GLAccountGroup and $projection.ChartOfAccounts = _GLAccountGroup.ChartOfAccounts
	association [0..1] to ZSNAP_F72G_GLAccountInCOA as _GLAccount2 on $projection.ChartOfAccounts = _GLAccount2.ChartOfAccounts and $projection.GLAccount2 = _GLAccount2.GLAccount
	association [0..1] to ZSNAP_F72G_GLAccountInCOA as _GLAccountInChartOfAccounts on $projection.ChartOfAccounts = _GLAccountInChartOfAccounts.ChartOfAccounts and $projection.GLAccount = _GLAccountInChartOfAccounts.GLAccount
	association [0..1] to ZSNAP_F72G_GroupAccount as _CorporateGroupAccount on $projection.CorporateGroupChartOfAccounts = _CorporateGroupAccount.ChartOfAccounts and $projection.CorporateGroupAccount = _CorporateGroupAccount.GroupAccount
	association [0..1] to ZSNAP_F72G_HouseBankAccount as _HouseBankAccount on $projection.CompanyCode = _HouseBankAccount.CompanyCode and $projection.HouseBank = _HouseBankAccount.HouseBank and $projection.HouseBankAccount = _HouseBankAccount.HouseBankAccount
	association [0..1] to ZSNAP_F72G_Housebank as _HouseBank on $projection.CompanyCode = _HouseBank.CompanyCode and $projection.HouseBank = _HouseBank.HouseBank
	association [0..1] to ZSNAP_F72G_JournalEntry as _ClearingAccountingDocument on $projection.CompanyCode = _ClearingAccountingDocument.CompanyCode and $projection.FiscalYear = _ClearingAccountingDocument.FiscalYear and $projection.ClearingAccountingDocument = _ClearingAccountingDocument.AccountingDocument and $projection.FiscalYearVariant = _ClearingAccountingDocument.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_JournalEntry as _JournalEntry on $projection.CompanyCode = _JournalEntry.CompanyCode and $projection.FiscalYear = _JournalEntry.FiscalYear and $projection.AccountingDocument = _JournalEntry.AccountingDocument and $projection.FiscalYearVariant = _JournalEntry.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_JournalEntry as _ReverseDocument on $projection.CompanyCode = _ReverseDocument.CompanyCode and $projection.ReverseDocumentFiscalYear = _ReverseDocument.FiscalYear and $projection.ReverseDocument = _ReverseDocument.AccountingDocument and $projection.FiscalYearVariant = _ReverseDocument.FiscalYearVariant
	association [0..1] to ZSNAP_F72G_Ledger as _Ledger on $projection.Ledger = _Ledger.Ledger
	association [0..1] to ZSNAP_F72G_Ledger as _SourceLedger on $projection.SourceLedger = _SourceLedger.Ledger
	association [0..1] to ZSNAP_F72G_MasterFixedAsset as _MasterFixedAsset on $projection.CompanyCode = _MasterFixedAsset.CompanyCode and $projection.MasterFixedAsset = _MasterFixedAsset.MasterFixedAsset
	association [0..1] to ZSNAP_F72G_Material as _Material on $projection.Material = _Material.Material
	association [0..1] to ZSNAP_F72G_Material as _SoldMaterial on $projection.SoldMaterial = _SoldMaterial.Material
	association [0..1] to ZSNAP_F72G_MaterialGroup as _MaterialGroup on $projection.MaterialGroup = _MaterialGroup.MaterialGroup
	association [0..1] to ZSNAP_F72G_OffsettingAcc as _OffsettingAccount on $projection.OffsettingChartOfAccounts = _OffsettingAccount.ChartOfAccounts and $projection.OffsettingAccountType = _OffsettingAccount.OffsettingAccountType and $projection.OffsettingAccount = _OffsettingAccount.OffsettingAccount
	association [0..1] to ZSNAP_F72G_OplAcctgDocItem as _AccountingDocumentItem on $projection.AccountingDocumentItem = _AccountingDocumentItem.AccountingDocumentItem and $projection.AccountingDocument = _AccountingDocumentItem.AccountingDocument and $projection.FiscalYear = _AccountingDocumentItem.FiscalYear and $projection.FiscalYearVariant = _AccountingDocumentItem.FiscalYearVariant and $projection.CompanyCode = _AccountingDocumentItem.CompanyCode
	association [0..1] to ZSNAP_F72G_Order as _Order on $projection.OrderID = _Order.OrderID
	association [0..1] to ZSNAP_F72G_Partnercompany as _CustomerPartnerCompany on $projection.CustomerPartnerCompany = _CustomerPartnerCompany.PartnerCompany
	association [0..1] to ZSNAP_F72G_Partnercompany as _SupplierPartnerCompany on $projection.SupplierPartnerCompany = _SupplierPartnerCompany.PartnerCompany
	association [0..1] to ZSNAP_F72G_Partnercompany as _PartnerCompany on $projection.PartnerCompany = _PartnerCompany.PartnerCompany
	association [0..1] to ZSNAP_F72G_Plant as _Plant on $projection.Plant = _Plant.Plant
	association [0..1] to ZSNAP_F72G_PostingKey as _PostingKey on $projection.PostingKey = _PostingKey.PostingKey
	association [0..1] to ZSNAP_F72G_Product as _Product on $projection.Product = _Product.Product
	association [0..1] to ZSNAP_F72G_Product as _SoldProduct on $projection.SoldProduct = _SoldProduct.Product
	association [0..1] to ZSNAP_F72G_ProfitCenter as _PartnerProfitCenter on $projection.ControllingArea = _PartnerProfitCenter.ControllingArea and $projection.PartnerProfitCenter = _PartnerProfitCenter.ProfitCenter
	association [0..*] to ZSNAP_F72G_ProfitCenter as _ProfitCenter on $projection.ControllingArea = _ProfitCenter.ControllingArea and $projection.ProfitCenter = _ProfitCenter.ProfitCenter
	association [0..1] to ZSNAP_F72G_Project as _Project on $projection.Project = _Project.Project
	association [0..1] to ZSNAP_F72G_PurchasingDoc as _PurchasingDocument on $projection.PurchasingDocument = _PurchasingDocument.PurchasingDocument
	association [0..1] to ZSNAP_F72G_PrchngDocItem as _PurchasingDocumentItem on $projection.PurchasingDocument = _PurchasingDocumentItem.PurchasingDocument and $projection.PurchasingDocumentItem = _PurchasingDocumentItem.PurchasingDocumentItem
	association [0..1] to ZSNAP_F72G_ReferenceDocType as _ReferenceDocumentType on $projection.ReferenceDocumentType = _ReferenceDocumentType.ReferenceDocumentType
	association [0..1] to ZSNAP_F72G_SalesOrganiza_6R as _SalesOrganization on $projection.SalesOrganization = _SalesOrganization.SalesOrganization
	association [0..1] to ZSNAP_F72G_Signage as _Signage on $projection.SignFactor = _Signage.Signage
	association [0..1] to ZSNAP_F72G_SpecialGLCode as _SpecialGLCode on $projection.SpecialGLCode = _SpecialGLCode.SpecialGLCode and $projection.FinancialAccountType = _SpecialGLCode.FinancialAccountType
	association [0..1] to ZSNAP_F72G_Supplier as _Supplier on $projection.Supplier = _Supplier.Supplier
	association [0..1] to ZSNAP_F72G_SupplierAccGroup as _SupplierAccountGroup on $projection.SupplierAccountGroup = _SupplierAccountGroup.SupplierAccountGroup
	association [0..1] to ZSNAP_F72G_User as _AccountingDocCreatedByUser on $projection.AccountingDocCreatedByUser = _AccountingDocCreatedByUser.UserID
	association [0..1] to ZSNAP_F72G_WBSElementByE_32 as _WBSElement on $projection.WBSElement = _WBSElement.WBSElement
	association [0..1] to ZSNAP_F72G_YearMonth as _YearMonth on $projection.CalendarYearMonth = _YearMonth.YearMonth
{
	@Analytics.internalName: #LOCAL
	@EndUserText.label: 'JE Doc #'
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
	
	@EndUserText.label: 'JE GL Item #'
	key main.LedgerGLLineItem,
	
	@EndUserText.label: 'Source Ledger'
	@ObjectModel.foreignKey.association: '_SourceLedger'
	key main.SourceLedger,
	
	@EndUserText.label: 'Account Assignment Number'
	main.AccountAssignmentNumber,
	
	@EndUserText.label: 'Account Assignment Type'
	main.AccountAssignmentType,
	
	@EndUserText.label: 'JE Created By'
	@ObjectModel.foreignKey.association: '_AccountingDocCreatedByUser'
	main.AccountingDocCreatedByUser,
	
	@EndUserText.label: 'JE Doc Type'
	@ObjectModel.foreignKey.association: '_AccountingDocumentType'
	main.AccountingDocumentType,
	
	@EndUserText.label: 'Company Code Name'
	_CompanyCode.CompanyCodeName,
	
	@EndUserText.label: 'Parking Date'
	main.ParkingDate,
	
	@EndUserText.label: 'Document Reference ID'
	main.DocumentReferenceID,
	
	@EndUserText.label: 'Alternative Reference Document'
	main.AlternativeReferenceDocument,
	
	@EndUserText.label: 'Document Header Text'
	main.DocumentHeaderText,
	
	@EndUserText.label: 'Reverse Document'
	@ObjectModel.foreignKey.association: '_ReverseDocument'
	main.ReverseDocument,
	
	@EndUserText.label: 'Reverse Document Fiscal Year'
	@ObjectModel.foreignKey.association: '_ReverseFiscalYear'
	main.ReverseDocumentFiscalYear,
	
	@EndUserText.label: 'Transaction Code'
	main.TransactionCode,
	
	@EndUserText.label: 'Country'
	main.Country,
	
	@EndUserText.label: 'Asset Transaction Type'
	@ObjectModel.foreignKey.association: '_AssetTransactionType'
	main.AssetTransactionType,
	
	@EndUserText.label: 'Accounting Document Category'
	@ObjectModel.foreignKey.association: '_AccountingDocumentCategory'
	main.AccountingDocumentCategory,
	
	@EndUserText.label: 'Accounting Document Item'
	@ObjectModel.foreignKey.association: '_AccountingDocumentItem'
	main.AccountingDocumentItem,
	
	@EndUserText.label: 'Assignment Reference'
	main.AssignmentReference,
	
	@EndUserText.label: 'Clearing Accounting Document'
	@ObjectModel.foreignKey.association: '_ClearingAccountingDocument'
	main.ClearingAccountingDocument,
	
	@EndUserText.label: 'Clearing Date'
	main.ClearingDate,
	
	@EndUserText.label: 'Clearing Doc Fiscal Year'
	@ObjectModel.foreignKey.association: '_ClearingFiscalYear'
	main.ClearingDocFiscalYear,
	
	@EndUserText.label: 'House Bank'
	@ObjectModel.foreignKey.association: '_HouseBank'
	main.HouseBank,
	
	@EndUserText.label: 'House Bank Account'
	@ObjectModel.foreignKey.association: '_HouseBankAccount'
	main.HouseBankAccount,
	
	@EndUserText.label: 'Distribution Channel'
	@ObjectModel.foreignKey.association: '_DistributionChannel'
	main.DistributionChannel,
	
	@EndUserText.label: 'Sales Organization'
	@ObjectModel.foreignKey.association: '_SalesOrganization'
	main.SalesOrganization,
	
	@EndUserText.label: 'Invoice Reference'
	main.InvoiceReference,
	
	@EndUserText.label: 'Invoice Item Reference'
	main.InvoiceItemReference,
	
	@EndUserText.label: 'Is Open Item Managed'
	main.IsOpenItemManaged,
	
	@EndUserText.label: 'Is Reversal'
	main.IsReversal,
	
	@EndUserText.label: 'Is Reversed'
	main.IsReversed,
	
	@EndUserText.label: 'Is Settled'
	main.IsSettled,
	
	@EndUserText.label: 'Is Settlement'
	main.IsSettlement,
	
	@EndUserText.label: 'Master Fixed Asset'
	@ObjectModel.foreignKey.association: '_MasterFixedAsset'
	main.MasterFixedAsset,
	
	@EndUserText.label: 'Posting Key'
	@ObjectModel.foreignKey.association: '_PostingKey'
	main.PostingKey,
	
	@EndUserText.label: 'Purchasing Document'
	@ObjectModel.foreignKey.association: '_PurchasingDocument'
	main.PurchasingDocument,
	
	@EndUserText.label: 'Purchasing Document Item'
	@ObjectModel.foreignKey.association: '_PurchasingDocumentItem'
	main.PurchasingDocumentItem,
	
	@EndUserText.label: 'Reference Document Item Group'
	main.ReferenceDocumentItemGroup,
	
	@EndUserText.label: 'Special GL Code'
	@ObjectModel.foreignKey.association: '_SpecialGLCode'
	main.SpecialGLCode,
	
	@EndUserText.label: 'Tax Code'
	main.TaxCode,
	
	@EndUserText.label: 'Transaction Type Determination'
	main.TransactionTypeDetermination,
	
	@EndUserText.label: 'Creation Date'
	main.CreationDate,
	
	@EndUserText.label: 'Customer Group'
	@ObjectModel.foreignKey.association: '_CustomerGroup'
	main.CustomerGroup,
	
	@EndUserText.label: 'Customer Auth Group'
	main.CustomerAuthorizationGroup,
	
	@EndUserText.label: 'Sold Material'
	@ObjectModel.foreignKey.association: '_SoldMaterial'
	main.SoldMaterial,
	
	@EndUserText.label: 'Bill-To Party'
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
	
	@EndUserText.label: 'Cost Center Activity Type'
	@ObjectModel.foreignKey.association: '_CostCtrActivityType'
	main.CostCtrActivityType,
	
	@EndUserText.label: 'Customer'
	@ObjectModel.foreignKey.association: '_Customer'
	main.Customer,
	
	@EndUserText.label: 'Customer Account Group'
	@ObjectModel.foreignKey.association: '_CustomerAccountGroup'
	main.CustomerAccountGroup,
	
	@EndUserText.label: 'Supplier'
	@ObjectModel.foreignKey.association: '_Supplier'
	main.Supplier,
	
	@EndUserText.label: 'Supplier Account Group'
	@ObjectModel.foreignKey.association: '_SupplierAccountGroup'
	main.SupplierAccountGroup,
	
	@EndUserText.label: 'Supplier Auth Group'
	main.SupplierAuthorizationGroup,
	
	@EndUserText.label: 'Group Account'
	@ObjectModel.foreignKey.association: '_CorporateGroupAccount'
	main.CorporateGroupAccount,
	
	@EndUserText.label: 'Group Chart of Accounts'
	@ObjectModel.foreignKey.association: '_CorporateGroupChartOfAccounts'
	main.CorporateGroupChartOfAccounts,
	
	@EndUserText.label: 'Debit/Credit Indicator'
	@ObjectModel.foreignKey.association: '_DebitCreditCode'
	main.DebitCreditCode,
	
	@EndUserText.label: 'JE Item Text'
	main.DocumentItemText,
	
	@EndUserText.label: 'Financial Account Type'
	@ObjectModel.foreignKey.association: '_FinancialAccountType'
	main.FinancialAccountType,
	
	@EndUserText.label: 'Functional Area'
	@ObjectModel.foreignKey.association: '_FunctionalArea'
	main.FunctionalArea,
	
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
	
	@EndUserText.label: 'GL Account Group'
	@ObjectModel.foreignKey.association: '_GLAccountGroup'
	main.GLAccountGroup,
	
	@EndUserText.label: 'GL Is Balance Sheet Account'
	main.IsBalanceSheetAccount,
	
	@EndUserText.label: 'GL Is Profit Loss Account'
	main.IsProfitLossAccount,
	
	@EndUserText.label: 'GL Profit/Loss Account Type'
	main.ProfitLossAccountType,
	
	@EndUserText.label: 'Material'
	@ObjectModel.foreignKey.association: '_Material'
	main.Material,
	
	@EndUserText.label: 'Material Group'
	@ObjectModel.foreignKey.association: '_MaterialGroup'
	main.MaterialGroup,
	
	@EndUserText.label: 'Offsetting Account'
	@ObjectModel.foreignKey.association: '_OffsettingAccount'
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
	
	@EndUserText.label: 'WBS Element'
	@ObjectModel.foreignKey.association: '_WBSElement'
	main.WBSElement,
	
	@EndUserText.label: 'Project'
	@ObjectModel.foreignKey.association: '_Project'
	main.Project,
	
	@EndUserText.label: 'Trading Partner'
	@ObjectModel.foreignKey.association: '_PartnerCompany'
	main.PartnerCompany,
	
	@EndUserText.label: 'Partner Profit Center'
	@ObjectModel.foreignKey.association: '_PartnerProfitCenter'
	main.PartnerProfitCenter,
	
	@EndUserText.label: 'Partner Functional Area'
	@ObjectModel.foreignKey.association: '_PartnerFunctionalArea'
	main.PartnerFunctionalArea,
	
	@EndUserText.label: 'Trading Partner BA'
	@ObjectModel.foreignKey.association: '_PartnerBusinessArea'
	main.PartnerBusinessArea,
	
	@EndUserText.label: 'Plant'
	@ObjectModel.foreignKey.association: '_Plant'
	main.Plant,
	
	@EndUserText.label: 'Product'
	@ObjectModel.foreignKey.association: '_Product'
	main.Product,
	
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
	
	@EndUserText.label: 'Reference Document'
	main.ReferenceDocument,
	
	@EndUserText.label: 'Reference Doc Item'
	main.ReferenceDocumentItem,
	
	@EndUserText.label: 'Reference Doc Type'
	@ObjectModel.foreignKey.association: '_ReferenceDocumentType'
	main.ReferenceDocumentType,
	
	@EndUserText.label: 'Ship-To Party'
	@ObjectModel.foreignKey.association: '_ShipToParty'
	main.ShipToParty,
	
	@EndUserText.label: 'Product Sold'
	@ObjectModel.foreignKey.association: '_SoldProduct'
	main.SoldProduct,
	
	@EndUserText.label: 'Calendar Year'
	@ObjectModel.foreignKey.association: '_CalendarYear'
	main.CalendarYear,
	
	@EndUserText.label: 'Calendar Year Month'
	@ObjectModel.foreignKey.association: '_YearMonth'
	main.CalendarYearMonth,
	
	@EndUserText.label: 'Calendar Year Quarter'
	main.CalendarYearQuarter,
	
	@EndUserText.label: 'JE Doc Date'
	main.DocumentDate,
	
	@EndUserText.label: 'Posting Date'
	@ObjectModel.foreignKey.association: '_PostingDate'
	main.PostingDate,
	
	@EndUserText.label: 'Fiscal Period'
	@ObjectModel.foreignKey.association: '_FiscalPeriod'
	main.FiscalPeriod,
	
	@EndUserText.label: 'Fiscal Special Period'
	@ObjectModel.foreignKey.association: '_SpecialPeriod'
	main.SpecialPeriod,
	
	@EndUserText.label: 'Posting Period'
	@ObjectModel.foreignKey.association: '_PostingPeriod'
	main.PostingPeriod,
	
	@EndUserText.label: 'Fiscal Quarter'
	@ObjectModel.foreignKey.association: '_FiscalQuarter'
	main.FiscalQuarter,
	
	@EndUserText.label: 'Fiscal Year Period'
	@ObjectModel.foreignKey.association: '_FiscalYearPeriod'
	main.FiscalYearPeriod,
	
	@EndUserText.label: 'Posting Year Period'
	@ObjectModel.foreignKey.association: '_PostingYearPeriod'
	main.PostingYearPeriod,
	
	@EndUserText.label: 'Fiscal Year Quarter'
	@ObjectModel.foreignKey.association: '_FiscalYearQuarter'
	main.FiscalYearQuarter,
	
	@EndUserText.label: 'Fiscal Year Variant'
	@ObjectModel.foreignKey.association: '_FiscalYearVariant'
	main.FiscalYearVariant,
	
	@EndUserText.label: 'Fiscal Period End Date'
	main.FiscalPeriodEndDate,
	
	@EndUserText.label: 'Ledger Fiscal Year'
	@ObjectModel.foreignKey.association: '_LedgerFiscalYear'
	main.LedgerFiscalYear,
	
	@EndUserText.label: 'Signage'
	@ObjectModel.foreignKey.association: '_Signage'
	main.SignFactor,
	
	@EndUserText.label: 'Is Intercompany Supplier'
	@ObjectModel.foreignKey.association: '_SupplierIsIntercompany'
	main.SupplierIsIntercompany,
	
	@EndUserText.label: 'Supplier Partner Company'
	@ObjectModel.foreignKey.association: '_SupplierPartnerCompany'
	main.SupplierPartnerCompany,
	
	@EndUserText.label: 'Supplier Is Intercompany'
	@ObjectModel.foreignKey.association: '_CustomerIsIntercompany'
	main.CustomerIsIntercompany,
	
	@EndUserText.label: 'Customer Partner Company'
	@ObjectModel.foreignKey.association: '_CustomerPartnerCompany'
	main.CustomerPartnerCompany,
	
	@EndUserText.label: 'Title'
	main.Title,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amt in TC'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.AmountInTransactionCurrency,
	
	@DefaultAggregation: #SUM
	@EnduserText.label: 'End Bal Amt in TC'
	@Semantics.amount.currencyCode: 'TransactionCurrency'
	main.EndingBalanceAmtInTransCrcy,
	
	@EndUserText.label: 'Transaction Currency'
	main.TransactionCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amt in LC'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.AmountInCompanyCodeCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'End Bal Amt in LC'
	@Semantics.amount.currencyCode: 'CompanyCodeCurrency'
	main.EndingBalanceAmtInCoCodeCrcy,
	
	@EndUserText.label: 'Local Currency'
	main.CompanyCodeCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Amt in GC'
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	main.AmountInGlobalCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'End Bal Amt in GC'
	@Semantics.amount.currencyCode: 'GlobalCurrency'
	main.EndingBalanceAmtInGlobalCrcy,
	
	@EndUserText.label: 'Group Currency'
	main.GlobalCurrency,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Valuation quantity'
	@Semantics.quantity.unitOfMeasure: 'CostSourceUnit'
	main.ValuationQuantity,
	
	@EndUserText.label: 'Cost Source Unit'
	main.CostSourceUnit,
	
	@DefaultAggregation: #SUM
	@EndUserText.label: 'Number of Rows'
	cast (1 as abap.dec (12, 0)) as NumberOfRows,
	_AccountingDocCreatedByUser,
	_AccountingDocumentCategory,
	_AccountingDocumentItem,
	_AccountingDocumentType,
	_AssetTransactionType,
	_BillToParty,
	_BusinessArea,
	_BusinessTransactionType,
	_CalendarYear,
	_ChartOfAccounts,
	_ClearingAccountingDocument,
	_ClearingFiscalYear,
	_CompanyCode,
	_ControllingArea,
	_CorporateGroupAccount,
	_CorporateGroupChartOfAccounts,
	_CostCenter,
	_CostCtrActivityType,
	_Customer,
	_CustomerAccountGroup,
	_CustomerGroup,
	_CustomerIsIntercompany,
	_CustomerPartnerCompany,
	_DebitCreditCode,
	_DistributionChannel,
	_FinancialAccountType,
	_FinancialTransactionType,
	_FiscalPeriod,
	_FiscalQuarter,
	_FiscalYear,
	_FiscalYearPeriod,
	_FiscalYearQuarter,
	_FiscalYearVariant,
	_FunctionalArea,
	_GLAccount2,
	_GLAccountGroup,
	_GLAccountInChartOfAccounts,
	_GLGrp1,
	_GLGrp2,
	_GLGrp3,
	_GLGrp4,
	_GLGrp5,
	_HouseBank,
	_HouseBankAccount,
	_JournalEntry,
	_Ledger,
	_LedgerFiscalYear,
	_MasterFixedAsset,
	_Material,
	_MaterialGroup,
	_OffsettingAccount,
	_OffsettingAccountType,
	_OffsettingChartOfAccounts,
	_Order,
	_PCGrp1,
	_PCGrp2,
	_PCGrp3,
	_PCGrp4,
	_PCGrp5,
	_PCGrp6,
	_PartnerBusinessArea,
	_PartnerCompany,
	_PartnerFunctionalArea,
	_PartnerProfitCenter,
	_Plant,
	_PostingDate,
	_PostingKey,
	_PostingPeriod,
	_PostingYearPeriod,
	_Product,
	_ProfitCenter,
	_Project,
	_PurchasingDocument,
	_PurchasingDocumentItem,
	_ReferenceDocumentType,
	_ReverseDocument,
	_ReverseFiscalYear,
	_SalesOrganization,
	_ShipToParty,
	_Signage,
	_SoldMaterial,
	_SoldProduct,
	_SourceLedger,
	_SpecialGLCode,
	_SpecialPeriod,
	_Supplier,
	_SupplierAccountGroup,
	_SupplierIsIntercompany,
	_SupplierPartnerCompany,
	_WBSElement,
	_YearMonth
}