module BCD_up_down_counter_tb();

reg clk,reset;
wire [3:0]count;

BCD_up_down_counter DUT (.clk(clk),.reset(reset),.count(count));

initial 
begin
clk=1'b0;
forever
#10 clk=~clk;
end

task initialize();
begin
clk=1'b0;
reset=1'b0;
end
endtask

task resetj();
begin
@(negedge clk);
reset=1'b1;
@(negedge clk);
reset=1'b0;
end
endtask


initial
begin
initialize();
resetj();
end

initial
begin
$monitor("Inputs:clk=%b, Outputs:reset=%b, count=%d",clk,reset,count);
#1000 $finish();
end
endmodule