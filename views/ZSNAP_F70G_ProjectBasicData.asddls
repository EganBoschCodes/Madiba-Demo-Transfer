@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Project Basic Data'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_ProjectBasicData
	as select from proj as main
{
	key cast (main.pspnr as ps_s4_proj_pspnr preserving type) as ProjectInternalID,
	main.pspid as Project,
	main.profl as ProjectProfileCode
}