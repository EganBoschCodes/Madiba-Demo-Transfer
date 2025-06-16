@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Master data for House Bank'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'HouseBank'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_Housebank
	as select from t012 as main
	
	left outer join t012d on t012d.bukrs = main.bukrs and t012d.hbkid = main.hbkid
	
	association [1..1] to ZSNAP_F70G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
	association [1..1] to ZSNAP_F70G_DfltBusPartner as _DefaultableBP on $projection.BankCountry = _DefaultableBP.BankCountry and $projection.BankInternalID = _DefaultableBP.BankInternalID and _DefaultableBP.ValidTo >= $session.system_date and _DefaultableBP.ValidFrom <= $session.system_date
	association [1..1] to ZSNAP_F70G_RiskBusPartner as _RiskBP on $projection.BankCountry = _RiskBP.BankCountry and $projection.BankInternalID = _RiskBP.BankInternalID and _RiskBP.ValidTo >= $session.system_date and _RiskBP.ValidFrom <= $session.system_date
{
	@ObjectModel.foreignKey.association: '_CompanyCode'
	@EndUserText.label: 'Company Code'
	key main.bukrs as CompanyCode,
	
	@EndUserText.label: 'House Bank'
	key main.hbkid as HouseBank,
	
	@EndUserText.label: 'Bank Country/Region'
	main.banks as BankCountry,
	
	@EndUserText.label: 'Bank Key'
	main.bankl as BankInternalID,
	
	@EndUserText.label: 'Telephone 1'
	main.telf1 as PhoneNumber1,
	
	@EndUserText.label: 'Tax Number 1'
	main.stcd1 as TaxID1,
	
	@EndUserText.label: 'Contact Person'
	main.name1 as ContactPersonName,
	
	@EndUserText.label: 'Language Key'
	main.spras as Language,
	
	@EndUserText.label: 'Business Place'
	main.bupla as BusinessPlace,
	
	@EndUserText.label: 'Edi Partner Number'
	t012d.edipn as EDIPartner,
	
	@EndUserText.label: 'Type Of Signature'
	t012d.edisn as EDISignatureType,
	
	@EndUserText.label: 'Alternative Bank Id'
	t012d.dtbid as DataMediumExchangeBank,
	
	@EndUserText.label: 'Bank Receiving Dme'
	t012d.dtelz as DataMediumReceivingBank,
	
	@EndUserText.label: 'Customer Number At House Bank'
	t012d.dtkid as CustomerByHouseBank,
	
	@EndUserText.label: 'Bank Control Key'
	t012d.dtgko as BankControlKey,
	
	@API.element.releaseState: #DEPRECATED
	@API.element.successor: 'DataExchangeInstructionKey'
	@EndUserText.label: 'Instruction Key'
	t012d.dtaws as DataExchangeInstruction,
	
	@EndUserText.label: 'Lead Days For Date Of Execution'
	t012d.dtvta as ExecutionLeadDays,
	
	@EndUserText.label: 'Create Central Bank Report'
	t012d.dtxbb as CentralBankReportIsRequired,
	
	@EndUserText.label: 'Area Number'
	t012d.dtlbe as RegionByCentralBank,
	
	@EndUserText.label: 'Forward Pay. Data'
	t012d.dtxms as PaymentIsForwardedToCentralBk,
	
	@EndUserText.label: 'Iso Curr. Code For Charge Acct'
	t012d.dtgis as ChargeAccountCurrencyISOCode,
	
	@EndUserText.label: 'Account Number'
	t012d.dtgbk as ChargeAccount,
	
	@EndUserText.label: 'Charge Account Bank Number'
	t012d.dtglz as ChargeAccountBank,
	
	@EndUserText.label: 'Company Number'
	t012d.dtfin as OrderingCompanyByBank,
	
	@EndUserText.label: 'Valid To'
	_DefaultableBP.ValidTo as DefaultPartnerValidToDate,
	
	@EndUserText.label: 'Valid From'
	_DefaultableBP.ValidFrom as DefaultPartnerValidFromDate,
	
	@EndUserText.label: 'Business Partner'
	_DefaultableBP.BusinessPartnerNumber as DefaultPartnerNo,
	
	@EndUserText.label: 'Valid To'
	_RiskBP.ValidTo as RiskPartnerValidToDate,
	
	@EndUserText.label: 'Valid From'
	_RiskBP.ValidFrom as RiskPartnerValidFromDate,
	
	@EndUserText.label: 'Business Partner'
	_RiskBP.BusinessPartnerNumber as RiskPartnerNo,
	
	@EndUserText.label: 'Instruction Key'
	t012d.dtaws as DataExchangeInstructionKey,
	_CompanyCode
}