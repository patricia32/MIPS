----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2022 10:40:42 PM
-- Design Name: 
-- Module Name: TESTgt - Behavioral
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

entity TESTgt is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC);
end TESTgt;

architecture Behavioral of TESTgt is
component subtract_16bit is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sub : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end component;

component pozORneg is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC);
end component;

signal SUBres: STD_LOGIC_VECTOR (15 downto 0);
signal cout, y1: STD_LOGIC;
begin
    SUB_pm: subtract_16bit port map( '0', a, b,SUBres, cout);
    pozORneg_pm: pozORneg port map(SUBres, y1);
   y <= not y1;
end Behavioral;
