@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Posting Key - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'PostingKey'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F01G_PostingKeyText
	as select from tbslt as main
{
	@Semantics.language
	key main.spras as Language,
	key cast (main.bschl as fis_bschl preserving type) as PostingKey,
	
	@Semantics.text
	cast (main.ltext as fis_bschl_name preserving type) as PostingKeyName
}
where (main.umskz = '')
	and main.spras = $session.system_language