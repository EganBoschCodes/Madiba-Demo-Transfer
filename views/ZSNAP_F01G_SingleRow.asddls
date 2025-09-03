@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SNAP: Single Row Selection'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F01G_SingleRow
	as select from ZSNAP_F01G_SAPClient as main
{
	key '' as Blank
}