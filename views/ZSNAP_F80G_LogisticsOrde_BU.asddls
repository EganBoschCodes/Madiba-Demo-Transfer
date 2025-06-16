@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Logistics Order Basic'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F80G_LogisticsOrde_BU
	as select from afko as main
{
	key main.aufnr as OrderID,
	cast (main.aufpl as pph_aufpl preserving type) as OrderInternalID,
	cast (main.dispo as pph_dispo preserving type) as MRPController
}