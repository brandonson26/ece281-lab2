----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Brandon Son
-- 
-- Create Date: 02/27/2024
-- Design Name: sevenSegDecoder
-- Module Name: sevenSegDecoder_tb - Behavioral
-- Project Name: sevenSegDecoder
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;

architecture test_bench of sevenSegDecoder_tb is
    component sevenSegDecoder is
        port ( i_D : in std_logic_vector(3 downto 0);
               o_S : out std_logic_vector(6 downto 0));
        
    end component sevenSegDecoder;
    
    signal w_7SD_En_n : std_logic;
    signal sw : std_logic_vector(3 downto 0) := "0000";
    signal seg : std_logic_vector(6 downto 0) := "0000000";

begin
    sevenSegDecoder_inst : sevenSegDecoder port map (
        i_D => sw,
        o_S => seg
    );
    
    test_process : process
    begin
        sw <= x"0"; wait for 20 ns;
            assert seg = "1000000" report "bad 0" severity failure;
        sw <= x"1"; wait for 20 ns;
            assert seg = "1111001" report "bad 1" severity failure;
        sw <= x"2"; wait for 20 ns;
            assert seg = "0100100" report "bad 2" severity failure;
        sw <= x"3"; wait for 20 ns;
            assert seg = "0110000" report "bad 3" severity failure;
        sw <= x"4"; wait for 20 ns;
            assert seg = "0011001" report "bad 4" severity failure;
        sw <= x"5"; wait for 20 ns;
            assert seg = "0010010" report "bad 5" severity failure;
        sw <= x"6"; wait for 20 ns;
            assert seg = "0000010" report "bad 6" severity failure;
        sw <= x"7"; wait for 20 ns;
            assert seg = "1111000" report "bad 7" severity failure;
        sw <= x"8"; wait for 20 ns;
            assert seg = "0000000" report "bad 8" severity failure;
        sw <= x"9"; wait for 20 ns;
            assert seg = "0011000" report "bad 9" severity failure;
        sw <= x"A"; wait for 20 ns;
            assert seg = "0001000" report "bad A" severity failure;
        sw <= x"B"; wait for 20 ns;
            assert seg = "0000011" report "bad B" severity failure;
        sw <= x"C"; wait for 20 ns;
            assert seg = "0100111" report "bad C" severity failure;
        sw <= x"D"; wait for 20 ns;
            assert seg = "0100001" report "bad D" severity failure;
        sw <= x"E"; wait for 20 ns;
            assert seg = "0000110" report "bad E" severity failure;
        sw <= x"F"; wait for 20 ns;
            assert seg = "0001110" report "bad F" severity failure;
        
    wait;
    end process;

end test_bench;
