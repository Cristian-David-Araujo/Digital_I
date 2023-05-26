library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity drawWood is
    Port ( clk : in  STD_LOGIC;
           posX : in  STD_LOGIC_VECTOR (10 downto 0);
           posY : in  STD_LOGIC_VECTOR (10 downto 0);
           Hcount : in  STD_LOGIC_VECTOR (10 downto 0);
           Vcount : in  STD_LOGIC_VECTOR (10 downto 0);
           draw : out  STD_LOGIC);
end drawWood;

architecture Behavioral of drawWood is

    component ROM_WOOD is
    port(
        address : in STD_LOGIC_VECTOR (4 downto 0);
        data : out STD_LOGIC_VECTOR (39 downto 0)
    );
    end component;
    
    signal addressX_aux, addressY_aux : STD_LOGIC_VECTOR (10 downto 0);
    signal addressY : STD_LOGIC_VECTOR (4 downto 0);
    signal addressX : STD_LOGIC_VECTOR (5 downto 0);
    signal dataROM : STD_LOGIC_VECTOR (39 downto 0);
begin


    --Instans of ROM_WOOD
    WOOD : ROM_WOOD
    port map(
        address => addressY,
        data => dataROM
    );


    addressY_aux <= Vcount - posY;
    addressY <= addressY_aux(4 downto 0);
    addressX_aux <= Hcount - posX;
    addressX <= addressX_aux(5 downto 0);

    --data <= dataROM
    
    draw <= dataROM(to_integer(unsigned(addressX(4 downto 0))));
    
end Behavioral;