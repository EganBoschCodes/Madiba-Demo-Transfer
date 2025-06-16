@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@EndUserText.label: 'Posting Key'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PostingKey'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

define view entity ZSNAP_F72G_PostingKey
	as select from tbsl as main
	
	association [0..*] to ZSNAP_F72G_PostingKeyText as _PostingKeyText on $projection.PostingKey = _PostingKeyText.PostingKey
{
	@ObjectModel.text.association: '_PostingKeyText'
	@EndUserText.label: 'Posting Key'
	key cast (main.bschl as fis_bschl preserving type) as PostingKey,
	
	@EndUserText.label: 'Debit/Credit Code'
	cast (main.shkzg as fis_shkzg preserving type) as DebitCreditCode,
	
	@EndUserText.label: 'Account Type'
	cast (main.koart as farp_koart preserving type) as FinancialAccountType,
	
	@EndUserText.label: 'Sales-Related Item'
	cast (main.xumsw as farp_xumsw preserving type) as IsSalesRelated,
	
	@EndUserText.label: 'Payment Transaction'
	main.xzahl as IsUsedInPaymentTransaction,
	
	@EndUserText.label: 'Reversal Posting Key'
	main.stbsl as ReversalPostingKey,
	
	@EndUserText.label: 'Special G/L'
	main.xsonu as IsSpecialGLTransaction,
	
	@ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
	_PostingKeyText
}