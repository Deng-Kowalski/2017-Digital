`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/10 23:14:44
// Design Name: 
// Module Name: test
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


module test(
    input CLK,
    input SW_in,
    output reg[10:0] display_out,
    output reg LED
    );
    reg [19:0]count=0;
    reg [25:0]count1=0;
    reg [2:0] sel=0;
    reg [2:0] millis=0;
    reg [9:0] press=0;
    reg [3:0] SES1=0;
    reg [3:0] SES2=0;
    reg [3:0] SES3=0;
    reg [3:0] SES4=0;
    parameter T1MS=50000;
    parameter T2MS=10000000;
    parameter SE1=7'b1001111;
    parameter SE2=7'b0010010;
    parameter SE3=7'b0000110;
    parameter SE4=7'b1001100;
    parameter SE5=7'b0100100;
    parameter SE6=7'b0100000;
    parameter SE7=7'b0001111;
    parameter SE8=7'b0000000;
    parameter SE9=7'b0000100;
    parameter SE0=7'b0000001;
    always@(posedge CLK)
        begin
            if(SW_in==0)
                begin
                case(sel)
                0:display_out<=11'b0111<<7|SE1;
                1:display_out<=11'b1011<<7|SE2;
                2:display_out<=11'b1101<<7|SE3;  
                3:display_out<=11'b1110<<7|SE4;                  
                default:display_out<=11'b1111_1111111;
                endcase
                end
            else
                begin
                case(sel)
                0:display_out<=11'b1110_0100100;
                1:display_out<=11'b1101_0100000;
                2:display_out<=11'b1011_0001111;
                3:display_out<=11'b0111_0000000;
                default:display_out<=11'b1111_1111111;
                endcase
                end
        end
        
    always@(posedge CLK)
        begin
            count<=count+1;
            if(count==T1MS)
                begin
                count<=0;
                sel<=sel+1;
                if(sel==4)
                    sel<=0;
                end
            end
      always@(posedge CLK)
          begin
              count1<=count1+1;
              if(count1==T2MS)
                  begin
                      count1<=0;
                      LED=!LED;
                  end
           end
       always@(posedge CLK)
           begin
                SES1<=press/1000;
                SES2<=(press-SES1*1000)/100;
                SES3<=(press-SES1*1000-SES2*100)/10;
                SES4<=press-SES1*1000-SES2*100-SES3*10;
           end
       always@(posedge SW_in)
            begin
                press<=press+1;
                if(press>1000)
                    press<=0;
            end               
endmodule
