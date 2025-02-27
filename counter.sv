module counter(
    input clk,
    input ce,
    input nrst,
    input [11:0] max_val,
    output logic [11:0] o_data,
    output logic over
);

logic [11:0] coun_val;

always_ff @(posedge clk)
begin
if (!nrst) begin
    coun_val <= 0;
    over <= 1'b0;
end
else if (ce) begin
    coun_val <= coun_val + 1;
    if(coun_val == (max_val - 2)) begin
    over <= 1'b1;
    end
    else over <= 1'b0;
    if(coun_val == (max_val - 1)) begin
    coun_val <= 0;
    end
end
end

always_comb begin
    o_data = coun_val;
end
endmodule