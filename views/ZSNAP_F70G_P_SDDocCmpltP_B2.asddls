@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'P: SD Doc Complete Partners'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #XL

define view entity ZSNAP_F70G_P_SDDocCmpltP_B2
	as select from vbpa as main
{
	key main.vbeln as SDDocument,
	key main.posnr as SDDocumentItem,
	key main.parvw as PartnerFunction,
	main.kunnr as Customer
}