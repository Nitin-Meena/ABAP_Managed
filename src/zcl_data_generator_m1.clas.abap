CLASS zcl_data_generator_m1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_generator_m1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    " delete existing entries in the database table
    DELETE FROM ztravel_tech_m1.
    DELETE FROM zBOOKING_tech_m1.
    DELETE FROM zbooksup_tech_m1.
    COMMIT WORK.
    " insert travel demo data
    INSERT ztravel_tech_m1 FROM (
        SELECT *
          FROM /dmo/travel_m
      ).
    COMMIT WORK.

    " insert booking demo data
    INSERT zBOOKING_tech_m1 FROM (
        SELECT *
          FROM   /dmo/booking_m
*            JOIN ytravel_tech_m AS y
*            ON   booking~travel_id = y~travel_id

      ).
    COMMIT WORK.
    INSERT zbooksup_tech_m1 FROM (
        SELECT *
          FROM   /dmo/booksuppl_m
*            JOIN ytravel_tech_m AS y
*            ON   booking~travel_id = y~travel_id

      ).
    COMMIT WORK.

    out->write( 'Travel and booking demo data inserted.').


  ENDMETHOD.
ENDCLASS.
