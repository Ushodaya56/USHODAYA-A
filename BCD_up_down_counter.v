module BCD_up_down_counter(clk,reset,count);

input clk,reset;
output reg [3:0]count;
reg up_down;

always @ (posedge clk)
begin

if(reset)

begin
count<=0;
up_down<=1'b0;
end

else if(reset==1'b0)
        begin
            if((up_down==1'b0)&&(count<4'd9))
               
               count<=count+1'b1;
               
            if(count==4'd9)
              up_down<=1;

            if((up_down==1'b1)&&(count>4'd0))
               count<=count-4'd1;
           
            if((count==4'd0) && (up_down==1'b1))
               up_down<=1'b0;
         end
end
endmodule