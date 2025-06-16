@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bank Risk Business Partner'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #M

define view entity ZSNAP_F72G_RiskBusPartner
	as select from fclm_bam_bnkabp2 as RiskBp
{
	key RiskBp.banks as BankCountry,
	key RiskBp.bankl as BankInternalID,
	key RiskBp.partner as BusinessPartnerNumber,
	key RiskBp.valid_to as ValidTo,
	RiskBp.valid_from as ValidFrom
}