module count_down(

    input clk,
    input rst,
    output[4:0] count,
    output[31:0] data_o,
    output[11:0] r_addr_o,
    output r_en,
    output w_en

    );

//create counter
reg [26:0] cyc_count;
initial cyc_count <= '0;
always @(posedge clk)
    if (rst) begin
       cyc_count <= '0;
    end
    else begin
        cyc_count <= cyc_count + 1; 
    end
    
reg [4:0] count_out;
initial count_out <= 5'b11111;
always @(posedge clk)
    if (rst) begin
        count_out <= 5'b11111;
    end
    else if (cyc_count == 27'b111111111111111111111111111) begin    //substracks one every 1.3 secs
        count_out <= count_out - 1;
    end
    
assign count = count_out;

//bram
reg [31:0]  bram[4096];
reg [11:0]  r_addr;
reg [11:0]  w_addr;
reg         wen;
reg         ren;
reg [31:0]  w_data = 32'hdeadbeef;
reg [31:0]  r_data;

always @(posedge clk) begin
    if (wen) begin
        bram[w_addr] <= w_data;
    end   
    if (ren) begin
        r_data <= bram[r_addr];
    end
end

typedef enum logic[1:0] {IDLE,WRITE,READ} state;

state currentState, nextState;    

always @(posedge clk)
    if (rst) begin
        currentState <= IDLE;
    end
    else begin
        currentState <= nextState;
    end
            
always @(*)
    case(currentState)
        IDLE: begin
            wen <= 0;
            ren <= 0;
            r_addr <= '0;
            w_addr <= '0;
            if (~rst) nextState <= WRITE;
        end
        WRITE: begin
            wen <= 1;
            ren <= 0;
            w_addr <= w_addr + 1;
            nextState <= READ;
        end
        READ: begin
            wen <= 0;
            ren <= 1;
            r_addr <= r_addr +1;
            nextState <= WRITE;
        end
        
        default: nextState <= IDLE;
     endcase
     
assign data_o = r_data;
assign r_addr_o = r_addr;
assign r_en = ren;
assign w_en = wen;                 
 
endmodule
