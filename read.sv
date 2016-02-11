//---------------------------------------------------------------------//
//                              Read and Write                         //
//                                                                     //
//Author: Bharath Shashidhar                    Date: Dec 17, 2015     //
//---------------------------------------------------------------------//





task read (logic [7:0] address);
begin
in.write = 1'b0;
in.address = address;
@ (posedge in.clock)
in.write = 1'b1;
end
endtask : read

