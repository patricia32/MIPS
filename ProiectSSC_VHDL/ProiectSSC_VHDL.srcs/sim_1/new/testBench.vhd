----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2022 04:22:27 PM
-- Design Name: 
-- Module Name: testBench - Behavioral
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

entity testBench is

     -- Port (  );
end testBench;

architecture Behavioral of testBench is
component fullAdder_16bit is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sum : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end component;
component subtract_16bit is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sub : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end component;
component rightArithmShift_16biti is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;
component rightLogicalShift is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;
component leftLogicalShift is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;
component rightLogicalRot is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;
component leftLogicalRot is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;
component ORgate_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;
component NORgate_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component ANDgate_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component NANDgate_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component XORgate_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component NXORgate_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component NOTgate_16biti is
    Port ( a : in STD_LOGIC_VECTOR(15 DOWNTO 0);
           y : out STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;

component pozORneg is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC);
end component;

component TESTeg is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC);
end component;

component TESTgt is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC);
end component;

component TESTlt is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC);
end component;
signal ALUout, ALUinput2, res: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal digits, ADDres, SUBres, rightArithShift, leftLogShift, rightLogShift, rightLogRot, leftLogRot, ORres, NORres : STD_LOGIC_VECTOR (15 downto 0) := x"0000";
signal ANDres, NANDres, XORres, NXORres, NOTres:  STD_LOGIC_VECTOR (15 downto 0) := x"0000";
signal coutSUB, coutADD, pozORnegres, TESTegRes, TESTgtRes, TESTltRes: STD_LOGIC;
signal RD1, RD2, sum: STD_LOGIC_VECTOR (15 downto 0);
signal cin, cout: STD_LOGIC; 
begin
    RD1 <= x"0012";
    RD2 <= x"0034";
        pm: fullAdder_16bit port map('0', RD1, RD2, ADDRes, cout);
      subtract: subtract_16bit port map( '0', RD1, RD2, SUBres, coutSUB);-- 2
      rightArithmShift_pm: rightArithmShift_16biti port map(RD1, rightArithShift);--3
      
      -- logice
      leftLogicalShift_pm: leftLogicalShift port map(RD1, leftLogShift);  -- 4
      rightLogicalShift_pm: rightLogicalShift port map(RD1, rightLogShift);  -- 5
      leftLogicalRot_pm: leftLogicalRot port map (RD1, leftLogRot);  --6 
      rightLogicalRot_pm: rightLogicalRot port map (RD1, rightLogRot);  --7 
      
      ORgate_16bit_pm: ORgate_16bit port map(RD1, RD2, ORres);   -- 8
      NORgate_16bit_pm: NORgate_16bit port map(RD1, RD2, NORres);  --9
      ANDgate_16bit_pm: ANDgate_16bit port map(RD1, RD2, ANDres);  -- 10
      NANDgate_16bit_pm: NANDgate_16bit port map(RD1, RD2, NANDres);    -- 11
      XORgate_16bit_pm: XORgate_16bit port map(RD1, RD2, XORres);   -- 12
      NXORgate_16bit_pm: NXORgate_16bit port map(RD1, RD2, NXORres);    -- 13
      NOTgate_16bit_pm: NOTgate_16biti port map(RD1, NOTres);   -- 14
      
      -- testare
      pozORneg_pm: pozORneg port map(RD1, pozORnegres); -- 15
        
      TESTeg_pm: TESTeg port map(RD1, RD2, TESTegRes);   -- 16
      TESTgt_pm: TESTgt port map(RD1, RD2, TESTgtRes);   -- 17
      TESTlt_pm: TESTlt port map(RD1, RD2, TESTltRes);   -- 18
end Behavioral;
