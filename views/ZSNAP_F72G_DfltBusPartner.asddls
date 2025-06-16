@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bank Defaultable Business Partner'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F72G_DfltBusPartner
	as select from fclm_bnka_bp_fs as DefaultableBp
{
	key DefaultableBp.banks as BankCountry,
	key DefaultableBp.bankl as BankInternalID,
	key DefaultableBp.partner as BusinessPartnerNumber,
	key DefaultableBp.valid_to as ValidTo,
	DefaultableBp.valid_from as ValidFrom
}