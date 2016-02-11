//---------------------------------------------------------------------//
//                        	   Interface                           //
//                                                                     //
//Author: Bharath Shashidhar                    Date: Dec 17, 2015     //
//---------------------------------------------------------------------//

`ifndef INTERFACE
`define INTERFACE

// Input to the DUT is output to the interface
interface input_intf(input bit clock);
logic [7:0] address;
logic [7:0] data_in;
logic enable;
logic write;
int errors;

clocking cb @(posedge clock);
default input #1 output #1;
output address;
output data_in;
output enable;
output write;
//logic errors;
endclocking

modport ip(clocking cb,input clock,output address, data_in,enable,write, errors);
endinterface

//output to the DUT is input to the interface
interface output_intf(input bit clock);
logic [7:0] data_out;
clocking cb @(posedge clock);
default input #1 output #1;
input data_out;
endclocking
modport op(clocking cb, input clock,data_out);
endinterface


`endif
