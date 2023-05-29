
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
    signal R : STD_LOGIC_VECTOR (3 downto 0) := x"0";
    signal G : STD_LOGIC_VECTOR (3 downto 0) := x"7";
    signal B : STD_LOGIC_VECTOR (3 downto 0) := x"A";
    
    signal count1 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
begin

    RGBout <= R & G & B;
    
    process (Vcount(0))
    begin
        if rising_edge(Vcount(0)) then
            if count1 < 10 then
                count1 <= count1 + 1;
            else
                count1 <= (others => '0');
                if G < 15 then
                    G <= G + 1;
                elsif B > 0 then
                    B <= B - 1;
                end if;
            end if;
            
            if Vcount >= 479 then
                G <= x"7";
                B <= x"A";
                count1 <= (others => '0');
            end if;
            
        end if;
    end process;
end Behavioral;
