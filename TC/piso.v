module parallel_in_serial_out ( din,clk_out ,reset ,load ,dout);
output dout; // output of piso(spits out the MSB every one tcclock pulse)
//output reg flag ;
wire dout;
input [31:0] din ; // 32 bit input to the piso
input clk_out ; // tcclock
input reset ; // global reset
input load ; // internally generated signal in the top module slv_reg
reg [31:0]temp; // temporary reg where data is stored and serially sent out every clock pulse

assign dout = temp[31];
always @ (posedge (clk_out)) begin
if (reset)
    temp <= 0;
else if (load)
    temp <= din; // temp is loaded only when load signal is high
else begin
    temp <= {temp[30:0],1'b0}; //every time 0 is append from the back
end
end
endmodule