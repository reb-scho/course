{% test minimum_row_count(model, minimum_row_count) %} --Jinja macro definition --(model, arg1)
{{ config(severity = 'warn') }} --Jinja config block

SELECT COUNT(*) AS cnt
FROM {{ model}}
HAVING COUNT(*) < {{ minimum_row_count }} --Jinja variable reference
{% endtest %}