----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 05:39:33 PM
-- Design Name: 
-- Module Name: degraded - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity degraded is
    Port ( clk : in  STD_LOGIC;
           Hcount : in  STD_LOGIC_VECTOR (10 downto 0);
           Vcount : in  STD_LOGIC_VECTOR (10 downto 0);
           RGBout : out STD_LOGIC_VECTOR (11 downto 0));
end degraded;

architecture Behavioral of degraded is
    signal R,G,B : STD_LOGIC_VECTOR (3 downto 0) ;
begin
    process (clk)

    end process;
end Behavioral;
