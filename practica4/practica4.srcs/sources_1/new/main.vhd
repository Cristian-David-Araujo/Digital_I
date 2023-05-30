library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity main is
    Port ( clk, reset: in std_logic;
		   hsync, vsync: out std_logic;
		   rgb_out: out std_logic_vector(11 downto 0);
           
           PS2Clk, PS2Data: in std_logic);
end main;

architecture Behavioral of main is

    component clkDivider is
        generic (countLimit : integer);
        Port (  clk : in STD_LOGIC;
                newClk : out STD_LOGIC
             );
    end component clkDivider;
    
    component vga_ctrl_640x480_60Hz is
    port(
        rst         : in std_logic;
        clk   : in std_logic;
        rgb_in     : in std_logic_vector(11 downto 0);     
        HS          : out std_logic;
        VS          : out std_logic;
        hcount      : out std_logic_vector(10 downto 0);
        vcount      : out std_logic_vector(10 downto 0);
        rgb_out     : out std_logic_vector(11 downto 0);
        blank       : out std_logic
    );
    end component;
    
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
    
    component degraded is
    port(
        Vcount : in  STD_LOGIC_VECTOR (10 downto 0);
        RGBout : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    type machineMoveBird is (s1, s2, s3, s4);
    signal stateMoveBird : machineMoveBird;
    
    signal posYBird : std_logic_vector (10 downto 0) := "00011010111";
    signal Hcount, Vcount, posXBird:  std_logic_vector (10 downto 0);
	signal RGBin, RGBbackground : STD_LOGIC_VECTOR (11 downto 0);
	signal clk20ns, clk2ms, clk60ms, drawBird, asciiStart, UPBird, DOWNBird, HS : STD_LOGIC;
	signal asciiData : STD_LOGIC_VECTOR (6 downto 0);
begin

    Inst_vga_ctrl_640x480_60Hz: vga_ctrl_640x480_60Hz 
        port map(
            rst => reset,
            clk => clk20ns,
            rgb_in => RGBin,
            HS => hsync,
            VS => vsync,
            hcount => Hcount,
            vcount => Vcount,
            rgb_out => rgb_out,
            blank => open
        );
	

    --Clock 20ns
    process (clk)
        begin  
            if (clk'event and clk = '1') then
                clk20ns <= NOT clk20ns;
            end if;
        end process;
    --Instans of clock
    --Clock 2ms
    clkDivider2ms : clkDivider
        generic map (countLimit => 100000)
        port map(clk => clk20ns,
                newClk => clk2ms);
    --Clock 60ms
    clkDivider60ms : clkDivider
        generic map (countLimit => 30)
        port map(clk => clk2ms,
                newClk => clk60ms);
                         
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

    keyboardPress: process(asciiStart, asciiData, clk2ms)
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
            
            if rising_edge(clk2ms) then 
            if (UPBird = '1') and ((posYBird + 15) <= 463) then
                posYBird <= posYBird + 1;
                UPBird <= '0';
            elsif (DOWNBird = '1') and (posYBird - 8>= 50) then
                posYBird <= posYBird - 1;
                DOWNBird <= '0';
            end if;
            end if;
        end process;
    
    moveBird: process(clk2ms, reset)
        begin
        if reset = '1' then
            posXBird <= (others => '0');
            
        else
            if rising_edge(clk2ms) then 
                if ((posXBird + 15) <= 639) then
                    posXBird <= posXBird + 1;
                else
                    posXBird <= (others => '0');
                end if;
            end if;
        end if;
        end process;
    
    degradade1 : degraded
        port map( Vcount => Vcount,
                  RGBout => RGBbackground);                  
    
    RGBin <= x"000" when drawBird = '1' else
             RGBbackground;
 
end Behavioral;