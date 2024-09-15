module fsm_ctrl_tb;

	`ifdef MEALY_FSM
        	parameter MEALY_FSM = `MEALY_FSM;
    	`else
        	parameter MEALY_FSM = 1'b0;
    	`endif

    	`ifdef LENGTH
        	parameter LENGTH = `LENGTH;
    	`else
        	parameter LENGTH = 32;
    	`endif

	reg clk, rst_n;
	reg stream;

	wire match;
	
	integer i;

fsm_ctrl #(.MEALY_FSM(MEALY_FSM)) u_dut (.clk(clk), .rst_n(rst_n), .stream(stream), .match(match));

initial begin
	$dumpfile ("fsm_ctrl_wave.vcd");
	$dumpvars (0, fsm_ctrl_tb);
	clk = 0;
	forever #1 clk = ~clk;
end

initial begin
	rst_n = 0;

	#1;
	rst_n = 1; 
	stream = 0;

	#1;
	for (i = 0; i < LENGTH; i = i + 1) begin
		@(posedge clk);
		stream = $random;
		#1;
		$display ("stream = %b, match = %b", stream, match);
	end

	#50;
	$finish;
end

endmodule
