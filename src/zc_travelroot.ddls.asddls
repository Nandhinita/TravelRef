@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Travel Report'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'Description' ]
define root view entity ZC_TravelRoot 
provider contract transactional_query
 as projection on ZI_TRAVELROOT
{
       @Consumption.valueHelpDefinition: [{ label: 'Travel ID', entity : {name: '/dmo/I_travel_D',
element: 'TravelID' } }]
    key Travelid,
    @Search.defaultSearchElement: true
@Search.fuzzinessThreshold: 0.90
    Description,
      @Semantics.amount.currencyCode : 'CurrencyCode'
    
    TotalPrice,
    CurrencyCode,
         @Consumption.valueHelpDefinition: [{ label: 'Status Text', entity : {name: '/DMO/I_Overall_Status_VH',
element: 'OverallStatus' } }]
    Status,
    TotalPriceWithCurrency,
           @Consumption.valueHelpDefinition: [{ label: 'Status Text', entity : {name: '/DMO/I_Overall_Status_VH',
element: 'OverallStatus' } }]
    StatusText,
    /* Associations */
    _Status
}
