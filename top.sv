//---------------------------------------------------------------------//
//                         	     Top                               //
//                                                                     //
//Author: Bharath Shashidhar                    Date: Dec 17, 2015     //
//---------------------------------------------------------------------//

`ifndef TOP
`define TOP

module top();

bit clock;

initial 
forever #10 clock= ~clock;

input_intf in(clock);

output_intf out(clock);

testcase tc(in, out);

memory dut (.clock(clock),.address(in.address), .data_in(in.data_in), .data_out(out.data_out), .write(in.write), .enable(in.enable));

endmodule
`endif
