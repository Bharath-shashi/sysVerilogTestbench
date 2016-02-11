//---------------------------------------------------------------------//
//                               Receiver                              //
//                                                                     //
//Author: Bharath Shashidhar                    Date: Dec 21, 2015     //
//---------------------------------------------------------------------//


`ifndef RECEIVER
`define RECEIVER 

class receiver;
virtual input_intf.ip in;
virtual output_intf.op out;

mailbox rcvr2sb;

function new(virtual input_intf.ip in_new,virtual output_intf.op out_new, mailbox rcvr2sb);
begin
this.in = in_new;
this.out= out_new;
this.rcvr2sb =  rcvr2sb;
end
endfunction : new 

task start();
begin
reg [7:0] rcvr_box;
wait(in.write == 1'b0);
    repeat(2) @(posedge out.clock)
	rcvr_box = out.data_out;
	rcvr2sb.put(rcvr_box);
	$display("%0t : Output Monitor: Byte received from DUT: %b", $time, rcvr_box);

end
endtask

endclass 

`endif


