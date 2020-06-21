library ieee;
    use ieee.std_logic_1164.all;
    use work.somador.all;

entity exemplo_de_utilizador_de_pacote is
    port (
        entrada1   : in integer;
        entrada2    :in integer;
        saida : out integer
    );
end entity;

architecture rtl of exemplo_de_utilizador_de_pacote is
    signal   entrada_a :integer;
    signal   entrada_b :integer;
    signal sinal_saida :integer;
    

begin


        


           entrada_a <=entrada1;
           entrada_b<=entrada2;
            sinal_saida <= soma (entrada_a, entrada_b);


    saida <= sinal_saida;

end architecture;
