module TM_tb();

wire tmdata;
reg tmclk,reset;

reg [31:0] PI;

wire [31:0]reg0;
wire [31:0]reg1;
wire [31:0]reg2;
wire [31:0]reg3;
wire [31:0]reg4;
wire [31:0]reg5;
wire [31:0]reg6;
wire [31:0]reg7;
wire [31:0]reg8;
wire [31:0]reg9;
wire [31:0]reg10;
wire [31:0]reg11;wire [31:0]reg12;
wire [31:0]reg13;
wire [31:0]reg14;
wire [31:0]reg15;
wire [31:0]reg16;
wire [31:0]reg17;
wire [31:0]reg18;
wire [31:0]reg19;
wire [31:0]reg20;
wire [31:0]reg21;
wire [31:0]reg22;
wire [31:0]reg23;
wire [31:0]reg24;
wire [31:0]reg25;
wire [31:0]reg26;
wire [31:0]reg27;
wire [31:0]reg28;
wire [31:0]reg29;
wire [31:0]reg30;
wire [31:0]reg31;
wire [31:0]reg32;
wire [31:0]reg33;
wire [31:0]reg34;
wire [31:0]reg35;
wire [31:0]reg36;
wire [31:0]reg37;
wire [31:0]reg38;
wire [31:0]reg39;
wire [31:0]reg40;
wire [31:0]reg41;
wire [31:0]reg42;
wire [31:0]reg43;
wire [31:0]reg44;
wire [31:0]reg45;
wire [31:0]reg46;
wire [31:0]reg47;
wire [31:0]reg48;
wire [31:0]reg49;
wire [31:0]reg50;
wire [31:0]reg51;
wire [31:0]reg52;
wire [31:0]reg53;
wire [31:0]reg54;
wire [31:0]reg55;wire [31:0]reg56;
wire [31:0]reg57;
wire [31:0]reg58;
wire [31:0]reg59;wire [31:0]reg60;
wire [31:0]reg61;
wire [31:0]reg62;
wire [31:0]reg63;

wire fr_sync;
wire load;
reg ld;
slv_reg dut(tmdata,tmclk,reset,reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,
                reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30,reg31,reg32,reg33,reg34,reg35,reg36,reg37,
                reg38,reg39,reg40,reg41,reg42,reg43,reg44,reg45,reg46,reg47,reg48,reg49,reg50,reg51,reg52,reg53,reg54,
                reg55,reg56,reg57,reg58,reg59,reg60,reg61,reg62,reg63,fr_sync,load);
PISO picaso1 (reset, tmclk, ld, PI, tmdata);

    initial
        begin

                // reset all the variables
    
                tmclk     = 1'b0;
                ld        = 1'b0;  
                reset     = 1'b1;
                PI        = 32'b0;
               
                // wait for 10 clock edges
                 repeat (10)
                    @ (negedge tmclk);
                reset = 1'b0;

        end    




 // generate Telemetry clock

    always
       begin :tm_clock_loop
            #`TMCLK_HIGH  tmclk = ~ tmclk;
       end

integer i;
integer j;
 initial
        begin 

           // wait for 10 clocks

 //          repeat (10) @ (negedge tmclk); reset = 1'b0;  
           
           for (i=0; i<7; i=i+1)
           begin      
                
             //          PI     = 8'h1a; 
                         PI     = 8'hF9; 
                       // strobe same data into PISO by pulsing ld signal
            
                       repeat (7)  @ (negedge tmclk);  ld = 1'b1;
                                   @ (negedge tmclk);  ld = 1'b0;                
            
                       $display("PI = %h", PI);            
                        
              //         PI     = 8'hcf;                 
                       PI    = 8'hA4;             // strobe same data into PISO by pulsing ld signal
                        
                       repeat (7) @ (negedge tmclk); ld = 1'b1;
                                  @ (negedge tmclk); ld = 1'b0; 
            
                       $display("PI = %h", PI);
                    
             //          PI     = 8'hfc;  
                         PI     = 8'h2B;
                       // strobe same data into PISO by pulsing ld signal
            
                       repeat (7) @ (negedge tmclk); ld = 1'b1;
                                  @ (negedge tmclk); ld = 1'b0;  
                       
                       $display("PI = %h", PI);
            
             //          PI     = 8'h1d;                 
                       PI     = 8'hB1;  
                       // strobe same data into PISO by pulsing ld signal
            
                       repeat (7) @ (negedge tmclk); ld = 1'b1;
                                  @ (negedge tmclk); ld = 1'b0; 
                                          
                       $display("PI = %h", PI);
                      
                       for( PI = 32'hababab ; PI < 32'habb0bf ; PI = PI + 1+i)
                             begin
            
                                  // strobe same data into PISO by pulsing ld signal

                                  repeat (31) @ (negedge tmclk); ld = 1'b1;
                                             @ (negedge tmclk); ld = 1'b0;
            
                                  $display("PI = %h", PI);
        
                              end  
                         
                            
            end
                    
            
        
           //disable tm_clock_loop;
 //          disable sys_clock_loop;

         $finish;

       end
        
        
	
    //clock signal                              
 

 

	    


endmodule
	
    // Parallel-In-Serial-Out shift register used for testbench
    // inputs are reset, clock and ld 
    // outputs sout: shift register serial output
    
   module PISO# (parameter dbits = 9) (
                  input  reset,            // global reset
                  input  clk,              // input TM clock
                  input  ld,               // preset load input pulse
                  input  [8:0] pin, // parallel load preset value
                  output sout              // serial shift reg output
                 );
       
      reg [8:0] q;  // local shift register with reset and preloadfg 
    
      assign sout = q[7];  // redefine q7 as sout
	      
      always @ (posedge clk or posedge reset)
        begin
    
            if (reset)          // if reset, then q = 0
                    q = 0;
            else
              if (ld)           // if ld == 1, then  q = PI              
                    q = pin;
              else
                    q = q << 1; // else leftshift q by 1
        end
            
    endmodule  // PISO()
