
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity degraded is
    Port (
           Vcount : in STD_LOGIC_VECTOR (10 downto 0);
           RGBout : out STD_LOGIC_VECTOR (11 downto 0));
end degraded;

architecture Behavioral of degraded is
    signal RGB : STD_LOGIC_VECTOR (11 downto 0) := x"00F";
    
    signal count1 : STD_LOGIC_VECTOR (1 downto 0) := "00";
begin

    RGBout <= RGB;
    
    process (Vcount(0))
    begin
        if rising_edge(Vcount(0)) then
            if count1 < 1 then
                count1 <= count1 + 1;
            else
                count1 <= (others => '0');
                RGB <= RGB + 1;
            end if;
            
            if Vcount >= 479 then
                RGB <= x"00F"
                count1 <= (others => '0');
            end if;
            
        end if;
    end process;
end Behavioral;
