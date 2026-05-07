CLASS zcl_read_practice_tech_m1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_read_practice_tech_m1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



*  short form read


*    READ ENTITY zi_travel_tech_m1
*    FROM VALUE #( (  %key-TravelId = '00000008'
*                     %control = VALUE #(  AgencyId = if_abap_behv=>mk-on
*                                          CustomerId =  if_abap_behv=>mk-on
*                                          BeginDate = if_abap_behv=>mk-on
*                     )
*
*
*    ) )
*    RESULT DATA(lt_result_short)
*    FAILED DATA(lt_failed_short).
*
*    IF lt_failed_short IS NOT INITIAL.
*      out->write( 'Read Failed' ).
*    ELSE.
*      out->write( lt_result_short ).
*    ENDIF.

*    READ ENTITY zi_travel_tech_m1
*    by \_Booking
**    FIELDS ( AgencyId CreatedAt CustomerId  )
*ALL FIELDS
*    WITH VALUE #( (  %key-TravelId = '00000008' )
*    ( %key-TravelId = '00000009' )
*
*
*    )
*    RESULT DATA(lt_result_short)
*    FAILED DATA(lt_failed_short).
*
*    IF lt_failed_short IS NOT INITIAL.
*      out->write( 'Read Failed' ).
*    ELSE.
*      out->write( lt_result_short ).
*    ENDIF.

*    READ ENTITIES OF zi_travel_tech_m1
*    ENTITY Travel
*    ALL FIELDS
*    WITH VALUE #( (  %key-TravelId = '00000008' )
*    ( %key-TravelId = '00000009' )
*
*
*    )
*    RESULT DATA(lt_result_Travel)
*
*    ENTITY Booking
*    ALL FIELDS
*    WITH VALUE #( (  %key-TravelId = '00000008'
*                     %key-BookingId = '0001'
*    )
*
*
*    )
*    RESULT DATA(lt_result_booking)
*    FAILED DATA(lt_failed_short).
*    IF lt_failed_short IS NOT INITIAL.
*      out->write( 'Read Failed' ).
*    ELSE.
*      out->write( lt_result_travel ).
*      out->write( lt_result_booking ).
*    ENDIF.

    DATA:it_optab          TYPE abp_behv_retrievals_tab,
         it_travel         TYPE TABLE FOR READ IMPORT zi_travel_tech_m1,
         it_travel_result  TYPE TABLE FOR READ RESULT zi_travel_tech_m1,
         it_booking        TYPE TABLE FOR READ IMPORT zi_travel_tech_m1\_Booking,
         it_booking_result TYPE TABLE FOR READ RESULT zi_travel_tech_m1\_Booking.


    it_travel = VALUE #(
    (  %key-TravelId = '00000008'
                %control = VALUE #(  AgencyId = if_abap_behv=>mk-on
                                     CustomerId =  if_abap_behv=>mk-on
                                     BeginDate = if_abap_behv=>mk-on
                )

     ) ).

    it_booking = VALUE #(
  (  %key-TravelId = '00000008'
              %control = VALUE #(  BookingDate = if_abap_behv=>mk-on
                                   BookingStatus =  if_abap_behv=>mk-on
                                   BookingId = if_abap_behv=>mk-on
              )

   ) ).

    it_optab = VALUE #( ( op = if_abap_behv=>op-r-read

    entity_name = 'ZI_TRAVEL_TECH_M1'
    instances = REF #( it_travel )
    results = REF #( it_travel_result )
    )
    ( op = if_abap_behv=>op-r-read_ba

    entity_name = 'ZI_TRAVEL_TECH_M1'
    sub_name    = '_BOOKING'
    instances = REF #( it_booking )
    results = REF #( it_booking_result )
    )
     ).

    READ ENTITIES
    OPERATIONS it_optab
    FAILED DATA(lt_failed_op).

    IF lt_failed_op IS NOT INITIAL.
      out->write( 'Read Failed' ).
    ELSE.
      out->write( it_travel_result ).
      out->write( it_booking_result ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
