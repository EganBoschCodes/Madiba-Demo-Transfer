@AccessControl.authorizationCheck: #PRIVILEGED_ONLY
@EndUserText.label: 'SD Document Partner'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F70G_SDDocPartner
	as select from ZSNAP_F70G_P_SDDocCmpltP_B2 as main
{
	key main.SDDocument,
	key main.PartnerFunction,
	main.Customer
}
where main.SDDocumentItem = '000000'