module fsm_ctrl (
    input wire clk,
    input wire rst_n,
    input wire stream,
    output reg match
);

parameter state0 = 3'b000; //start
parameter state1 = 3'b001; //1
parameter state2 = 3'b010; //10
parameter state3 = 3'b011; //101
parameter state4 = 3'b100; //1011

parameter MEALY_FSM = 1;

reg [2:0] state_reg, state_next;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state_reg <= state0;
    end else begin
        state_reg <= state_next;
    end
end

always @(*) begin
    state_next = state_reg;
    case (state_reg)
        state0: begin
            if (stream == 0) 
                state_next = state0;
            else
                state_next = state1;
        end

        state1: begin
            if (stream == 0) 
                state_next = state2;
            else
                state_next = state1;
        end

        state2: begin
            if (stream == 0) 
                state_next = state0;
            else
                state_next = state3;
        end

        state3: begin
            if (stream == 0)
                state_next = state0;
            else 
                state_next = state4;
        end

        state4: begin
            if (stream == 0) 
                state_next = state2;
            else
                state_next = state1;
        end
    endcase
end

generate 
    if (MEALY_FSM) begin 
        always @(*) begin
            case (state_reg)
                state0: match = 0;
                state1: match = 0;
                state2: match = 0;
                state3: begin
                    if (stream) 
                        match = 1;
                    else
                        match = 0;
                end
                state4: match = 0;
                default: match = 0;
            endcase
        end
    end else begin
        always @(*) begin
            match = (state_reg == state4);
        end
    end
endgenerate

endmodule

