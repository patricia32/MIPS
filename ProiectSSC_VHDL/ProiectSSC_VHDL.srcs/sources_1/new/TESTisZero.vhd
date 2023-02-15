----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2022 07:40:12 AM
-- Design Name: 
-- Module Name: TESTisZero - Behavioral
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

entity TESTisZero is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC);
end TESTisZero;

architecture Behavioral of TESTisZero is
component mux21_1bit is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sel : in STD_LOGIC;
           out1 : out STD_LOGIC);
end component;
signal ORres: STD_LOGIC;
begin

    ORres <= a(0) or a(1) or a(2) or a(3) or a(4) or a(5) or a(6) or a(7) or a(8) or a(9) or a(10) or a(11) or a(12) or a(13) or a(14) or a(15);
    MUXpm: mux21_1bit port map( '0', '1', ORres, y);
    
end Behavioral;
