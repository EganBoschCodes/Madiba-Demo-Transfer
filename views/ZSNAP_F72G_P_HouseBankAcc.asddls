@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F72G_P_HouseBankAcc
	as select from fclm_bam_aclink2 as hba
	
	inner join fclm_bam_amd as acc on acc.acc_id = hba.acc_id and acc.revision = '0000'
	left outer join t012k on hba.bukrs = t012k.bukrs and hba.hbkid = t012k.hbkid and hba.hktid = t012k.hktid
{
	hba.bukrs,
	hba.hbkid,
	hba.hktid,
	hba.bankn,
	acc.waers,
	hba.hkont,
	hba.acc_id,
	hba.cash_pooling_flag,
	hba.bank_account_auth_group,
	acc.acc_num
}
where hba.herku = ''
	and hba.hbkid <> ''
	and hba.hktid <> ''
	and acc.deleted_flag = ''
	and (acc.status = '02' or acc.status = '09' or acc.status = '10' or acc.status = '11' or acc.status = '15')
	and hba.is_reused = ''
	and hba.revision = '0000'