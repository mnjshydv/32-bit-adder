////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*Write an RTL code to design a 32bit Ripple carry adder using Full
adders*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////

/*module full_adder(input a,b,c,output sum,carry);
    assign sum = (a^b^c);
    assign carry = ((a & b)|(b& c)|(c&a));
endmodule

////// RCA module///////
module ripplegentop(input [31:0]a,b,
    input cin,
    output [31:0]sum,
    output carry);
    
    wire [31:0]c;
    genvar i;
    
    generate 
        for(i=0;i<32;i=i+1)
            begin
                full_adder fa(a[i],b[i],c[i],sum[i],c[i+1]);
            end
    endgenerate 
    
    assign c[0]=cin;
    assign carry=c[31];
endmodule*/

module clkdiv(clk,rst,clkout);
input clk,rst;
output clkout;
reg [2:0] counter1;
reg [2:0] counter2;
wire w1=(counter1==3'd4)?1'b1:1'b0;
always @(posedge clk)
if(rst)
counter1<=0;
else if(w1)
counter1 <= 0;
else
counter1 <= counter1+1;
wire w2=(counter2==3'd4)?1'b1:1'b0;
always @(negedge clk)
if(rst)
counter2<=0;
else if(w2)
counter2 <= 0;
else
counter2 <= counter2+1;
assign clkout = counter1[1] | counter2[1];
endmodule