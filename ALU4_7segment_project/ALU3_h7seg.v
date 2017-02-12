`timescale 1ns / 1ps

module ALU3_h7seg(
    input [2:0] left,right,
    input [1:0] mode,
    output reg [6:0] g_to_a,
    output [3:0] an,
    output dp
    );

	reg [3:0] alu_out = 4'bx;
	
	// for ALU 3 bit operation
	
	always @(left,right,mode)
		begin
			case(mode)
				0: alu_out = left + right;
				1: alu_out = left - right;
				2: if(left >= right)
				      alu_out = left ;
					else
					   alu_out = right;
				3: alu_out = left & right;
				default: alu_out = 4'bX;
			endcase
		end
		
	// for 7 segment display
	
	assign an = 4'b1101;
	assign dp = 1;
	
	always @(*)
		begin
			case(alu_out)
					0: g_to_a = 7'b1000000;
					1: g_to_a = 7'b1111001;
					2: g_to_a = 7'b0100100;
					3: g_to_a = 7'b0110000; //0000110
					4: g_to_a = 7'b0011001;
					5: g_to_a = 7'b0010010;
					6: g_to_a = 7'b0000010;
					7: g_to_a = 7'b1111000;
					8: g_to_a = 7'b0000000;
					9: g_to_a = 7'b0010000;
					
					'hA: g_to_a = 7'b0001000;
					'hb: g_to_a = 7'b0000011;
					'hC: g_to_a = 7'b1000110;
					'hd: g_to_a = 7'b0100001;
					'hE: g_to_a = 7'b0000110;
					'hF: g_to_a = 7'b0001110;
					default: g_to_a = 7'b0001000; //  0001000 = R
			endcase
		end

endmodule
