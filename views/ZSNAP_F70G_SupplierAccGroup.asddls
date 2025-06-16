@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Supplier Account Group'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'SupplierAccountGroup'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_SupplierAccGroup
	as select from t077k as main
	
	association [0..*] to ZSNAP_F70G_SuppAccGroupText as _SupplierAccountGroupText on $projection.SupplierAccountGroup = _SupplierAccountGroupText.SupplierAccountGroup
{
	@ObjectModel.text.association: '_SupplierAccountGroupText'
	@EndUserText.label: 'Account Group'
	key main.ktokk as SupplierAccountGroup,
	
	@EndUserText.label: 'Partner Schema: Purch. Org.'
	main.parge as BPSchemaPurgOrganizationLevel,
	_SupplierAccountGroupText
}