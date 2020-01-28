`timescale 1ns / 1ps

`define FS 32'hF9A42BB1
module slv_reg(a,clk,reset,reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,
                reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30,reg31,reg32,reg33,reg34,reg35,reg36,reg37,
                reg38,reg39,reg40,reg41,reg42,reg43,reg44,reg45,reg46,reg47,reg48,reg49,reg50,reg51,reg52,reg53,reg54,
                reg55,reg56,reg57,reg58,reg59,reg60,reg61,reg62,reg63,fr_sync,load);
input a,clk,reset;
output reg [31:0] reg0;
output reg [31:0] reg1;
output reg [31:0] reg2;
output reg [31:0] reg3;
output reg [31:0] reg4;
output reg [31:0] reg5;
output reg [31:0] reg6;
output reg [31:0] reg7;
output reg [31:0] reg8;
output reg [31:0] reg9;
output reg [31:0] reg10;
output reg [31:0] reg11;
output reg [31:0] reg12;
output reg [31:0] reg13;
output reg [31:0] reg14;
output reg [31:0] reg15;
output reg [31:0] reg16;
output reg [31:0] reg17;
output reg [31:0] reg18;
output reg [31:0] reg19;
output reg [31:0] reg20;
output reg [31:0] reg21;
output reg [31:0] reg22;
output reg [31:0] reg23;
output reg [31:0] reg24;
output reg [31:0] reg25;
output reg [31:0] reg26;
output reg [31:0] reg27;
output reg [31:0] reg28;
output reg [31:0] reg29;
output reg [31:0] reg30;
output reg [31:0] reg31;
output reg [31:0] reg32;
output reg [31:0] reg33;
output reg [31:0] reg34;
output reg [31:0] reg35;
output reg [31:0] reg36;
output reg [31:0] reg37;
output reg [31:0] reg38;
output reg [31:0] reg39;
output reg [31:0] reg40;
output reg [31:0] reg41;
output reg [31:0] reg42;
output reg [31:0] reg43;
output reg [31:0] reg44;
output reg [31:0] reg45;output reg [31:0] reg46;
output reg [31:0] reg47;
output reg [31:0] reg48;
output reg [31:0] reg49;
output reg [31:0] reg50;
output reg [31:0] reg51;
output reg [31:0] reg52;output reg [31:0] reg53;
output reg [31:0] reg54;
output reg [31:0] reg55;
output reg [31:0] reg56;
output reg [31:0] reg57;
output reg [31:0] reg58;
output reg [31:0] reg59;
output reg [31:0] reg60;
output reg [31:0] reg61;
output reg [31:0] reg62;
output reg [31:0] reg63;
output fr_sync;
output load;
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
reg fr_sync;
reg load;
reg [7:0] state;
reg [31:0] temp1;
wire [31:0] temp;
//wire tm_start;

//assign tm_start = reg0[0];
parameter 
          s1 = 1,
          s2 = 2,
          s3 = 3,
          s4 = 4,
          s5 = 5,
          s6 = 6,
          s7 = 7,
          s8 = 8,
          s9 = 9,
          s10 = 10,
          s11 = 11,
          s12 = 12,
          s13 = 13,
          s14 = 14,
          s15 = 15,
          s16 = 16,
          s17 = 17,
          s18 = 18,
          s19 = 19,
          s20 = 20,
          s21 = 21,
          s22 = 22,
          s23 = 23,
          s24 = 24,
          s25 = 25,
          s26 = 26,
          s27 = 27,
          s28 = 28,
          s29 = 29,
          s30 = 30,
          s31 = 31,
          s32 = 32,
          s33 = 33,
          s34 = 34,
          s35 = 35,
          s36 = 36,
          s37 = 37,
          s38 = 38,
          s39 = 39,
          s40 = 40,
          s41 = 41,
          s42 = 42,
          s43 = 43,
          s44 = 44,
          s45 = 45,
          s46 = 46,
          s47 = 47,
          s48 = 48,
          s49 = 49,
          s50 = 50,
          s51 = 51,
          s52 = 52,
          s53 = 53,
          s54 = 54,
          s55 = 55,
          s56 = 56,
          s57 = 57,
          s58 = 58,
          s59 = 59,
          s60 = 60,
          s61 = 61,
          s62 = 62,
          s63 = 63,
          s64 = 64;          
          

always @ (posedge clk or posedge reset)
begin
        if(reset)
        begin
            reg0 <= 0;
            reg1 <= 0;
            reg2 <= 0;
            reg3 <= 0;
            reg4 <= 0;
            reg5 <= 0;
            reg6 <= 0;
            reg7 <= 0;
            reg8 <= 0;  
            reg9 <= 0;  
            reg10 <= 0;  
            reg11 <= 0;
            reg12 <= 0;
            reg13 <= 0;
            reg14 <= 0;
            reg15 <= 0;
            reg16 <= 0;
            reg17 <= 0;reg18 <= 0;
            reg19 <= 0;
            reg20 <= 0;
            reg21 <= 0;
            reg22 <= 0;
            reg23 <= 0;
            reg24 <= 0;
            reg25 <= 0;
            reg26 <= 0;
            reg27 <= 0;
            reg28 <= 0;
            reg29 <= 0;
            reg30 <= 0;
            reg31 <= 0;
            reg32 <= 0;
            reg33 <= 0;
            reg34 <= 0;
            reg35 <= 0;
            reg36 <= 0;
            reg37 <= 0;
            reg38 <= 0;
            reg39 <= 0;
            reg40 <= 0;
            reg41 <= 0;
            reg42 <= 0;
            reg43 <= 0;
            reg44 <= 0;
            reg45 <= 0;
            reg46 <= 0;
            reg47 <= 0;
            reg48 <= 0;
            reg49 <= 0;
            reg50 <= 0;
            reg51 <= 0;
            reg52 <= 0;
            reg53 <= 0;reg54 <= 0;
            reg55 <= 0;
            reg56 <= 0;
            reg57 <= 0;
            reg58 <= 0;
            reg59 <= 0;
            reg60 <= 0;
            reg61 <= 0;
            reg62 <= 0;
            reg63 <= 0;
        end
        
        case(state)
        s1:
            begin 
            reg1 <=temp1;
            reg0 <=0;
            end
            
        s2:
            begin
            reg2 <= temp1;
            reg0 <= 1'b0;
            end
        
        s3:
            begin
            reg3 <= temp1;
            //reg0 <= 1'b0;
            end
            
         s4:
            begin
            reg4 <= temp1;
           // reg0 <= 1'b0;
            end
            
         s5:
            begin
            reg5 <= temp1;
           // reg0 <= 1'b0;
            end
            
        s6:
            begin
             reg6<= temp1;
            // reg0 <= 1'b0;
            end
            
            
        s7:
            begin
             reg7<= temp1;
            // reg0 <= 1'b0;
            end
        
        s8:
            begin
             reg8<= temp1;
             //reg0 <= 1'b0;
            end
        
         s9:
            begin
             reg9<= temp1;
             //reg0 <= 1'b0;
            end
        
         s10:
            begin
             reg10<= temp1;
             //reg0 <= 1'b0;
            end
        
       s11:
            begin
               reg11 <= temp1;
            end
            
         s12:
            begin
             reg12<= temp1;
             //reg0 <= 1'b0;
            end
        
         s13:
            begin
             reg13<= temp1;
             //reg0 <= 1'b0;
            end
        
         s14:
            begin
             reg14<= temp1;
             //reg0 <= 1'b0;
            end
        
      s15:
            begin
             reg15<= temp1;
             //reg0 <= 1'b0;
            end
            
      s16:
            begin
             reg16<= temp1;
             //reg0 <= 1'b0;
            end
            
      s17:
            begin
             reg17<= temp1;
             //reg0 <= 1'b0;
            end
      
        s18:
            begin
             reg18<= temp1;
             //reg0 <= 1'b0;
            end
     
       s19:
            begin
             reg19<= temp1;
             //reg0 <= 1'b0;
            end
        
        s20:
            begin
             reg20<= temp1;
             //reg0 <= 1'b0;
            end
            
        s21:
            begin
             reg21<= temp1;
             //reg0 <= 1'b0;
            end
            
        s22:
            begin
             reg22<= temp1;
             //reg0 <= 1'b0;
            end
            
        s23:
            begin
             reg23<= temp1;
             //reg0 <= 1'b0;
            end
            
        s24:
            begin
             reg24<= temp1;
             //reg0 <= 1'b0;
            end
            
            
        s25:
            begin
             reg25<= temp1;
             //reg0 <= 1'b0;
            end
            
            
        s26:
           begin
             reg26<= temp1;
             //reg0 <= 1'b0;
            end
            
        s27:
            begin
             reg27<= temp1;
             //reg0 <= 1'b0;
            end
           
        s28:
            begin
             reg28<= temp1;
             //reg0 <= 1'b0;
            end
            
        s29:
            begin
             reg29<= temp1;
             //reg0 <= 1'b0;
            end
            
        s30:
            begin
             reg30<= temp1;
             //reg0 <= 1'b0;
            end
            
        s31:
            begin
             reg31<= temp1;
             //reg0 <= 1'b0;
            end
            
        s32:
            begin
             reg32<= temp1;
             //reg0 <= 1'b0;
            end
            
        s33:
            begin
             reg33<= temp1;
             //reg0 <= 1'b0;
            end
            
        s34:
            begin
             reg34<= temp1;
             //reg0 <= 1'b0;
            end
                           
       s35:
            begin
             reg35<= temp1;
             //reg0 <= 1'b0;
            end
                   
        s36:
            begin
             reg36<= temp1;
             //reg0 <= 1'b0;
            end
                   
       s37:
            begin
             reg37<= temp1;
             //reg0 <= 1'b0;
            end
       
       s38:
            begin
             reg38<= temp1;
             //reg0 <= 1'b0;
            end
                   
       s39:
            begin
             reg39<= temp1;
             //reg0 <= 1'b0;
            end
                   
        s40:
            begin
             reg40<= temp1;
             //reg0 <= 1'b0;
            end
        s41:
            begin
             reg41<= temp1;
             //reg0 <= 1'b0;
            end

        s42:
            begin
             reg42<= temp1;
             //reg0 <= 1'b0;
            end
            
        s43:
            begin
             reg43<= temp1;
             //reg0 <= 1'b0;
            end
               
            
        s44:
            begin
             reg44<= temp1;
             //reg0 <= 1'b0;
            end

            
        s45:
            begin
             reg45<= temp1;
             //reg0 <= 1'b0;
            end

            
        s46:
            begin
             reg46<= temp1;
             //reg0 <= 1'b0;
            end
            
        s47:
            begin
             reg47<= temp1;
             //rg0 <= 1'b0;
            end
            
        s48:
            begin
             reg48<= temp1;
             //reg0 <= 1'b0;
            end
               
            
        s49:
            begin
             reg49<= temp1;
             //reg0 <= 1'b0;
            end
               
        s50:
            begin
             reg50<= temp1;
             //reg0 <= 1'b0;
            end
        s51:
            begin
             reg51<= temp1;
             //reg0 <= 1'b0;
            end
        s52:
            begin
             reg52<= temp1;
             //reg0 <= 1'b0;
            end
               
        s53:
            begin
             reg53<= temp1;
             //reg0 <= 1'b0;
            end
            
        s54:
            begin
             reg54<= temp1;
             //reg0 <= 1'b0;
            end
        s55:
            begin
             reg55<= temp1;
             //reg0 <= 1'b0;
            end

        s56:
            begin
             reg56<= temp1;
             //reg0 <= 1'b0;
            end
        s57:
            begin
             reg57<= temp1;
             //reg0 <= 1'b0;
            end
            
        s58:
            begin
             reg58<= temp1;
             //reg0 <= 1'b0;
            end
            
        s59:
            begin
             reg59<= temp1;
             //reg0 <= 1'b0;
            end
        s60:
            begin
             reg60<= temp1;
             //reg0 <= 1'b0;
            end
         s61:
            begin
             reg61<= temp1;
             //reg0 <= 1'b0;
            end
         s62:
            begin
             reg62<= temp1;
             //reg0 <= 1'b0;
            end
            
         s63:
            begin
             reg63<= temp1;
             //reg0 <= 1'b0;
            end
        
         s64:
            begin
                reg0[0] <= 1'b1;    
//              tm_start <= 1'b0;
            end

         endcase
end
integer int;
reg [31:0] temp2;
reg load1;
wire load2;
wire load4;
DFlipFlop_SyncReset sut(load,clk,reset,load2);
DFlipFlop_SyncReset xut(load2,clk,reset,load4);
always @(posedge load4 or posedge reset)
begin
    if(reset)
        begin
            state <= 0;
            int <= 0;
        end
   else
    begin 
       if(load1)
            begin    
           if(state >63)
               begin
                    state <= 1;
                    temp1 <= temp2;
                    int <= 0; 
               end
           
        
            else 
                begin
                    state <= state +1;
                    temp1 <= temp2;  
                    int <= 2;
                end
        end  
    end
end


always @ (posedge load,posedge reset)
    begin
    if(reset)
        begin
       // state <= 0;
        temp2 <=0;
        //int <= 0;
        end
   
   else
    begin 
 /*       if(load1)
            begin    
           if(state >63)
               begin
                    state <= 1;
                    temp1 <= temp;
                    int <= 0; 
              
               end
           
        
            else 
                begin
                    state <= state +1;
                    temp1 <= temp;  
                    int <= 2;
                end
        end  
        */
        temp2 <= temp;
//      if((state == 40) or (state == 0))
  //      count_max <
   end
end
reg [5:0] counter;
/////////////////////////////////////////////////

//////////////////////////////////////////////
always @(posedge clk or posedge reset)
begin
    if(reset)
        fr_sync <= 1'b0;
   
   else
    begin
    if(temp == `FS )
        begin
        fr_sync <= 1'b1;   
        end
   else
    fr_sync <= 1'b0;
   end
    
end

reg count_max;


always @(posedge clk or posedge reset)
begin
    if(reset)
        begin
     //   counter <= 0;
        load <= 1'b0;
        end
  else
    begin  
   if(fr_sync)
                begin
                counter <= 0;
                end

    else
    begin
            
  //           if((counter > count_max) & load1)
            if((counter > (28+int)) & load1)
               begin
                counter <= 0; 
                load<=1'b1; 
                end
            else
            begin
                counter <= counter +1;
                load <=1'b0;   
            end
    end
end


end


reg [31:0] counter1;

always @(posedge clk or posedge reset)
begin
    if(reset)
        begin
     //   counter <= 0;
        load1 <= 1'b0;
        end
  else
    begin  
   if(fr_sync)
                begin
                counter1 <= 0;
                load1 <=1'b1;
                end

    else
    begin
            
             if(counter1 > 2048)// only till 64 states it will be high
               begin
                //counter1 <= 0; 
                load1<=1'b0; 
                end
            else
            begin
                counter1 <= counter1 +1;
               // load1 <=1'b1;   
            end
    end
end


end
reg [8:0] fr_counter;
integer i;
always @(posedge fr_sync or posedge reset)
begin
    if(reset)
        begin
        fr_counter <= 0;
        i <= 0;
        end
   // if(fr_counter)
       // i <= -1;
    
    else
        fr_counter <= fr_counter +1;
end
////////////////////////////////////


sipo dut(clk,reset,a,temp);


endmodule
