@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'G/L Account Hierarchy Node'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #HIERARCHY
@ObjectModel.representativeKey: 'HierarchyNode'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L
@Hierarchy.parentChild: [{ recurse: { parent: ['ParentNode'], child: ['HierarchyNode']}, siblingsOrder: [{ by: 'SequenceNumber', direction: #ASC }], directory: '_Hierarchy'}]

define view entity ZSNAP_F72G_GLAccHierNode
	as select from hrrp_node as main
	
	left outer to many join hrrp_attr_node on main.hryid = hrrp_attr_node.hryid and main.hryver = hrrp_attr_node.hryver and main.hryvalto = hrrp_attr_node.hryvalto and main.nodecls = hrrp_attr_node.nodecls and main.hrynode = hrrp_attr_node.hrynode and main.parnode = hrrp_attr_node.parnode and hrrp_attr_node.hryattrname = 'SIGN'
	inner join hrrp_directory on main.hryid = hrrp_directory.hryid and main.hryver = hrrp_directory.hryver and main.hryvalto = hrrp_directory.hryvalto
	
	association [0..*] to ZSNAP_F72G_GLAccHierNodeT as _Text on $projection.GLAccountHierarchy = _Text.GLAccountHierarchy and $projection.HierarchyNode = _Text.HierarchyNode and $projection.GLAccount = ''
	association [0..1] to ZSNAP_F72G_GLAccountInCOA as _GLAccountInChartOfAccounts on $projection.ChartOfAccounts = _GLAccountInChartOfAccounts.ChartOfAccounts and $projection.GLAccount = _GLAccountInChartOfAccounts.GLAccount
	association [0..1] to ZSNAP_F72G_GLAccHierarchy as _Hierarchy on $projection.GLAccountHierarchy = _Hierarchy.GLAccountHierarchy and $projection.ValidityEndDate = _Hierarchy.ValidityEndDate
{
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@ObjectModel.foreignKey.association: '_Hierarchy'
	@EndUserText.label: 'Hierarchy Id'
	key main.hryid as GLAccountHierarchy,
	
	@ObjectModel.text.association: '_Text'
	@EndUserText.label: 'Hierarchy Node'
	key main.hrynode as HierarchyNode,
	
	@Consumption.filter.mandatory: true
	@Consumption.filter.multipleSelections: false
	@Consumption.filter.selectionType: #SINGLE
	@Semantics.businessDate.to: true
	@EndUserText.label: 'Validity End Date'
	key cast (main.hryvalto as fis_datbi) as ValidityEndDate,
	
	@EndUserText.label: 'Hierarchy Parent Node'
	main.parnode as ParentNode,
	
	@EndUserText.label: 'Hierarchy Version'
	main.hryver as HierarchyVersion,
	
	@Semantics.businessDate.from: true
	@EndUserText.label: 'Validity Start Date'
	cast (main.hryvalfrom as fis_datab) as ValidityStartDate,
	
	@EndUserText.label: 'Chart of Accounts'
	cast (main.nodecls as ktopl) as ChartOfAccounts,
	
	@ObjectModel.foreignKey.association: '_GLAccountInChartOfAccounts'
	case main.nodetype
		when 'L' then cast (main.nodevalue as fis_saknr)
		else ''
	end as GLAccount,
	concat (main.hryseqnbr, main.hrynode) as SequenceNumber,
	
	@EndUserText.label: 'Hierarchy Sequence Number'
	main.hryseqnbr as HierarchyNodeSequence,
	
	@EndUserText.label: 'Hierarchy Level'
	main.hrylevel as HierarchyNodeLevel,
	
	@EndUserText.label: 'Hierarchy Node Type'
	main.nodetype as NodeType,
	
	@Semantics.signReversalIndicator: true
	@EndUserText.label: 'Attribute Value'
	hrrp_attr_node.hryattrvalue as SignIsInverted,
	
	@EndUserText.label: 'Node Value'
	main.nodevalue as HierarchyNodeVal,
	_Text,
	_GLAccountInChartOfAccounts,
	_Hierarchy
}
where hrrp_directory.hrytyp = 'FSVN'
	and (main.balind = 'S' or main.balind = ' ')
	and ((main.nodetype <> 'D' and main.nodetype <> 'L') or (main.nodetype = 'L' and main.nodecls <> ''))
	and (main.nodetype = 'R' or main.nodetype = 'L' or main.nodetype = 'N' or main.nodetype = 'O')