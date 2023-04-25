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
    --signal FA : STD_LOGIC;
    --signal FB : STD_LOGIC;
    signal en0 : STD_LOGIC;
    signal en1 : STD_LOGIC;
    signal en2 : STD_LOGIC;
    signal sel_ALU : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal dataA : STD_LOGIC_VECTOR (3 downto 0) := "1011"; -- Initial value is 11
    signal dataB : STD_LOGIC_VECTOR (3 downto 0) := "0111"; -- Initial value is 7
    
    signal clk : STD_LOGIC := '0'; -- the clock signal starts at 0
    
    -- Outputs
    signal cout : STD_LOGIC;
    signal displayOut : STD_LOGIC_VECTOR(6 downto 0);
    signal activeDisplay : STD_LOGIC_VECTOR(3 downto 0);

    -- clock period definition
    --constant clk_freq : integer := 10;
    constant clk_period : time := 30 ns; -- 33.3 MHz
    -- this constant is used to generate the clock signal

    signal FAFB : STD_LOGIC_VECTOR(1 downto 0) := "00"; -- this signal is used to control the inputs of the ALU


    -- Procedure to increment a counter
    procedure increment_counter(signal counter : inout STD_LOGIC_VECTOR(2 downto 0)) is
        begin
            if counter = "111" then
                counter <= "000";
            else
                counter <= counter + 1;
            end if;
        end procedure;

    -- Procedure to increment add_A and add_B
    procedure increment(signal add_A : inout STD_LOGIC_VECTOR(2 downto 0); signal add_B : inout STD_LOGIC_VECTOR(1 downto 0);signal FAFB : in STD_LOGIC_VECTOR(1 downto 0)) is
        begin
            if FAFB = "01" then
                add_A <= add_A + 1;
                add_B <= add_B + 1;
            elsif FAFB = "00" then
                add_A <= add_A + 1;
            elsif FAFB = "11" then
                add_B <= add_B + 1;
            end if;
    end procedure;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: completeAssembly port map (
        add_A => add_A,
        add_B => add_B,
        --FA => FA,
        --FB => FB,
        FA => FAFB(1),
        FB => FAFB(0),
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
    
    -- Stimulus process
    -- Using loops, we will test all 8 ALU operations, and in each operation we will test the 4 possible cases, romA and dataB, romA and romB, dataA and dataB, and finally dataA and romB.
    -- FA and FB control the input data, when FA is 0 the input is romA, and when FB is 0 the input is dataB.
    -- So we are going to test all the possible combinations of FA and FB, and we will test all the possible combinations of sel_ALU.
    stim_proc: process
    variable count : integer := 0;
    variable enables : std_logic_vector (2 downto 0) := (others => '0');
    begin

        wait until rising_edge(clk);
        wait until rising_edge(clk);


        -- This loop test all the values of sel_ALU
        for i in 0 to 7 loop
            for j in 0 to 7 loop
            
                -- Here we change the value of sel_ALU in each iteration
                sel_ALU <= std_logic_vector(to_unsigned(i, 3));
                enables := std_logic_vector(to_unsigned(j, 3));
                -- We change the value of add_A and add_B in each iteration so we can test different values
                increment(add_A, add_B, FAFB); -- Here we change the values of add_A and add_B
    
                en0 <= enables(0);
                en1 <= enables(1);
                en2 <= enables(2);
                
                wait until rising_edge(clk);
                wait until rising_edge(clk);
                
                --en0 <= '0';
                --en1 <= '0';
                --en2 <= '1';
                wait until rising_edge(clk);
                --wait until rising_edge(clk);
           end loop;
            
            
        end loop;
        
        FAFB <= FAFB + 1; -- Here we change the values of FA and FB
        dataA <= dataA + 1; -- Here we change the value of dataA
        dataB <= dataB + 1; -- Here we change the value of dataB

       
    end process;

end architecture Behavioral;
