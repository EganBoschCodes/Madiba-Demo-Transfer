@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true

define view entity ZSNAP_F70G_P_OffsettingAcc
	as select from ZSNAP_F70G_GLAccountInCOA as main
{
	key main.ChartOfAccounts,
	key cast (main.GLAccount as fis_gkont) as OffsettingAccount,
	key cast (cast ('S' as abap.char (1)) as farp_gkoar) as OffsettingAccountType,
	cast (main._Text.GLAccountName as fis_offsetting_acct_name) as OffsettingAccountName
}

union all select from ZSNAP_F70G_GLAccountInCOA as main
{
	key main.ChartOfAccounts,
	key cast (main.GLAccount as fis_gkont) as OffsettingAccount,
	key cast (cast ('A' as abap.char (1)) as farp_gkoar) as OffsettingAccountType,
	cast (main._Text.GLAccountName as fis_offsetting_acct_name) as OffsettingAccountName
}

union all select from ZSNAP_F70G_GLAccountInCOA as main
{
	key main.ChartOfAccounts,
	key cast (main.GLAccount as fis_gkont) as OffsettingAccount,
	key cast (cast ('M' as abap.char (1)) as farp_gkoar) as OffsettingAccountType,
	cast (main._Text.GLAccountName as fis_offsetting_acct_name) as OffsettingAccountName
}

union all select from ZSNAP_F70G_Customer as main
{
	key cast (cast ('' as abap.char (4)) as fis_ktopl) as ChartOfAccounts,
	key cast (main.Customer as fis_gkont) as OffsettingAccount,
	key cast (cast ('D' as abap.char (1)) as farp_gkoar) as OffsettingAccountType,
	cast (main.CustomerName as fis_offsetting_acct_name) as OffsettingAccountName
}

union all select from ZSNAP_F70G_Supplier as main
{
	key cast (cast ('' as abap.char (4)) as fis_ktopl) as ChartOfAccounts,
	key cast (main.Supplier as fis_gkont) as OffsettingAccount,
	key cast (cast ('K' as abap.char (1)) as farp_gkoar) as OffsettingAccountType,
	cast (main.SupplierName as fis_offsetting_acct_name) as OffsettingAccountName
}