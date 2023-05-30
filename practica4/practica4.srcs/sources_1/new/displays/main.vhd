library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity main is
    Port ( clk, reset: in std_logic;
		   hcount, vcount: in std_logic_vector(10 downto 0);
           
           PS2Clk, PS2Data: in std_logic;
           posx : out std_logic_vector (10 downto 0);
           paintbird: out std_logic
           );

end main;

architecture Behavioral of main is

    component clkDivider is
        generic (countLimit : integer);
        Port (  clk : in STD_LOGIC;
                newClk : out STD_LOGIC
             );
    end component clkDivider;
    
    component VGACounter is
        Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PBTON : in  STD_LOGIC;
           HS : out  STD_LOGIC;
           VS : out  STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (11 downto 0));
    end component VGACounter;
    
    component keyboard2ASCII is
    port(
        clk        : IN  STD_LOGIC;                     --system clock input
        ps2_clk    : IN  STD_LOGIC;                     --clock signal from PS2 keyboard
        ps2_data   : IN  STD_LOGIC;                     --data signal from PS2 keyboard
        ascii_new  : OUT STD_LOGIC;                     --output flag indicating new ASCII value
        ascii_code : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    end component;

    component draw_Bird is
    port(
        clk : in  STD_LOGIC;
        posX : in  STD_LOGIC_VECTOR (10 downto 0);
        posY : in  STD_LOGIC_VECTOR (10 downto 0);
        Hcount : in  STD_LOGIC_VECTOR (10 downto 0);
        Vcount : in  STD_LOGIC_VECTOR (10 downto 0);
        draw : out  STD_LOGIC
    );
    end component;
    
    signal posYBird : std_logic_vector (10 downto 0) := "00011010111";
    signal posXBird:  std_logic_vector (10 downto 0);
	signal RGBin : STD_LOGIC_VECTOR (11 downto 0);
	signal clk20ns, clk10ms, clk60ms, drawBird, asciiStart, UPBird, DOWNBird : STD_LOGIC;
	signal asciiData : STD_LOGIC_VECTOR (6 downto 0);
begin

    --Clock 20ns
    process (clk)
        begin  
            if (clk'event and clk = '1') then
                clk20ns <= NOT clk20ns;
            end if;
        end process;
    --Instans of clock
    --Clock 60ms
    clkDivider10ms : clkDivider
        generic map (countLimit => 500000)
        port map(clk => clk20ns,
                newClk => clk10ms);
    --Clock 60ms
    clkDivider60ms : clkDivider
        generic map (countLimit => 6)
        port map(clk => clk10ms,
                newClk => clk60ms);
	
    --Instantiation of components to be used                 
    draw_Bird1: draw_Bird
        port map( clk => clk60ms,
                  posX => posXBird,
                  posY => posYBird,
                  Hcount => Hcount,
                  Vcount => Vcount,
                  draw => drawBird);

    keyboard: keyboard2ASCII
        port map( clk => clk20ns,
                  ps2_clk => PS2Clk,
                  ps2_data => PS2Data,
                  ascii_new => asciiStart,
                  ascii_code => asciiData);
	    
    --Checking of key presses and also movement on the Y axis of the character
    keyboardPress: process(asciiStart, asciiData, clk10ms)
        begin
            if (asciiStart = '1') then
                if (asciiData = x"66" or asciiData = x"46") then --fF
                    UPBird <= '1';
                    DOWNBird <= '0';
                elsif (asciiData = x"48" or asciiData = x"68") then --Hh
                    DOWNBird <= '1';
                    UPBird <= '0';
                end if;
            end if;
            
            if rising_edge(clk10ms) then 
            if (UPBird = '1') and ((posYBird + 15) <= 463) then
                posYBird <= posYBird + 4;
                UPBird <= '0';
            elsif (DOWNBird = '1') and (posYBird - 8>= 50) then
                posYBird <= posYBird - 4;
                DOWNBird <= '0';
            end if;
            end if;
        end process;
		    
     --X-axis motion generator
     moveBird: process(clk10ms, reset)
        begin
        if reset = '1' then
            posXBird <= (others => '0');
            
        else
            if rising_edge(clk10ms) then 
                if ((posXBird + 15) <= 639) then
                    posXBird <= posXBird + 4;
                else
                    posXBird <= (others => '0');
                end if;
            end if;
        end if;
        end process;

    paintBird <= drawBird;
    posX <= posXbird;
    RGBin <= x"000" when drawBird = '1' else
            x"FFF";
 
end Behavioral;
