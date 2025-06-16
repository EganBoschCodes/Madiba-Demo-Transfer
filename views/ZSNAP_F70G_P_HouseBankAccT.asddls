@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F70G_P_HouseBankAccT
	as select from fclm_bam_aclink2 as hba
	
	inner join fclm_bam_amd_t as acctxt on acctxt.acc_id = hba.acc_id and acctxt.revision = '0000'
	inner join fclm_bam_amd as acc on acc.acc_id = hba.acc_id and acc.revision = '0000'
{
	acctxt.langu as spras,
	hba.bukrs,
	hba.hbkid,
	hba.hktid,
	cast (substring (acctxt.description, 1, 50) as fclm_bam_description) as text1
}
where hba.herku = ''
	and acctxt.deleted_flag = ''
	and hba.hbkid <> ''
	and hba.hktid <> ''
	and (acc.status = '02' or acc.status = '09' or acc.status = '10' or acc.status = '11' or acc.status = '15')
	and hba.revision = '0000'
	and hba.is_reused != 'X'