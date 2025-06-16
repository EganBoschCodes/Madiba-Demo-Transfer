@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: Single Row Selection'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F80G_SingleRow
	as select from ZSNAP_F80G_SAPClient as main
{
	key '' as Blank
}