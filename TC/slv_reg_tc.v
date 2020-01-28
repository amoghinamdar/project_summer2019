module slv_reg(
        input [31:0] reg0, // control rgister (status)
        input [31:0] reg1,//reg1-reg10 are 32bit data registers for storing 320bits
        input [31:0] reg2,
        input [31:0] reg3,
        input [31:0] reg4,
        input [31:0] reg5,
        input [31:0] reg6,
        input [31:0] reg7,
        input [31:0] reg8,
        input [31:0] reg9,
        input [31:0] reg10,
        input sysclk, //input clock(AXI clock)
        //input reset,// reset  is the second last LSB bit of the control register(reg 0)
        output tcclk_out,
        output sout
    );
    parameter   s1=4'd1,
                s2=4'd2,
                s3=4'd3,
                s4=4'd4,
                s5=4'd5,
                s6=4'd6,
                s7=4'd7,
                s8=4'd8,
                s9=4'd9,
                s10=4'd10;
            
    parameter TRUE = 1'b1,
              FALSE = 1'b0;
 

//assign serialout = ~sout;
 //////////////////////////////////////////////////
wire reset;
 /////////////////////////////////////////////////
assign reset = reg0[1];
 
 reg load;   // signal required for loading the data in the temporary register of piso
 reg [31:0]temp; // to this temporary register the data are stored based on the state  
 reg [3:0]state;  // register which is used as a counter to update the state
 //reg [3:0]next_state; 
 //wire flag;//////to indicate the 32 bit shift in the piso 
 //reg load;
 reg [5:0] counter; // to signal 32 posedges of telecommand clock so that the next data register is loaded into the piso register
 
 reg [3:0] load2; // 
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////
 wire clk_out; // output from the clock_divider circuit
 assign tcclk_out = clk_out & reg0[0]; // tcclk_out should come only when LSB of control register is high(tc_start) 
 reg load3; // signal to indicate that the  64 clock cycles have passed (that is valid data is present in the piso register)
 
 wire dout;//output from piso
 assign sout = dout & reg0[0] & load3; //output is valid only when tc_start is present &  clock cycles have passsed
 
 
 // the 64 clock cycles is the time required for the output from the  second d flipflop to reach  

Clock_divider dut(reset,sysclk,clk_out); // instantiation of clock divider module

//below is a case statement logic for assignment of data register to temporary register which would later be an input to the piso
always @(posedge sysclk)
begin    
    case(state)  
    s1:
        begin 
            temp <=reg1; 
        end
        
    s2:
        begin
        temp <= reg2;   
        end
    s3:
        begin
        temp <= reg3;      
        end
        
     s4:
        begin
        temp <= reg4;    
        end
        
     s5:
        begin
        temp <= reg5;   
        end
    s6:
        begin
        temp <= reg6;   
         end
   
   s7:
        begin
        temp <= reg7;   
        end
   
   s8:
        begin
        temp <= reg8;   
        end
   
   s9:
        begin
        temp <= reg9;  
        end
   
   s10:
        begin
        temp <= reg10;   
        end
   endcase
end

////////////////////////////////////////////////////////////////////////////////

//load signal becomes high only when 32 clock cycles are completed
always @(posedge load or posedge reset) // a counetr which tells how many data registers are sent serially out
begin
    if(reset)
        load2 <= 0;
    else if(load2 > 10)
        load2 <= 0;
    else 
        load2 <= load2 +1;
end
///////////////////////////////////////////////////////////////////////////////
always @(posedge tcclk_out or posedge reset)
begin
if(reset)
    begin
    counter <= 0;
    load <= FALSE;
    end
else if(counter > 30)
   begin
    counter <= 0; 
    load<=TRUE; 
    end
else
begin
    counter <= counter +1;
    load <=FALSE;   
end
end

wire Q;
wire Q1;
reg [31:0] temp1;

//creating 2 clock pulse delay
DFlipFlop_SyncReset sut(load,tcclk_out,reset,Q); // instantiation of D flipflop 
DFlipFlop_SyncReset tut(Q,tcclk_out,reset,Q1);
//Q1 is the output from the 2nd D FF, 
always @(posedge tcclk_out)
begin
    if(Q1)
        temp1 <= temp; //temp1 is loaded only after 2 clockpulse delay of load
end

 parallel_in_serial_out uut( temp1,tcclk_out ,reset ,load ,dout);
 
//always @(posedge Q1 or posedge reset)
always @(posedge load or posedge reset)
begin
        if(reset)
            begin
            state <= s1;
            load3 <= FALSE;
            end
        else if(state > 9)
           begin
           state <= s1;        
            load3 <= TRUE;  
           end
       else if(load2 < 1)
       begin
            state <= s1;
            load3 <= FALSE;
        end
        else
        begin
            state <= state +1;
            load3 <= TRUE;
        end
end 
endmodule
