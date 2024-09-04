CLASS z_travelroot_cls DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_travelroot_cls IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DELETE FROM ztravel_root.

  INSERT ztravel_root FROM (
  SELECT travel_id,description,total_price,currency_code,
  CASE status WHEN 'N' THEN 'O'
              WHEN 'P' THEN 'O'
              WHEN 'B' THEN 'A'
              ELSE 'X'
              END AS status
              FROM /dmo/travel ).
  ENDMETHOD.
ENDCLASS.
