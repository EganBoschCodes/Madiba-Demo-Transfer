@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Customer'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Customer'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F70G_Customer
	as select from kna1 as main
{
	@ObjectModel.text.element: ['CustomerName']
	@EndUserText.label: 'Customer'
	key cast (main.kunnr as kunnr) as Customer,
	
	@EndUserText.label: 'Is Intercompany Flag'
	case
		when main.ktokd = '' then 'X'
	end as IsIntercompany,
	
	@Semantics.text: true
	@EndUserText.label: 'Name of Customer'
	cast (substring (rtrim (replace (concat (main.name1, concat (' &@', main.name2)), '&@', ''), ' '), 1, 80) as md_customer_name) as CustomerName,
	
	@EndUserText.label: 'Customer Name'
	cast (concat (concat (concat (concat (concat (concat_with_space (main.anred, main.name1, 1), main.name2), main.name3), main.name4), '/'), concat_with_space (main.pstlz, main.ort01, 1)) as md_customer_full_name) as CustomerFullName,
	
	@EndUserText.label: 'Created By'
	main.ernam as CreatedByUser,
	
	@EndUserText.label: 'Created On'
	main.erdat as CreationDate,
	
	@EndUserText.label: 'Address'
	main.adrnr as AddressID,
	
	@EndUserText.label: 'Customer Classific.'
	main.kukla as CustomerClassification,
	
	@EndUserText.label: 'Vat Registration No.'
	main.stceg as VATRegistration,
	
	@EndUserText.label: 'Account Group'
	main.ktokd as CustomerAccountGroup,
	
	@EndUserText.label: 'Authorization Group'
	main.begru as AuthorizationGroup,
	
	@EndUserText.label: 'Central Delivery Block'
	main.lifsd as DeliveryIsBlocked,
	
	@EndUserText.label: 'Central Posting Block'
	main.sperr as PostingIsBlocked,
	
	@EndUserText.label: 'Central Billing Block'
	main.faksd as BillingIsBlockedForCustomer,
	
	@EndUserText.label: 'Central Order Block'
	main.aufsd as OrderIsBlockedForCustomer,
	
	@EndUserText.label: 'Int. Location No. 1'
	main.bbbnr as InternationalLocationNumber1,
	
	@EndUserText.label: 'One-Time Account'
	main.xcpdk as IsOneTimeAccount,
	
	@EndUserText.label: 'Tax Jurisdiction'
	main.txjcd as TaxJurisdiction,
	
	@EndUserText.label: 'Industry'
	main.brsch as Industry,
	
	@EndUserText.label: 'Tax Number Type'
	main.stcdt as TaxNumberType,
	
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
	
	@EndUserText.label: 'Group Key'
	main.konzs as CustomerCorporateGroup,
	
	@EndUserText.label: 'Supplier'
	main.lifnr as Supplier,
	
	@EndUserText.label: 'Nielsen Indicator'
	main.niels as NielsenRegion,
	
	@EndUserText.label: 'Industry Code 1'
	main.bran1 as IndustryCode1,
	
	@EndUserText.label: 'Industry Code 2'
	main.bran2 as IndustryCode2,
	
	@EndUserText.label: 'Industry Code 3'
	main.bran3 as IndustryCode3,
	
	@EndUserText.label: 'Industry Code 4'
	main.bran4 as IndustryCode4,
	
	@EndUserText.label: 'Industry Code 5'
	main.bran5 as IndustryCode5,
	
	@EndUserText.label: 'Country/Region Key'
	main.land1 as Country,
	
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
	
	@EndUserText.label: 'Search Term'
	main.sortl as SortField,
	
	@EndUserText.label: 'Fax Number'
	main.telfx as FaxNumber,
	
	@EndUserText.label: 'Suframa Code'
	main.suframa as BR_SUFRAMACode,
	
	@EndUserText.label: 'Region'
	main.regio as Region,
	
	@EndUserText.label: 'Telephone 1'
	main.telf1 as TelephoneNumber1,
	
	@EndUserText.label: 'Telephone 2'
	main.telf2 as TelephoneNumber2,
	
	@EndUserText.label: 'Alternative Payer'
	main.knrza as AlternativePayerAccount,
	
	@EndUserText.label: 'Dme Recipient Code'
	main.dtams as DataMediumExchangeIndicator,
	
	@EndUserText.label: 'Liable For Vat'
	main.stkzu as VATLiability,
	
	@EndUserText.label: 'Business Purpose Completed Flag'
	main.cvp_xblck as IsBusinessPurposeCompleted,
	
	@EndUserText.label: 'Tax Type'
	main.fityp as ResponsibleType,
	
	@EndUserText.label: 'Fiscal Address'
	main.fiskn as FiscalAddress,
	
	@EndUserText.label: 'Natural Person'
	main.stkzn as NFPartnerIsNaturalPerson,
	
	@EndUserText.label: 'Central Deletion Flag'
	main.loevm as DeletionIndicator,
	
	@EndUserText.label: 'Language Key'
	main.spras as Language,
	
	@EndUserText.label: 'Trading Partner No.'
	main.vbund as TradingPartner,
	
	@EndUserText.label: 'Delivery Date Rule'
	main.delivery_date_rule as DeliveryDateTypeRule,
	
	@EndUserText.label: 'Express Station'
	main.bahne as ExpressTrainStationName,
	
	@EndUserText.label: 'Train Station'
	main.bahns as TrainStationName,
	
	@EndUserText.label: 'Int. Location No. 2'
	main.bbsnr as InternationalLocationNumber2,
	
	@EndUserText.label: 'Check Digit'
	main.bubkz as InternationalLocationNumber3,
	
	@EndUserText.label: 'City Code'
	main.cityc as CityCode,
	
	@EndUserText.label: 'County Code'
	main.counc as County,
	
	@EndUserText.label: 'Unloading Points'
	main.exabl as CustomerHasUnloadingPoint,
	
	@EndUserText.label: 'Working Times'
	main.knazk as CustomerWorkingTimeCalendar,
	
	@EndUserText.label: 'Competitors'
	main.dear1 as IsCompetitor,
	
	@EndUserText.label: 'Name Of Representative'
	main.j_1kfrepre as TaxInvoiceRepresentativeName,
	
	@EndUserText.label: 'Type Of Business'
	main.j_1kftbus as BusinessType,
	
	@EndUserText.label: 'Type Of Industry'
	main.j_1kftind as IndustryType,
	
	@EndUserText.label: 'Consolidated Invoicing'
	main.consolidate_invoice as TW_CollvBillingIsSupported,
	
	@EndUserText.label: 'Alt.Payer In Doc?'
	main.xzemp as AlternativePayeeIsAllowed,
	
	@EndUserText.label: 'Attribute 1'
	main.katr1 as FreeDefinedAttribute01,
	
	@EndUserText.label: 'Attribute 2'
	main.katr2 as FreeDefinedAttribute02,
	
	@EndUserText.label: 'Attribute 3'
	main.katr3 as FreeDefinedAttribute03,
	
	@EndUserText.label: 'Attribute 4'
	main.katr4 as FreeDefinedAttribute04,
	
	@EndUserText.label: 'Attribute 5'
	main.katr5 as FreeDefinedAttribute05,
	
	@EndUserText.label: 'Attribute 6'
	main.katr6 as FreeDefinedAttribute06,
	
	@EndUserText.label: 'Attribute 7'
	main.katr7 as FreeDefinedAttribute07,
	
	@EndUserText.label: 'Attribute 8'
	main.katr8 as FreeDefinedAttribute08,
	
	@EndUserText.label: 'Attribute 9'
	main.katr9 as FreeDefinedAttribute09,
	
	@EndUserText.label: 'Attribute 10'
	main.katr10 as FreeDefinedAttribute10
}