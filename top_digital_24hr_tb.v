
`timescale 1s/1s

module top_digital_24hr_tb();

reg  clk,reset,enable;

wire [3:0]ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec; 

top_digital_24hr DUT (clk,enable,reset,ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec);

initial
begin

clk=1'b0;
forever
#0.5 clk=~clk;
end



task reseti();
begin
@(negedge clk);
reset=1'b1;
@(negedge clk);
reset=1'b0;
end
endtask

initial
begin
enable=1'b1;
reseti();
end

initial 
begin
$monitor("%d%d : %d%d : %d%d",ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec);
#1000000000 $finish();
end

endmodule
