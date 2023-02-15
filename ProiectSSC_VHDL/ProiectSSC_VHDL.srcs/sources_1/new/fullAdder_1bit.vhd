----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2022 09:45:10 AM
-- Design Name: 
-- Module Name: fullAdder_1bit - Behavioral
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

entity fullAdder_1bit is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
end fullAdder_1bit;

architecture Behavioral of fullAdder_1bit is
component ORgate3 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           y : out STD_LOGIC);
end component;
component XORgate3 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           y : out STD_LOGIC);
end component;
component ANDgate is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           y : out STD_LOGIC);
end component;
signal abAND, acinAND, bcinAND: STD_LOGIC;
begin
    sumPortMap: XORgate3 port map(a, b, cin, sum);
    a_and_b: ANDgate port map(a, b, abAND);
    a_and_cin: ANDgate port map(a, cin, acinAND);
    b_and_cin: ANDgate port map(b, cin, bcinAND);
    coutPortMap: ORgate3 port map(abAND, acinAND, bcinAND, cout);
    

end Behavioral;
