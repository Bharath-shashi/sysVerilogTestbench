//---------------------------------------------------------------------//
//                              Environment                            //
//                                                                     //
//Author: Bharath Shashidhar                    Date: Dec 17, 2015     //
//---------------------------------------------------------------------//

`ifndef ENVIRONMENT
`define ENVIRONMENT

class environment;

virtual input_intf.ip in;
virtual output_intf.op out;

driver drv;
mailbox drvr2sb;
receiver rcvr;
mailbox rcvr2sb;
scoreboard sb;

function new(virtual input_intf.ip in_new, virtual output_intf.op out_new);
this.in = in_new;
this.out = out_new;
$display(" %0d : Environment : created env object", $time);
endfunction : new

function void build();
$display("%0d : Environment : start of build()", $time);
$display("%0d : Environment : end of build()", $time);

drvr2sb = new();
drv = new(in,out,drvr2sb);
rcvr2sb = new();
rcvr = new(in,out,rcvr2sb);
sb = new(drvr2sb, rcvr2sb, in);
endfunction : build

task reset();
$display("%0d : Environment : start of reset()", $time);
in.cb.address <= 0;
in.cb.data_in <= 0;
in.cb.enable <= 0;
in.cb.write <= 0;
out.cb.data_out <= 0;
repeat(4) @(posedge in.clock);
$display("%0d : Environment : end of reset()", $time);
endtask : reset



/*task cfg_dut();
$display("%0d : Environment : start of cfg_dut()", $time);
$display("%0d : Environment : end of cfg_dut()", $time);
endtask : cfg_dut
*/

task start();
$display("%0d : Environment : start of start()", $time);
fork
drv.start();
rcvr.start();
sb.start();
join_none
$display("%0d : Environment : end of start()", $time);
endtask : start

task wait_for_end();
$display("%0d : Environment : start of wait_for_end()", $time);
$display("%0d : Environment : end of wait_for_end()", $time);
endtask : wait_for_end

task run();
$display("%0d : Environment : start of run()", $time);
build();
reset();
//cfg_dut();
start();
wait_for_end();
report();
$display("%0d : Environment : end of run()", $time);
endtask : run

task report();
$display("\n\n**************************************************");
if(0 == in.errors)
$display("**************TEST PASSED**************");
else
$display("**************Test failed with %0d errors ********", in.errors);
$display("***************************************************\n\n");
endtask : report

endclass

`endif
