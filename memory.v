//---------------------------------------------------------------------//
//			  Synchronous Dual Port RAM		       //
//								       //
//Author: Bharath Shashidhar			Date: Dec 17, 2015     //
//---------------------------------------------------------------------//


`timescale 1 ns/10 ps 
  
module memory(input  logic           clock       ,       // Clock 
              input  logic  [7:0]    address     ,       // Memory address 
              input  logic  [7:0]    data_in     ,       // input data 
              output logic  [7:0]    data_out    ,       // Output data 
              input  logic           write       ,       // 1 is write mode, 0 is read mode 
              input  logic           enable              // Activate the circuit 
             ); 
  
  
logic [7:0] mem [255:0]; 
  
  
always @ (posedge clock) 
begin 
  if(enable)                        //Enable the circuit 
    if(write)                       //Write mode 
      mem[address] = data_in; 
    else                            //Read mode 
      data_out = mem[address]; 
  else 
    data_out = 8'd0; 
end 
  
endmodule
