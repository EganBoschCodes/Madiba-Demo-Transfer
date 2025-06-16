@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Controlling Object Class - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'ControllingObjectClass'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_CtrllingObjClT
	as select from dd07t as main
{
	key substring (main.domvalue_l, 1, 2) as ControllingObjectClass,
	
	@Semantics.language: true
	key main.ddlanguage as Language,
	
	@EndUserText.label: 'Controlling Object Class Name'
	@Semantics.text: true
	main.ddtext as ControllingObjectClassName
}
where (main.domname = 'SCOPE_CV' and main.as4local = 'A')
	and main.ddlanguage = $session.system_language