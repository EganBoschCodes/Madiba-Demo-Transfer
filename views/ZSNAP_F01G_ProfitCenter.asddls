@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Profit Center'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ProfitCenter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_ProfitCenter
	as select distinct from cepc as main
	
	association [0..1] to ZSNAP_F01G_ControllingArea as _ControllingArea on $projection.ControllingArea = _ControllingArea.ControllingArea
	association [0..*] to ZSNAP_F01G_ProfitCenterText as _Text on $projection.ControllingArea = _Text.ControllingArea and $projection.ProfitCenter = _Text.ProfitCenter
{
	@ObjectModel.foreignKey.association: '_ControllingArea'
	@EndUserText.label: 'Controlling Area'
	key main.kokrs as ControllingArea,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Profit Center'
	key cast (main.prctr as prctr preserving type) as ProfitCenter,
	
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Valid To'
	key main.datbi as ValidityEndDate,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Valid From'
	main.datab as ValidityStartDate,
	
	@EndUserText.label: 'Segment'
	main.segment as Segment,
	
	@EndUserText.label: 'Department'
	main.abtei as Department,
	
	@EndUserText.label: 'Person Resp. For Pc'
	main.verak as ProfitCtrResponsiblePersonName,
	
	@EndUserText.label: 'Hierarchy Area'
	main.khinr as ProfitCenterStandardHierarchy,
	
	@EndUserText.label: 'Entered On'
	main.ersda as ProfitCenterCreationDate,
	
	@EndUserText.label: 'User Responsible'
	main.verak_user as ProfitCtrResponsibleUser,
	
	@EndUserText.label: 'Lock Indicator'
	main.lock_ind as ProfitCenterIsBlocked,
	
	@EndUserText.label: 'Title'
	main.anred as FormOfAddress,
	
	@EndUserText.label: 'Name'
	main.name1 as AddressName,
	
	@EndUserText.label: 'Name 2'
	main.name2 as AdditionalName,
	
	@EndUserText.label: 'Name 3'
	main.name3 as ProfitCenterAddrName3,
	
	@EndUserText.label: 'Name 4'
	main.name4 as ProfitCenterAddrName4,
	
	@EndUserText.label: 'Street'
	main.stras as StreetAddressName,
	
	@EndUserText.label: 'Po Box'
	main.pfach as POBox,
	
	@EndUserText.label: 'City'
	main.ort01 as CityName,
	
	@EndUserText.label: 'Postal Code'
	main.pstlz as PostalCode,
	
	@EndUserText.label: 'P.O. Box Postal Code'
	main.pstl2 as POBoxPostalCode,
	
	@EndUserText.label: 'District'
	main.ort02 as District,
	
	@EndUserText.label: 'Country/Region Key'
	main.land1 as Country,
	
	@EndUserText.label: 'Region'
	main.regio as Region,
	
	@EndUserText.label: 'Tax Jurisdiction'
	main.txjcd as TaxJurisdiction,
	
	@Semantics.language: true
	@EndUserText.label: 'Language Key'
	main.spras as Language,
	
	@EndUserText.label: 'Telephone 1'
	main.telf1 as PhoneNumber1,
	
	@EndUserText.label: 'Telephone 2'
	main.telf2 as PhoneNumber2,
	
	@EndUserText.label: 'Telebox Number'
	main.telbx as TeleboxNumber,
	
	@EndUserText.label: 'Telex Number'
	main.telx1 as TelexNumber,
	
	@EndUserText.label: 'Fax Number'
	main.telfx as FaxNumber,
	
	@EndUserText.label: 'Teletex Number'
	main.teltx as TeletexNumber,
	
	@EndUserText.label: 'Data Line'
	main.datlt as DataCommunicationPhoneNumber,
	
	@EndUserText.label: 'Printer Name'
	main.drnam as ProfitCenterPrinterName,
	
	@EndUserText.label: 'Created By'
	main.usnam as ProfitCenterCreatedByUser,
	
	@EndUserText.label: 'Company Code'
	main.bukrs as CompanyCode,
	
	@EndUserText.label: 'Prctr Formula Planning Template'
	main.pca_template as FormulaPlanningTemplate,
	_ControllingArea,
	_Text
}