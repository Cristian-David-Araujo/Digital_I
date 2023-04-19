--*****************************************************************************************
-- Implementation of an ALU in VHDL
-- Opcodes for the ALU
--111   s <= B + A (20 si A + B > 24 ) 
--110   s <= B * 2
--101   s <= - (shows a - sign in the display)
--100   s <= A - 2 (0 si A <2)
--011   s <= A + 2
--010   s <= not B
--001   s <= B + A
--000   s<= A or B
--*****************************************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity ALU is
    Port ( A : in std_logic_vector(3 downto 0);
           B : in std_logic_vector(3 downto 0);
           opcode : in std_logic_vector(2 downto 0);
           S : out std_logic_vector(3 downto 0);
           CarryOut : out STD_LOGIC
           );
end ALU;

architecture Behavioral of ALU is
    signal ALUout : std_logic_vector(4 downto 0);

begin
    process(A, B, opcode)
    begin
        case opcode is
            when "000" => -- OR operation
                ALUout <= "0" & (A or B);
            when "001" => -- ADD operation
                ALUout <= ("0" &  A) + ("0" & B);
            when "010" => -- NOT operation
                ALUout <= "0" & not B;
            when "011" => -- ADD 2 operation   
                ALUout <= "0" & A + 2;
            when "100" => -- SUB 2 operation
                if A < "0010" then
                    ALUout <= "00000";
                else
                    ALUout <= "0" & A - 2;
                end if;
            when "101" => -- SET operation
                ALUout <= "01111";
            when "110" => -- MUL by 2 operation
                ALUout <= B & "0";
            when "111" => -- ADD and check for overflow operation
                if ("0" &  A) + ("0" & B) > "11000" then
                    ALUout <= "10100";
                else
                    ALUout <=("0" &  A) + ("0" & B);
                end if;
            when others => -- default operation
                ALUout <= "00000";
        end case;
    end process;

    S <= ALUout(3 downto 0);
    CarryOut <= ALUout(4);
end Behavioral;