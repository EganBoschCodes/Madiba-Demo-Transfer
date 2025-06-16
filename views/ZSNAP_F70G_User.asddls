@AccessControl.authorizationCheck: #PRIVILEGED_ONLY
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'User'
@ObjectModel.representativeKey: 'UserID'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F70G_User
	as select from usr21 as main
{
	@ObjectModel.text.element: ['UserDescription']
	@EndUserText.label: 'User ID'
	key cast (main.bname as vdm_userid preserving type) as UserID,
	
	@Semantics.text: true
	@EndUserText.label: 'Description'
	cast (main.techdesc as vdm_userdescription preserving type) as UserDescription,
	
	@Consumption.hidden: true
	@EndUserText.label: 'Business Partner Guid'
	main.bpperson as BusinessPartnerUUID,
	
	@EndUserText.label: 'Identity Add. Type'
	case main.idadtype
		when '00' then ' '
		when '02' then ' '
		when '03' then ' '
		when '04' then ' '
		else 'X'
	end as IsTechnicalUser
}