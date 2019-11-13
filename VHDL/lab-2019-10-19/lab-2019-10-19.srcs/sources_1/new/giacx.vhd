library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegisterSIPO is
    Generic(
      SR_WIDTH  : integer:=4
    );
    Port(
      reset    : in std_logic;
      clk      : in std_logic;

      data_in    : in std_logic;
      data_out  : out std_logic_vector(SR_WIDTH-1 DOWNTO 0)

    );
  end ShiftRegisterSIPO;
architecture behavioural of ShiftRegisterSIPO is
    --inserire signal qui per il behavioural
    signal data : std_logic_vector(0 to SR_WIDTH+1);
    --inserisco il component del flip flop
    component ff_d is
        Port(
            reset    : in std_logic;
            clk        : in std_logic;

            d     :    in std_logic;
            q     : out std_logic
        );
    end component;
begin
    --collego "a mano" il primo bit del flip flop in modo tale da semplificare il for successivo
    data(0) <= data_in;
    --faccio un for per istanziare SW_WIDTH flip flops, poi vado a collegare il Q del precedente con il D del successivo
    shift_inst :  for I in 0 to SR_WIDTH-1 generate
    ff_inst : ff_d port map(
            reset => reset,
            clk => clk,
            d => data(I),
            q => data(I+1)
    );
    end generate;
    -- ora colleghiamo le uscite q dei flip flop con il nostro data_out dello shift
    GEN_OUT_SIG :  for cnt in 0 to SR_WIDTH-1 generate
        data_out(cnt) <= data(cnt+1);
    end generate;

end behavioural;
