-- programa un script que pida al usuario introducir dos números positivos
-- si los números no son positivos que le salga un mensaje conforme están mal y debe volver a introducirlos
-- se tiene que hacer división entre ellos y sumar el segundo
-- el resultado tiene que asignarse a variable NO PLSQL y luego imprimirse fuera del bloque PL/SQL

SET SERVEROUTPUT ON;

DECLARE

    numberA number(5);
    
    numberB number(5);
    
    operacion number(5);
                    
BEGIN

    numberA := &numberA;
    
    numberB := &numberB;
    
    if (numberA < 0) then
        DBMS_OUTPUT.PUT_LINE(numberA|| ' is a negative number');
    elsif (numberB < 0) then
        DBMS_OUTPUT.PUT_LINE(numberB|| ' is a negative number');
    else
        operacion := (numberA / numberB) + numberB;
        DBMS_OUTPUT.PUT_LINE('number A is '||numberA);
        DBMS_OUTPUT.PUT_LINE('number B is '||numberB);
        DBMS_OUTPUT.PUT_LINE('el resultado es '||operacion);
    END IF;
    
END;
