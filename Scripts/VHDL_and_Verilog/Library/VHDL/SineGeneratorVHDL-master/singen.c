/***
 * Copyright (C) 2018 Alexander Klemd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
***/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define PI 3.14159265


int main(int argc, char const *argv[])
{
  /******************** Initialization and Checks ********************/

  // Check if system has assumed data type sizes. If not then the programm will not function properly
  if (sizeof(short) != 2 || sizeof(int) != 4 || sizeof(long long) != 8)
  {
    fprintf(stderr, "Incompatible System for this programm (Invalid DataType Sizes)\n");
    return 0;
  }

  // Check parameter count and initialize with variables with command parameters

  char *filename = NULL;
  char *signalname = NULL;
  unsigned int frequency = 30;
  unsigned int sampleRate = 10000;
  double amplitude = 1.0;
  unsigned char bitWidth = 16;
  char unsign = 0;
  char append = 0;
  char debug = 0;

  char errorCaught = 0;

  size_t normParam = 0;
  char breakOut = 0;
  for (size_t i = 1; (int) i < argc; i++) // process arguments
  {
    if (argv[i][0] == '-') // check for switches
    {
      breakOut = 0;
      for (size_t j = 1; argv[i][j] != '\0'; j++)
      {
        switch (argv[i][j])
        {
          case 'a':
            append = 1;
            break;
          case 'd':
            debug = 1;
            break;
          case 'u':
            unsign = 1;
            break;
          case 'o':
            i++;
            filename = (char*) malloc(sizeof(char) * strlen(argv[i]));
            strcpy(filename, argv[i]);
            breakOut = 1;
            break;
          case 's':
            i++;
            signalname = (char*) malloc(sizeof(char) * strlen(argv[i]));
            strcpy(signalname, argv[i]);
            breakOut = 1;
            break;
          case 'h':
          default:
            fprintf(stderr, "---Sine Generator for VHDL Signal---\nProgram writes VHDL process to given file. Process assignes signal with sine wave of given amplitude and frequency.\n\nUSAGE:   %s (<frequency[Hz]>) (<sampleRate[Hz]>) (<amplitude>) (<bitWidth>)\nExample: %s 300 50000 1 16 -o tb.vhd\n\nPlease respect argument order and use all arguments left from the most right used argument.\n\nFrequency range: 0 - 4.294e9 [Hz]\t(default: 100)\nAmplitude range: 0.0 - 1.0\t\t(default: 1.0)\nSample rate range: 0 - 4.294e9 [Hz]\t(default: 1000)\nSupported Bit widths: 8/16/32/64\t(default: 16)\n\nFlags:\n-o <filename> : name the output file\t(default: \"singen.vhd\")\n-s <signalname> : name the VHDL signal\t(default: \"mySignal\")\n-u : convert to unsigned values\t\t(default: signed)\n-a : append file\t\t\t(default: overwriting)\n-d : debug output\n-<other> : help\n", argv[0], argv[0]);
            return 0;
        }
        if (breakOut) // break from for-loop after "-o" has been found
          break;
      }
    }
    else // normal parameter
    {
      switch (normParam)
      {
        case 0:
          frequency = atoi(argv[i]);
          break;
        case 1:
          sampleRate = atoi(argv[i]);
          break;
        case 2:
          amplitude = atof(argv[i]);
          break;
        case 3:
          bitWidth = atoi(argv[i]);
          break;
        default:
          break;
      }
      normParam++;
    }
  }

  // Catch unwanted parameter values
    if (frequency == 0)
    {
      fprintf(stderr, "Invalid value for parameter <frequency>\n");
      errorCaught = 1;
    }
    if (sampleRate == 0)
    {
      fprintf(stderr, "Invalid value for parameter <sampleRate>\n");
      errorCaught = 1;
    }
    if (amplitude < 0 || amplitude > 1)
    {
      fprintf(stderr, "Invalid value for parameter <amplitude>\n");
      errorCaught = 1;
    }
    if (sampleRate < frequency)
    {
      fprintf(stderr, "Value for parameter <sampleRate> must be greater than <frequency>\n");
      errorCaught = 1;
    }

    if (errorCaught)
    {
      free(filename);
      free(signalname);
      return 0;
    }

    if (filename == NULL)
    {
      filename = (char*) malloc(sizeof(char) * 11);
      strcpy(filename, "singen.vhd\0");
    }
    if (signalname == NULL)
    {
      signalname = (char*) malloc(sizeof(char) * 9);
      strcpy(signalname, "mySignal\0");
    }

  /******************** Calculations ********************/

  // Rounded (truncated) time step in [ns]
  unsigned int steps = (sampleRate / frequency);
  unsigned int timeStep = 1000000000 / sampleRate;
  double *data_frac = (double *) malloc(steps * sizeof(double));
  long long *data_int = (long long *) malloc(steps * sizeof(long long));

  // Calculation of normalized sine with given step size
  // and conversion from floating point to fixed-point (only fractional bits)
  if (debug)
  {
    printf("Frequency: %u [Hz]\nSample Rate: %u [Hz]\nAmplitude: %lf\nBit Width: %hhu\nUnsigned: %s\n\nRounded (truncated) time step in [ns]: %u\nSteps: %u\nSine values (type 'long long') of first period:\nFractional|     FixedP (Dec)     |   FixedP (Hex) \n----------+----------------------+-----------------\n", frequency, sampleRate, amplitude, bitWidth, unsign ? "yes" : "no", timeStep, steps);
  }
  for (size_t i = 0; i < steps; i++)
  {
    data_frac[i] = amplitude * sin(2 * PI * (double)i / steps);

    if (unsign)
    {
      data_frac[i] = (data_frac[i] + amplitude) / 2;
      data_int[i] = (pow(2, bitWidth) - 1) * data_frac[i];
    }
    else
    {
      data_int[i] = (pow(2, bitWidth - 1) - 1) * data_frac[i];
    }

    if (debug)
      printf("%9.6lf | %20lld | %16llX\n", data_frac[i], data_int[i], data_int[i]);
  }

  /******************** Output to File ********************/

  FILE *file = NULL;
  if (append)
    file = fopen(filename, "a"); // append
  else
    file = fopen(filename, "wt"); // overwrite

  if (file == NULL)
    fprintf(stderr, "Error opening %s\n", filename);
  else
  {
    fprintf(file, "-- COPY: signal %s : std_logic_vector(%hhu downto 0);\n", signalname, bitWidth - 1);
    fprintf(file, "-- Sine Wave - Frequency: %u[Hz], Amplitude: %.1lf, SampleRate: %u[Hz]\n", frequency, amplitude, sampleRate);
    fprintf(file, "SIN_GEN : process\n");
    fprintf(file, "begin\n");
    for (size_t i  = 0; i < steps; i++)
    {
      switch (bitWidth)
      {
        case 8:
          fprintf(file, "\t%s <= x\"%02hhX\"; ", signalname, (char) data_int[i]); break;
        case 16:
          fprintf(file, "\t%s <= x\"%04hX\"; ", signalname, (short) data_int[i]); break;
        case 32:
          fprintf(file, "\t%s <= x\"%08X\"; ", signalname, (int) data_int[i]); break;
        case 64:
          fprintf(file, "\t%s <= x\"%016llX\"; ", signalname, (long long) data_int[i]); break;
        default:
          fprintf(stderr, "Invalid bit width set. Aborting file output.\n");
          fclose(file);
          free(filename);
          free(signalname);
          free(data_frac);
          free(data_int);
          return 0;
      }
      fprintf(file, "wait for %u ns;\n", timeStep);
    }
    fprintf(file, "end process;\n");
  }

  /******************** Cleaning ********************/

  fclose(file);
  free(filename);
  free(signalname);
  free(data_frac);
  free(data_int);
  return 0;
}
