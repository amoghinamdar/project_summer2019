module sipo(clk,rst,a,q);
input clk,rst;
input a;
output [31:0]q;
wire [31:0]q;
reg [31:0]temp;
always@(posedge clk,posedge rst)
begin
    if(rst==1'b1)
         temp<=32'b0000;
    else
    begin
        temp<=temp<<1'b1;//shift by 1 bit
        temp[0]<=a;
    end
end
assign q = temp;
endmodule