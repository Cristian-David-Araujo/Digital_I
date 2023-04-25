library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


--========================================================================
--This code in VHDL is for implement of a ALU and an 7 segments display with next operation
-- if operationSelect = "000" then operationOut <= A or B
-- if operationSelect = "001" then operationOut <= A + B
-- if operationSelect = "010" then operationOut <= not B
-- if operationSelect = "011" then operationOut <= A + 2
-- if operationSelect = "100" then operationOut <= A - 2, but if A < 2 then operationOut <= 0;
-- if operationSelect = "101" then operationOut <= show an "-" in the display
-- if operationSelect = "110" then operationOut <= B*2
-- if operationSelect = "111" then operationOut <= A + B, but if A + B > 24 then operationOut <= 0;
--========================================================================

entity completeAssembly_tb is
end completeAssembly_tb;


-- Intructions for the testbench
-- Plan a strategy to automate testing by simulation. You must consider the size of input and output ports to define the number of test vectors needed to fully verify your circuit.
-- The testBench for the circuit simulation must allow a complete verification of the circuit. For this, the test vectors must be generated and the automatic verification must be performed by means of a verifier module.
architecture Behavioral of completeAssembly_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component completeAssembly is
        port(add_A: in STD_LOGIC_VECTOR(2 downto 0);
        add_B : in STD_LOGIC_VECTOR(1 downto 0);
        FA, FB, en0, en1, en2 : in STD_LOGIC;
        sel_ALU : in STD_LOGIC_VECTOR (2 downto 0);
        dataA, dataB : in STD_LOGIC_VECTOR (3 downto 0);
        clk : in STD_LOGIC;
        -- Outputs
        cout : out STD_LOGIC;
        displayOut : out STD_LOGIC_VECTOR(6 downto 0);
        activeDisplay : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    -- Inputs
    signal add_A : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal add_B : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
    signal FA : STD_LOGIC := '0';
    signal FB : STD_LOGIC := '0';
    signal en0 : STD_LOGIC := '1';
    signal en1 : STD_LOGIC := '1';
    signal en2 : STD_LOGIC := '1';
    signal sel_ALU : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal dataA : STD_LOGIC_VECTOR (3 downto 0) := "1000"; -- Initial value is 8
    signal dataB : STD_LOGIC_VECTOR (3 downto 0) := "0101"; -- Initial value is 5
    
    signal clk : STD_LOGIC := '0'; -- the clock signal starts at 0
    
    -- Outputs
    signal cout : STD_LOGIC;
    signal displayOut : STD_LOGIC_VECTOR(6 downto 0);
    signal activeDisplay : STD_LOGIC_VECTOR(3 downto 0);

    -- clock period definition
    constant clk_period : time := 30 ns; -- 33.33 MHz clock frequency
    -- this constant is used to generate the clock signal

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: completeAssembly port map (
        add_A => add_A,
        add_B => add_B,
        FA => FA,
        FB => FB,
        en0 => en0,
        en1 => en1,
        en2 => en2,
        sel_ALU => sel_ALU,
        dataA => dataA,
        dataB => dataB,
        clk => clk,
        cout => cout,
        displayOut => displayOut,
        activeDisplay => activeDisplay
    );

    -- clock generation
    clk <= not clk after clk_period / 2; -- 50% duty cycle clock
    
    -- testbench stimulus process
    process is
        variable FAB : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
    begin
        wait for 100 ns;
        -- First we use a for loop to test all the possible values of the selection of the ALU
        for i in 0 to 7 loop
            sel_ALU <= std_logic_vector(to_unsigned(i, 3)); -- This way we can test all the possible values of the ALU selection
            -- Now in each operation we test the possible 4 cases of the inputs A and B for the ALU 
            -- romA and dataB: FA = '0', FB = '0'
            -- romA and romB: FA = '0', FB = '1'
            -- dataA and dataB: FA = '1', FB = '0'
            -- dataA and romB: FA = '1', FB = '1'

            -- loop to test all the 4 cases of the inputs A and B for the ALU
            while FAB < "11" loop
                FA <= FAB(1);
                FB <= FAB(0);
                FAB := FAB + 1; -- We increment the value of the variable FAB to test all the possible values
                wait for 100 ms; -- We wait 100 ms to see the result in the display
            end loop;
            -- We increment this signals to test different values
            add_A <= add_A + 1;
            add_B <= add_B + 1; 
            dataA <= dataA + 1; 
            dataB <= dataB + 1; 
            wait until rising_edge(clk);

        end loop;
        wait;

    end process;
   




end architecture Behavioral;
