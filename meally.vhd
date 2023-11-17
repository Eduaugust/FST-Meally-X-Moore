-- FILEPATH: /Users/pedronunes/Documents/Ecomp3Ano/UniversityWorks/SistemasDigitais/FST/mealy_fsm.vhd

library ieee;
use ieee.std_logic_1164.all;

entity meally is
    port (
        clk: in std_logic;
        reset: in std_logic;
        input: in std_logic;
        output: out std_logic
    );
end entity meally;

architecture rtl of meally is
    type state_type is (s0, s1, s2, s3);
    signal current_state, next_state: state_type;
begin
    -- State register
    process (clk, reset)
    begin
        if reset = '1' then
            current_state <= s0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    -- Next state logic
    process (current_state, input)
    begin
        case current_state is
            when s0 =>
                if input = '1' then
                    next_state <= s1;
                else
                    next_state <= s0;
                end if;
                output <= '0';
            when s1 =>
                if input = '1' then
                    next_state <= s2;
                else
                    next_state <= s0;
                end if;
                output <= '0';
            when s2 =>
                if input = '1' then
                    next_state <= s3;
                else
                    next_state <= s0;
                end if;
                output <= '1';
            when s3 =>
                if input = '1' then
                    next_state <= s3;
                else
                    next_state <= s0;
                end if;
                output <= '1';
        end case;
    end process;
end architecture rtl;