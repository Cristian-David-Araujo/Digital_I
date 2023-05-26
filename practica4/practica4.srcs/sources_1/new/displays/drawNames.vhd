library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity drawNames is
        port(
             hcount : in  STD_LOGIC_VECTOR (10 downto 0);
             vcount : in  STD_LOGIC_VECTOR (10 downto 0);
             rgb : out STD_LOGIC_VECTOR (11 downto 0);
             paintLetters : out  STD_LOGIC
        );
end drawNames;

architecture Behavioral of drawNames is

    Component display34segm
	generic(SG_WD : integer range 0 to 31 := 5; --Segment width
			DL : integer range 0 to 511 := 100  --DYSPLAY_LENGTH
		);  
		 port(posx : in integer range 0 to 639; 
			  posy : in integer range 0 to 480;
			  segments : in STD_LOGIC_VECTOR (33 downto 0);
			  hcount : in  STD_LOGIC_VECTOR (10 downto 0);
			  vcount : in  STD_LOGIC_VECTOR (10 downto 0);
			  paint : out  STD_LOGIC
		);
 	end Component;


    --constants for the segments width and the displays length
    constant thickness : integer range 0 to 31 := 2;
    constant size : integer range 0 to 511 := 50;

    -- Signals for the 34 segments displays
    signal segments : STD_LOGIC_VECTOR (33 downto 0);
    signal paint1, paint2, paint3, paint4, paint5, paint6, paint7, paint8, paint9, hyphen : STD_LOGIC;


    -- Signals for drawing the letters
    signal color : STD_LOGIC_VECTOR (11 downto 0);
    signal auxPaintLetters : std_logic;

    begin

        --letter 1 'J'
        letter1: display34segm
        generic map(SG_WD => thickness, DL => size)
        port map(
            posx => 0,
            posy => 0,
            segments => "110000" & "000000001110" & "00000010" & "00000001", -- J
            hcount => hcount,
            vcount => vcount,
            paint => paint1
        );

        --letter 2 'O'
        letter2: display34segm
        generic map(SG_WD => thickness, DL => size)
        port map(
            posx => 30,
            posy => 0,
            segments => "110011" & "111100001111" & "00000000" & "00000000", -- O
            hcount => hcount,
            vcount => vcount,
            paint => paint2
        );

        --letter 3 'S'
        letter3: display34segm
        generic map(SG_WD => thickness, DL => size)
        port map(
            posx => 60,
            posy => 0,
            segments => "000000" & "000000000000" & "01100110" & "10000001", -- S
            hcount => hcount,
            vcount => vcount,
            paint => paint3
        );

        --letter 4 'E'
        letter4: display34segm
        generic map(SG_WD => thickness, DL => size)
        port map(
            posx => 90,
            posy => 0,
            segments => "111011" & "111100000000" & "00000000" & "00000000", -- E
            hcount => hcount,
            vcount => vcount,
            paint => paint4
        );

        -- hyphen separator '-'
        hyphenSeparator: display34segm
        generic map(SG_WD => thickness, DL => size)
        port map(
            posx => 120,
            posy => 0,
            segments => "0011000000000000000000000000000000", -- '-'
            hcount => hcount,
            vcount => vcount,
            paint => hyphen
        );

        -- letter 5 'D'
        letter5: display34segm
        generic map(SG_WD => thickness, DL => size)
        port map(
            posx => 150,
            posy => 0,
            segments => "100010" & "111100000110" & "01000000" & "00000001", -- D
            hcount => hcount,
            vcount => vcount,
            paint => paint5
        );

        -- letter 6 'A'
        letter6: display34segm
        generic map(SG_WD => thickness, DL => size)
        port map(
            posx => 180,
            posy => 0,
            segments => "001100" & "011100000111" & "01000000" & "10000000", -- A
            hcount => hcount,
            vcount => vcount,
            paint => paint6
        );

        -- letter 7 'V'
        letter7: display34segm
        generic map(SG_WD => thickness, DL => size)
        port map(
            posx => 210,
            posy => 0,
            segments => "000000" & "111000001110" & "00000010" & "00000001", -- V
            hcount => hcount,
            vcount => vcount,
            paint => paint7
        );

        -- letter 8 'I'
        letter8: display34segm
        generic map(SG_WD => thickness, DL => size)
        port map(
            posx => 240,
            posy => 0,
            segments => "110011" & "000011110000" & "00000000" & "00000000", -- I
            hcount => hcount,
            vcount => vcount,
            paint => paint8
        );

        -- letter 9 'D'
        letter9: display34segm
        generic map(SG_WD => thickness, DL => size)
        port map(
            posx => 270,
            posy => 0,
            segments => "100010" & "111100000110" & "01000000" & "00000001", -- D
            hcount => hcount,
            vcount => vcount,
            paint => paint9
        );
        auxPaintLetters <= '1' when (paint1 = '1' or paint2 = '1' or paint3 = '1' or paint4 = '1' or hyphen = '1'or
                                    paint5 = '1' or paint6 = '1' or paint7 = '1' or paint8 = '1' or paint9 = '1') else '0';

        -- color of the letters
        -- when paintLetters = '1' we paint the letters
        color <= "000010001111" when auxPaintLetters = '1' else "000000000000";

        -- Outputs
        paintletters <= auxPaintLetters;
        rgb <= color;
        

end Behavioral;

