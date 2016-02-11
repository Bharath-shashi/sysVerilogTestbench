//---------------------------------------------------------------------//
//                                 Driver                              //
//                                                                     //
//Author: Bharath Shashidhar                    Date: Dec 17, 2015     //
//---------------------------------------------------------------------//


`ifndef DRIVER
`define DRIVER
//`include "write.sv"
//`include "read.sv"
`include "interface.sv"
class driver;


mailbox drvr2sb;

virtual input_intf.ip in;
virtual output_intf.op out;
function new(virtual input_intf.ip in_new,virtual output_intf.op out_new,mailbox drvr2sb);
begin
this.in = in_new;
this.out = out_new;
this.drvr2sb = drvr2sb;
end
endfunction : new

task start();
begin
reg [7:0] address;
reg [7:0] data_in;
//why extra reg??
reg [7:0] send;
reg [7:0] sent;
in.enable = 1'b1;
address = $random;
data_in = $random;
send = data_in;
$display("byte %b from driver", send);
drvr2sb.put(send);

write_to(address,data_in);
drvr2sb.get(sent);
$display("byte sent 2 mailbx %b",sent);

repeat(4) @ (posedge in.clock)
read(address);

end
endtask : start 

task read (logic [7:0] address);
begin
in.write = 1'b0;
in.address = address;
@ (posedge in.clock)
in.write = 1'b1;
end
endtask : read

task write_to (input logic [7:0] address, logic [7:0] data_in);
begin
in.write = 1'b1;
in.address = address;
in.data_in = data_in;
@(posedge in.clock)
in.write = 1'b0;
end
endtask : write_to

endclass
`endif 
