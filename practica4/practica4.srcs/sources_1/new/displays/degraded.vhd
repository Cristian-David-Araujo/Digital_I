-- This code is to generate a gradient effect on the screen,
--in which it goes from a blue to a green color.

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
    --initial values
    signal R : STD_LOGIC_VECTOR (3 downto 0) := x"0";
    signal G : STD_LOGIC_VECTOR (3 downto 0) := x"0";
    signal B : STD_LOGIC_VECTOR (3 downto 0) := x"F";
    signal count : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin

    RGBout <= R&G&B;
    
    process (Vcount(0))
    begin
        --Each time you change columns
        if rising_edge(Vcount(0)) then
            --Segmentation of a range of rows that will be painted with the same color.
            if count < 8 then
                count <= count + 1;
            else
                if Vcount < 239 then
                    --addition of green shade
                    G <= G + 1;
                else
                    --green fading
                    B <= B - 1;
                end if;
                
                count <= (others => '0');
            end if;
            
            --When the column counter reaches the end, the initial RGB values are set.
            if Vcount >= 479 then
                R <= X"0";
                G <= X"0";
                B <= X"F";
                count <= (others => '0');
            end if;
            
        end if;
    end process;
end Behavioral;
