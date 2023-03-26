library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--========================================================================
--This code in VHDL is for implement of a ALU with the next operations:
-- if operationSelect = "000" then operationOut <= A or B
-- if operationSelect = "001" then operationOut <= A + B
-- if operationSelect = "010" then operationOut <= not B
-- if operationSelect = "011" then operationOut <= A + 2
-- if operationSelect = "100" then operationOut <= A - 2, but if A < 2 then operationOut <= 0;
-- if operationSelect = "101" then operationOut <= show an "-" in the display
-- if operationSelect = "110" then operationOut <= B*2
-- if operationSelect = "111" then operationOut <= A + B, but if A + B > 24 then operationOut <= 0;
--========================================================================
entity ALU is
    Port (  A, B : in STD_LOGIC_VECTOR (3 downto 0);
            operationSelect : in STD_LOGIC_VECTOR (2 downto 0);
            operationOut : out STD_LOGIC_VECTOR (3 downto 0);
            Cout : out STD_LOGIC
    );
end ALU;

architecture Behavioral of ALU is
    
begin
    
end  architecture Behavioral;