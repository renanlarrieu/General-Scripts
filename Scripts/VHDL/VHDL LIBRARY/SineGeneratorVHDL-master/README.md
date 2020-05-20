# Sine Generator for VHDL Signal

This program generates VHDL-code to a file. Within this code a VHDL signal is frequently assigned with a vector of bits to represent a sampled sine wave.

## Purpose

Use the generated VHDL-code to test your own VHDL-components in simulation software. Within a VHDL-testbench, feed the generated signal to your component, such as a digital filter. See if it works as expected.

## Installation

To build application, use `make` or compile `singen.c` manually.

## Usage

USAGE: `./singen (<frequency[Hz]>) (<sampleRate[Hz]>) (<amplitude>) (<bitWidth>)`  
Examples: `./singen 300 50000 1 16 -o tb.vhd` or simply  `./singen -d`

All arguments are optional. Please respect argument order and use all arguments left from the most right used argument.

### Flags:  
`-o <filename>` : name the output file (default: \"singen.vhd\")  
`-s <signalname>` : name the VHDL signal (default: \"mySignal\")  
`-u` : convert to unsigned values (default: signed)  
`-a` : append file (default: overwriting)  
`-d` : debug output  
`-<other>` : help  

### Parameters:

| Parameter | Range | Unit | Default |
|---|:--:|---|---|
| Frequency | 0 - 4.294*10^9 | \[Hz\] | 100 |
|Amplitude range| 0.0 - 1.0 |  | 1.0 |
|Sample rate range| 0 - 4.294e9 | \[Hz\] | 1000 |
|Supported Bit widths| 8/16/32/64 |  | 16 |
#### Illustration:
![singen](https://www.klemd.com/wp-content/uploads/2018/01/singen.png)

## Contributing

Don't hesitate to [open GitHub Issues](https://github.com/alexg-k/SineGeneratorVHDL/issues) for any problem or question you may have.

All contributions are welcome.

## Author
- Alexander Klemd [github/alexg-k](https://github.com/alexg-k)

## License

SineGeneratorVHDL is licensed under the [GNU GPLv3](LICENSE).
