library ieee;
use ieee.std_logic_1164.all;

entity maquina_estados_mealy is
    port(
        clk, reset, entrada: in std_logic;
        saida: out std_logic
    );
end entity maquina_estados_mealy;

architecture comportamento of maquina_estados_mealy is

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
                    saida <= '0';
                    proximo_estado <= B;
                else
                    saida <= '0';
                    proximo_estado <= A;
                end if;
            when B =>
                if entrada = '1' then
                    saida <= '1';
                    proximo_estado <= C;
                else
                    saida <= '0';
                    proximo_estado <= A;
                end if;
            when C =>
                if entrada = '1' then
                    saida <= '1';
                    proximo_estado <= B;
                else
                    saida <= '0';
                    proximo_estado <= A;
                end if;
        end case;
    end process combinacional;
end architecture comportamento;