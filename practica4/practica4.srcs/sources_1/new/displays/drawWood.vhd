--This code is to control the positions in which the figure will be shown to be painted, returning a draw 1 to be painted in a certain position.
--Taking the information from a ROMs drawing

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity drawWood is
    Port ( --clk : in  STD_LOGIC;
           posX : in  STD_LOGIC_VECTOR (10 downto 0);
           posY : in  STD_LOGIC_VECTOR (10 downto 0);
           Hcount : in  STD_LOGIC_VECTOR (10 downto 0);
           Vcount : in  STD_LOGIC_VECTOR (10 downto 0);
           woodcolor: out STD_LOGIC_VECTOR (11 downto 0);
           draw : out  STD_LOGIC);
end drawWood;

architecture Behavioral of drawWood is
    --Instans of ROM
    component ROM_WOOD is
    port(
        address : in STD_LOGIC_VECTOR (4 downto 0);
        data : out STD_LOGIC_VECTOR (39 downto 0)
    );
    end component;

    component romwood2 is
        port(
            address : in STD_LOGIC_VECTOR (4 downto 0);
            data : out STD_LOGIC_VECTOR (39 downto 0)
        );
        end component;
    
    signal addressX_aux, addressY_aux : STD_LOGIC_VECTOR (10 downto 0);
    signal addressY : STD_LOGIC_VECTOR (4 downto 0);
    signal addressX : STD_LOGIC_VECTOR (5 downto 0);
    signal dataROM,dataROM2 : STD_LOGIC_VECTOR (39 downto 0);
    signal drawwood : STD_LOGIC;
begin


    --Instans of ROM_WOOD
    WOOD : ROM_WOOD
    port map(
        address => addressY,
        data => dataROM
    );

    Woodinterior : romwood2
    port map(
        address => addressY,
        data => dataROM2
    );

    --Control of ROMS positions to be read out
    addressY_aux <= Vcount - posY;
    addressY <= addressY_aux(4 downto 0);
    addressX_aux <= Hcount - posX;
    addressX <= addressX_aux(5 downto 0);

    --The output of the ROM information is conditioned so that the image is not repeated in all possible positions.

    drawwood <= '1' when dataROM(to_integer(unsigned(addressX(5 downto 0)))) = '1' and (posX + 39 >= Hcount and posX <= Hcount and posY + 31 >= Vcount and posY <= Vcount) else '0';
    draw <= drawwood;
    -- when draw is 1 the color is brown
    woodcolor <=  X"730"; --when drawwood = '1' else X"fff";
    
    
end Behavioral;
