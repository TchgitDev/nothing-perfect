// Under GPL v3
// Zharkynali Alikhan S.

module register #(
    parameter WIDTH = 8
)(
    input           clk,
    input           rst,
    input           le,
    input           [WIDTH-1:0] data_in,
    output reg      [WIDTH-1:0] data_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 0;
        end    
        else if (le) begin
            data_out <= data_in;
        end
    end

endmodule


// module general_regfile #(
//     parameter WIDTH = 8,
//     parameter WIDTH_REG_OUT_CHOICE_OPCODE = 2
// )(
//     input clk,
//     input rst,
//     input rw,

//     input [WIDTH-1:0] input_from_alu_result,
//     input [WIDTH-1:0] input_from_data_bus,
//     input input_opcode,

//     input [WIDTH_REG_OUT_CHOICE_OPCODE-1:0] reg_first_out_choice_opcode,
//     input [WIDTH_REG_OUT_CHOICE_OPCODE-1:0] reg_second_out_choice_opcode,

//     input [WIDTH_REG_OUT_CHOICE_OPCODE-1:0] 

//     output [WIDTH-1:0] reg_first_out,
//     output [WIDTH-1:0] reg_second_out
// );

// endmodule