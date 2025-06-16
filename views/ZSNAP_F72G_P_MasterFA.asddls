@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F72G_P_MasterFA
	as select from anlh as root
{
	key root.bukrs as CompanyCode,
	key root.anln1 as MasterFixedAsset,
	root.anlhtxt as MasterFixedAssetDescription,
	root.luntn as LastSubNumberAssigned,
	root.lanep as LastLineItemAssigned,
	root.anupd as TableChangeTypeIndicator,
	root.funtn as FirstSubNumberAssigned,
	cast ('CLASSIC' as faa_authcntxt) as AssetAuthorizationContext
}