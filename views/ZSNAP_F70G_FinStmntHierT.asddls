@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Financial Statement Hierarchy - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'FinancialStatementHierarchy'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #C
@ObjectModel.usageType.sizeCategory: #L

define view entity ZSNAP_F70G_FinStmntHierT
	as select from hrrp_directoryt as main
{
	key main.hryid as FinancialStatementHierarchy,
	
	@Semantics.businessDate.to: true
	key main.hryvalto as ValidityEndDate,
	
	@Semantics.language: true
	key main.spras as Language,
	
	@Semantics.businessDate.from: true
	main.hryvalfrom as ValidityStartDate,
	
	@EndUserText.label: 'Financial Statement Description'
	@Semantics.text: true
	main.hrytxt as FinancialStmntHierarchyName
}
where (not main.hryid like '0109/%' and not main.hryid like '0102/%' and not main.hryid like 'H109/%')
	and main.spras = $session.system_language