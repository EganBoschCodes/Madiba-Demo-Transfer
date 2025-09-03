@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Accounting Clerk'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'AccountingClerk'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F01G_AccountingClerk
	as select from t001s as main
	
	association [0..1] to ZSNAP_F01G_CompanyCode as _Company on _Company.CompanyCode = $projection.CompanyCode
{
	@ObjectModel.foreignKey.association: '_Company'
	@EndUserText.label: 'Company Code'
	key cast (main.bukrs as fis_bukrs) as CompanyCode,
	
	@ObjectModel.text.element: ['AccountingClerkName']
	@EndUserText.label: 'Accounting Clerk'
	key cast (main.busab as farp_busab) as AccountingClerk,
	
	@Semantics.text
	@EndUserText.label: 'Accounting Clerk Name'
	cast (main.sname as farp_sname_001s) as AccountingClerkName,
	
	@EndUserText.label: 'User ID'
	cast (main.usnam as vdm_userid) as UserID,
	_Company
}