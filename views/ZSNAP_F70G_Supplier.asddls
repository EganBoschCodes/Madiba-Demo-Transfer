@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Supplier'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Supplier'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F70G_Supplier
	as select from lfa1 as main
{
	@Consumption.labelElement: 'SupplierName'
	@ObjectModel.text.element: ['SupplierName']
	@EndUserText.label: 'Supplier'
	key cast (main.lifnr as lifnr preserving type) as Supplier,
	
	@EndUserText.label: 'Is Intercompany Flag'
	case
		when main.ktokk = '' then 'X'
	end as IsIntercompany,
	
	@EndUserText.label: 'Account Group'
	main.ktokk as SupplierAccountGroup,
	
	@Semantics.text: true
	@EndUserText.label: 'Name of Supplier'
	cast (substring (rtrim (replace (concat (main.name1, concat (' &@', main.name2)), '&@', ''), ' '), 1, 80) as md_supplier_name) as SupplierName,
	
	@EndUserText.label: 'Supplier Name'
	cast (concat (concat (concat (concat (concat (concat_with_space (main.anred, main.name1, 1), main.name2), main.name3), main.name4), '/'), concat_with_space (main.pstlz, main.ort01, 1)) as md_supplier_full_name) as SupplierFullName,
	
	@EndUserText.label: 'Business Purpose Completed Flag'
	main.cvp_xblck as IsBusinessPurposeCompleted,
	
	@EndUserText.label: 'Created By'
	main.ernam as CreatedByUser,
	
	@EndUserText.label: 'Created On'
	main.erdat as CreationDate,
	
	@EndUserText.label: 'One-Time Account'
	main.xcpdk as IsOneTimeAccount,
	
	@EndUserText.label: 'Authorization Group'
	main.begru as AuthorizationGroup,
	
	@EndUserText.label: 'Vat Registration No.'
	main.stceg as VATRegistration,
	
	@API.element.releaseState: #DEPRECATED
	@API.element.successor: 'PostingIsBlocked'
	@EndUserText.label: 'Posting Block(Deprecated)'
	main.sperr as AccountIsBlockedForPosting,
	
	@EndUserText.label: 'Tax Jurisdiction'
	main.txjcd as TaxJurisdiction,
	
	@EndUserText.label: 'Scac'
	main.scacd as SupplierStandardCarrierAccess,
	
	@EndUserText.label: 'Carrier Freight Grp'
	main.sfrgr as SupplierFwdAgentFreightGroup,
	
	@EndUserText.label: 'Servagntprocgrp'
	main.dlgrp as SupplierAgentProcedureGroup,
	
	@EndUserText.label: 'Social Insurance'
	main.regss as SupplIsSocialInsuranceRegtrd,
	
	@EndUserText.label: 'Social Ins. Code'
	main.actss as SocialInsuranceActivityCode,
	
	@EndUserText.label: 'Group Key'
	main.konzs as SupplierCorporateGroup,
	
	@EndUserText.label: 'Customer'
	main.kunnr as Customer,
	
	@EndUserText.label: 'Industry'
	main.brsch as Industry,
	
	@EndUserText.label: 'Tax Number 1'
	main.stcd1 as TaxNumber1,
	
	@EndUserText.label: 'Tax Number 2'
	main.stcd2 as TaxNumber2,
	
	@EndUserText.label: 'Tax Number 3'
	main.stcd3 as TaxNumber3,
	
	@EndUserText.label: 'Tax Number 4'
	main.stcd4 as TaxNumber4,
	
	@EndUserText.label: 'Tax Number 5'
	main.stcd5 as TaxNumber5,
	
	@EndUserText.label: 'Tax Number 6'
	main.stcd6 as TaxNumber6,
	
	@EndUserText.label: 'Central Posting Block'
	main.sperr as PostingIsBlocked,
	
	@EndUserText.label: 'Purch. Block'
	main.sperm as PurchasingIsBlocked,
	
	@EndUserText.quickInfo: 'International Location Number (Part 1)'
	@EndUserText.label: 'Int. Location No. 1'
	main.bbbnr as InternationalLocationNumber1,
	
	@EndUserText.quickInfo: 'International Location Number (Part 2)'
	@EndUserText.label: 'Int. Location No. 2'
	main.bbsnr as InternationalLocationNumber2,
	
	@EndUserText.label: 'Check Digit'
	main.bubkz as InternationalLocationNumber3,
	
	@EndUserText.label: 'Address'
	main.adrnr as AddressID,
	
	@EndUserText.label: 'Region'
	main.regio as Region,
	
	@EndUserText.label: 'Name'
	main.name1 as OrganizationBPName1,
	
	@EndUserText.label: 'Name 2'
	main.name2 as OrganizationBPName2,
	
	@EndUserText.label: 'City'
	main.ort01 as CityName,
	
	@EndUserText.label: 'Postal Code'
	main.pstlz as PostalCode,
	
	@EndUserText.label: 'Street'
	main.stras as StreetName,
	
	@EndUserText.label: 'Country/Region Key'
	main.land1 as Country,
	
	@EndUserText.label: 'International Location No.'
	cast (concat (concat (main.bbbnr, concat (' & ', main.bbsnr)), concat (' & ', main.bubkz)) as md_international_loc) as ConcatenatedInternationalLocNo,
	
	@EndUserText.label: 'Block Function'
	main.sperq as SupplierProcurementBlock,
	
	@EndUserText.label: 'Actual Qm System'
	main.qssys as SuplrQualityManagementSystem,
	
	@EndUserText.label: 'Qm System Valid To'
	main.qssysdat as SuplrQltyInProcmtCertfnValidTo,
	
	@EndUserText.label: 'Language Key'
	main.spras as SupplierLanguage,
	
	@EndUserText.label: 'Alternative Payee'
	main.lnrza as AlternativePayeeAccountNumber,
	
	@EndUserText.label: 'Telephone 1'
	main.telf1 as PhoneNumber1,
	
	@EndUserText.label: 'Fax Number'
	main.telfx as FaxNumber,
	
	@EndUserText.label: 'Natural Person'
	main.stkzn as IsNaturalPerson,
	
	@EndUserText.label: 'Tax Number At Responsible Tax Authority'
	main.stenr as TaxNumberResponsible,
	
	@EndUserText.label: 'Business Type'
	main.categ as UK_ContractorBusinessType,
	
	@EndUserText.label: 'Prtnrs Trading Name'
	main.partner_name as UK_PartnerTradingName,
	
	@EndUserText.label: 'Partners Utr'
	main.partner_utr as UK_PartnerTaxReference,
	
	@EndUserText.label: 'Verification Status'
	main.status as UK_VerificationStatus,
	
	@EndUserText.label: 'Verification Number'
	main.vfnum as UK_VerificationNumber,
	
	@EndUserText.label: 'Companies House Registration Number'
	main.crn as UK_CompanyRegistrationNumber,
	
	@EndUserText.label: 'Tax Status'
	main.vfnid as UK_VerifiedTaxStatus,
	
	@EndUserText.label: 'Title'
	main.anred as FormOfAddress,
	
	@EndUserText.label: 'Reference Acct Group'
	main.ktock as ReferenceAccountGroup,
	
	@EndUserText.label: 'Liable For Vat'
	main.stkzu as VATLiability,
	
	@EndUserText.label: 'Tax Type'
	main.fityp as ResponsibleType,
	
	@EndUserText.label: 'Tax Number Type'
	main.stcdt as TaxNumberType,
	
	@EndUserText.label: 'Fiscal Address'
	main.fiskn as FiscalAddress,
	
	@EndUserText.label: 'Type Of Business'
	main.j_1kftbus as BusinessType,
	
	@EndUserText.label: 'Date Of Birth'
	main.gbdat as BirthDate,
	
	@EndUserText.label: 'Payment Block'
	main.sperz as PaymentIsBlockedForSupplier,
	
	@EndUserText.label: 'Search Term'
	main.sortl as SortField,
	
	@EndUserText.label: 'Telephone 2'
	main.telf2 as PhoneNumber2,
	
	@EndUserText.label: 'Central Deletion Flag'
	main.loevm as DeletionIndicator,
	
	@EndUserText.label: 'Name Of Representative'
	main.j_1kfrepre as TaxInvoiceRepresentativeName,
	
	@EndUserText.label: 'Type Of Industry'
	main.j_1kftind as IndustryType,
	
	@EndUserText.label: 'Gst Vendor Classification'
	main.ven_class as IN_GSTSupplierClassification,
	
	@EndUserText.label: 'Relevant For Pod'
	main.podkzb as SuplrProofOfDelivRlvtCode,
	
	@EndUserText.label: 'Trading Partner No.'
	main.vbund as TradingPartner,
	
	@EndUserText.label: 'Tax Split'
	main.ipisp as BR_TaxIsSplit,
	
	@EndUserText.label: 'Enterprise In Au'
	main.au_carrying_ent as AU_PayerIsPayingToCarryOnEnt,
	
	@EndUserText.label: 'Individual Under 18'
	main.au_ind_under_18 as AU_IndividualIsUnder18,
	
	@EndUserText.label: 'Payment Does not Exc'
	main.au_payment_not_exceed_75 as AU_PaymentIsExceeding75,
	
	@EndUserText.label: 'Wholly Input Taxed'
	main.au_wholly_inp_taxed as AU_PaymentIsWhollyInputTaxed,
	
	@EndUserText.label: 'Individual w/o Gain'
	main.au_partner_without_gain as AU_PartnerIsSupplyWithoutGain,
	
	@EndUserText.label: 'The Supplier Is Not Entitled To An Abn'
	main.au_not_entitled_abn as AU_SupplierIsEntitledToABN,
	
	@EndUserText.label: 'The Whole Of The Payment Is Exempt Incom'
	main.au_payment_exempt as AU_PaymentIsIncomeExempted,
	
	@EndUserText.label: 'An Activity Done As A Private Recreation'
	main.au_private_hobby as AU_SupplyIsMadeAsPrivateHobby,
	
	@EndUserText.label: 'Wholly Of A Private Or Domestic Nature'
	main.au_domestic_nature as AU_SupplyMadeIsOfDmstcNature,
	
	@EndUserText.label: 'Origin Acceptance'
	main.weora as IsToBeAcceptedAtOrigin,
	cast (main.stkza as xfeld preserving type) as BPIsEqualizationTaxSubject,
	
	@EndUserText.label: 'Tax Base'
	main.taxbs as BRSpcfcTaxBasePercentageCode,
	
	@EndUserText.label: 'Profession'
	main.profs as SupplierProfession,
	
	@EndUserText.label: 'Ext. Manufacturer'
	main.emnfr as SuplrManufacturerExternalName,
	
	@EndUserText.label: 'Dme Recipient Code'
	main.dtams as DataMediumExchangeIndicator,
	
	@EndUserText.label: 'Instruction Key'
	main.dtaws as DataExchangeInstructionKey,
	
	@EndUserText.label: 'VSR Relevant'
	main.ltsna as SupplierIsSubRangeRelevant,
	
	@EndUserText.label: 'Train Station'
	main.bahns as TrainStationName,
	
	@EndUserText.label: 'Payee In Document'
	main.xzemp as AlternativePayeeIsAllowed,
	
	@EndUserText.label: 'Pbc/Isr Number'
	main.esrnr as PaytSlipWthRefSubscriber,
	
	@EndUserText.label: 'Stat. Grp, Agent'
	main.stgdl as TranspServiceAgentStstcGrp,
	
	@EndUserText.label: 'Plant Level Relevant'
	main.werkr as SupplierIsPlantRelevant,
	
	@EndUserText.label: 'Tax Office Responsible'
	main.fisku as SuplrTaxAuthorityAccountNumber,
	
	@Semantics.booleanIndicator: true
	@EndUserText.label: 'Carrier Confirmation Expected'
	main.carrier_conf as SuplrCarrierConfirmIsExpected,
	
	@EndUserText.label: 'Plant'
	main.werks as SupplierPlant,
	
	@EndUserText.label: 'Factory Calendar'
	main.plkal as FactoryCalendar,
	
	@EndUserText.label: 'Payment Reason'
	main.paytrsn as PaymentReason,
	
	@EndUserText.label: 'Central Del. Block'
	main.nodel as SupplierCentralDeletionIsBlock,
	
	@EndUserText.label: 'Transportation Chain'
	main.transport_chain as SupplierTransportationChain,
	
	@EndUserText.label: 'Staging Time'
	main.staging_time as SupplierStagingTimeInDays,
	
	@EndUserText.label: 'Scheduling Procedure'
	main.scheduling_type as SupplierSchedulingProcedure,
	
	@EndUserText.label: 'Cd: Relevant For Collective Numbering'
	main.submi_relevant as CollectiveNumberingIsRelevant,
	
	@EndUserText.label: 'Permanent Account Number'
	main.j_1ipanno as BusinessPartnerPanNumber,
	
	@EndUserText.label: 'Pan Reference Number'
	main.j_1ipanref as BPPanReferenceNumber,
	
	@EndUserText.label: 'Pan Valid From Date'
	main.j_1ipanvaldt as BPPanValidFromDate
}