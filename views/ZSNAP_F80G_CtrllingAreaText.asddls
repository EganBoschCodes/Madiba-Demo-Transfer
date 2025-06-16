@EndUserText.label: 'Controlling Area Text'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'ControllingArea'

define view entity ZSNAP_F80G_CtrllingAreaText
	as select from tka01 as main
{
	@ObjectModel.text.element: ['ControllingAreaName']
	key cast (main.kokrs as fis_kokrs preserving type) as ControllingArea,
	
	@Semantics.text: true
	cast (main.bezei as fis_kokrs_name preserving type) as ControllingAreaName
}