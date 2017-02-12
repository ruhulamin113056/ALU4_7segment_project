`timescale 1ns / 1ps


module testbanch;

	// Inputs
	reg [2:0] left;
	reg [2:0] right;
	reg [1:0] mode;

	// Outputs
	wire [6:0] g_to_a;
	wire [3:0] an;
	wire dp;

	// Instantiate the Unit Under Test (UUT)
	ALU3_h7seg uut (
		.left(left), 
		.right(right), 
		.mode(mode), 
		.g_to_a(g_to_a), 
		.an(an), 
		.dp(dp)
	);

	initial begin
		// Initialize Inputs
		#10 ; left = 7; right = 3;
		#10 ; mode = 0; 
		#10 ; mode = 1;
		#10 ; mode = 2;
		#10 ; mode = 3;

		// Wait 100 ns for global reset to finish
		#10; $stop;
        
		// Add stimulus here

	end
      
endmodule

