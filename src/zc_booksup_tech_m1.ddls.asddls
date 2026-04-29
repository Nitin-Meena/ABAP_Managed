@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking supplement Projection view managed'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_BOOKSUP_TECH_M1
  as projection on ZI_BOOKSUP_TECH_M1
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      @ObjectModel.text.element: [ 'SupplementDesc' ]
      SupplementId,
      _SupplementText.Description as SupplementDesc : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZC_BOOKING_TECH_M1,
      _Supplement,
      _SupplementText,
      _Travel  : redirected to ZC_TRAVEL_TECH_M1
}
