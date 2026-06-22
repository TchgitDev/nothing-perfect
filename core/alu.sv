// Under GPL v3
// Zharkynali Alikhan S.

`define OP_ADD                          4'h0
`define OP_SUB                          4'h1
`define OP_AND                          4'h2
`define OP_OR                           4'h3
`define OP_XOR                          4'h4
`define OP_SHR                          4'h5
`define OP_SHL                          4'h6

module alu #(
    parameter WIDTH = 8
)(
    input           [WIDTH-1:0]     op_a,
    input           [WIDTH-1:0]     op_b,
    
    input           [3:0]           opcode,

    output logic    [WIDTH-1:0]     alu_result
);

    // And/Sub Operations
    logic [WIDTH-1:0] add;
    logic [WIDTH-1:0] sub;

    // Logic Operations
    logic [WIDTH-1:0] l_and;
    logic [WIDTH-1:0] l_or;
    logic [WIDTH-1:0] l_xor;
    
    // Shift Operations
    logic [WIDTH-1:0] shr;
    logic [WIDTH-1:0] shl;


    // Assigns

    localparam SHIFT_BITS = $clog2(WIDTH);

    // Logic Operations
    assign add  =   op_a + op_b;
    assign sub  =   op_a - op_b;

    // Logic Operations
    assign l_and  =   op_a & op_b;
    assign l_xor  =   op_a ^ op_b;
    assign l_or   =   op_a | op_b;

    // Shift Operations
    assign shr  =   op_a>>op_b[SHIFT_BITS-1:0];
    assign shl  =   op_a<<op_b[SHIFT_BITS-1:0];

    always_comb begin
        case(opcode)
            // Add/Sub Opcodes
            `OP_ADD     :   alu_result = add;
            `OP_SUB     :   alu_result = sub;

            // Logic Opcodes
            `OP_AND     :   alu_result = l_and;
            `OP_OR      :   alu_result = l_or;
            `OP_XOR     :   alu_result = l_xor;

            // Shift Opcodes
            `OP_SHR     :   alu_result = shr;
            `OP_SHL     :   alu_result = shl;
        endcase
    end

endmodule