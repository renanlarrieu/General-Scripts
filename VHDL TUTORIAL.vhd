--Tutorial VHDL

-- enumerated types

bit {0,1}

boolean {false,true}

character {"Qualquer caractere entre os definidos pela ASCII")

-- range types

integer --todos os numeros entre -2bi até +2bi

real --todos os numeros 

-- physical types

time 

-- vector types

palavra is string 

vector_A is bit_vector(7 downto 0); --cria um vetor com 8 bits

vector_A(0); --acessa o primeiro bit do vetor de 8 bits

-- User-Defined enumerated types;

signal = Sig1

type signal_types is (signal1,signal2,signal3,....);

-- Array type
              
--name = block_8x16;
--range = 0 to 7;
--element_type = bit_vector (15 downto 0);
			  
type block_8x16 is array ((0 to 7)) bit_vector((15 downto 0));

signal my array : block_8x16;

-- The entity

entity entity_name is
    port ( port_name : in std_ulogic;
	       port_name2 : out std_ulogic;
		   
end entity;



-- Entity example with systems:


--system1
entity system1 is
    port ( X, Y : in bit;
		   Z    : out bit);
		   
end entity;

--system2

entity system2 is
    port (Bus_In : in bit_vector(31 downto 0);
	      Bus_Out : out bit_vector(31 downto 0));
		  
end entity;







		  








	