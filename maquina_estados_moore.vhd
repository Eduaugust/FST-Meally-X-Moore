library ieee;
use ieee.std_logic_1164.all;

entity maquina_estados_moore is
    port(
        clk, reset, entrada: in std_logic;
        saida: out std_logic
    );
end entity maquina_estados_moore;

architecture comportamento of maquina_estados_moore is

type estado is (A,B,C);
signal estado_atual, proximo_estado: estado;

begin

    -- processo para definição do sincronismo da FSM
    sincrono: process(clk, reset)
    begin
        if reset = '1' then
            estado_atual <= A;
        elsif rising_edge(clk) then
            estado_atual <= proximo_estado;
        end if;
    end process sincrono;

    -- processo para a lógica combinacional da máquina
    combinacional: process(estado_atual, entrada)
    begin
        case estado_atual is
            when A =>
                if entrada = '1' then
                    proximo_estado <= B;
                else
                    proximo_estado <= A;
                end if;
                saida <= '0';
            when B =>
                if entrada = '1' then
                    proximo_estado <= C;
                else
                    proximo_estado <= A;
                end if;
                saida <= '0';
            when C =>
                if entrada = '1' then
                    proximo_estado <= C;
                else
                    proximo_estado <= A;
                end if;
                saida <= '1';
        end case;
    end process combinacional;
end architecture comportamento;