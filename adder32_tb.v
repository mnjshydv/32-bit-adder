//module ripplecarry_tb;
//    reg [31:0]a,b;
//    reg cin;
//    wire [31:0]sum;
//    wire carry;
    
//    ripplegentop DUT (a,b,cin,sum,carry);

//    task inputs (input [31:0]x,y, input z);
//    begin
//        a=x;
//        b=y;
//        cin=z;
//        #10;
//    end
//    endtask
    
//    initial
//    begin
//        inputs (32'd100,32'd200,1'b0);
//        inputs (32'd200,32'd200,1'b0);
//        inputs (32'd300,32'd400,1'b0);
//        inputs (32'd400,32'd500,1'b0);
//    end
//endmodule

module clkdiv_tb;
// Inputs
reg clk,rst;
// Outputs
wire clkout;
// Instantiate the Design Under Test (DUT)
clkdiv DUT (.clk(clk),.rst(rst),.clkout(clkout));
always@(clk)
#10 clk<=~clk;
initial
begin
clk = 0;
rst=1;
#20 rst=0;
#500 $finish;
end
endmodule