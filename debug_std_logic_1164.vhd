library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
package print is 
function print_digit(a: integer range 0 to 9) return string;
function print_number(a: integer ) return string;
function print_number(a: std_logic_vector ) return string ;
end package print;


package body print is
    function print_digit(a: integer range 0 to 9) return string is
        variable ret : string ( 1 to 1 );
        begin
            case a is 
            when 0 => ret := "0";
            when 1 => ret := "1";
            when 2 => ret := "2";
            when 3 => ret := "3";
            when 4 => ret := "4";
            when 5 => ret := "5";
            when 6 => ret := "6";
            when 7 => ret := "7";
            when 8 => ret := "8";
            when 9 => ret := "9";    
    end case;
    return ret;
    end print_digit;

    function print_number(a: integer ) return string is 
    variable ret : string (1 to 10);
    variable tmp : integer ;
    begin 
        tmp := a;
        for i in  1 to 10 loop
            ret(i to i) := print_digit(tmp mod 10);
            tmp := tmp / 10;
        end loop;
            return ret;

    end print_number;

    function print_number(a: std_logic_vector ) return string is

        variable tmp : integer;
        begin
            tmp := ieee.std_logic_arith.conv_integer(signed(a));
        return print_number(tmp);

    end print_number;
    
end package body;