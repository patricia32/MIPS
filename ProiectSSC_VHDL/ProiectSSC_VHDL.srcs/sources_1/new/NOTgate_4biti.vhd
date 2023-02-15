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

entity NOTgate_4biti is
    Port ( a : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           y : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end NOTgate_4biti;

architecture Behavioral of NOTgate_4biti is
component NOTgate_1bit is
    Port ( a : in STD_LOGIC;
           y : out STD_LOGIC);
end component;
begin
    pm0: NOTgate_1bit port map(a(0), y(0));
    pm1: NOTgate_1bit port map(a(1), y(1));
    pm2: NOTgate_1bit port map(a(2), y(2));
    pm3: NOTgate_1bit port map(a(3), y(3));
     

end Behavioral;
