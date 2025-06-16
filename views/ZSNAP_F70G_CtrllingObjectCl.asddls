@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Controlling Object Class'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ControllingObjectClass'
@ObjectModel.usageType.dataClass: #META
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_CtrllingObjectCl
	as select from dd07l as main
	
	association [1..*] to ZSNAP_F70G_CtrllingObjClT as _Text on $projection.ControllingObjectClass = _Text.ControllingObjectClass
{
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Lower Value'
	key substring (main.domvalue_l, 1, 2) as ControllingObjectClass,
	_Text
}
where main.domname = 'SCOPE_CV'
	and main.as4local = 'A'