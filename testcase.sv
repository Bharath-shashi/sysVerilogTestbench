//---------------------------------------------------------------------//
//                        	   Testcase                            //
//                                                                     //
//Author: Bharath Shashidhar                    Date: Dec 17, 2015     //
//---------------------------------------------------------------------//

`ifndef TESTCASE
`define TESTCASE
`include "interface.sv"
`include "environment.sv"

program testcase(input_intf.ip in, output_intf.op out);
environment env;
initial 
begin
$display("**********Start of Testcase*************");
env = new(in,out);
env.run();
#1000;
$display("*************End of Testcase**************");
end
endprogram

`endif
