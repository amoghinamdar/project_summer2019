`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2019 15:34:54
// Design Name: 
// Module Name: slv_reg_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module slv_reg_tb;     
        reg [31:0] reg0;
        reg [31:0] reg1;
        reg [31:0] reg2;
        reg [31:0] reg3;
        reg [31:0] reg4;
        reg [31:0] reg5;
        reg [31:0] reg6;
        reg [31:0] reg7;
        reg [31:0] reg8;
        reg [31:0] reg9;
        reg [31:0] reg10;
        reg sysclk;
        reg reset;
        wire tcclk_out;
        wire sout;
       
   // slv_reg dut( reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,sysclk,reset,
     //           tcclk_out,sout
     
     
     
     slv_reg dut( reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,sysclk,
                tcclk_out,sout);                
    initial
    begin
    reg0 = 32'b00000000000000000000000000000010;
    
    #1000
    
    reg0 = 32'b00000000000000000000000000000001;
  
     reg1 = 32'b10101010101010101010101010101010;
    reg2 =  32'b11001100110011001100110011001100;
    reg3 =  32'b11100011100011100011100011100011;
    reg4 =  32'b11110000111100001111000011110000;
    reg5 =  32'b11111000001111100000111110000011;
    reg6 = 32'b11111100000011111100000011111100;
    reg7 = 32'h77777777;
    reg8 = 32'h88888888;
    reg9 = 32'h99999999;
    reg10 = 32'haaaaaaaa;
    reset = 1;
    #100 reset = 0;
    sysclk = 0;
    
    //#1000000000   reg0 = 32'h0;
    end    
    always #10 sysclk = ~sysclk;
endmodule
