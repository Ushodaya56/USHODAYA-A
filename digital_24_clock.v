module top_digital_24hr(clk,enable,reset,ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec);

input clk,reset,enable;

output [3:0]ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec;

wire [0:4]i;
wire [0:2]r;

BCD_counter b1(clk,reset,enable,ls_sec);
BCD_counter b2(clk,r[0],i[0],ms_sec);

BCD_counter b3(clk,reset,i[1],ls_min);
BCD_counter b4(clk,r[1],i[2],ms_min);

BCD_counter b5(clk,r[2],i[3],ls_hr);
BCD_counter b6(clk,r[2],i[4],ms_hr);


assign r[0] = (ls_sec == 4'd9 && ms_sec == 4'd5)||reset;
assign i[0] = ls_sec==4'd9;
assign i[1] = ls_sec==4'd9 && ms_sec==4'd5;
assign r[1] = (ls_min==4'd9 && ms_min==4'd5 && ls_sec==4'd9 && ms_sec==4'd5 )||reset;
assign r[2] = (ls_hr==4'd3 && ms_hr==4'd2 && ls_min==4'd9 && ms_min==4'd5 && ls_sec==4'd9 && ms_sec==4'd5 )||reset;
assign i[2] = ls_min==4'd9 && ls_sec==4'd9 && ms_sec==4'd5;

assign i[3] = ls_min==4'd9 && ms_min==4'd5 && ls_sec==4'd9 && ms_sec==4'd5;

assign i[4] = ls_hr==4'd9 && ls_min==4'd9 && ms_min==4'd5 && ls_sec==4'd9 && ms_sec==4'd5;
endmodule














