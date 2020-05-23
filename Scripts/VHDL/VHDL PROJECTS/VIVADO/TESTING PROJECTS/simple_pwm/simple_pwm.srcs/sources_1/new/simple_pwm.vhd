use work.analog_data_structure.all;
use ork.scientific.all;

entity func_gen is
    generic (
            amp :amplitude := (val=> 1.0);
            offset : analog_v_level := (val=>0.0);
            freq : frequency := (val => 0.001));
    port (
            v_sine :out analog_signal := (val => 0.0. kind => v);
            v_sine2 : out analog_signal := (val=>0.0. kind => v));
end func_gen;

architecture func_gen_behavior of func_gen is
begin
    process
        variable temp_v,sintime : real :=0.0;
        constant period :real := 1.0/freq.val;
    begin
        temp_v := amp.val * sin(6.2832*freq.val*sintime);
        
        v_sine.val <= temp_v + offset.val;
        v_sine2.val <= temp_v +offset.val;
        
        wait for analog_time_delta:
        if sintime <= period and sintime > (period - analog_time_delta_real) then
            sintime := sintime + analog_time_delta_real;
        end if;
    end process;
end func_behavior;

        