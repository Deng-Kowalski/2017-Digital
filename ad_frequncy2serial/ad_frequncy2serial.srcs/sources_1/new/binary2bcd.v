`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: 邓剡梁
// Module Name: binary2bcd
// Description: binary转bcd，输出7位bcd。

//////////////////////////////////////////////////////////////////////////////////
module binary2bcd(
    input CLK,
    input [23:0] binaryin,//二进制数输入
    (* KEEP = "TRUE" *)output reg [27:0] bcdout//7位十进制输出
//    ,(* KEEP = "TRUE" *)output reg [28:0] bcd
//    ,(* KEEP = "TRUE" *)output reg [4:0] count
    );
    (* KEEP = "TRUE" *)reg [4:0] count;
    (* KEEP = "TRUE" *)reg [28:0] bcd;
    always@(posedge CLK)
    begin
            if(count == 24)
            begin
                bcdout <= bcd[27:0];
                count <= 0;
                bcd <= 0;
            end
            else
            begin
                if(bcd[3:0]>4)
                    bcd[4:1] <= bcd[3:0]+3;
                else
                    bcd[4:1] <= bcd[3:0];
                if(bcd[7:4]>4)
                    bcd[8:5] <= bcd[7:4]+3;
                else
                    bcd[8:5] <= bcd[7:4];
                if(bcd[11:8]>4)
                    bcd[12:9] <= bcd[11:8]+3;
                else
                    bcd[12:9] <= bcd[11:8];
                if(bcd[15:12]>4)
                    bcd[16:13] <= bcd[15:12]+3;
                else
                    bcd[16:13] <= bcd[15:12]; 
                if(bcd[19:16]>4)
                    bcd[20:17] <= bcd[19:16]+3;
                else
                    bcd[20:17] <= bcd[19:16];                    
                if(bcd[23:20]>4)
                    bcd[24:21] <= bcd[23:20]+3;
                else
                    bcd[24:21] <= bcd[23:20];
                if(bcd[27:24]>4)
                    bcd[28:25] <= bcd[27:24]+3;
                else
                    bcd[28:25] <= bcd[27:24];                                      
                bcd[0] <= binaryin[23-count];
                count <= count+1;
            end
    end   
endmodule