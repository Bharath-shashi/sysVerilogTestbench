//---------------------------------------------------------------------//
//                            ScoreBoard                               //
//                                                                     //
//Author: Bharath Shashidhar                    Date: Dec 21, 2015     //
//---------------------------------------------------------------------//

`ifndef SCOREBOARD
`define SCOREBOARD

class scoreboard;

mailbox drvr2sb;
mailbox rcvr2sb;
virtual input_intf.ip in;

function new(mailbox drvr2sb, mailbox rcvr2sb, virtual input_intf.ip in_new);
this.drvr2sb = drvr2sb;
this.rcvr2sb = rcvr2sb;
this.in = in_new;
endfunction : new

task start();
begin

reg [7:0] sent_byte;
reg [7:0] recv_byte;

    drvr2sb.get(sent_byte);
    $display(" %0t : Scoreboard : byte %b received from driver", $time, sent_byte);

    rcvr2sb.get(recv_byte);
    $display(" %0t : scoreboard : byte %b received from output monitor", $time, recv_byte);

    if(sent_byte == recv_byte)
	begin
	   $display("%0t : Scoreboard: Byte sent to DUT match byte received fro, DUT", $time);
	end

     else
	begin
	   $display(" %0t : Scoreboard : ERROR! Byte sent to DUT is not byte received from DUT", $time);
	   in.errors++;
	end
end
endtask

endclass


`endif
