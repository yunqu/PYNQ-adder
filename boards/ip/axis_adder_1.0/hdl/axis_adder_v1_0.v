
`timescale 1 ns / 1 ps

	module axis_adder_v1_0 #
	(
		// Users to add parameters here
        parameter WIDTH = 4,
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output wire  s00_axis_tready,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready
	);
	wire axis2pipe_tvalid, axis2pipe_tready, axis2pipe_tlast;
	wire [C_S00_AXIS_TDATA_WIDTH-1:0] axis2pipe_data;
	
	wire pipe2axis_tvalid, pipe2axis_tready, pipe2axis_tlast;
	wire [C_M00_AXIS_TDATA_WIDTH-1:0] pipe2axis_data;
// Instantiation of Axi Bus Interface S00_AXIS
	axis_adder_v1_0_S00_AXIS # ( 
		.ADDER_WIDTH(WIDTH)
	) axis_adder_v1_0_S00_AXIS_inst (
		.clk(s00_axis_aclk),
		.rst(~s00_axis_aresetn),
		.input_axis_tdata(s00_axis_tdata),
		.input_axis_tvalid(s00_axis_tvalid),
		.input_axis_tready(s00_axis_tready),
		.input_axis_tlast(s00_axis_tlast),
		.output_axis_tdata(axis2pipe_data),
		.output_axis_tvalid(axis2pipe_tvalid),
		.output_axis_tready(axis2pipe_tready),
		.output_axis_tlast(axis2pipe_tlast)
	);

// Instantiation of Axi Bus Interface M00_AXIS
	axis_adder_v1_0_M00_AXIS # ( 
		.ADDER_WIDTH(WIDTH)
	) axis_adder_v1_0_M00_AXIS_inst (
		.clk(m00_axis_aclk),
		.rst(~m00_axis_aresetn),
		.input_axis_tdata(pipe2axis_data),
		.input_axis_tvalid(pipe2axis_tvalid),
		.input_axis_tready(pipe2axis_tready),
		.input_axis_tlast(pipe2axis_tlast),
		.output_axis_tdata(m00_axis_tdata),
		.output_axis_tvalid(m00_axis_tvalid),
		.output_axis_tready(m00_axis_tready),
		.output_axis_tlast(m00_axis_tlast)
	);

	// Add user logic here
    axis_adder # (
        .WIDTH(WIDTH)
    ) axis_adder_inst(
        .a(axis2pipe_data[WIDTH-1:0]),
        .b(axis2pipe_data[2*WIDTH-1:WIDTH]),
        .c(pipe2axis_data[WIDTH:0])
    );
	// User logic ends
	assign axis2pipe_tready = pipe2axis_tready;
	assign pipe2axis_tvalid = axis2pipe_tvalid;
	assign pipe2axis_tlast = axis2pipe_tlast;

	endmodule
