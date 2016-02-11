//---------------------------------------------------------------------//
//                              Read and Write                         //
//                                                                     //
//Author: Bharath Shashidhar                    Date: Dec 17, 2015     //
//---------------------------------------------------------------------//




task write_to (input logic [7:0] address, logic [7:0] data_in);
begin
in.write = 1'b1;
in.address = address;
in.data_in = data_in;
@(posedge in.clock)
in.write = 1'b0;
end
endtask : write_to 


