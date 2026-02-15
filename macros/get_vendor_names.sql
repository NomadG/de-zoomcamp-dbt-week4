{% macro get_vendor_names(id) %}
    CASE 
    WHEN {{id}} = 1 THEN 'Creative Mobile Technologies, LLC'
    WHEN {{id}} = 2 THEN 'VeriFone Inc.'
    ELSE 'Unkown' END 
{% endmacro %}