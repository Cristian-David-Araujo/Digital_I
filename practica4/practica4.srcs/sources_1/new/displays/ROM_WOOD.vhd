--In this code is to generate a ROM in which is stored the information of a 32 x 40 image
--that will be used to plot on the screen, when the stored information is a 1 indicates 
--that you have to paint that pixel.


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM_WOOD is
    Port ( address : in STD_LOGIC_VECTOR (4 downto 0);
           data : out STD_LOGIC_VECTOR (39 downto 0));
end ROM_WOOD;

architecture Behavioral of ROM_WOOD is
--Here is the defition of the ROM memory
    subtype dataMemory is STD_LOGIC_VECTOR (39 downto 0);
    type memory is array (0 to 31) of dataMemory;

    --Information in the memory ROM
    constant memoryROM : memory := (
        "0000000000000000000001111111111110000000",
        "0000000000000000000011111111111111000000",
        "0000000000000000000111111111111111100000",
        "0000000000000000001111111111111111110000",
        "0000000000000000011111111111111111111000",
        "0111100000000000111111111111111111111100",
        "1111111000000001111111111111111111111110",
        "1111111100000011111111111111111111111111",
        "1111111110000111111111111111111111111111",
        "1111111111001111111111111111111111111111",
        "1111111111111111111111111111111111111111",
        "0011111111111111111111111111111111111111",
        "0000111111111111111111111111111111111111",
        "0000001111111111111111111111111111111111",
        "0000000011111111111111111111111111111110",
        "0000001111111111111111111111111111111100",
        "0000110000000000011111111111111111111000",
        "0011000000000000001111111111111111110000",
        "1100000000000000000111111111111111100000",
        "1100000000000000000011111111111111000000",
        "1100000000000000000001111111111110000000",
        "1100000000000000000000111111111100000000",
        "1100000001111110000000011111111000000000",
        "1100000001111111000000011111110000000000",
        "1100000000011111100000011111100000000000",
        "1100000000000110000000011111000000000000",
        "0011000000000000000000011110000000000000",
        "0000110000000000000000011100000000000000",
        "0000001100000000000000011000000000000000",
        "0000000011000000000000110000000000000000",
        "0000000000110000000001100000000000000000",
        "0000000000001111111111000000000000000000"
    );

begin
    data <= memoryROM(to_integer(unsigned(address)));
end Behavioral;
