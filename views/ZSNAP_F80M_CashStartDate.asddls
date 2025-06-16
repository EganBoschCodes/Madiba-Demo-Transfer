@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SNAP F80: Cash Start Date'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XXL

define view entity ZSNAP_F80M_CashStartDate
	as select from ZSNAP_F80G_SingleRow as main
{
	key 'C' as BindingField,
	'20200101' as CashStartDate
}