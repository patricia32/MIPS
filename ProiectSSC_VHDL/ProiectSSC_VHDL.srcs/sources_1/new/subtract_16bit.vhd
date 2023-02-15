----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2022 08:25:43 PM
-- Design Name: 
-- Module Name: subtract_16bit - Behavioral
-- Project Name: 
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

entity subtract_16bit is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sub : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end subtract_16bit;

architecture Behavioral of subtract_16bit is
component fullAdder_16bit is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sum : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end component;

component NOTgate_16biti is
    Port ( a : in STD_LOGIC_VECTOR(15 DOWNTO 0);
           y : out STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;
signal NOTb, FINALb: STD_LOGIC_VECTOR (15 downto 0);
begin
    NOTpm: NOTgate_16biti port map(b, NOTb);
    FOR_B_pm: fullAdder_16bit port map('0', x"0001", NOTb, FINALb, cout);
    FULLADDERpm: fullAdder_16bit port map('0', a, FINALb, sub, cout);
end Behavioral;
