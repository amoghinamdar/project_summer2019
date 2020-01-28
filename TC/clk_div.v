module Clock_divider(reset,clock_in,clock_out
    );
input reset;
input clock_in; // input clock on FPGA
output reg clock_out; // output clock after dividing the input clock by divisor
reg[27:0] counter=28'd0;
parameter DIVISOR = 28'd16000; // value 
// The frequency of the output clk_out
//  = The frequency of the input clk_in divided by DIVISOR
// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
always @(posedge clock_in or posedge reset)
begin
  if(reset)
    begin
        clock_out   <= 1'b0;
        counter     <= 28'd0;
    end
  else if(counter>=(DIVISOR-1))
    begin
        counter     <= 28'd0;
        clock_out   <= ~clock_out; //inversion of clock after stipulated time
    end
  else
      counter <= counter + 28'd1;
 
end

//assign clock_out = (counter<DIVISOR/2)?1'b0:1'b1;
endmodule