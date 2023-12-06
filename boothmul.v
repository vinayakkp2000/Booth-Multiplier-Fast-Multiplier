module boothmul #(parameter BW = 4)(
	input signed [BW-1:0] X, Y,
    	output signed [2*(BW)-1:0] Z
    );
       
    reg signed [2*(BW)-1:0] Z;
    reg [1:0] temp;
    reg E1;
    reg [BW-1:0] Y1;
    
    integer i;
    
	always @ (X, Y) begin
		Z = 8'd0;
		E1 = 1'd0;
		for (i = 0; i < BW; i = i + 1) begin
			temp = {X[i], E1};
       			Y1 = - Y;
  			case (temp)
				2'd2 : Z [2*(BW)-1 : BW] = Z [2*(BW)-1 : BW] + Y1;
		        	2'd1 : Z [2*(BW)-1 : BW] = Z [2*(BW)-1 : BW] + Y;
       				default : begin end
      			endcase
      		
       			Z = Z >> 1;
       			Z[2*(BW)-1] = Z[2*(BW)-2];
            		E1 = X[i];
		end
		
        	if (Y == (1<<(2*(BW)-1))) begin
        		Z = -Z;
        	end
      
	end
      
endmodule
