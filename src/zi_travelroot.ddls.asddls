@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view - Travel Root'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_TRAVELROOT as select from ztravel_root
association [0..1] to /DMO/I_Overall_Status_VH as _Status
on $projection.Status = _Status.OverallStatus
{

    key travelid as Travelid,
    description as Description,
  @Semantics.amount.currencyCode : 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    status as Status,
    concat_with_space(cast(total_price as abap.char(20)), currency_code, 2) as TotalPriceWithCurrency,
    _Status._Text.Text as StatusText,
    _Status
}
