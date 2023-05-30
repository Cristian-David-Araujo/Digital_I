library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity drawingwoods is
    port(
        hcount : in std_logic_vector(10 downto 0);
        vcount : in std_logic_vector(10 downto 0);
        clk : in std_logic;
        color : out std_logic_vector(11 downto 0);
        paintwood : out std_logic
    );
end drawingwoods;

architecture Behavioral of drawingwoods is
    -- Component for drawing the woods
    Component drawWood
		Port ( 
			posX : in  STD_LOGIC_VECTOR (10 downto 0);
			posY : in  STD_LOGIC_VECTOR (10 downto 0);
			Hcount : in  STD_LOGIC_VECTOR (10 downto 0);
			Vcount : in  STD_LOGIC_VECTOR (10 downto 0);
			draw : out  STD_LOGIC
			);
	end Component;


    signal draw1,draw2,draw3,draw4,draw5,draw6 : std_logic;
    signal posX : std_logic_vector(10 downto 0) := "00111110100"; --500
    signal posY : std_logic_vector(10 downto 0) := (others => '0');

    --signal posY2,posY3,posY4,posY5,posY6 : std_logic_vector(10 downto 0);
    signal posY2 : std_logic_vector(10 downto 0) := "00000000000"+ 80;
    signal posY3 : std_logic_vector(10 downto 0) := "00000000000"+ 160;
    signal posY4 : std_logic_vector(10 downto 0) := "00000000000"+ 240;
    signal posY5 : std_logic_vector(10 downto 0) := "00000000000"+ 320;
    signal posY6 : std_logic_vector(10 downto 0) := "00000000000"+ 400;
    
    signal paint : std_logic;

    begin
    
    -- Instantiate the components
    wood1 : drawWood 
    port map (
        posX => posX,
        posY => posY,
        Hcount => Hcount,
        Vcount => Vcount,
        draw => draw1
    );

    wood2 : drawWood
    port map (
        posX => posX,
        posY => posY2,
        Hcount => Hcount,
        Vcount => Vcount,
        draw => draw2
    );

    wood3 : drawWood
    port map (
        posX => posX,
        posY => posY3,
        Hcount => Hcount,
        Vcount => Vcount,
        draw => draw3
    );

    wood4 : drawWood
    port map (
        posX => posX,
        posY => posY4,
        Hcount => Hcount,
        Vcount => Vcount,
        draw => draw4
    );

    wood5 : drawWood
    port map (
        posX => posX,
        posY => posY5,
        Hcount => Hcount,
        Vcount => Vcount,
        draw => draw5
    );

    wood6 : drawWood
    port map (
        posX => posX,
        posY => posY6,
        Hcount => Hcount,
        Vcount => Vcount,
        draw => draw6
    );



    --When the last wood reaches the end of the screen, it starts to be drawn at the top.
    -- Process for the movement of woods
    process(clk)
    begin
        if rising_edge(clk) then
            if posY = 479 then
                posY <= (others => '0');
                posY2 <= posY2 + 1;
                posY3 <= posY3 + 1;
                posY4 <= posY4 + 1;
                posY5 <= posY5 + 1;
                posY6 <= posY6 + 1;

            elsif posY6 = 479 then
                posY6 <=(others => '0');

                posY <= posY + 1;
                posY2 <= posY2 + 1;
                posY3 <= posY3 + 1;
                posY4 <= posY4 + 1;
                posY5 <= posY5 + 1;
    
            elsif posY5 >= 479 then
                posY5 <= (others => '0');

                posY <= posY + 1;
                posY2 <= posY2 + 1;
                posY3 <= posY3 + 1;
                posY4 <= posY4 + 1;
                posY6 <= posY6 + 1;
    
            elsif posY4 >= 479 then
                posY4 <= (others => '0');

                posY <= posY + 1;
                posY2 <= posY2 + 1;
                posY3 <= posY3 + 1;
                posY5 <= posY5 + 1;
                posY6 <= posY6 + 1;
    
            elsif posY3 >= 479 then
                posY3 <= (others => '0');

                posY <= posY + 1;
                posY2 <= posY2 + 1;
                posY4 <= posY4 + 1;
                posY5 <= posY5 + 1;
                posY6 <= posY6 + 1;
    
            elsif posY2 >= 479 then
                posY2 <= (others => '0');

                posY <= posY + 1;
                posY3 <= posY3 + 1;
                posY4 <= posY4 + 1;
                posY5 <= posY5 + 1;
                posY6 <= posY6 + 1;

            else
                posY <= posY + 1;
                posY2 <= posY2 + 1;
                posY3 <= posY3 + 1;
                posY4 <= posY4 + 1;
                posY5 <= posY5 + 1;
                posY6 <= posY6 + 1;
            end if;
        end if;
    end process;

    -- Check if any of the trunks is drawn
    paint <= draw1 or draw2 or draw3 or draw4 or draw5 or draw6;
    paintwood <= paint;
    --color <= X"730" when (draw1 = '1' or draw2 = '1' or draw3 = '1') else X"FFF";
    -- The default color of the trunk is black, the rest is left in the background color.
    color <= X"000" when (paint = '1') else X"FFF";

end Behavioral;
