----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:33:54 05/20/2014 
-- Design Name: 
-- Module Name:    VGACounter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGACounter is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PBTON : in  STD_LOGIC;
           HS : out  STD_LOGIC;
           VS : out  STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (11 downto 0);
		   -- keyboard
		   PS2Clk, PS2Data: in std_logic);
			  
	-- Las siguientes declaraciones realizan la asignacion de pines (version aantigua) 
--	attribute loc: string;
--	attribute loc of CLK : signal is "B8"; -- Pin de reloj
--	attribute loc of RST : signal is "B18"; -- Pulsador BTN0
--	attribute loc of PBTON : signal is "D18"; -- Pulsador BTN1
--	attribute loc of HS : signal is "T4"; -- Driver VGA
--	attribute loc of VS	: signal is "U3"; -- Driver VGA
--	attribute loc of RGB : signal is "R9,T8,R8,N8,P8,P6,U5,U4"; -- Driver VGA
	
end VGACounter;

architecture Behavioral of VGACounter is
	
	-- First, all components are declared
	
	-- This component receives a 100 mhz clock and a reset signal for the bird's movement.
	component birdMovement -- bird movement and keyboard control
	Port ( clk, reset: in std_logic;
		hcount, vcount: in std_logic_vector(10 downto 0);
		PS2Clk, PS2Data: in std_logic;
		posx : out std_logic_vector (10 downto 0);
		paintbird: out std_logic);
	end component;

	-- this component is for creating the background gradient of the game.
	component degraded is
		port(
			Vcount : in  STD_LOGIC_VECTOR (10 downto 0);
			RGBout : out STD_LOGIC_VECTOR (11 downto 0));
		end component;


	-- This component is responsible for separating a number into hundreds, tens and units to show the corresponding number in each display.
	COMPONENT BIN2BCD_0a999
	PORT(
		BIN : IN std_logic_vector(9 downto 0);          
		BCD2 : OUT std_logic_vector(3 downto 0);
		BCD1 : OUT std_logic_vector(3 downto 0);
		BCD0 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	-- This is the driver in charge of controlling what is displayed on the screen.
	COMPONENT vga_ctrl_640x480_60Hz
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		rgb_in : IN std_logic_vector(11 downto 0);          
		HS : OUT std_logic;
		VS : OUT std_logic;
		hcount : OUT std_logic_vector(10 downto 0);
		vcount : OUT std_logic_vector(10 downto 0);
		rgb_out : OUT std_logic_vector(11 downto 0);
		blank : OUT std_logic
		);
	END COMPONENT;
	
	-- This component is used to instantiate 3 displays and show the score on the screen.
	COMPONENT Display 
	GENERIC ( LW: INTEGER:=10; -- width of the lines
				 DW: INTEGER:=50;  -- width of the display
				 DL: INTEGER:=100; -- height of the display
				 POSX: INTEGER:= 0; 
				 POSY: INTEGER:= 0
         	); 
   PORT (  HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VALUE : in  STD_LOGIC_VECTOR (3 downto 0);
           PAINT : out  STD_LOGIC); -- Indicates whether the display is drawn or not.
	end COMPONENT;
	
	-- This is the driver to write the letters of our names on the vga screen.
	-- Every second they change to a different color
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
 	-- This component uses the 34-segment display driver to write each letter of the desired names.
 	Component drawNames
        port(
             hcount : in  STD_LOGIC_VECTOR (10 downto 0);
             vcount : in  STD_LOGIC_VECTOR (10 downto 0);
			 clk : in  STD_LOGIC; -- a clock with a period of 1 second is passed to change the color of the letters
             rgb : out STD_LOGIC_VECTOR (11 downto 0); -- This output passes the color with which the names are painted.
             paintLetters : out  STD_LOGIC -- This indicates whether or not the pixel of each letter is drawn.
        );
      end component;
	
	-- This component is in charge of drawing each of the woods on the vga screen.
	-- The woods are the obstacles through which our character (the bird) must pass to reach the end and obtain a point.
	-- Each time a log reaches the end of the screen it is redrawn from the 0 position at y
	Component drawingwoods
	port(
        hcount : in std_logic_vector(10 downto 0);
        vcount : in std_logic_vector(10 downto 0);
        clk : in std_logic; -- We use a 6 millisecond clock to move the logs.
        color : out std_logic_vector(11 downto 0);
        paintwood : out std_logic -- Indicates whether a wood is painted or not.
    );
	end Component;
	
	COMPONENT AlphaNumerico
	GENERIC ( LW: INTEGER:=10;
				 DW: INTEGER:=50;
				 DL: INTEGER:=100;
				 POSX: INTEGER:= 0;
				 POSY: INTEGER:= 0
         	); 
	PORT(
		ALPHANUM : IN std_logic_vector(6 downto 0);
		HCOUNT : IN std_logic_vector(10 downto 0);
		VCOUNT : IN std_logic_vector(10 downto 0);          
		PAINT : OUT std_logic
		);
	END COMPONENT;

	-- Component to achieve any desired frequency using any other clock
	component clkDivider is
        generic (countLimit : integer);
        Port (  clk : in STD_LOGIC;
                newClk : out STD_LOGIC
             );
    end component clkDivider;
	-- We declare the following signs

	
	signal colordisplays : STD_LOGIC_VECTOR (11 downto 0); -- Color for each 7-segment display
	signal hcount : STD_LOGIC_VECTOR (10 downto 0);
	signal vcount : STD_LOGIC_VECTOR (10 downto 0);

	-- these signals indicate whether or not the displays are drawn to show the letters and numbers
	signal paintNames : STD_LOGIC; 
	signal paint2 : STD_LOGIC;
	signal paint1 : STD_LOGIC;
	signal paint0 : STD_LOGIC;
	signal paintdisplay : STD_LOGIC;

	-- These signs are used for colors
	signal rgb_aux1 : STD_LOGIC_VECTOR (2 downto 0);
	signal rgb_aux2 : STD_LOGIC_VECTOR (11 downto 0);
	signal rgb_aux3 : STD_LOGIC_VECTOR (11 downto 0);
	signal lettersColor : STD_LOGIC_VECTOR (11 downto 0);

	-- Signs to show the score number
	signal conteo : std_logic_vector(9 downto 0);
	signal unidades : std_logic_vector(3 downto 0);
	signal decenas : std_logic_vector(3 downto 0);
	signal centenas : std_logic_vector(3 downto 0);

	-- Signs for watches used
	signal CLK_1Hz : STD_LOGIC:='0';
	signal count_clk : INTEGER:=0;
	signal clk_interno : STD_LOGIC;
	signal clk_10ms : STD_LOGIC; -- this clock is 6 milliseconds

	-- Signs for drawing logs and for color.
	signal drawWoods : STD_LOGIC;
	signal woodcolor : STD_LOGIC_VECTOR (11 downto 0);
	
	-- Signals used to draw and know the x-position of the bird.
	signal drawbird : STD_LOGIC;
	signal posXbird : std_logic_vector (10 downto 0);
	
	-- Signals to add up the points and to know if there was a collision to reset the score to 0
	signal score : std_logic := '0';
	signal crash : std_logic := '0';
	-- Signal used for background color
	signal background : std_logic_vector (11 downto 0);
begin
	--Reloj de 1hz
	CLK_DIV: process(clk_interno)
	begin
		if(clk_interno'event and clk_interno='1') then
			if (count_clk = 5000000) then
				count_clk <= 0;
				CLK_1Hz <= not CLK_1Hz;
			else
				count_clk <= count_clk +1;
			end if;
		end if;
	end process;

	-- Here the internal clock (50mhz) is used to obtain a 6ms clock .	
	clkDivider_10ms: clkDivider
	generic map (countLimit => 300000)
	port map (clk => clk_interno,
			  newClk => clk_10ms);
	
	-- This process is responsible for increasing the score and detecting collisions.
	CONT: process(score,crash)
	begin
		if (crash='1') then
			conteo <= (others=>'0');
		elsif (score'event and score='1') then
			if (conteo=999) then
				conteo <= (others=>'0');
			else
				conteo <= conteo + 5;
			end if;
		else
			conteo <= conteo;
		end if;
	end process;
	
	-- From this point we instantiate all the components
			
	-- The component in charge of the bird's movement is instantiated.
	bird: birdMovement
	port map(
		clk => clk,
		reset => crash, -- Crash is used to detect collisions and return the bird to its initial position.
		hcount => hcount,
		vcount => vcount,
		PS2Clk => PS2Clk,
		PS2Data => PS2Data,
		posx => posXbird,
		paintbird => drawbird
	);

	-- background
	background1: degraded
	port map(
		Vcount => vcount,
		RGBout => background
	);
	
	-- Component for display numbers
	BIN2BCD: BIN2BCD_0a999 PORT MAP(
		BIN => conteo,
		BCD2 => centenas,
		BCD1 => decenas,
		BCD0 => unidades
	);
	
	-- Here the driver for the vga display is shown.
	Inst_vga_ctrl_640x480_60Hz: vga_ctrl_640x480_60Hz 
	PORT MAP(
		rst => RST,
		clk => clk_interno,
		rgb_in => rgb_aux3,
		HS => HS,
		VS => VS,
		hcount => hcount,
		vcount => vcount,
		rgb_out => rgb_aux2,
		blank => open
	);

	-- Component for drawing woods
	wood: drawingwoods
	port map(
		hcount => hcount,
		vcount => vcount,
		clk => clk_10ms,
		color => woodcolor,
		paintwood => drawWoods
	);
	
	-- 34 segments displays, names
	Names: drawNames
	Port map(
		hcount => hcount,
		vcount => vcount,
		clk => CLK_1Hz,
		rgb => lettersColor,
		paintLetters => paintNames
	);
	
	-- In this part 3 displays are instantiated to draw on the screen
		
	Display2: Display  
	GENERIC MAP (
		LW => 2,
		DW => 20,
		DL => 35,
		POSX =>400,
		POSY => 0)
	PORT MAP(
		HCOUNT => hcount,
		VCOUNT => vcount,
		VALUE => centenas,
		PAINT => paint2
	);
	
	Display1: Display  
	GENERIC MAP (
		LW => 2,
		DW => 20,
		DL => 35,
		POSX => 430,
		POSY => 0)
	PORT MAP(
		HCOUNT => hcount,
		VCOUNT => vcount,
		VALUE => decenas,
		PAINT => paint1
	);
	
	Display0: Display 
	GENERIC MAP (
		LW => 2,
		DW => 20,
		DL => 35,
		POSX => 460,
		POSY => 0)
	PORT MAP(
		HCOUNT => hcount,
		VCOUNT => vcount,
		VALUE => unidades,
		PAINT => paint0
	);
	-- End of component installation
	
	-- This is used to color the score displays.
	rgb_aux1 <= 
		   "110" when paint2='1' else
	           "101" when paint1='1' else
		   "100" when paint0='1' else
		   "111";

	paintdisplay <= paint2 or paint1 or paint0; -- With this we know if any of the displays are drawn.
	-- Here is chosen the color for each display based on the value of rgb_aux1
	colorDisplays <= (rgb_aux1(2) & rgb_aux1(2) & rgb_aux1(2) & rgb_aux1(2) &
	            rgb_aux1(1) & rgb_aux1(1) & rgb_aux1(1) & rgb_aux1(1) &
	             rgb_aux1(0) & rgb_aux1(0) & rgb_aux1(0) & rgb_aux1(0));
	
	-- Here several conditions are created to know what is being painted on the screen
	-- Then rgb_aux3 receives the corresponding value of the pixel that it has to draw at that moment
	rgb_aux3 <= colorDisplays when (paintdisplay = '1' and paintNames = '0' and drawWoods = '0' and drawbird = '0') else
            lettersColor when (paintdisplay = '0' and paintNames = '1' and drawWoods = '0' and drawbird = '0') else
        	woodcolor when (paintdisplay = '0' and paintNames = '0' and drawWoods = '1' and drawbird = '0') else
			X"000" when (paintdisplay = '0' and paintNames = '0' and drawWoods = '0' and drawbird = '1') else
			background;
			
			
	-- Here the collision of the bird with one of the woods is detected.
	-- crash will only be one when the signals indicating whether a log is drawn and the bird are both active.
	-- In addition to that condition it will only change to one being within the range of the length of the wood.
	-- I.e. in the range between 500 and 540 in X
	crash <= '1' when (drawbird = '1' and drawWoods = '1' and ((posxbird + 15) > "00111110100") and posxbird <= "01000011100") else
		'0';
	-- The score will be marked when the bird arrives in a range between 600 and 640 on x
	score <= '1' when posXbird >= "01010000000" else 
			'0' when posXbird < "01010000000" ; --640
			
	RGB <= rgb_aux2; -- Here we pass to the rgb output the value of the corresponding color to be displayed on the screen.
		    
		    
	-- 50 MHZ clock generator
    process (CLK)
        begin  
            if (CLK'event and CLK = '1') then
                clk_interno <= NOT clk_interno;
            end if;
        end process;
	
end Behavioral;
