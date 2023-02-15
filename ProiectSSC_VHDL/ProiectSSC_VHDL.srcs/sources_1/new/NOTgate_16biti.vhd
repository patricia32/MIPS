----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2022 08:33:26 PM
-- Design Name: 
-- Module Name: NOTgate_1bit - Behavioral
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

entity NOTgate_16biti is
    Port ( a : in STD_LOGIC_VECTOR(15 DOWNTO 0);
           y : out STD_LOGIC_VECTOR(15 DOWNTO 0));
end NOTgate_16biti;

architecture Behavioral of NOTgate_16biti is
component NOTgate_4biti is
    Port ( a : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           y : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;
begin
    pm0: NOTgate_4biti port map(a(3 downto 0), y(3 downto 0));
    pm1: NOTgate_4biti port map(a(7 downto 4), y(7 downto 4));
    pm2: NOTgate_4biti port map(a(11 downto 8), y(11 downto 8));
    pm3: NOTgate_4biti port map(a(15 downto 12), y(15 downto 12));
     

end Behavioral;
