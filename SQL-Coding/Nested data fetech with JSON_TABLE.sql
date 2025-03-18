--------------------------------------------------------------
-- Desc: Nested JSON Data fetch from a table with JSON_TABLE
--------------------------------------------------------------

-- Table Creation:

CREATE TABLE nested_json_tab (
    id NUMBER PRIMARY KEY,
    json_data CLOB CONSTRAINT nested_json_data_is_json CHECK (json_data IS JSON)
);



-- Insert Data:

INSERT INTO nested_json_tab (id, json_data) VALUES (1, '{
    "name": "John",
    "age": 30,
    "address": {
        "street": "123 Main St",
        "city": "New York",
        "country": "USA"
    },
    "contacts": [
        {"type": "email", "value": "john@example.com"},
        {"type": "phone", "value": "123-456-7890"}
    ]
}');



-- SQL:



SELECT jt.name,
       jt.age,
       jt.street,
       jt.city,
       jt.country,
       jt.contact_type,
       jt.contact_value
  FROM nested_json_tab,
       json_table(json_data,
                  '$[*]'
                  COLUMNS(NAME VARCHAR2(50) PATH '$.name',
                          age NUMBER PATH '$.age',
                          NESTED PATH '$.address[*]'
                          COLUMNS(street VARCHAR2(50) PATH '$.street',
                                  city VARCHAR2(50) PATH '$.city',
                                  country VARCHAR2(50) PATH '$.country'),
                          NESTED PATH '$.contacts[*]'
                          COLUMNS(contact_type VARCHAR2(50) PATH '$.type',
                                  contact_value VARCHAR2(50) PATH '$.value')
                          
                          )) jt;



