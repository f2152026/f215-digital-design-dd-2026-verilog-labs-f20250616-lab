module tb;

  reg  [2:0] t_sel;
  wire [7:0] t_dout;

  lut #(.WIDTH(8), .DEPTH(8)) DUT (
    .sel  (t_sel),
    .dout (t_dout)
  );

  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  integer i;
  initial begin
    for (i = 0; i < 8; i = i + 1) begin
      t_sel = i;
      #5;
    end
    $finish;
  end

  initial
    $monitor($time, " sel=%0d | dout=%0d (expected %0d)", t_sel, t_dout, t_sel*t_sel);

endmodule