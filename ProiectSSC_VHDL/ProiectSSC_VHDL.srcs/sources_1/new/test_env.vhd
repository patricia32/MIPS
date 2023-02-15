library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_env is
   Port ( clk : in STD_LOGIC;
          btn : in STD_LOGIC_VECTOR (4 downto 0);
          sw : in STD_LOGIC_VECTOR (15 downto 0);
          led : out STD_LOGIC_VECTOR (15 downto 0);
          an : out STD_LOGIC_VECTOR (3 downto 0);
          cat : out STD_LOGIC_VECTOR (6 downto 0));
end test_env;

architecture Behavioral of test_env is
 component MPG
   port(btn: in STD_LOGIC;
       clock: in STD_LOGIC;
       en: out STD_LOGIC);
 end component;
 
  component SSD
    port( digits : in STD_LOGIC_VECTOR (15 downto 0);
          clk : in STD_LOGIC;
          cat : out STD_LOGIC_VECTOR (6 downto 0);
          an : out STD_LOGIC_VECTOR (3 downto 0));
  end component;
  
  component instructionFetch is
    Port ( jumpAddress: in STD_LOGIC_VECTOR(15 downto 0);
           branchAddress: in STD_LOGIC_VECTOR(15 downto 0);
           jump: in STD_LOGIC;
           PCsrc: in STD_LOGIC;
           clk: in STD_LOGIC;
           reset: in STD_LOGIC;
           enable: in STD_LOGIC;
           PC: out STD_LOGIC_VECTOR(15 downto 0);
           instruction: out STD_LOGIC_VECTOR(15 downto 0));
  end component;
  
  component instructionDecode is
      Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           instruction : in STD_LOGIC_VECTOR (12 downto 0);
           wd : in STD_LOGIC_VECTOR (15 downto 0);
           regWrite : in STD_LOGIC;
           func : out STD_LOGIC_VECTOR (2 downto 0));
  end component;
  
  component instructionExecute is
    Port ( PC:  in STD_LOGIC_VECTOR(15 downto 0);
           RD1: in STD_LOGIC_VECTOR(15 downto 0);
           RD2: in STD_LOGIC_VECTOR(15 downto 0);
           ALUctrl: in STD_LOGIC_VECTOR(2 DOWNTO 0);
           func: in STD_LOGIC_VECTOR(2 downto 0);
           BranchAddress: out STD_LOGIC_VECTOR(15 downto 0);
           ALURes: out STD_LOGIC_VECTOR(15 downto 0); 
           Zero: out STD_LOGIC);
  end component;
  
  component memory is
       Port (rd1_code: in STD_LOGIC_VECTOR (2 downto 0);
             rd2_code :in STD_LOGIC_VECTOR (2 downto 0);
             MemWrite : in STD_LOGIC;
             ALUResIn : in STD_LOGIC_VECTOR (15 downto 0);
             RD2 : in STD_LOGIC_VECTOR (15 downto 0);
             MemData : out STD_LOGIC_VECTOR (15 downto 0);
             MemDataRD1 : out STD_LOGIC_VECTOR (15 downto 0);
             MemDataRD2 : out STD_LOGIC_VECTOR (15 downto 0);
             ALUResOut : out STD_LOGIC_VECTOR (15 downto 0);
             enable : in STD_LOGIC;
             clk : in STD_LOGIC);
  end component;
  
  component MainUnit is
      Port ( Instruction : in STD_LOGIC_VECTOR (2 downto 0);
             RegDst : inout STD_LOGIC;
             RegOp : inout STD_LOGIC;
             ALUSrc : inout STD_LOGIC;
             Branch : inout STD_LOGIC;
             Jump : inout STD_LOGIC;
             ALUOp : inout STD_LOGIC_VECTOR(2 downto 0);
             MemWrite : inout STD_LOGIC;
             MemtoReg : inout STD_LOGIC;
             RegWrite : inout STD_LOGIC);
  end component;

      signal enable, resetEnable, MemToReg, Branch, RegWrite, RegDst, RegOp, ALUSrc, Zero, MemWrite, PCSrc , Jump: STD_LOGIC;
      signal MemDataRD1, MemDataRD2, digits, JumpAddress, PCcounter, instruction, WriteData, RD1, RD2, BranchAddress, ALURes, ALUResOut,  MemData:  STD_LOGIC_VECTOR(15  DOWNTO 0); 
      signal func,  ALUOp:  STD_LOGIC_VECTOR(2  DOWNTO 0);
   
begin
        
        IFportmap: instructionFetch port map(JumpAddress, BranchAddress, Jump, PCSrc, clk, resetEnable, enable, PCcounter, instruction);
        IDportmap: instructionDecode port map(clk, enable, instruction(12 downto 0), WriteData, RegWrite, func);
        MainUnitportmap: MainUnit port map(Instruction(15 downto 13), RegDst, RegOp, ALUSrc, Branch, Jump, ALUOp, MemWrite, MemToReg, RegWrite);
        EXportmap: instructionExecute port map(PCcounter, MemDataRD1, MemDataRD2, ALUOp, func, BranchAddress, ALURes, Zero);
        MEMportmap: memory port map(Instruction(12 downto 10), Instruction(9 downto 7), MemWrite, ALURes, RD2, MemData, MemDataRD1, MemDataRD2, ALUResOut, enable, clk);
     
         process(MemToReg, ALURes, MemData, PCcounter)
           begin
               if MemToReg = '0' then
                   WriteData <= ALURes;
               else
                   WriteData <= MemData;
               end if;
           end process;
       
       -- BRANCH
           PCSrc <= Branch and zero;
                 
       -- JUMP
           JumpAddress <= PCcounter(15 downto 13) & Instruction(12 downto 0);
         
         -- ssd
         with sw(15 downto 13) select
             digits  <= MemDataRD1 when "100",
             MemDataRD2 when "110",
             ALURes when "111",
             WriteData when "000",
             (others => 'X') when others;
         
         SSDportmap: SSD port map(digits, clk, cat, an);
         MPG1portmap: MPG port map(btn(0), clk, enable);
         MPG2portmap: MPG port map(btn(1), clk, resetEnable);

end Behavioral;

