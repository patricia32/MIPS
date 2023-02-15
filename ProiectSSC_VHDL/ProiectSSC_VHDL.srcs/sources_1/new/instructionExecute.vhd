----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 06:37:02 PM
-- Design Name: 
-- Module Name: EX - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instructionExecute is
  Port ( PC:  in STD_LOGIC_VECTOR(15 downto 0);
         RD1: in STD_LOGIC_VECTOR(15 downto 0);
         RD2: in STD_LOGIC_VECTOR(15 downto 0);
         ALUCTRL: in STD_LOGIC_VECTOR(2 DOWNTO 0);
         func: in STD_LOGIC_VECTOR(2 downto 0);
         BranchAddress: out STD_LOGIC_VECTOR(15 downto 0);
         ALURes: out STD_LOGIC_VECTOR(15 downto 0); 
         Zero: out STD_LOGIC);
end instructionExecute;

architecture Behavioral of instructionExecute is
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


begin
      adder: fullAdder_16bit port map('0', RD1, RD2, ADDres, coutADD); -- 1
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
     
     process(ALUCTRL, RD1, ALUinput2, func)
     begin
        if ALUCTRL = "000" THEN   -- sub
            case func is
                when "000" => ALUout <= ADDres;
                when "001" => ALUout <= SUBres;
                when "010" => ALUout <= rightArithShift;
                when "011" => ALUout <= leftLogShift;
                when "100" => ALUout <= rightLogShift;
                when "101" => ALUout <= leftLogRot;
                when "110" => ALUout <= rightLogRot;
                when "111" => ALUout <= ANDres;        
            end case;
        end if;
        if ALUCTRL = "001" then
            case func is
                    when "000" => ALUout <= NANDres;
                    when "001" => ALUout <= ORres;
                    when "010" => ALUout <= NORres;
                    when "011" => ALUout <= XORres;
                    when "100" => ALUout <= NXORres;
                    when "101" => ALUout <= NOTres;
                    when "110" => ALUout <= "000000000000000" & TESTegRes;
                    when "111" => ALUout <= "000000000000000" & TESTgtRes;        
                end case;
        end if;
        if ALUCTRL = "010" then
            case func is
                    when "000" => ALUout <= "000000000000000" & TESTltRes;
                    when "001" => ALUout <= "000000000000000" & pozORnegres;
                    when others => ALUout <= "XXXXXXXXXXXXXXXX" ;                      
                end case;
        end if;
       
        if ALUCTRL = "011" then
            case func is
                    when "000" => ALUout <= "000000000000000" & TESTltRes; -- ble
                    when others => ALUout <= "XXXXXXXXXXXXXXXX" ;                      
                end case;
        end if;
        
        BranchAddress <= PC + 1 + RD1;
        if ALUCTRL = "011" and func = "000" and TESTltRes = '1' then 
            zero <= '1';
        else
            zero <= '0';
        end if;
        ALURes <= ALUOut;
        
     end process;     
end Behavioral;