@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Master Fixed Asset'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MasterFixedAsset'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F70G_MasterFixedAsset
	as select from ZSNAP_F70G_P_MasterFA as main
	
	association [0..1] to ZSNAP_F70G_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
{
	@EndUserText.label: 'Company Code'
	@ObjectModel.foreignKey.association: '_CompanyCode'
	key main.CompanyCode,
	
	@EndUserText.label: 'Master Fixed Asset'
	@ObjectModel.text.element: ['MasterFixedAssetDescription']
	key main.MasterFixedAsset,
	
	@EndUserText.label: 'Master Fixed Asset Description'
	@Semantics.text: true
	main.MasterFixedAssetDescription,
	
	@EndUserText.label: 'Last Sub Number Assigned'
	main.LastSubNumberAssigned,
	
	@EndUserText.label: 'Last Line Item Assigned'
	main.LastLineItemAssigned,
	
	@EndUserText.label: 'Table Change Type Indicator'
	main.TableChangeTypeIndicator,
	
	@EndUserText.label: 'First Sub Number Assigned'
	main.FirstSubNumberAssigned,
	
	@Consumption.hidden: true
	@EndUserText.label: 'Asset Authorization Context'
	main.AssetAuthorizationContext,
	_CompanyCode
}