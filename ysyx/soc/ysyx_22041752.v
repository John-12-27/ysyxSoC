    
`ifndef _MY_CPU_H_
`define _MY_CPU_H_

    `define ysyx_22041752_DATA_ADDR_WD      32
    `define ysyx_22041752_DATA_DATA_WD      64
    `define ysyx_22041752_DATA_WEN_WD        8
    `define ysyx_22041752_RF_ADDR_WD         5
    `define ysyx_22041752_RF_DATA_WD        64
    `define ysyx_22041752_RF_WEN_WD          8
    `define ysyx_22041752_RF_NUM            32

    `define ysyx_22041752_INST_WD           32
    `define ysyx_22041752_PC_WD             32
    `define ysyx_22041752_RESET_PC_VALUE    `ysyx_22041752_PC_WD'h2fff_fffc

    `define ysyx_22041752_BR_BUS_WD         33
    `define ysyx_22041752_PS_TO_FS_BUS_WD   `ysyx_22041752_PC_WD
    `define ysyx_22041752_FS_TO_DS_BUS_WD   118
    `define ysyx_22041752_DS_TO_ES_BUS_WD   324
    `define ysyx_22041752_ES_TO_MS_BUS_WD   79
    `define ysyx_22041752_MS_TO_WS_BUS_WD   70
    `define ysyx_22041752_WS_TO_RF_BUS_WD   70
    `define ysyx_22041752_FORWARD_BUS_WD    71
    `define ysyx_22041752_WS_FORWARD_BUS_WD 70


    `define ysyx_22041752_CSR_ADDR_MSTATUS  12'h300
    `define ysyx_22041752_CSR_ADDR_MIE      12'h304
    `define ysyx_22041752_CSR_ADDR_MTVEC    12'h305
    `define ysyx_22041752_CSR_ADDR_MEPC     12'h341
    `define ysyx_22041752_CSR_ADDR_MCAUSE   12'h342
    `define ysyx_22041752_CSR_ADDR_MIP      12'h344

    `define ysyx_22041752_ICACHE_SIZE         (4*1024)
    `define ysyx_22041752_ICACHE_EN_WD        (`ysyx_22041752_ICACHE_SIZE / 1024)
    `define ysyx_22041752_ICACHE_WAY          2
    `define ysyx_22041752_ICACHE_SIZE_PERWAY  (`ysyx_22041752_ICACHE_SIZE / `ysyx_22041752_ICACHE_WAY)
    `define ysyx_22041752_ICACHE_SIZE_PERLINE (128 / 8)
    `define ysyx_22041752_ICACHE_LINE_PERWAY  (`ysyx_22041752_ICACHE_SIZE_PERWAY / `ysyx_22041752_ICACHE_SIZE_PERLINE)
    `define ysyx_22041752_ICACHE_INDEX_WD     $clog2(`ysyx_22041752_ICACHE_LINE_PERWAY)
    `define ysyx_22041752_ICACHE_OFFSET_WD    $clog2(`ysyx_22041752_ICACHE_SIZE_PERLINE)
    `define ysyx_22041752_ICACHE_TAG_WD       `ysyx_22041752_PC_WD - `ysyx_22041752_ICACHE_OFFSET_WD - `ysyx_22041752_ICACHE_INDEX_WD
    `define ysyx_22041752_IRS_TO_ICS_BUS_WD   36

    `define ysyx_22041752_DCACHE_SIZE         (4*1024)
    `define ysyx_22041752_DCACHE_EN_WD        (`ysyx_22041752_DCACHE_SIZE / 1024)
    `define ysyx_22041752_DCACHE_WAY          4
    `define ysyx_22041752_DCACHE_SIZE_PERWAY  (`ysyx_22041752_DCACHE_SIZE / `ysyx_22041752_DCACHE_WAY)
    `define ysyx_22041752_DCACHE_SIZE_PERLINE (128 / 8)
    `define ysyx_22041752_DCACHE_LINE_PERWAY  (`ysyx_22041752_DCACHE_SIZE_PERWAY / `ysyx_22041752_DCACHE_SIZE_PERLINE)
    `define ysyx_22041752_DCACHE_INDEX_WD     $clog2(`ysyx_22041752_DCACHE_LINE_PERWAY)
    `define ysyx_22041752_DCACHE_OFFSET_WD    $clog2(`ysyx_22041752_DCACHE_SIZE_PERLINE)
    `define ysyx_22041752_DCACHE_TAG_WD       `ysyx_22041752_DATA_ADDR_WD - `ysyx_22041752_DCACHE_OFFSET_WD - `ysyx_22041752_DCACHE_INDEX_WD
    `define ysyx_22041752_DRS_TO_DCS_BUS_WD   110

    `define ysyx_22041752_MEM_BASEADDR        32'h8000_0000
    `define ysyx_22041752_MEM_END             32'hfbff_ffff
    `define ysyx_22041752_FLASH_BASEADDR      32'h3000_0000
    `define ysyx_22041752_FLASH_END           32'h3fff_ffff
    `define ysyx_22041752_UART_BASEADDR       32'h1000_0000
    `define ysyx_22041752_UART_END            32'h1000_0fff
    `define ysyx_22041752_SPI_BASEADDR        32'h1000_1000
    `define ysyx_22041752_SPI_END             32'h1000_1fff
    `define ysyx_22041752_CLINT_BASE_ADDR     32'h0200_0000
    `define ysyx_22041752_MTIME_OFFSET        32'h0000_bff8
    `define ysyx_22041752_MTIMECMP_OFFSET     32'h0000_4000

    /*`define DPI_C*/
    `define REAL_MUL
    `define REAL_DIV
    `define REAL_DIV_MUL 
`endif

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2022 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752.v
// Author        : Cw
// Created On    : 2022-10-17 21:44
// Last Modified : 2023-07-18 21:09
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752(
    input         clock,
    input         reset,

    input          io_interrupt     ,
    output         io_slave_awready ,
    input          io_slave_awvalid ,
    input  [3:0]   io_slave_awid    ,
    input  [31:0]  io_slave_awaddr  ,
    input  [7:0]   io_slave_awlen   ,
    input  [2:0]   io_slave_awsize  ,
    input  [1:0]   io_slave_awburst ,
    output         io_slave_wready  ,
    input          io_slave_wvalid  ,
    input  [63:0]  io_slave_wdata   ,
    input  [7:0]   io_slave_wstrb   ,
    input          io_slave_wlast   ,
    input          io_slave_bready  ,
    output         io_slave_bvalid  ,
    output [3:0]   io_slave_bid     ,
    output [1:0]   io_slave_bresp   ,
    output         io_slave_arready ,
    input          io_slave_arvalid ,
    input  [3:0]   io_slave_arid    ,
    input  [31:0]  io_slave_araddr  ,
    input  [7:0]   io_slave_arlen   ,
    input  [2:0]   io_slave_arsize  ,
    input  [1:0]   io_slave_arburst ,
    input          io_slave_rready  ,
    output         io_slave_rvalid  ,
    output [3:0]   io_slave_rid     ,
    output [63:0]  io_slave_rdata   ,
    output [1:0]   io_slave_rresp   ,
    output         io_slave_rlast   ,

    input          io_master_awready ,
    output         io_master_awvalid ,
    output [3:0]   io_master_awid    ,
    output [31:0]  io_master_awaddr  ,
    output [7:0]   io_master_awlen   ,
    output [2:0]   io_master_awsize  ,
    output [1:0]   io_master_awburst ,
    input          io_master_wready  ,
    output         io_master_wvalid  ,
    output [63:0]  io_master_wdata   ,
    output [7:0]   io_master_wstrb   ,
    output         io_master_wlast   ,
    output         io_master_bready  ,
    input          io_master_bvalid  ,
    input  [3:0]   io_master_bid     ,
    input  [1:0]   io_master_bresp   ,
    input          io_master_arready ,
    output         io_master_arvalid ,
    output [3:0]   io_master_arid    ,
    output [31:0]  io_master_araddr  ,
    output [7:0]   io_master_arlen   ,
    output [2:0]   io_master_arsize  ,
    output [1:0]   io_master_arburst ,
    output         io_master_rready  ,
    input          io_master_rvalid  ,
    input  [3:0]   io_master_rid     ,
    input  [63:0]  io_master_rdata   ,
    input  [1:0]   io_master_rresp   ,
    input          io_master_rlast   ,

    output [5:0]   io_sram0_addr     ,
    output         io_sram0_cen      ,
    output         io_sram0_wen      ,
    output [127:0] io_sram0_wmask    ,
    output [127:0] io_sram0_wdata    ,
    input  [127:0] io_sram0_rdata    ,
    output [5:0]   io_sram1_addr     ,
    output         io_sram1_cen      ,
    output         io_sram1_wen      ,
    output [127:0] io_sram1_wmask    ,
    output [127:0] io_sram1_wdata    ,
    input  [127:0] io_sram1_rdata    ,
    output [5:0]   io_sram2_addr     ,
    output         io_sram2_cen      ,
    output         io_sram2_wen      ,
    output [127:0] io_sram2_wmask    ,
    output [127:0] io_sram2_wdata    ,
    input  [127:0] io_sram2_rdata    ,
    output [5:0]   io_sram3_addr     ,
    output         io_sram3_cen      ,
    output         io_sram3_wen      ,
    output [127:0] io_sram3_wmask    ,
    output [127:0] io_sram3_wdata    ,
    input  [127:0] io_sram3_rdata    ,
    output [5:0]   io_sram4_addr     ,
    output         io_sram4_cen      ,
    output         io_sram4_wen      ,
    output [127:0] io_sram4_wmask    ,
    output [127:0] io_sram4_wdata    ,
    input  [127:0] io_sram4_rdata    ,
    output [5:0]   io_sram5_addr     ,
    output         io_sram5_cen      ,
    output         io_sram5_wen      ,
    output [127:0] io_sram5_wmask    ,
    output [127:0] io_sram5_wdata    ,
    input  [127:0] io_sram5_rdata    ,
    output [5:0]   io_sram6_addr     ,
    output         io_sram6_cen      ,
    output         io_sram6_wen      ,
    output [127:0] io_sram6_wmask    ,
    output [127:0] io_sram6_wdata    ,
    input  [127:0] io_sram6_rdata    ,
    output [5:0]   io_sram7_addr     ,
    output         io_sram7_cen      ,
    output         io_sram7_wen      ,
    output [127:0] io_sram7_wmask    ,
    output [127:0] io_sram7_wdata    ,
    input  [127:0] io_sram7_rdata    
);

assign io_slave_awready= 0; 
assign io_slave_wready = 0;
assign io_slave_bvalid = 0;   
assign io_slave_bid    = 0; 
assign io_slave_bresp  = 0; 
assign io_slave_arready= 0; 
assign io_slave_rvalid = 0; 
assign io_slave_rid    = 0; 
assign io_slave_rdata  = 0; 
assign io_slave_rresp  = 0; 
assign io_slave_rlast  = 0; 

wire         int_t;
wire         fence_i;
wire         fence_over;
wire         flush;
wire         flush_pc_p4;
wire         pre_error;       
wire [`ysyx_22041752_PC_WD-1:0] flush_pc  ;

wire         ds_allowin;
wire         es_allowin;
wire         ms_allowin;
wire         ws_allowin;
wire         fs_to_ds_valid;
wire         ds_to_es_valid;
wire         es_to_ms_valid;
wire         ms_to_ws_valid;
wire [`ysyx_22041752_FS_TO_DS_BUS_WD -1:0]   fs_to_ds_bus;
wire [`ysyx_22041752_DS_TO_ES_BUS_WD -1:0]   ds_to_es_bus;
wire [`ysyx_22041752_ES_TO_MS_BUS_WD -1:0]   es_to_ms_bus;
wire [`ysyx_22041752_MS_TO_WS_BUS_WD -1:0]   ms_to_ws_bus;
wire [`ysyx_22041752_WS_TO_RF_BUS_WD -1:0]   ws_to_rf_bus;
wire [`ysyx_22041752_PC_WD           -1:0]   ra_data     ;
wire [`ysyx_22041752_FORWARD_BUS_WD -1:0]    es_forward_bus;
wire [`ysyx_22041752_FORWARD_BUS_WD-1:0]     ms_forward_bus;
wire [`ysyx_22041752_WS_FORWARD_BUS_WD -1:0] ws_forward_bus;

`ifdef DPI_C
// trace debug interface
wire [`ysyx_22041752_PC_WD       -1:0] debug_wb_pc      ;
wire [`ysyx_22041752_PC_WD       -1:0] debug_es_pc      ;
wire                                   debug_es_bjpre_error; 
wire                                   debug_es_bj_inst ; 
wire                                   debug_es_exp     ;
wire                                   debug_es_mret    ;
wire                                   debug_es_data_ren;
wire                                   debug_es_data_wen;
wire [`ysyx_22041752_DATA_ADDR_WD-1:0] debug_es_data_addr;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] debug_es_data_wdata;
wire                                   debug_ws_valid   ;
wire [`ysyx_22041752_INST_WD     -1:0] debug_ds_inst    ;
wire [`ysyx_22041752_INST_WD     -1:0] debug_es_inst    ;
wire [`ysyx_22041752_INST_WD     -1:0] debug_ms_inst    ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] debug_ms_data_rdata;
wire                                   debug_ms_rdata_valid;
wire [`ysyx_22041752_INST_WD     -1:0] debug_ws_inst    ;
wire                                   debug_es_out_of_mem;
wire                                   debug_ms_out_of_mem;
wire                                   debug_ws_out_of_mem;
wire [`ysyx_22041752_RF_DATA_WD  -1:0] dpi_regs [`ysyx_22041752_RF_NUM-1:0];
wire [`ysyx_22041752_RF_DATA_WD  -1:0] dpi_csrs [3:0];
wire [                            0:0] stop;
wire                                   debug_icache_miss;
wire                                   debug_dcache_miss;
wire                                   debug_dcache_en;
`endif

wire clk = clock;

// fetch insts interface
wire                                   inst_en   ;
wire [`ysyx_22041752_DATA_ADDR_WD-1:0] inst_addr ;
wire [`ysyx_22041752_INST_WD-1:0]      inst_rdata;
wire                                   icache_miss;
// ld/store interface
wire                                   es_data_en    ;
wire [`ysyx_22041752_DATA_WEN_WD -1:0] es_data_wen   ;
wire [`ysyx_22041752_DATA_ADDR_WD-1:0] es_data_addr  ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] es_data_wdata ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] ms_data_rdata ;
wire                                   ms_miss       ;
wire                                   es_write_hit  ;

// IF stage
ysyx_22041752_IFU U_IFU_0(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ds_allowin     (ds_allowin     ),
    //outputs
    .fs_to_ds_valid (fs_to_ds_valid ),
    .fs_to_ds_bus   (fs_to_ds_bus   ),

    .inst_en        (inst_en        ),
    .inst_addr      (inst_addr      ),
    .inst_rdata     (inst_rdata     ),
    .cache_miss     (icache_miss    ) ,

    .ra_data        (ra_data        ),
    .flush          (flush|pre_error|fence_over),
    .flush_pc_p4    (flush_pc_p4    ),
    .flush_pc       (flush_pc       )

`ifdef DPI_C
    ,
    .debug_icache_miss (debug_icache_miss)
`endif
);

// ID stage
ysyx_22041752_IDU U_IDU_0(
    .clk            ( clk            ),
    .reset          ( reset          ),
    .es_allowin     ( es_allowin     ),
    .ds_allowin     ( ds_allowin     ),
    .fs_to_ds_valid ( fs_to_ds_valid ),
    .fs_to_ds_bus   ( fs_to_ds_bus   ),
    .ds_to_es_valid ( ds_to_es_valid ),
    .ds_to_es_bus   ( ds_to_es_bus   ),
    .ws_to_rf_bus   ( ws_to_rf_bus   ),
    .es_forward_bus ( es_forward_bus ),
    .ms_forward_bus ( ms_forward_bus ),
    .ws_forward_bus ( ws_forward_bus ),
    .ra_data        ( ra_data        ),
    .flush          ( flush|pre_error|fence_over)
`ifdef DPI_C
    ,
    .dpi_regs       ( dpi_regs       ),
    .stop           ( stop           ),
    .debug_ds_inst  ( debug_ds_inst  )
`endif
);

// EXE stage
ysyx_22041752_EXU U_EXU_0(
    .clk            ( clk             ),
    .reset          ( reset           ),
    .ms_allowin     ( ms_allowin      ),
    .es_allowin     ( es_allowin      ),
    .ds_to_es_valid ( ds_to_es_valid  ),
    .ds_to_es_bus   ( ds_to_es_bus    ),
    .es_to_ms_valid ( es_to_ms_valid  ),
    .es_to_ms_bus   ( es_to_ms_bus    ),
    .es_forward_bus ( es_forward_bus  ),
    .data_en        ( es_data_en      ),
    .data_wen       ( es_data_wen     ),
    .data_addr      ( es_data_addr    ),
    .data_wdata     ( es_data_wdata   ),
    .write_hit      ( es_write_hit    ),
    .fence_i_o      ( fence_i         ),
    .fence_over     ( fence_over      ),
    .flush          ( flush           ),
    .flush_pc       ( flush_pc        ),
    .int_t_i        ( int_t           ),
    .flush_pc_p4    ( flush_pc_p4     ),
    .bjpre_error    ( pre_error       )
`ifdef DPI_C
    ,
    .debug_es_bjpre_error(debug_es_bjpre_error),
    .dpi_csrs            ( dpi_csrs        ),
    .es_exp              ( debug_es_exp    ),
    .es_mret             ( debug_es_mret   ),
    .debug_es_bj_inst    ( debug_es_bj_inst),
    .debug_es_data_addr  ( debug_es_data_addr),
    .debug_es_out_of_mem ( debug_es_out_of_mem),
    .debug_es_data_ren   ( debug_es_data_ren),
    .debug_es_data_wen   ( debug_es_data_wen),
    .debug_es_data_wdata ( debug_es_data_wdata),
    .debug_es_pc         ( debug_es_pc     ),
    .debug_ds_inst       ( debug_ds_inst   ),
    .debug_es_inst       ( debug_es_inst   )
`endif
);

// MEM stage
ysyx_22041752_MEU U_MEU_0(
    .clk            ( clk             ),
    .reset          ( reset           ),
    .ws_allowin     ( ws_allowin      ),
    .ms_allowin     ( ms_allowin      ),
    .es_to_ms_valid ( es_to_ms_valid  ),
    .es_to_ms_bus   ( es_to_ms_bus    ),
    .ms_to_ws_valid ( ms_to_ws_valid  ),
    .ms_to_ws_bus   ( ms_to_ws_bus    ),
    .data_rdata     ( ms_data_rdata   ),
    .cache_miss     ( ms_miss         ),
    .ms_forward_bus ( ms_forward_bus  )
`ifdef DPI_C
    ,
    .debug_es_inst  ( debug_es_inst   ),
    .debug_ms_inst  ( debug_ms_inst   ),
    .debug_ms_data_rdata    (debug_ms_data_rdata),
    .debug_es_out_of_mem    (debug_es_out_of_mem),
    .debug_ms_out_of_mem    (debug_ms_out_of_mem),
    .debug_cache_miss       (debug_dcache_miss  ),
    .debug_ms_rdata_valid   (debug_ms_rdata_valid)
`endif
);

// WB stage
ysyx_22041752_WBU U_WBU_0(
    .clk                    ( clk               ),
    .reset                  ( reset             ),
    .ws_allowin             ( ws_allowin        ),
    .ms_to_ws_valid         ( ms_to_ws_valid    ),
    .ms_to_ws_bus           ( ms_to_ws_bus      ),
    .ws_to_rf_bus           ( ws_to_rf_bus      ),
    .ws_forward_bus         ( ws_forward_bus    )
`ifdef DPI_C
    ,
    .debug_ws_valid         ( debug_ws_valid    ),
    .debug_ms_inst          ( debug_ms_inst     ),
    .debug_ms_out_of_mem    (debug_ms_out_of_mem),
    .debug_ws_inst          ( debug_ws_inst     ),
    .debug_ws_out_of_mem    (debug_ws_out_of_mem),
    .debug_wb_pc	        ( debug_wb_pc	    )
`endif
);

wire                                   icache_req       ;
wire [`ysyx_22041752_DATA_ADDR_WD-1:0] icache_req_addr  ;
wire                                   icache_ready     ;
wire                                   icache_valid     ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] icache_rdata     ;
ysyx_22041752_ICACHE U_ICACHE_0(
    .clk                            ( clk                       ),
    .reset                          ( reset                     ),
    .flush                          ( flush|pre_error           ),
    .fence_i                        ( fence_i                   ),
    .inst_en                        ( inst_en                   ),
    .inst_addr                      ( inst_addr                 ),
    .inst_rdata                     ( inst_rdata                ),
    .cache_miss                     ( icache_miss               ),
    .sram_req                       ( icache_req                ),
    .sram_ready                     ( icache_ready              ),
    .sram_addr                      ( icache_req_addr           ),
    .sram_rdata                     ( icache_rdata              ),
    .sram_valid                     ( icache_valid              ),
    .io_sram0_addr                  ( io_sram0_addr             ),
    .io_sram0_cen                   ( io_sram0_cen              ),
    .io_sram0_wen                   ( io_sram0_wen              ),
    .io_sram0_wmask                 ( io_sram0_wmask            ),
    .io_sram0_wdata                 ( io_sram0_wdata            ),
    .io_sram0_rdata                 ( io_sram0_rdata            ),
    .io_sram1_addr                  ( io_sram1_addr             ),
    .io_sram1_cen                   ( io_sram1_cen              ),
    .io_sram1_wen                   ( io_sram1_wen              ),
    .io_sram1_wmask                 ( io_sram1_wmask            ),
    .io_sram1_wdata                 ( io_sram1_wdata            ),
    .io_sram1_rdata                 ( io_sram1_rdata            ),
    .io_sram2_addr                  ( io_sram2_addr             ),
    .io_sram2_cen                   ( io_sram2_cen              ),
    .io_sram2_wen                   ( io_sram2_wen              ),
    .io_sram2_wmask                 ( io_sram2_wmask            ),
    .io_sram2_wdata                 ( io_sram2_wdata            ),
    .io_sram2_rdata                 ( io_sram2_rdata            ),
    .io_sram3_addr                  ( io_sram3_addr             ),
    .io_sram3_cen                   ( io_sram3_cen              ),
    .io_sram3_wen                   ( io_sram3_wen              ),
    .io_sram3_wmask                 ( io_sram3_wmask            ),
    .io_sram3_wdata                 ( io_sram3_wdata            ),
    .io_sram3_rdata                 ( io_sram3_rdata            )
);

wire                                   clint_en   ;
wire                                   clint_wen  ;
wire [`ysyx_22041752_DATA_ADDR_WD-1:0] clint_addr ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] clint_wdata;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] clint_rdata;

wire                                   dcache_data_en    ;
wire [`ysyx_22041752_DATA_WEN_WD -1:0] dcache_data_wen   ;
wire [`ysyx_22041752_DATA_ADDR_WD-1:0] dcache_data_addr  ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] dcache_data_wdata ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] dcache_data_rdata ;
wire                                   dcache_miss       ;
wire                                   dcache_write_hit  ;
wire                                   dcache_sram_req   ;
wire                                   dcache_sram_ready ;
wire [`ysyx_22041752_DATA_WEN_WD -1:0] dcache_sram_wen   ;
wire [`ysyx_22041752_DATA_ADDR_WD-1:0] dcache_sram_addr  ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] dcache_sram_wdata ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] dcache_sram_rdata ;
wire                                   dcache_sram_valid ;

wire                                   io_data_en    ;
wire [`ysyx_22041752_DATA_WEN_WD -1:0] io_data_wen   ;
wire [`ysyx_22041752_DATA_ADDR_WD-1:0] io_data_addr  ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] io_data_wdata ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] io_data_rdata ;
wire                                   io_miss       ;
wire                                   io_sram_req   ;
wire [2:0]                             io_sram_size  ;
wire                                   io_sram_ready ;
wire [`ysyx_22041752_DATA_WEN_WD -1:0] io_sram_wen   ;
wire [`ysyx_22041752_DATA_ADDR_WD-1:0] io_sram_addr  ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] io_sram_wdata ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] io_sram_rdata ;
wire                                   io_sram_valid ;

wire                                   sram_req   ;
wire [2:0]                             sram_size  ;
wire                                   sram_ready ;
wire [`ysyx_22041752_DATA_WEN_WD -1:0] sram_wen   ;
wire [`ysyx_22041752_DATA_ADDR_WD-1:0] sram_addr  ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] sram_wdata ;
wire [`ysyx_22041752_DATA_DATA_WD-1:0] sram_rdata ;
wire                                   sram_valid ;

ysyx_22041752_memspace U_MEMSPACE_0(
    .clk                            ( clk                         ),
    .reset                          ( reset                       ),
    .es_data_en_i                   ( es_data_en                  ),
    .es_data_wen_i                  ( es_data_wen                 ),
    .es_data_addr_i                 ( es_data_addr                ),
    .es_data_wdata_i                ( es_data_wdata               ),
    .es_write_hit_o                 ( es_write_hit                ),
    .ms_data_rdata_o                ( ms_data_rdata               ),
    .ms_miss_o                      ( ms_miss                     ),
    .clint_en_o                     ( clint_en                    ),
    .clint_wen_o                    ( clint_wen                   ),
    .clint_data_addr_o              ( clint_addr                  ),
    .clint_data_wdata_o             ( clint_wdata                 ),
    .clint_data_rdata_i             ( clint_rdata                 ),
    .dcache_en_o                    ( dcache_data_en              ),
    .dcache_wen_o                   ( dcache_data_wen             ),
    .dcache_data_addr_o             ( dcache_data_addr            ),
    .dcache_data_wdata_o            ( dcache_data_wdata           ),
    .dcache_miss_i                  ( dcache_miss                 ),
    .dcache_write_hit_i             ( dcache_write_hit            ),
    .dcache_data_rdata_i            ( dcache_data_rdata           ),
    .io_miss_i                      ( io_miss                     ),
    .io_data_rdata_i                ( io_data_rdata               ),
    .io_en_o                        ( io_data_en                  ),
    .io_wen_o                       ( io_data_wen                 ),
    .io_data_addr_o                 ( io_data_addr                ),
    .io_data_wdata_o                ( io_data_wdata               )
`ifdef DPI_C
    ,
    .debug_dcache_en                ( debug_dcache_en             )
`endif

);

ysyx_22041752_clint U_CLINT_0(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .en                             ( clint_en                      ),
    .wen                            ( clint_wen                     ),
    .addr                           ( clint_addr                    ),
    .wdata                          ( clint_wdata                   ),
    .rdata                          ( clint_rdata                   ),
    .int_t_o                        ( int_t                         )
);

ysyx_22041752_DCACHE U_DCACHE_0(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .fence_i                        ( fence_i                       ),
    .fence_over                     ( fence_over                    ),
    .data_en                        ( dcache_data_en                ),
    .data_wen                       ( dcache_data_wen               ),
    .data_addr                      ( dcache_data_addr              ),
    .data_wdata                     ( dcache_data_wdata             ),
    .data_rdata                     ( dcache_data_rdata             ),
    .cache_miss                     ( dcache_miss                   ),
    .write_hit                      ( dcache_write_hit              ),
    .sram_req                       ( dcache_sram_req               ),
    .sram_ready                     ( dcache_sram_ready             ),
    .sram_wen                       ( dcache_sram_wen               ),
    .sram_addr                      ( dcache_sram_addr              ),
    .sram_wdata                     ( dcache_sram_wdata             ),
    .sram_rdata                     ( dcache_sram_rdata             ),
    .sram_valid                     ( dcache_sram_valid             ),
    .io_sram4_addr                  ( io_sram4_addr                 ), 
    .io_sram4_cen                   ( io_sram4_cen                  ),
    .io_sram4_wen                   ( io_sram4_wen                  ),
    .io_sram4_wmask                 ( io_sram4_wmask                ),
    .io_sram4_wdata                 ( io_sram4_wdata                ),
    .io_sram4_rdata                 ( io_sram4_rdata                ),
    .io_sram5_addr                  ( io_sram5_addr                 ),
    .io_sram5_cen                   ( io_sram5_cen                  ),
    .io_sram5_wen                   ( io_sram5_wen                  ),
    .io_sram5_wmask                 ( io_sram5_wmask                ),
    .io_sram5_wdata                 ( io_sram5_wdata                ),
    .io_sram5_rdata                 ( io_sram5_rdata                ),
    .io_sram6_addr                  ( io_sram6_addr                 ),
    .io_sram6_cen                   ( io_sram6_cen                  ),
    .io_sram6_wen                   ( io_sram6_wen                  ),
    .io_sram6_wmask                 ( io_sram6_wmask                ),
    .io_sram6_wdata                 ( io_sram6_wdata                ),
    .io_sram6_rdata                 ( io_sram6_rdata                ),
    .io_sram7_addr                  ( io_sram7_addr                 ),
    .io_sram7_cen                   ( io_sram7_cen                  ),
    .io_sram7_wen                   ( io_sram7_wen                  ),
    .io_sram7_wmask                 ( io_sram7_wmask                ),
    .io_sram7_wdata                 ( io_sram7_wdata                ),
    .io_sram7_rdata                 ( io_sram7_rdata                )
);

ysyx_22041752_io U_IO_0(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .io_en                          ( io_data_en                    ),
    .io_wen                         ( io_data_wen                   ),
    .io_data_addr                   ( io_data_addr                  ),
    .io_data_wdata                  ( io_data_wdata                 ),
    .io_data_rdata                  ( io_data_rdata                 ),
    .io_miss                        ( io_miss                       ),
    .sram_req                       ( io_sram_req                   ),
    .size                           ( io_sram_size                  ),
    .sram_ready                     ( io_sram_ready                 ),
    .sram_wen                       ( io_sram_wen                   ),
    .sram_addr                      ( io_sram_addr                  ),
    .sram_wdata                     ( io_sram_wdata                 ),
    .sram_rdata                     ( io_sram_rdata                 ),
    .sram_valid                     ( io_sram_valid                 )
);

ysyx_22041752_mmu U_MMU_0(
    .clk                            ( clk                         ),
    .reset                          ( reset                       ),
    .dcache_sram_req_i              ( dcache_sram_req             ),
    .dcache_sram_ready_o            ( dcache_sram_ready           ),
    .dcache_sram_wen_i              ( dcache_sram_wen             ),
    .dcache_sram_addr_i             ( dcache_sram_addr            ),
    .dcache_sram_wdata_i            ( dcache_sram_wdata           ),
    .dcache_sram_rdata_o            ( dcache_sram_rdata           ),
    .dcache_sram_valid_o            ( dcache_sram_valid           ),
    .io_sram_req_i                  ( io_sram_req                 ),
    .io_sram_size_i                 ( io_sram_size                ),
    .io_sram_ready_o                ( io_sram_ready               ),
    .io_sram_wen_i                  ( io_sram_wen                 ),
    .io_sram_addr_i                 ( io_sram_addr                ),
    .io_sram_wdata_i                ( io_sram_wdata               ),
    .io_sram_rdata_o                ( io_sram_rdata               ),
    .io_sram_valid_o                ( io_sram_valid               ),
    .sram_req_o                     ( sram_req                    ),
    .sram_size_o                    ( sram_size                   ),
    .sram_ready_i                   ( sram_ready                  ),
    .sram_wen_o                     ( sram_wen                    ),
    .sram_addr_o                    ( sram_addr                   ),
    .sram_wdata_o                   ( sram_wdata                  ),
    .sram_rdata_i                   ( sram_rdata                  ),
    .sram_valid_i                   ( sram_valid                  )
);

ysyx_22041752_axiarbiter U_AXIARBITER_0(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .inst_en                        ( icache_req                    ),
    .inst_ready                     ( icache_ready                  ),
    .inst_addr                      ( icache_req_addr               ),
    .inst_rdata                     ( icache_rdata                  ),
    .inst_valid                     ( icache_valid                  ),
    .data_en                        ( sram_req                      ),
    .data_size                      ( sram_size                     ),
    .data_ready                     ( sram_ready                    ),
    .data_wen                       ( sram_wen                      ),
    .data_addr                      ( sram_addr                     ),
    .data_wdata                     ( sram_wdata                    ),
    .data_rdata                     ( sram_rdata                    ),
    .data_valid                     ( sram_valid                    ),
    .arid                           ( io_master_arid                ),
    .araddr                         ( io_master_araddr              ),
    .arlen                          ( io_master_arlen               ),
    .arsize                         ( io_master_arsize              ),
    .arburst                        ( io_master_arburst             ),
    .arvalid                        ( io_master_arvalid             ),
    .arready                        ( io_master_arready             ),
    .rid                            ( io_master_rid                 ),
    .rdata                          ( io_master_rdata               ),
    .rresp                          ( io_master_rresp               ),
    .rlast                          ( io_master_rlast               ),
    .rvalid                         ( io_master_rvalid              ),
    .rready                         ( io_master_rready              ),
    .awid                           ( io_master_awid                ),
    .awaddr                         ( io_master_awaddr              ),
    .awlen                          ( io_master_awlen               ),
    .awsize                         ( io_master_awsize              ),
    .awburst                        ( io_master_awburst             ),
    .awvalid                        ( io_master_awvalid             ),
    .awready                        ( io_master_awready             ),
    .wdata                          ( io_master_wdata               ),
    .wstrb                          ( io_master_wstrb               ),
    .wlast                          ( io_master_wlast               ),
    .wvalid                         ( io_master_wvalid              ),
    .wready                         ( io_master_wready              ),
    .bid                            ( io_master_bid                 ),
    .bresp                          ( io_master_bresp               ),
    .bvalid                         ( io_master_bvalid              ),
    .bready                         ( io_master_bready              )
);


`ifdef DPI_C
dpi_c u_dpi_c(
    .clk                    (  clk                       ),
    .stop                   (  stop                      ),
    .ws_valid               (  debug_ws_valid            ),
    .dpi_regs               (  dpi_regs                  ),
    .dpi_csrs               (  dpi_csrs                  ),
    .debug_wb_pc            ( {32'd0,debug_wb_pc}        ),
    .debug_es_pc            ( {32'd0,debug_es_pc}        ),
    .debug_es_bjpre_error   ( debug_es_bjpre_error       ),
    .debug_es_bj_inst       ( debug_es_bj_inst           ),
    .debug_es_exp           ( debug_es_exp               ),
    .debug_es_mret          ( debug_es_mret              ),
    .debug_es_data_ren      ( debug_es_data_ren          ),
    .debug_es_data_wen      ( debug_es_data_wen          ),
    .debug_ms_rdata_valid   ( debug_ms_rdata_valid       ),
    .debug_ms_data_rdata    ( debug_ms_data_rdata        ),
    .debug_es_data_addr     ( {32'b0,debug_es_data_addr} ),
    .debug_es_data_wdata    ( debug_es_data_wdata        ),
    .debug_ws_inst          ( debug_ws_inst              ),
    .debug_ws_out_of_mem    ( debug_ws_out_of_mem        ),
    .debug_es_inst          ( debug_es_inst              ),
    .debug_icache_miss      ( debug_icache_miss          ),
    .debug_dcache_miss      ( debug_dcache_miss          ),
    .debug_dcache_en        ( debug_dcache_en            )
);
`endif

endmodule
// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2022 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_aser.v
// Author        : Cw
// Created On    : 2022-08-24 09:46
// Last Modified : 2023-06-03 20:30
// ---------------------------------------------------------------------------------
// Description   : 64-bit adder_suber 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_aser #( 
    parameter WIDTH = 64   )
(
    input  [WIDTH-1:0] a        ,
    input  [WIDTH-1:0] b        ,
    input              sub      ,
    output             cout     ,
    output [WIDTH-1:0] result   
);

wire [WIDTH-1:0] x  ;
wire [WIDTH-1:0] y  ;

assign x = a;
assign y = sub ? ~b : b;
assign {cout, result} = x + y + {{WIDTH{1'b0}}, sub};

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2022 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_IFU.v
// Author        : Cw
// Created On    : 2022-10-17 20:50
// Last Modified : 2023-07-20 12:39
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_IFU (
    input                                        clk            ,
    input                                        reset          ,
    
    input                                        ds_allowin     ,
    
    output                                       fs_to_ds_valid ,
    output [`ysyx_22041752_FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus   ,
    
    output                                       inst_en        ,
    output [`ysyx_22041752_DATA_ADDR_WD-1:0]     inst_addr      ,
    input  [`ysyx_22041752_INST_WD-1:0]          inst_rdata     ,
    input                                        cache_miss     ,

    input  [`ysyx_22041752_PC_WD       -1:0]     ra_data        ,
    input                                        flush          , 
    input  [`ysyx_22041752_PC_WD-1:0]            flush_pc       ,
    input                                        flush_pc_p4    
`ifdef DPI_C
    ,
    output                                       debug_icache_miss
`endif

);

reg         fs_valid;
wire        fs_ready_go;
wire        fs_allowin;
wire        to_fs_valid;

wire [`ysyx_22041752_PC_WD-1:0] seq_bj_pc;
wire [`ysyx_22041752_PC_WD-1:0] nextpc;

wire fs_inst_jal  ;
wire fs_inst_jalr ;
wire fs_inst_beq  ;
wire fs_inst_bne  ;
wire fs_inst_blt  ;
wire fs_inst_bge  ;
wire fs_inst_bltu ;
wire fs_inst_bgeu ;
wire [12:0] imm_b ;

wire [`ysyx_22041752_INST_WD-1:0] fs_inst;
reg  [`ysyx_22041752_PC_WD-1:0]   fs_pc;
wire                              br_taken;
wire [`ysyx_22041752_PC_WD-1:0]   br_target;
assign fs_to_ds_bus = {fs_inst      , 
                       fs_pc        ,
                       fs_inst_jal  ,
                       fs_inst_jalr ,                       
                       fs_inst_beq  ,
                       fs_inst_bne  ,
                       fs_inst_blt  ,
                       fs_inst_bge  ,
                       fs_inst_bltu ,
                       fs_inst_bgeu ,
                       br_taken     ,
                       br_target    ,
                       imm_b        
                      };

reg [`ysyx_22041752_PC_WD-1:0] flush_pc_r;
always @(posedge clk) begin
    if (reset) begin
        flush_pc_r <= 0;
    end
    else if (flush && !(fs_to_ds_valid && ds_allowin)) begin
        flush_pc_r <= seq_bj_pc;
    end
end
reg flush_pc_r_v;
always @(posedge clk) begin
    if (reset) begin
        flush_pc_r_v <= 0;
    end
    else if (flush && !(fs_to_ds_valid && ds_allowin)) begin
        flush_pc_r_v <= 1;
    end
    else if (inst_en) begin
        flush_pc_r_v <= 0;
    end
end

assign nextpc  = flush_pc_r_v  ? flush_pc_r :
                                 seq_bj_pc  ; 

assign to_fs_valid  = ~reset;

assign fs_ready_go    = !cache_miss;
assign fs_allowin     = !fs_valid || fs_ready_go && ds_allowin;
assign fs_to_ds_valid =  fs_valid && fs_ready_go && !flush && !flush_pc_r_v;
always @(posedge clk) begin
    if (reset) begin
        fs_valid <= 1'b0;
    end
    else if (fs_allowin) begin
        fs_valid <= to_fs_valid;
    end
end

always @(posedge clk) begin
    if (reset) begin
        fs_pc <= `ysyx_22041752_RESET_PC_VALUE;   
    end
    else if (to_fs_valid && fs_allowin) begin
        fs_pc <= nextpc;
    end
end

assign inst_en    = to_fs_valid && fs_allowin; 
assign inst_addr  = nextpc;

reg inst_rdata_r_v;
always @(posedge clk) begin
    if (reset) begin
        inst_rdata_r_v <= 0;
    end
    else if (fs_to_ds_valid && !ds_allowin) begin
        inst_rdata_r_v <= 1;
    end
    else if (fs_to_ds_valid||flush) begin
        inst_rdata_r_v <= 0;
    end
end
reg [`ysyx_22041752_INST_WD-1:0] inst_rdata_r;
always @(posedge clk) begin
    if (reset) begin
        inst_rdata_r <= 0;
    end
    else if (fs_to_ds_valid && !ds_allowin && !inst_rdata_r_v) begin
        inst_rdata_r <= inst_rdata;
    end
end
assign fs_inst = inst_rdata_r_v ? inst_rdata_r : inst_rdata;

/*=======================================================================================*/
/*=======================================================================================*/
/*=======================================================================================*/
wire [ 6:0] opcode = fs_inst[ 6: 0];
wire [ 2:0] funct3 = fs_inst[14:12];
assign imm_b  = {fs_inst[31], fs_inst[7], fs_inst[30:25], fs_inst[11:8], 1'b0};
wire [11:0] imm_i  = fs_inst[31:20]; 
wire [20:0] imm_j  = {fs_inst[31], fs_inst[19:12], fs_inst[20], fs_inst[30:21], 1'b0}; 

assign fs_inst_jal  = opcode == 7'b1101111;
assign fs_inst_jalr = opcode == 7'b1100111;
assign fs_inst_beq  = opcode == 7'b1100011 && funct3 == 3'b000;
assign fs_inst_bne  = opcode == 7'b1100011 && funct3 == 3'b001;
assign fs_inst_blt  = opcode == 7'b1100011 && funct3 == 3'b100;
assign fs_inst_bge  = opcode == 7'b1100011 && funct3 == 3'b101;
assign fs_inst_bltu = opcode == 7'b1100011 && funct3 == 3'b110;
assign fs_inst_bgeu = opcode == 7'b1100011 && funct3 == 3'b111;

assign br_taken=fs_valid && ((fs_inst_beq  || 
                              fs_inst_bne  || 
                              fs_inst_blt  || 
                              fs_inst_bge  || 
                              fs_inst_bltu || 
                              fs_inst_bgeu) && imm_b[12] || fs_inst_jal || fs_inst_jalr);

wire [`ysyx_22041752_PC_WD-1:0] bt_a;
wire [`ysyx_22041752_PC_WD-1:0] bt_b;
wire [`ysyx_22041752_PC_WD-1:0] bt_c;

assign bt_a = flush ? flush_pc : fs_inst_jalr ? ra_data : fs_pc;

assign bt_b = (fs_inst_beq || fs_inst_bne || fs_inst_blt || fs_inst_bge || fs_inst_bltu || fs_inst_bgeu) ? {{19{imm_b[12]}},imm_b} :
               fs_inst_jalr                                                                              ? {{20{imm_i[11]}},imm_i} :
                                                                                                           {{11{imm_j[20]}},imm_j} ;

assign bt_c = flush &&!flush_pc_p4 ? 0    : 
              flush && flush_pc_p4 ? 4    : 
              br_taken             ? bt_b : 
                                     4    ;
assign br_target = seq_bj_pc;

wire count;
ysyx_22041752_aser #(.WIDTH (32))
U_ASER_1(
    .a          ( bt_a      ),
    .b          ( bt_c      ),
    .sub        ( 1'b0      ),
    .cout       ( count     ),
    .result     ( seq_bj_pc )
);

`ifdef DPI_C
    assign debug_icache_miss = cache_miss;
`endif
endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2022 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_IDU.v
// Author        : Cw
// Created On    : 2022-10-17 21:00
// Last Modified : 2023-07-24 12:06
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_IDU (
    input                                          clk           ,
    input                                          reset         ,
    
    input                                          es_allowin    ,
    output                                         ds_allowin    ,
   
    input                                          fs_to_ds_valid,
    input  [`ysyx_22041752_FS_TO_DS_BUS_WD -1:0]   fs_to_ds_bus  ,
    
    output                                         ds_to_es_valid,
    output [`ysyx_22041752_DS_TO_ES_BUS_WD -1:0]   ds_to_es_bus  ,
    
    input  [`ysyx_22041752_WS_TO_RF_BUS_WD -1:0]   ws_to_rf_bus  ,
	
	input  [`ysyx_22041752_FORWARD_BUS_WD -1:0]    es_forward_bus,
	input  [`ysyx_22041752_FORWARD_BUS_WD-1:0]     ms_forward_bus,
	input  [`ysyx_22041752_WS_FORWARD_BUS_WD -1:0] ws_forward_bus,

    output [`ysyx_22041752_PC_WD          -1:0]    ra_data       ,
    input                                          flush         

`ifdef DPI_C
        ,
    //used to dpi-c debug
    output [`ysyx_22041752_RF_DATA_WD     -1:0]    dpi_regs [`ysyx_22041752_RF_NUM-1:0],
    output [                               0:0]    stop                                ,
    output [`ysyx_22041752_INST_WD        -1:0]    debug_ds_inst
`endif
);

reg  ds_valid   ;
wire ds_ready_go;

reg  [`ysyx_22041752_FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus_r;
wire [`ysyx_22041752_INST_WD         -1:0] ds_inst;
wire [`ysyx_22041752_PC_WD           -1:0] ds_pc  ;
wire inst_jal       ;
wire inst_jalr      ;
wire inst_beq       ;
wire inst_bne       ;
wire inst_blt       ;
wire inst_bge       ;
wire inst_bltu      ;
wire inst_bgeu      ;
wire [12:0] ds_imm_b;
wire                              br_taken;
wire [`ysyx_22041752_PC_WD-1:0]   br_target;

assign {ds_inst  ,
        ds_pc    ,
        inst_jal ,  
        inst_jalr,  
        inst_beq ,  
        inst_bne ,  
        inst_blt ,  
        inst_bge ,  
        inst_bltu,  
        inst_bgeu,
        br_taken ,
        br_target,
        ds_imm_b 
       } = fs_to_ds_bus_r;

wire                   rf_we   ;
wire [`ysyx_22041752_RF_ADDR_WD-1:0] rf_waddr;
wire [`ysyx_22041752_RF_DATA_WD-1:0] rf_wdata;
assign {rf_we   ,  //69:69
        rf_waddr,  //68:64
        rf_wdata   //63:0
       } = ws_to_rf_bus;

wire mul_u  ;
wire mul_su ;
wire mul_h  ;
wire div_u  ;
wire op_mul ;
wire op_div ;
wire op_rem ;

wire [4:0] imm_csr;
wire csri   ;
wire csrrs  ;
wire csrrc  ;
wire op_add ;
wire op_sub ;
wire op_slt ;
wire op_sltu;
wire op_and ;
wire op_or  ;
wire op_xor ;
wire op_sll ;
wire op_srl ;
wire op_sra ;

wire        res_sext    ;
wire        res_zext    ;
wire        src_shamt   ;
wire        src_pc      ;
wire        src_imm_u   ;
wire        src_4       ;
wire        src_0       ;
wire        src_imm_i   ;
wire        src_imm_s   ;
wire        src_csr     ;
wire        id_csr_we   ;
wire        id_rf_we    ;
wire        id_mem_we   ;
wire        id_mem_re   ;
wire [ 1:0] id_mem_bytes;
wire [ 5:0] shamt;
wire [19:0] imm_u;
wire [11:0] imm_i;
wire [11:0] imm_s;
wire [11:0] rscsr;

wire [ 6:0] opcode;
wire [ 4:0] rd;
wire [ 2:0] funct3;
wire [ 4:0] rs1;
wire [ 4:0] rs2;
wire [ 6:0] funct7;
wire [ 5:0] sh_funct6;

wire es_rs1_hazard;
wire es_rs2_hazard;
wire ms_rs1_hazard;
wire ms_rs2_hazard;
wire ws_rs1_hazard;
wire ws_rs2_hazard;

wire [`ysyx_22041752_RF_ADDR_WD-1:0] es_dest_reg;
wire [`ysyx_22041752_RF_ADDR_WD-1:0] ms_dest_reg;
wire [`ysyx_22041752_RF_ADDR_WD-1:0] ws_dest_reg;
wire [`ysyx_22041752_RF_DATA_WD-1:0] es_wreg_data;
wire [`ysyx_22041752_RF_DATA_WD-1:0] ms_wreg_data;
wire [`ysyx_22041752_RF_DATA_WD-1:0] ws_wreg_data;
wire                                 es_mem_re;
wire                                 ms_mem_re;
wire                                 es_forward_valid;
wire                                 ms_forward_valid;
wire                                 ws_forward_valid;
wire [`ysyx_22041752_RF_DATA_WD-1:0] data_r1;
wire [`ysyx_22041752_RF_DATA_WD-1:0] data_r2;
wire [`ysyx_22041752_RF_DATA_WD-1:0] rs1_value;
wire [`ysyx_22041752_RF_DATA_WD-1:0] rs2_value;

wire inst_fence_i;
wire inst_lui    ;
wire inst_auipc  ;
wire inst_lb     ;
wire inst_lh     ;
wire inst_lw     ;
wire inst_lbu    ;
wire inst_lhu    ;
wire inst_lwu    ;
wire inst_ld     ;
wire inst_sb     ;
wire inst_sh     ;
wire inst_sw     ;
wire inst_sd     ;
wire inst_addi   ;
wire inst_addiw  ;
wire inst_slti   ;
wire inst_sltiu  ;
wire inst_xori   ;
wire inst_ori    ;
wire inst_andi   ;
wire inst_slli   ;
wire inst_slliw  ;
wire inst_srli   ;
wire inst_srliw  ;
wire inst_srai   ;
wire inst_sraiw  ;
wire inst_add    ;
wire inst_addw   ;
wire inst_sub    ;
wire inst_subw   ;
wire inst_sll    ;
wire inst_sllw   ;
wire inst_slt    ;
wire inst_sltu   ;
wire inst_xor    ;
wire inst_srl    ;
wire inst_srlw   ;
wire inst_sra    ;
wire inst_sraw   ;
wire inst_or     ;
wire inst_and    ;
wire inst_mul    ;
wire inst_mulh   ;
wire inst_mulhsu ;
wire inst_mulhu  ;
wire inst_mulw   ;
wire inst_div    ;
wire inst_divu   ;
wire inst_divw   ;
wire inst_divuw  ;
wire inst_rem    ;
wire inst_remu   ;
wire inst_remw   ;
wire inst_remuw  ;
wire inst_csrrw  ;
wire inst_csrrs  ;
wire inst_csrrc  ;
wire inst_csrrwi ;
wire inst_csrrsi ;
wire inst_csrrci ;
wire inst_ecall  ;
wire inst_mret   ;

assign ds_to_es_bus = {inst_fence_i  ,
                       inst_ecall    ,
                       inst_mret     ,
                       div_u         ,
                       mul_u         ,
                       mul_su        ,
                       mul_h         ,
                       inst_jalr     ,  
                       inst_beq      ,  
                       inst_bne      ,  
                       inst_blt      ,  
                       inst_bge      ,  
                       inst_bltu     ,  
                       inst_bgeu     ,  
                       br_taken      ,
                       br_target     ,
                       ds_imm_b      ,
                       op_mul        ,
                       op_div        ,
                       op_rem        ,
                       op_add        ,   
                       op_sub        ,  
                       op_slt        ,  
                       op_sltu       ,  
                       op_and        ,  
                       op_or         ,  
                       op_xor        ,  
                       op_sll        ,  
                       op_srl        ,  
                       op_sra        ,  
                       res_sext      , 
                       res_zext      , 
                       shamt         ,  
                       src_shamt     ,  
					   src_pc        ,	
					   src_imm_u     ,  
                       src_4         ,  
                       src_0         ,
                       src_imm_i     ,  
                       src_imm_s     ,  
                       src_csr       ,
                       rscsr         ,
                       id_csr_we     ,
                       csrrc         ,
                       csrrs         ,
                       csri          ,
                       imm_csr       ,
                       id_rf_we      ,  
                       id_mem_we     ,
                       id_mem_re     ,
                       id_mem_bytes  ,
                       rd            ,  
                       imm_s         ,  
                       imm_i         ,  
                       imm_u         ,  
                       rs1_value     ,  
                       rs2_value     ,  
                       ds_pc            
                      };

assign ds_allowin     = !ds_valid || ds_ready_go && es_allowin;
assign ds_to_es_valid = ds_valid && ds_ready_go && ~flush;
assign ds_ready_go = !(ms_mem_re && (ms_rs1_hazard || ms_rs2_hazard) ||
                       es_mem_re && (es_rs1_hazard || es_rs2_hazard));
always @(posedge clk) begin
	if(reset)begin
		ds_valid <= 1'b0;
	end
	else if(ds_allowin)begin
		ds_valid <= fs_to_ds_valid;
	end
end

always @(posedge clk) begin
    if (reset) begin
        fs_to_ds_bus_r <= 0;
    end
	else if (fs_to_ds_valid && ds_allowin) begin
        fs_to_ds_bus_r <= fs_to_ds_bus;
    end
end

//wire inst_invalid;
//assign inst_invalid = !(inst_lui   || 
                        //inst_auipc || 
                        //inst_jal   || 
                        //inst_jalr  || 
                        //inst_beq   || 
                        //inst_bne   || 
                        //inst_blt   || 
                        //inst_bge   || 
                        //inst_bltu  || 
                        //inst_bgeu  || 
                        //inst_lb    || 
                        //inst_lh    || 
                        //inst_lw    || 
                        //inst_lbu   || 
                        //inst_lhu   || 
                        //inst_lwu   || 
                        //inst_ld    || 
                        //inst_sb    || 
                        //inst_sh    || 
                        //inst_sw    || 
                        //inst_sd    || 
                        //inst_addi  || 
                        //inst_addiw || 
                        //inst_slti  || 
                        //inst_sltiu || 
                        //inst_xori  || 
                        //inst_ori   || 
                        //inst_andi  || 
                        //inst_slli  || 
                        //inst_slliw || 
                        //inst_srli  || 
                        //inst_srliw || 
                        //inst_srai  || 
                        //inst_sraiw || 
                        //inst_add   || 
                        //inst_addw  || 
                        //inst_sub   || 
                        //inst_subw  || 
                        //inst_sll   || 
                        //inst_sllw  || 
                        //inst_slt   || 
                        //inst_sltu  || 
                        //inst_xor   || 
                        //inst_srl   || 
                        //inst_srlw  || 
                        //inst_sra   || 
                        //inst_sraw  || 
                        //inst_or    || 
                        //inst_and   || 
                        //inst_mul   || 
                        //inst_mulh  || 
                        //inst_mulhsu|| 
                        //inst_mulhu || 
                        //inst_mulw  || 
                        //inst_div   || 
                        //inst_divu  || 
                        //inst_divw  || 
                        //inst_divuw || 
                        //inst_rem   || 
                        //inst_remu  || 
                        //inst_remw  || 
                        //inst_remuw ||
                        //inst_csrrw ||
                        //inst_csrrs ||
                        //inst_csrrc ||
                        //inst_csrrwi||
                        //inst_csrrsi||
                        //inst_csrrci||
                        //inst_ecall ||
                        //inst_mret  );

assign opcode    = ds_inst[ 6: 0];
assign rd        = ds_inst[11: 7];
assign funct3    = ds_inst[14:12];
assign rs1       = ds_inst[19:15];
assign rs2       = ds_inst[24:20];
assign funct7    = ds_inst[31:25];
assign sh_funct6 = funct7 [ 6: 1];
assign shamt     = ds_inst[25:20];
assign rscsr     = ds_inst[31:20];
assign imm_u     = ds_inst[31:12];
assign imm_i     = ds_inst[31:20]; 
assign imm_s     = {ds_inst[31:25], ds_inst[11:7]}; 

assign inst_add    = funct7 == 7'b0000000 && funct3 == 3'b0   && opcode == 7'b0110011;
assign inst_addw   = funct7 == 7'b0000000 && funct3 == 3'b0   && opcode == 7'b0111011;
assign inst_sub    = funct7 == 7'b0100000 && funct3 == 3'b0   && opcode == 7'b0110011;
assign inst_subw   = funct7 == 7'b0100000 && funct3 == 3'b0   && opcode == 7'b0111011;
assign inst_sll    = funct7 == 7'b0000000 && funct3 == 3'b001 && opcode == 7'b0110011;
assign inst_sllw   = funct7 == 7'b0000000 && funct3 == 3'b001 && opcode == 7'b0111011;
assign inst_slt    = funct7 == 7'b0000000 && funct3 == 3'b010 && opcode == 7'b0110011;
assign inst_sltu   = funct7 == 7'b0000000 && funct3 == 3'b011 && opcode == 7'b0110011;
assign inst_xor    = funct7 == 7'b0000000 && funct3 == 3'b100 && opcode == 7'b0110011;
assign inst_srl    = funct7 == 7'b0000000 && funct3 == 3'b101 && opcode == 7'b0110011;
assign inst_srlw   = funct7 == 7'b0000000 && funct3 == 3'b101 && opcode == 7'b0111011;
assign inst_sra    = funct7 == 7'b0100000 && funct3 == 3'b101 && opcode == 7'b0110011;
assign inst_sraw   = funct7 == 7'b0100000 && funct3 == 3'b101 && opcode == 7'b0111011;
assign inst_or     = funct7 == 7'b0000000 && funct3 == 3'b110 && opcode == 7'b0110011;
assign inst_and    = funct7 == 7'b0000000 && funct3 == 3'b111 && opcode == 7'b0110011;
assign inst_mul    = funct7 == 7'b0000001 && funct3 == 3'b000 && opcode == 7'b0110011; 
assign inst_mulh   = funct7 == 7'b0000001 && funct3 == 3'b001 && opcode == 7'b0110011; 
assign inst_mulhsu = funct7 == 7'b0000001 && funct3 == 3'b010 && opcode == 7'b0110011;
assign inst_mulhu  = funct7 == 7'b0000001 && funct3 == 3'b011 && opcode == 7'b0110011; 
assign inst_mulw   = funct7 == 7'b0000001 && funct3 == 3'b000 && opcode == 7'b0111011;
assign inst_div    = funct7 == 7'b0000001 && funct3 == 3'b100 && opcode == 7'b0110011; 
assign inst_divu   = funct7 == 7'b0000001 && funct3 == 3'b101 && opcode == 7'b0110011; 
assign inst_divw   = funct7 == 7'b0000001 && funct3 == 3'b100 && opcode == 7'b0111011; 
assign inst_divuw  = funct7 == 7'b0000001 && funct3 == 3'b101 && opcode == 7'b0111011; 
assign inst_rem    = funct7 == 7'b0000001 && funct3 == 3'b110 && opcode == 7'b0110011; 
assign inst_remu   = funct7 == 7'b0000001 && funct3 == 3'b111 && opcode == 7'b0110011; 
assign inst_remw   = funct7 == 7'b0000001 && funct3 == 3'b110 && opcode == 7'b0111011; 
assign inst_remuw  = funct7 == 7'b0000001 && funct3 == 3'b111 && opcode == 7'b0111011; 

assign inst_csrrw  = funct3 == 3'b001 && opcode == 7'b1110011;
assign inst_csrrs  = funct3 == 3'b010 && opcode == 7'b1110011;
assign inst_csrrc  = funct3 == 3'b011 && opcode == 7'b1110011;
assign inst_csrrwi = funct3 == 3'b101 && opcode == 7'b1110011;
assign inst_csrrsi = funct3 == 3'b110 && opcode == 7'b1110011;
assign inst_csrrci = funct3 == 3'b111 && opcode == 7'b1110011;
assign inst_ecall  = funct7 == 7'b0000000 && rs2 == 5'b00000 && rs1 == 5'b00000 && funct3 == 3'b000 && rd == 5'b00000 && opcode == 7'b1110011;
assign inst_mret   = funct7 == 7'b0011000 && rs2 == 5'b00010 && rs1 == 5'b00000 && funct3 == 3'b000 && rd == 5'b00000 && opcode == 7'b1110011;

assign inst_lui    = opcode == 7'b0110111;
assign inst_auipc  = opcode == 7'b0010111;

assign inst_fence_i= opcode == 7'b0001111 && funct3 == 3'b001;

assign inst_lb     = opcode == 7'b0000011 && funct3 == 3'b000;
assign inst_lh     = opcode == 7'b0000011 && funct3 == 3'b001;
assign inst_lw     = opcode == 7'b0000011 && funct3 == 3'b010;
assign inst_lbu    = opcode == 7'b0000011 && funct3 == 3'b100;
assign inst_lhu    = opcode == 7'b0000011 && funct3 == 3'b101;
assign inst_lwu    = opcode == 7'b0000011 && funct3 == 3'b110;
assign inst_ld     = opcode == 7'b0000011 && funct3 == 3'b011;
assign inst_sb     = opcode == 7'b0100011 && funct3 == 3'b000;
assign inst_sh     = opcode == 7'b0100011 && funct3 == 3'b001;
assign inst_sw     = opcode == 7'b0100011 && funct3 == 3'b010;
assign inst_sd     = opcode == 7'b0100011 && funct3 == 3'b011;
assign inst_addi   = opcode == 7'b0010011 && funct3 == 3'b000;
assign inst_addiw  = opcode == 7'b0011011 && funct3 == 3'b000;
assign inst_slti   = opcode == 7'b0010011 && funct3 == 3'b010;
assign inst_sltiu  = opcode == 7'b0010011 && funct3 == 3'b011;
assign inst_xori   = opcode == 7'b0010011 && funct3 == 3'b100;
assign inst_ori    = opcode == 7'b0010011 && funct3 == 3'b110;
assign inst_andi   = opcode == 7'b0010011 && funct3 == 3'b111;
assign inst_slli   = opcode == 7'b0010011 && funct3 == 3'b001 && sh_funct6 == 6'b000000 ;
assign inst_slliw  = opcode == 7'b0011011 && funct3 == 3'b001 && funct7    == 7'b0000000;
assign inst_srli   = opcode == 7'b0010011 && funct3 == 3'b101 && sh_funct6 == 6'b000000 ;
assign inst_srliw  = opcode == 7'b0011011 && funct3 == 3'b101 && funct7    == 7'b0000000;
assign inst_srai   = opcode == 7'b0010011 && funct3 == 3'b101 && sh_funct6 == 6'b010000 ;
assign inst_sraiw  = opcode == 7'b0011011 && funct3 == 3'b101 && funct7    == 7'b0100000;

assign op_mul = inst_mul  | inst_mulh  | inst_mulhsu| inst_mulhu | inst_mulw;
assign mul_u  = inst_mulhu;
assign mul_su = inst_mulhsu;
assign mul_h  = inst_mulh | inst_mulhsu| inst_mulhu;
assign div_u  = inst_divu | inst_divuw | inst_remu  | inst_remuw ;
assign op_div = inst_div  | inst_divu  | inst_divw  | inst_divuw ;
assign op_rem = inst_rem  | inst_remu  | inst_remw  | inst_remuw ;
assign op_add = inst_add  | inst_addw  | inst_auipc | inst_jal   | inst_jalr   | inst_sd     | 
                inst_lb   | inst_lh    | inst_lw    | inst_lbu   | inst_lhu    | inst_addi   | 
                inst_lwu  | inst_ld    | inst_sb    | inst_sh    | inst_sw     | inst_addiw  |
                inst_lui  | inst_csrrw | inst_csrrs | inst_csrrc | inst_csrrwi | inst_csrrsi |
                inst_csrrci;

assign csri   = inst_csrrwi | inst_csrrsi | inst_csrrci;
assign imm_csr= rs1;
assign csrrs  = inst_csrrs  | inst_csrrsi;
assign csrrc  = inst_csrrc  | inst_csrrci;

assign op_sub = inst_sub  | inst_subw;
assign op_slt = inst_slti | inst_slt;
assign op_sltu= inst_sltiu| inst_sltu;
assign op_and = inst_andi | inst_and;
assign op_or  = inst_ori  | inst_or;
assign op_xor = inst_xori | inst_xor;
assign op_sll = inst_slli | inst_slliw | inst_sll | inst_sllw;
assign op_srl = inst_srli | inst_srliw | inst_srl | inst_srlw;
assign op_sra = inst_srai | inst_sraiw | inst_sra | inst_sraw;
assign id_csr_we = inst_csrrw  || inst_csrrs || inst_csrrc|| inst_csrrwi|| inst_csrrsi || inst_csrrci;
assign id_rf_we  = !(inst_sb   || inst_sh    || inst_sw   || inst_sd    || inst_beq  || 
                    inst_bne   || inst_blt   || inst_bge  || inst_bltu  || inst_bgeu ||
                    inst_ecall || inst_mret );
assign id_mem_we = inst_sb   || inst_sh    || inst_sw   || inst_sd;
assign id_mem_re = inst_lb   || inst_lh    || inst_lw   || inst_lbu   || inst_lhu  || inst_lwu   || inst_ld;
assign src_shamt = inst_slli || inst_slliw || inst_srli || inst_srliw || inst_srai || inst_sraiw; 
assign src_pc    = inst_jal  || inst_jalr  || inst_auipc;
assign src_imm_u = inst_lui  || inst_auipc;
assign src_4     = inst_jal  || inst_jalr;
assign src_0     = inst_lui  || inst_csrrw || inst_csrrs|| inst_csrrc || inst_csrrwi|| inst_csrrsi||inst_csrrci;
assign src_imm_i = inst_lb   || inst_lh    || inst_lw   || inst_lbu   || inst_lhu  || inst_lwu  ||
                   inst_ld   || inst_addi  || inst_addiw|| inst_slti  || inst_sltiu|| inst_xori || inst_ori || inst_andi;
assign src_imm_s = inst_sb   || inst_sh    || inst_sw   || inst_sd;
assign src_csr   = inst_csrrw|| inst_csrrs || inst_csrrc|| inst_csrrwi|| inst_csrrsi||inst_csrrci;
assign res_sext  = inst_lb   || inst_lh    || inst_lw   ||
                   inst_addiw|| inst_slliw || inst_srliw|| inst_sraiw || inst_addw || inst_subw || inst_sllw||
                   inst_srlw || inst_sraw  || inst_mulw || inst_divw  || inst_divuw|| inst_remw || inst_remuw;
assign res_zext  = inst_lbu  || inst_lhu   || inst_lwu;
assign id_mem_bytes = (inst_lb || inst_lbu || inst_sb) ? 2'b00 :
                      (inst_lh || inst_lhu || inst_sh) ? 2'b01 :
                      (inst_lw || inst_lwu || inst_sw) ? 2'b10 :
                                                         2'b11 ;

//read from regfile
ysyx_22041752_rf U_RF_0(
    .clk        ( clk      ),
    .reset      ( reset    ),
    .addr_r1    ( rs1      ),
    .addr_r2    ( rs2      ),
    .data_r1    ( data_r1  ),
    .data_r2    ( data_r2  ),
    .addr_w     ( rf_waddr ),
    .we         ( rf_we    ),
    .data_w     ( rf_wdata ),
    .ra_data    ( ra_data  )
`ifdef DPI_C
        ,
    .dpi_regs   ( dpi_regs )
`endif

);

wire rs1_is_not_zero;
wire rs2_is_not_zero;
assign rs1_is_not_zero = |rs1;
assign rs2_is_not_zero = |rs2;
assign {es_mem_re,es_forward_valid,es_wreg_data,es_dest_reg} = es_forward_bus;
assign {ms_mem_re,ms_forward_valid,ms_wreg_data,ms_dest_reg} = ms_forward_bus;
assign {ws_forward_valid,ws_wreg_data,ws_dest_reg} = ws_forward_bus;

assign es_rs1_hazard = (es_dest_reg == rs1) && rs1_is_not_zero && es_forward_valid;
assign es_rs2_hazard = (es_dest_reg == rs2) && rs2_is_not_zero && es_forward_valid;
assign ms_rs1_hazard = (ms_dest_reg == rs1) && rs1_is_not_zero && ms_forward_valid;
assign ms_rs2_hazard = (ms_dest_reg == rs2) && rs2_is_not_zero && ms_forward_valid;
assign ws_rs1_hazard = (ws_dest_reg == rs1) && rs1_is_not_zero && ws_forward_valid;
assign ws_rs2_hazard = (ws_dest_reg == rs2) && rs2_is_not_zero && ws_forward_valid;

assign rs1_value = es_rs1_hazard ? es_wreg_data : 
                   ms_rs1_hazard ? ms_wreg_data :
                   ws_rs1_hazard ? ws_wreg_data :
                                      data_r1   ;
assign rs2_value = es_rs2_hazard ? es_wreg_data :
                   ms_rs2_hazard ? ms_wreg_data :
                   ws_rs2_hazard ? ws_wreg_data :
                                      data_r2   ;

`ifdef DPI_C
assign stop = inst_ebreak & ds_valid ;
assign debug_ds_inst = ds_inst;
`endif
endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2022 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_regfiles.v
// Author        : Cw
// Created On    : 2022-10-17 21:21
// Last Modified : 2023-07-24 12:07
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_rf (
    input                                    clk,
    input                                    reset,
    input  [`ysyx_22041752_RF_ADDR_WD-1 : 0] addr_r1,
    input  [`ysyx_22041752_RF_ADDR_WD-1 : 0] addr_r2,
    output [`ysyx_22041752_RF_DATA_WD-1 : 0] data_r1,
    output [`ysyx_22041752_RF_DATA_WD-1 : 0] data_r2,
    input  [`ysyx_22041752_RF_ADDR_WD-1 : 0] addr_w ,
    input                                    we     , 
    input  [`ysyx_22041752_RF_DATA_WD-1 : 0] data_w ,

    output [`ysyx_22041752_PC_WD     -1 : 0] ra_data
`ifdef DPI_C
        ,
    output [`ysyx_22041752_RF_DATA_WD-1 : 0] dpi_regs [`ysyx_22041752_RF_NUM-1 : 0]
`endif
);

reg [`ysyx_22041752_RF_DATA_WD-1 : 0] regs [`ysyx_22041752_RF_NUM-1 : 0];

assign data_r1 = regs[addr_r1];
assign data_r2 = regs[addr_r2];

always @(*) begin
    regs[0] = `ysyx_22041752_RF_DATA_WD'b0;
end

genvar i;
generate
    for (i = 1; i < `ysyx_22041752_RF_NUM; i=i+1) begin
        :Write_Regs
        always @(posedge clk) begin
            if (reset) begin
                regs[i] <= 0;
            end
            else if(we && (addr_w == i))
                regs[i] <= data_w;
        end
    end
endgenerate

assign ra_data = regs[1][31:0];

`ifdef DPI_C
generate
    for(i = 0; i < `ysyx_22041752_RF_NUM; i=i+1) begin
        :DPI_C_REGS
        assign dpi_regs[i] = regs[i];
    end
endgenerate
`endif

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2022 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_EXU.v
// Author        : Cw
// Created On    : 2022-11-19 16:16
// Last Modified : 2023-07-24 12:11
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------

module ysyx_22041752_EXU(
    input                                          clk           ,
    input                                          reset         ,

    input                                          ms_allowin    ,
    output                                         es_allowin    ,

    input                                          ds_to_es_valid,
    input  [`ysyx_22041752_DS_TO_ES_BUS_WD -1:0]   ds_to_es_bus  ,

    output                                         es_to_ms_valid,
    output [`ysyx_22041752_ES_TO_MS_BUS_WD -1:0]   es_to_ms_bus  ,

	output [`ysyx_22041752_FORWARD_BUS_WD -1:0]    es_forward_bus,

    output                                         data_en       ,
    output [`ysyx_22041752_DATA_WEN_WD -1:0]       data_wen      ,
    output [`ysyx_22041752_DATA_ADDR_WD-1:0]       data_addr     ,
    output [`ysyx_22041752_DATA_DATA_WD-1:0]       data_wdata    ,
    input										   write_hit     ,

    output                                         fence_i_o     ,
    input                                          fence_over    ,
    output                                         flush         ,
    output [`ysyx_22041752_PC_WD-1:0]              flush_pc      ,
    input                                          int_t_i       , 
    output                                         flush_pc_p4   ,
    output                                         bjpre_error   

`ifdef DPI_C
        ,
    output                                   debug_es_bjpre_error,
    output                                   debug_es_bj_inst    ,
    output [63:0]                            dpi_csrs [3:0]      ,
    output                                   es_exp              ,
    output                                   es_mret             ,
    output [`ysyx_22041752_DATA_ADDR_WD-1:0] debug_es_data_addr  ,
    output                                   debug_es_out_of_mem ,
    output                                   debug_es_data_ren   ,
    output                                   debug_es_data_wen   ,
    output [`ysyx_22041752_DATA_DATA_WD-1:0] debug_es_data_wdata ,
    output [`ysyx_22041752_PC_WD       -1:0] debug_es_pc         ,      
    input  [`ysyx_22041752_INST_WD-1:0]      debug_ds_inst       ,
    output reg [`ysyx_22041752_INST_WD-1:0]  debug_es_inst
`endif
);

reg         es_valid      ;
wire        es_ready_go   ;

reg  [`ysyx_22041752_DS_TO_ES_BUS_WD -1:0] ds_to_es_bus_r;  

wire fence_i  ;
wire ecall    ;
wire mret     ;
wire mul_u    ;
wire mul_su   ;
wire mul_h    ;
wire div_u    ;
wire jalr     ;
wire beq      ;
wire bne      ;
wire blt      ;
wire bge      ;
wire bltu     ;
wire bgeu     ;
wire [12:0] es_imm_b;
wire                              br_taken_pre ;
wire [`ysyx_22041752_PC_WD-1:0]   br_target_pre;
wire op_mul   ;
wire op_div   ;
wire op_rem   ;
wire op_add   ;
wire op_sub   ;
wire op_slt   ;
wire op_sltu  ;
wire op_and   ;
wire op_or    ;
wire op_xor   ;
wire op_sll   ;
wire op_srl   ;
wire op_sra   ;

wire        res_sext    ;
wire        res_zext    ;
wire        src_shamt   ;
wire        src_pc      ;
wire        src_imm_u   ;
wire        src_4       ;
wire        src_0       ;
wire        src_imm_i   ;
wire        src_imm_s   ;
wire [ 4:0] imm_csr     ;
wire        csri        ;
wire        csrrs       ;
wire        csrrc       ;
wire        src_csr     ;
wire        es_rf_we    ;
wire        es_csr_we   ;
wire        es_mem_we   ;
wire        es_mem_re   ;
wire [ 1:0] es_mem_bytes;
wire [ 2:0] es_addr_offset;
wire [ 5:0] shamt;
wire [19:0] imm_u;
wire [11:0] imm_i;
wire [11:0] imm_s;
wire [11:0] rscsr;
wire [ 4:0] rd;
wire [`ysyx_22041752_RF_DATA_WD-1:0]    rs1_value;
wire [`ysyx_22041752_RF_DATA_WD-1:0]    rs2_value;
wire [`ysyx_22041752_PC_WD     -1:0]    es_pc  ;
reg mul_done, div_done;
reg [`ysyx_22041752_RF_DATA_WD-1:0] md_res_buf;

assign {fence_i       ,
        ecall         ,
        mret          ,
        div_u         ,
        mul_u         ,
        mul_su        ,
        mul_h         ,
        jalr          ,  
        beq           ,  
        bne           ,  
        blt           ,  
        bge           ,  
        bltu          ,  
        bgeu          ,  
        br_taken_pre  ,
        br_target_pre ,
        es_imm_b      ,
        op_mul        ,
        op_div        ,
        op_rem        ,
        op_add        ,   
        op_sub        ,  
        op_slt        ,  
        op_sltu       ,  
        op_and        ,  
        op_or         ,  
        op_xor        ,  
        op_sll        ,  
        op_srl        ,  
        op_sra        ,  
        res_sext      , 
        res_zext      , 
        shamt         ,  
        src_shamt     ,  
		src_pc        ,	
		src_imm_u     ,  
        src_4         ,  
        src_0         ,  
        src_imm_i     ,  
        src_imm_s     ,  
        src_csr       ,
        rscsr         ,
        es_csr_we     ,
        csrrc         ,
        csrrs         ,
        csri          ,
        imm_csr       ,
        es_rf_we      ,  
        es_mem_we     ,
        es_mem_re     ,
        es_mem_bytes  ,
        rd            ,  
        imm_s         ,  
        imm_i         ,  
        imm_u         ,  
        rs1_value     ,  
        rs2_value     ,  
        es_pc            
       } = ds_to_es_bus_r;

wire [63:0] alu_src1   ;
wire [63:0] alu_src2   ;
wire [63:0] alu_result ;

assign es_to_ms_bus = {res_sext         ,  
                       res_zext         ,
                       es_addr_offset   ,
					   es_mem_bytes     ,  
					   es_mem_re        ,  
                       es_mem_we        ,
					   es_rf_we         ,  
                       rd               ,  
                       mul_done||div_done ? md_res_buf : alu_result       //,  
                       //es_pc               
                      };

assign fence_i_o   = fence_i && es_valid && !fence_over;

wire                            pre_error  ;
wire [`ysyx_22041752_PC_WD-1:0] bj_addr    ;
wire                            br_taken_real = alu_result[0];

assign bjpre_error = pre_error && es_valid;
ysyx_22041752_bjt_cal U_BJT_CAL_0(
    .jalr                           ( jalr                                ),
    .imm_i                          ( imm_i                               ),
    .jalr_src1                      ( rs1_value[`ysyx_22041752_PC_WD-1:0] ),
    .branch                         ( beq|bne|bge|blt|bgeu|bltu           ),
    .imm_b                          ( es_imm_b                            ),
    .es_pc                          ( es_pc                               ),
    .b_taken_real                   ( br_taken_real                       ),
    .br_taken_pre                   ( br_taken_pre                        ),
    .jt_pre                         ( br_target_pre                       ),
    .pre_error                      ( pre_error                           ),
    .bj_addr                        ( bj_addr                             )
);

wire        int_t_o  ;
reg  [1:0] expfsm_pre;
wire [1:0] expfsm_nxt;
parameter IDLE = 0;
parameter W_MEPC  = 1;
parameter W_MCAUSE= 2;
always @(posedge clk) begin
    if (reset) begin
        expfsm_pre <= IDLE;
    end
    else begin
        expfsm_pre <= expfsm_nxt;
    end
end
assign expfsm_nxt = expfsm_pre == IDLE && ecall&&es_valid || int_t_o   ? W_MEPC   :
                    expfsm_pre == W_MEPC                               ? W_MCAUSE :
                    expfsm_pre == W_MCAUSE                             ? IDLE     :
                                                                         expfsm_pre;

wire mul_out_valid;
wire mul_stall = op_mul && !mul_out_valid && !mul_done && es_valid && !int_t_o;
wire div_out_valid;                                              
wire div_stall = op_rem|op_div && !div_out_valid && !div_done && es_valid && !int_t_o;
wire fence_i_stall = fence_i && !fence_over;
wire data_pren;
wire cache_compete	  = write_hit && data_pren;
assign es_ready_go    = expfsm_pre != W_MEPC && !div_stall && !mul_stall && !fence_i_stall && !cache_compete;
assign es_allowin     = !es_valid || es_ready_go && ms_allowin;
assign es_to_ms_valid =  es_valid && es_ready_go &&!int_t_o;
always @(posedge clk) begin
    if (reset) begin
        es_valid <= 1'b0;
    end
    else if (es_allowin) begin
        es_valid <= ds_to_es_valid;
    end
end
always @(posedge clk) begin
    if (reset) begin
        ds_to_es_bus_r <= 0;
    end
    else if(ds_to_es_valid && es_allowin) begin
        ds_to_es_bus_r <= ds_to_es_bus;
    end
end

wire        csr_we   ;
wire [11:0] csr_addr ;
wire [63:0] csr_wdata;
wire [63:0] csr_rdata;

wire int_allowin = es_valid && !fence_i;

ysyx_22041752_csr U_CSR_0(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .mret                           ( mret&&es_to_ms_valid          ),
    .wen                            ( csr_we                        ),
    .addr                           ( csr_addr                      ),
    .wdata                          ( csr_wdata                     ),
    .rdata                          ( csr_rdata                     ),
    .int_t_i                        ( int_t_i                       ),
    .int_t_o                        ( int_t_o                       ),
    .int_allowin                    ( int_allowin                   )
`ifdef DPI_C
        ,
    .dpi_csrs                       ( dpi_csrs                      )
`endif
);
assign csr_we    = es_csr_we&&!int_t_o || expfsm_pre==W_MEPC || expfsm_pre==W_MCAUSE;

assign csr_addr  = (ecall || int_t_o) && (expfsm_pre==IDLE)    ? `ysyx_22041752_CSR_ADDR_MTVEC  :
                   expfsm_pre==W_MEPC    || mret               ? `ysyx_22041752_CSR_ADDR_MEPC   :
                   expfsm_pre==W_MCAUSE                        ? `ysyx_22041752_CSR_ADDR_MCAUSE :
                                                                 rscsr                          ;
assign csr_wdata = expfsm_pre == W_MEPC   ? {32'b0, es_pc} :
                   expfsm_pre == W_MCAUSE ? ecall&&!int_t_o ? 64'hb : 64'h8000_0000_0000_0007 : 
                   {64{ csrrs &&!csri}} & ( rs1_value        | csr_rdata) |
                   {64{ csrrs && csri}} & ( {59'b0, imm_csr} | csr_rdata) |
                   {64{ csrrc &&!csri}} & (~rs1_value        & csr_rdata) |
                   {64{ csrrc && csri}} & (~{59'b0, imm_csr} & csr_rdata) |
                   {64{!csrrs &&!csrrc &&!csri}}             & rs1_value  |
                   {64{!csrrs &&!csrrc && csri}} & {59'b0, imm_csr};

assign flush       = (ecall||mret||int_t_o&&expfsm_pre==IDLE) && es_valid;
assign flush_pc_p4 = bjpre_error && !(br_taken_real || jalr) || fence_over;
assign flush_pc    = int_t_o&&expfsm_pre==IDLE ? csr_rdata[`ysyx_22041752_PC_WD-1:0]   :
                     bjpre_error               ? br_taken_real||jalr ? bj_addr : es_pc :
                     fence_over                ?                                 es_pc : 
                     csr_rdata[`ysyx_22041752_PC_WD-1:0];

assign alu_src1 = src_pc   ? {32'b0, es_pc} : 
                  src_0    ? 64'd0          :
                  res_sext && (op_sll || op_srl || op_sra) ? {32'b0,rs1_value[31:0]} :
                  rs1_value;
  
assign alu_src2 = src_csr   ? csr_rdata :
                  src_4     ? 64'd4 : 
                  src_imm_u ? {{32{imm_u[19]}},imm_u,12'b0} :
                  src_imm_i ? {{52{imm_i[11]}},imm_i} :
                  src_imm_s ? {{52{imm_s[11]}},imm_s} :
                  src_shamt ? {58'b0,shamt} :
                  res_sext && (op_sll || op_srl || op_sra) ? {59'b0,rs2_value[4:0]} :
                  (op_sll || op_srl || op_sra) ? {58'b0,rs2_value[5:0]} :
                  rs2_value;

always @(posedge clk) begin
    if (reset) begin
        mul_done <= 0;
    end
    else if(mul_out_valid&&!ms_allowin) begin
        mul_done <= 1;
    end
    else if(es_allowin&&ds_to_es_valid) begin
        mul_done <= 0;
    end
end
always @(posedge clk) begin
    if (reset) begin
        div_done <= 0;
    end
    else if(div_out_valid&&!ms_allowin) begin
        div_done <= 1;
    end
    else if(es_allowin&&ds_to_es_valid) begin
        div_done <= 0;
    end
end
always @(posedge clk) begin
    if (reset) begin
        md_res_buf <= 0;
    end
    else if(mul_out_valid&&!ms_allowin || div_out_valid&&!ms_allowin) begin
        md_res_buf <= alu_result;
    end
end

wire [63:0] mem_addr;
ysyx_22041752_alu U_ALU_0(
`ifdef REAL_DIV_MUL
    .clk             ( clk            ),
    .reset           ( reset          ),
    .flush           ( flush          ),
`ifdef REAL_MUL
    .mul_calc        (es_valid&&!mul_done&&op_mul),
`endif
`ifdef REAL_DIV
    .div_calc        (es_valid&&!div_done&&(op_div||op_rem)),
`endif
`endif
    .mul_u           ( mul_u          ),
    .mul_su          ( mul_su         ),
    .div_u           ( div_u          ),
    .mul_h           ( mul_h          ),
    .beq             ( beq            ),  
    .bne             ( bne            ),  
    .blt             ( blt            ),  
    .bge             ( bge            ),  
    .bltu            ( bltu           ),  
    .bgeu            ( bgeu           ),  
    .op_mul          ( op_mul         ),
    .op_div          ( op_div         ),
    .op_rem          ( op_rem         ),
    .op_add          ( op_add         ),
    .op_sub          ( op_sub         ),
    .op_slt          ( op_slt         ),
    .op_sltu         ( op_sltu        ),
    .op_and          ( op_and         ),
    .op_or           ( op_or          ),
    .op_xor          ( op_xor         ),
    .op_sll          ( op_sll         ),
    .op_srl          ( op_srl         ),
    .op_sra          ( op_sra         ),
    .res_sext        ( res_sext       ),
    .alu_src1        ( alu_src1       ),
    .alu_src2        ( alu_src2       ),
    .alu_result      ( alu_result     ),
    .mem_result      ( mem_addr       ),
    .div_out_valid   ( div_out_valid  ),
    .mul_out_valid   ( mul_out_valid  )
);

assign es_addr_offset=data_addr[2:0];
assign data_addr= mem_addr[31:0];
assign data_pren= (es_mem_re | es_mem_we) && es_valid && ms_allowin;
assign data_en  = data_pren && !cache_compete;

assign data_wen = es_mem_we && es_valid && es_mem_bytes == 2'b11 ? 8'hff: 
                  es_mem_we && es_valid && es_mem_bytes == 2'b10 ? 
										   es_addr_offset[2]	 ? 8'hf0:
																   8'h0f:
                  es_mem_we && es_valid && es_mem_bytes == 2'b01 ? 

										   es_addr_offset[2]	 ?
									 es_addr_offset[1:0]== 2'b00 ? 8'h30:
									 es_addr_offset[1:0]== 2'b01 ? 8'h60:
								/*es_addr_offset[1:0]== 2'10 ?*/   8'hc0
																 :
									 es_addr_offset[1:0]== 2'b00 ? 8'h03:
									 es_addr_offset[1:0]== 2'b01 ? 8'h06:
									 es_addr_offset[1:0]== 2'b10 ? 8'h0c:
							    /*es_addr_offset[1:0]== 2'b11 ?*/  8'h18:

                  es_mem_we && es_valid && es_mem_bytes == 2'b00 ? 
									es_addr_offset[2:0]== 3'b000 ? 8'h01:
									es_addr_offset[2:0]== 3'b001 ? 8'h02:
									es_addr_offset[2:0]== 3'b010 ? 8'h04:
									es_addr_offset[2:0]== 3'b011 ? 8'h08:
									es_addr_offset[2:0]== 3'b100 ? 8'h10:
									es_addr_offset[2:0]== 3'b101 ? 8'h20:
									es_addr_offset[2:0]== 3'b110 ? 8'h40:
							/*es_addr_offset[2:0]== 3'b111 ?*/     8'h80:

                                                                   8'h00;
reg [`ysyx_22041752_DATA_DATA_WD-1:0] shift_data;
always @(*) begin
    case (es_addr_offset)
        3'b000: begin
            shift_data = rs2_value;
        end
        3'b001: begin
            shift_data = rs2_value << 8;
        end
        3'b010: begin
            shift_data = rs2_value << 16;
        end
        3'b011: begin
            shift_data = rs2_value << 24;
        end
        3'b100: begin
            shift_data = rs2_value << 32;
        end
        3'b101: begin
            shift_data = rs2_value << 40;
        end
        3'b110: begin
            shift_data = rs2_value << 48;
        end
        default: begin
            shift_data = rs2_value << 56;
        end
    endcase
end

assign data_wdata = shift_data;

//forward_bus
wire es_forward_valid;
assign es_forward_valid = es_rf_we && es_valid;
assign es_forward_bus = {es_mem_re&es_valid,es_forward_valid,alu_result,rd};
`ifdef DPI_C
assign es_exp = ecall && flush;
assign es_mret  = mret && flush;
always @(posedge clk) begin
    if(ds_to_es_valid && es_allowin) begin
        debug_es_inst <= debug_ds_inst;    
    end
end
assign debug_es_pc          = es_pc;
assign debug_es_bjpre_error = bjpre_error;
assign debug_es_data_ren    = data_en && es_mem_re;
assign debug_es_data_wen    = es_mem_we && es_to_ms_valid && ms_allowin;
assign debug_es_bj_inst     = (beq | bne | blt | bge | bgeu | bltu | jalr) && es_valid;
assign debug_es_data_addr   = data_addr;
assign debug_es_data_wdata  = data_wdata;
wire access_mem = (data_addr >= `ysyx_22041752_MEM_BASEADDR) && (data_addr <= (`ysyx_22041752_MEM_BASEADDR+`ysyx_22041752_MEM_SIZE));
assign debug_es_out_of_mem  = es_to_ms_valid && ms_allowin && data_en && !access_mem;
`endif
endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2022 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_alu.v
// Author        : Cw
// Created On    : 2022-11-19 18:06
// Last Modified : 2023-07-22 18:31
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_alu(
`ifdef REAL_DIV_MUL
    input         clk         ,
    input         reset       , 
    input         flush       ,
`ifdef REAL_MUL
    input         mul_calc    ,
`endif
`ifdef REAL_DIV
    input         div_calc    ,
`endif
`endif
    input         mul_u        ,
    input         mul_su       ,
    input         div_u        , 
    input         mul_h        ,
    input         beq          ,  
    input         bne          ,  
    input         blt          ,  
    input         bge          ,  
    input         bltu         ,  
    input         bgeu         ,  
    input         op_mul       ,     
    input         op_div       ,
    input         op_rem       ,
    input         op_add       ,
    input         op_sub       ,
    input         op_slt       ,
    input         op_sltu      ,
    input         op_and       ,
    input         op_or        ,
    input         op_xor       ,
    input         op_sll       ,
    input         op_srl       ,
    input         op_sra       ,
    input         res_sext     ,
    input  [63:0] alu_src1     ,
    input  [63:0] alu_src2     ,
    output [63:0] alu_result   ,
    output [63:0] mem_result   ,
    output        div_out_valid,
    output        mul_out_valid
);

wire [63:0] mul_result;
wire [63:0] div_result;
wire [63:0] rem_result;
    
wire [ 63:0] r_slt; 
wire [ 63:0] r_and;
wire [ 63:0] r_or ;
wire [ 63:0] r_xor;
wire [ 63:0] r_sll; 
wire [ 63:0] r_srl; 
wire [127:0] r_sra; 

// 64-bit adder
wire [63:0] adder_a;
wire [63:0] adder_b;
wire        adder_cin;
wire [63:0] adder_result;
wire        adder_cout;

assign adder_a   = alu_src1;
assign adder_b   = alu_src2;
assign adder_cin = op_sub | op_slt | op_sltu | 
                   beq    | bne    | bge     | bgeu | blt | bltu;
ysyx_22041752_aser #(.WIDTH (64))
U_ASER_0(
    .a          ( adder_a      ),
    .b          ( adder_b      ),
    .sub        ( adder_cin    ),
    .cout       ( adder_cout   ),
    .result     ( adder_result )
);

// SLT result
assign r_slt[63:1] = 63'b0;
assign r_slt[0]    = op_sltu ? ~adder_cout : adder_result[63];

// bitwise operation
assign r_and = alu_src1 &  alu_src2;
assign r_or  = alu_src1 |  alu_src2; 
assign r_xor = alu_src1 ^  alu_src2; 
assign r_sll = alu_src1 << alu_src2; 
assign r_srl = alu_src1 >> alu_src2; 
assign r_sra = (res_sext ? {{96{alu_src1[31]}}, alu_src1[31:0]} : {{64{alu_src1[63]}}, alu_src1}) >> alu_src2;


wire rs1_eq_rs2 ;
wire rs1_l_rs2  ;
wire rs1u_l_rs2u;

assign rs1u_l_rs2u=~adder_cout;
assign rs1_l_rs2  = adder_result[63];
assign rs1_eq_rs2 = alu_src1==alu_src2;


wire [63:0] res;
assign res = ({64{op_add|op_sub }}&{adder_result[63:0]})
            |({64{op_slt|op_sltu}}&{r_slt       [63:0]})
            |({64{op_and        }}&{r_and       [63:0]})
            |({64{op_or         }}&{r_or        [63:0]})
            |({64{op_xor        }}&{r_xor       [63:0]})
            |({64{op_sll        }}&{r_sll       [63:0]})
            |({64{op_srl        }}&{r_srl       [63:0]})
            |({64{op_sra        }}&{r_sra       [63:0]})
            |({64{op_mul        }}&{mul_result})
            |({64{op_div        }}&{div_result})
            |({64{op_rem        }}&{rem_result})
            |({64{beq & rs1_eq_rs2}})
            |({64{bne &!rs1_eq_rs2}})
            |({64{blt & rs1_l_rs2}})
            |({64{bge &!rs1_l_rs2}})
            |({64{bltu& rs1u_l_rs2u}})
            |({64{bgeu&!rs1u_l_rs2u}});
assign alu_result = res_sext ? {{32{res[31]}}, res[31:0]} : res;

assign mem_result = adder_result;

ysyx_22041752_mul U_MUL_0(
`ifdef REAL_MUL
    .clk            ( clk             ),
    .reset          ( reset           ),
    .flush          ( flush           ),
    .count_en       ( mul_calc        ),
`endif
    .mul_u          ( mul_u           ),
    .mul_su         ( mul_su          ),
    .mul_h          ( mul_h           ),
    .mul_valid      ( op_mul          ),
    .multiplicand   ( alu_src1        ),
    .multiplier     ( alu_src2        ),
    .product        ( mul_result      ),
    .out_valid      ( mul_out_valid   )
);

ysyx_22041752_diver U_DIVER_0(
`ifdef REAL_DIV
    .clk        ( clk              ),
    .reset      ( reset            ),
    .flush      ( flush            ),
    .count_en   ( div_calc         ),
`endif
    .dividend   ( alu_src1         ),
    .divisor    ( alu_src2         ),
    .div_valid  ( op_div|op_rem    ),
    .div_signed (~div_u            ),
    .out_valid  ( div_out_valid    ),
    .quotient   ( div_result       ),
    .remainder  ( rem_result       )
);

endmodule
// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2022 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_mul.v
// Author        : Cw
// Created On    : 2022-11-29 16:07
// Last Modified : 2023-07-22 12:15
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------

module ysyx_22041752_mul(
`ifdef REAL_MUL
    input                          clk           ,
    input                          reset         ,
    input                          flush         ,
    input                          count_en      ,
`endif
    input                          mul_u         ,
    input                          mul_su        ,
    input                          mul_h         ,
    input                          mul_valid     ,
    input       [`ysyx_22041752_RF_DATA_WD-1:0]  multiplicand  ,
    input       [`ysyx_22041752_RF_DATA_WD-1:0]  multiplier    ,
    output reg  [`ysyx_22041752_RF_DATA_WD-1:0]  product       ,
    output                                       out_valid
);

`ifdef REAL_MUL
reg [6:0] count;
always @(posedge clk) begin
    if (reset || flush|| out_valid) begin
        count <= 0;
    end
    else if (count_en) begin
        count <= count + 1;
    end
end

reg [2*`ysyx_22041752_RF_DATA_WD-1:0] pdt_r;
reg [2*`ysyx_22041752_RF_DATA_WD-1:0] up_pdt;
always @(posedge clk) begin
    if (reset) begin
        pdt_r <= 0;
    end
    else if (count_en && (count==0)) begin
        pdt_r <= {64'b0, multiplier};
    end
    else begin
        pdt_r <= up_pdt;
    end
end

wire adder_cout;
wire [`ysyx_22041752_RF_DATA_WD-1:0] adder_res;
wire sub_en = !mul_su && !mul_u && count==`ysyx_22041752_RF_DATA_WD;

always @(*) begin
    if (mul_u) begin
        if(pdt_r[0]) begin
            up_pdt = {adder_cout, adder_res, pdt_r[`ysyx_22041752_RF_DATA_WD-1:1]};
        end
        else begin
            up_pdt = {1'b0, pdt_r[2*`ysyx_22041752_RF_DATA_WD-1:`ysyx_22041752_RF_DATA_WD], pdt_r[`ysyx_22041752_RF_DATA_WD-1:1]};
        end
    end
    else begin
        if(pdt_r[0]) begin
            up_pdt = {adder_res[`ysyx_22041752_RF_DATA_WD-1], adder_res, pdt_r[`ysyx_22041752_RF_DATA_WD-1:1]};
        end
        else begin
            up_pdt = {pdt_r[2*`ysyx_22041752_RF_DATA_WD-1], pdt_r[2*`ysyx_22041752_RF_DATA_WD-1:`ysyx_22041752_RF_DATA_WD], pdt_r[`ysyx_22041752_RF_DATA_WD-1:1]};
        end
    end
end

ysyx_22041752_aser #(.WIDTH (64))
U_YSYX_22041752_ASER_0(
    .a                              ( pdt_r[2*`ysyx_22041752_RF_DATA_WD-1:`ysyx_22041752_RF_DATA_WD] ), 
    .b                              ( multiplicand                       ),
    .sub                            ( sub_en                             ),
    .cout                           ( adder_cout                         ),
    .result                         ( adder_res                          )
);

assign out_valid = mul_valid && ((count==`ysyx_22041752_RF_DATA_WD+1) ||
                   (multiplicand==0) || (multiplier==0));

always @(*) begin
    if ((multiplicand==0) || (multiplier==0)) begin
        product = 0;
    end
    else if (mul_h) begin
        product = pdt_r[2*`ysyx_22041752_RF_DATA_WD-1:`ysyx_22041752_RF_DATA_WD];
    end
    else begin
        product = pdt_r[`ysyx_22041752_RF_DATA_WD-1:0];
    end
end

/**************************************************************************/
/**************************************************************************/
/**************************************************************************/
`else

wire [`ysyx_22041752_RF_DATA_WD-1:0] not_p1_x = ~multiplicand+1;
wire [`ysyx_22041752_RF_DATA_WD-1:0] not_p1_y = ~multiplier+1;

wire [`ysyx_22041752_RF_DATA_WD-1:0] src1 = !mul_u && multiplicand[`ysyx_22041752_RF_DATA_WD-1] ? not_p1_x : multiplicand;
wire [`ysyx_22041752_RF_DATA_WD-1:0] src2 = !(mul_u|mul_su) && multiplier[`ysyx_22041752_RF_DATA_WD-1] ? not_p1_y : multiplier;

wire [2*`ysyx_22041752_RF_DATA_WD-1:0] r_abs = src1 * src2;
wire [2*`ysyx_22041752_RF_DATA_WD-1:0] r_abs_not_p1 = ~r_abs + 1;

always @(*) begin
    out_valid = mul_valid;
end
always @(*) begin
    if (!mul_u && !mul_su && (multiplicand[`ysyx_22041752_RF_DATA_WD-1] ^ multiplier[`ysyx_22041752_RF_DATA_WD-1])) begin
        if (mul_h) begin
            product = r_abs_not_p1[2*`ysyx_22041752_RF_DATA_WD-1:`ysyx_22041752_RF_DATA_WD];
        end
        else begin
            product = r_abs_not_p1[`ysyx_22041752_RF_DATA_WD-1:0];
        end
    end
    else if (mul_su && multiplicand[`ysyx_22041752_RF_DATA_WD-1]) begin
        if (mul_h) begin
            product = r_abs_not_p1[2*`ysyx_22041752_RF_DATA_WD-1:`ysyx_22041752_RF_DATA_WD];
        end
        else begin
            product = r_abs_not_p1[`ysyx_22041752_RF_DATA_WD-1:0];
        end
    end
    else begin
        if (mul_h) begin
            product = r_abs[2*`ysyx_22041752_RF_DATA_WD-1:`ysyx_22041752_RF_DATA_WD];
        end
        else begin
            product = r_abs[`ysyx_22041752_RF_DATA_WD-1:0];
        end
    end
end
`endif

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2022 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_diver.v
// Author        : Cw
// Created On    : 2022-12-14 14:01
// Last Modified : 2023-07-22 18:34
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------

module ysyx_22041752_diver (
`ifdef REAL_DIV
    input                                       clk        ,
    input                                       reset      ,
    input                                       flush      ,
    input                                       count_en   ,
`endif
    input  [`ysyx_22041752_RF_DATA_WD-1:0]      dividend   ,
    input  [`ysyx_22041752_RF_DATA_WD-1:0]      divisor    ,
    input                                       div_valid  ,
    input                                       div_signed ,
    output                                      out_valid  ,
    output reg  [`ysyx_22041752_RF_DATA_WD-1:0] quotient   ,
    output reg  [`ysyx_22041752_RF_DATA_WD-1:0] remainder
);
    
`ifdef REAL_DIV
reg [7:0] count;
always @(posedge clk) begin
    if(reset || flush || out_valid)
        count <= 0;
    else if (count_en)
        count <= count + 1;
end

wire dividend_s  = div_signed & dividend[`ysyx_22041752_RF_DATA_WD-1];
wire divisor_s   = div_signed & divisor[`ysyx_22041752_RF_DATA_WD-1];
wire remainder_s = dividend_s;
wire quotient_s  = div_signed & (dividend_s ^ divisor_s);

wire [`ysyx_22041752_RF_DATA_WD-1:0]   dividend_abs       ;
wire [`ysyx_22041752_RF_DATA_WD-1:0]   divisor_abs        ;
wire [2*`ysyx_22041752_RF_DATA_WD-1:0] dividend_abs_128   = {64'b0, dividend_abs};
wire [`ysyx_22041752_RF_DATA_WD:0]     divisor_abs_65     = {1'b0, divisor_abs};
reg  [2*`ysyx_22041752_RF_DATA_WD-1:0] result_abs_buffer  ;

wire [`ysyx_22041752_RF_DATA_WD-1:0] not_p1_i_1 = out_valid ? result_abs_buffer[2*`ysyx_22041752_RF_DATA_WD-1:`ysyx_22041752_RF_DATA_WD] : dividend;
wire [`ysyx_22041752_RF_DATA_WD-1:0] not_p1_i_2 = out_valid ? result_abs_buffer[`ysyx_22041752_RF_DATA_WD-1:0] : divisor;
wire [`ysyx_22041752_RF_DATA_WD-1:0] not_p1_o_1 ;
wire [`ysyx_22041752_RF_DATA_WD-1:0] not_p1_o_2 ;

wire cout0, cout1, cout2;
ysyx_22041752_aser #(
    .WIDTH                          ( 64                            ))
U_ASER_0(
    .a                              ( 0                             ),
    .b                              ( not_p1_i_1                    ),
    .sub                            ( 1'b1                          ),
    .cout                           ( cout0                         ),
    .result                         ( not_p1_o_1                    )
);
ysyx_22041752_aser #(
    .WIDTH                          ( 64                            ))
U_ASER_1(
    .a                              ( 0                             ),
    .b                              ( not_p1_i_2                    ),
    .sub                            ( 1'b1                          ),
    .cout                           ( cout1                         ),
    .result                         ( not_p1_o_2                    )
);

assign dividend_abs = dividend_s ? not_p1_o_1 : dividend;
assign divisor_abs  = divisor_s  ? not_p1_o_2 : divisor;

wire [`ysyx_22041752_RF_DATA_WD:0]     sub_result;
ysyx_22041752_aser #(
    .WIDTH                          ( 65                                                                           ))
U_ASER_2(
    .a                              ( result_abs_buffer[2*`ysyx_22041752_RF_DATA_WD-1:`ysyx_22041752_RF_DATA_WD-1]  ),
    .b                              ( divisor_abs_65                                                                ),
    .sub                            ( 1'b1                                                                          ),
    .cout                           ( cout2                                                                         ),
    .result                         ( sub_result                                                                    )
);

wire [2*`ysyx_22041752_RF_DATA_WD-1:0] update_result = {(sub_result[`ysyx_22041752_RF_DATA_WD] ? result_abs_buffer[2*`ysyx_22041752_RF_DATA_WD-2:`ysyx_22041752_RF_DATA_WD-1] : sub_result[`ysyx_22041752_RF_DATA_WD-1:0]),result_abs_buffer[`ysyx_22041752_RF_DATA_WD-2:0],(sub_result[`ysyx_22041752_RF_DATA_WD] ? 1'b0 : 1'b1)};

always @(posedge clk) begin
    if (reset) begin
        result_abs_buffer <= 0;
    end
    else if (count == 0)
        result_abs_buffer <= dividend_abs_128;
    else
        result_abs_buffer <= update_result;
end

assign out_valid = div_valid && ((count == `ysyx_22041752_RF_DATA_WD+1)                                          || 
                   divisor == 0                                                                                  || 
                   (div_signed && (dividend == 64'h8000_0000_0000_0000) && (divisor == 64'hffff_ffff_ffff_ffff)));

always @(*) begin
    if (divisor == 0) begin
        quotient = 64'hffff_ffff_ffff_ffff;        
    end
    else if (div_signed && (dividend == 64'h8000_0000_0000_0000) && (divisor == 64'hffff_ffff_ffff_ffff)) begin
        quotient = dividend;
    end
    else if (quotient_s) begin
        quotient = not_p1_o_2;
    end
    else begin
        quotient = result_abs_buffer[`ysyx_22041752_RF_DATA_WD-1:0];
    end
end

always @(*) begin
    if (divisor == 0) begin
        remainder = dividend;        
    end
    else if (div_signed && (dividend == 64'h8000_0000_0000_0000) && (divisor == 64'hffff_ffff_ffff_ffff)) begin
        remainder = 0;
    end
    else if (remainder_s) begin
        remainder = not_p1_o_1;
    end
    else begin
        remainder = result_abs_buffer[2*`ysyx_22041752_RF_DATA_WD-1:`ysyx_22041752_RF_DATA_WD];
    end
end

/**************************************************************************************/
/**************************************************************************************/
/**************************************************************************************/
`else

wire dividend_s  = div_signed & dividend[`ysyx_22041752_RF_DATA_WD-1];
wire divisor_s   = div_signed & divisor [`ysyx_22041752_RF_DATA_WD-1];
wire remainder_s = dividend_s;
wire quotient_s  = div_signed & (dividend_s ^ divisor_s);

wire [`ysyx_22041752_RF_DATA_WD-1:0]   dividend_abs       ;
wire [`ysyx_22041752_RF_DATA_WD-1:0]   divisor_abs        ;

wire [`ysyx_22041752_RF_DATA_WD-1:0] not_p1_i_1 = dividend;
wire [`ysyx_22041752_RF_DATA_WD-1:0] not_p1_i_2 = divisor;
wire [`ysyx_22041752_RF_DATA_WD-1:0] not_p1_o_1 = ~not_p1_i_1 + 1;
wire [`ysyx_22041752_RF_DATA_WD-1:0] not_p1_o_2 = ~not_p1_i_2 + 1;

assign dividend_abs = dividend_s ? not_p1_o_1 : dividend;
assign divisor_abs  = divisor_s  ? not_p1_o_2 : divisor;

wire [`ysyx_22041752_RF_DATA_WD-1:0] quotient_abs  = dividend_abs / divisor_abs;
wire [`ysyx_22041752_RF_DATA_WD-1:0] remainder_abs = dividend_abs % divisor_abs;

assign out_valid = div_valid;

always @(*) begin
    if (divisor == 0) begin
        quotient = 64'hffff_ffff_ffff_ffff;        
    end
    else if (div_signed && (dividend == 64'h8000_0000_0000_0000) && (divisor == 64'hffff_ffff_ffff_ffff)) begin
        quotient = dividend;
    end
    else if (quotient_s) begin
        quotient = ~quotient_abs + 1;
    end
    else begin
        quotient = quotient_abs;
    end
end

always @(*) begin
    if (divisor == 0) begin
        remainder = dividend;        
    end
    else if (div_signed && (dividend == 64'h8000_0000_0000_0000) && (divisor == 64'hffff_ffff_ffff_ffff)) begin
        remainder = 0;
    end
    else if (remainder_s) begin
        remainder = ~remainder_abs + 1;
    end
    else begin
        remainder = remainder_abs;
    end
end
`endif

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_csr.v
// Author        : Cw
// Created On    : 2023-03-28 22:12
// Last Modified : 2023-07-20 16:41
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_csr (
    input clk   ,
    input reset ,

    input         int_allowin,
    input         mret       ,
    input         wen        ,
    input  [11:0] addr       ,
    input  [63:0] wdata      ,
    output [63:0] rdata      ,
    
    input  int_t_i           ,
    output int_t_o           
    `ifdef DPI_C
        ,
    output [63:0] dpi_csrs [3:0]
`endif
);
    
reg [63:0] mstatus;
reg [63:0] mtvec  ;
reg [63:0] mepc   ;
reg [63:0] mcause ;
reg [63:0] mie    ;

reg [63:0] mip    ;

assign rdata = {64{(addr == `ysyx_22041752_CSR_ADDR_MSTATUS)}} & mstatus |
               {64{(addr == `ysyx_22041752_CSR_ADDR_MIE)}}     & mie     |
               {64{(addr == `ysyx_22041752_CSR_ADDR_MIP)}}     & mip     |
               {64{(addr == `ysyx_22041752_CSR_ADDR_MTVEC)}}   & mtvec   |
               {64{(addr == `ysyx_22041752_CSR_ADDR_MEPC)}}    & mepc    |
               {64{(addr == `ysyx_22041752_CSR_ADDR_MCAUSE)}}  & mcause  ;

always @(posedge clk) begin
    if (reset) begin
        mstatus <= 64'ha00001800;
    end
    else if (int_t_o) begin
        mstatus[7] <= mstatus[3]; //mpie <= mie 
        mstatus[3] <= 1'b0; //mie <= 0
    end
    else if (wen && addr == `ysyx_22041752_CSR_ADDR_MSTATUS) begin
        mstatus <= wdata;
    end
    else if (mret) begin
        mstatus[7] <= 1'b1; //mpie <= 1
        mstatus[3] <= mstatus[7]; //mie <= mpie
    end
end

always @(posedge clk) begin
    if (reset) begin
        mtvec <= 0;
    end
    else if (wen && addr == `ysyx_22041752_CSR_ADDR_MTVEC) begin
        mtvec <= wdata;
    end
end

always @(posedge clk) begin
    if (reset) begin
        mepc <= 0;
    end
    else if (wen && addr == `ysyx_22041752_CSR_ADDR_MEPC) begin
        mepc <= {wdata[63:1], 1'b0};
    end
end

always @(posedge clk) begin
    if (reset) begin
        mcause <= 0;
    end
    else if (wen && addr == `ysyx_22041752_CSR_ADDR_MCAUSE) begin
        mcause <= wdata;
    end
end

always @(posedge clk) begin
    if (reset) begin
        mie <= 0;
    end
    else if (wen && addr == `ysyx_22041752_CSR_ADDR_MIE) begin
        mie <= wdata;
    end
end

always @(posedge clk) begin
    if (reset) begin
        mip <= 0;
    end
    else begin
        mip[7] <= mstatus[3] & mie[7] & int_t_i;
    end
end

assign int_t_o = int_allowin && mip[7];

`ifdef DPI_C
assign dpi_csrs[0] = mstatus; 
assign dpi_csrs[1] = mtvec;   
assign dpi_csrs[2] = mepc;    
assign dpi_csrs[3] = mcause;  
`endif

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_bjt_cal.v
// Author        : Cw
// Created On    : 2023-06-06 09:19
// Last Modified : 2023-07-17 19:45
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_bjt_cal (
    input                             jalr         ,
    input  [11:0]                     imm_i        ,
    input  [`ysyx_22041752_PC_WD-1:0] jalr_src1    ,
    input                             branch       ,
    input  [12:0]                     imm_b        ,
    input  [`ysyx_22041752_PC_WD-1:0] es_pc        ,
    input                             b_taken_real ,
    input                             br_taken_pre ,
    input  [`ysyx_22041752_PC_WD-1:0] jt_pre       ,

    output                            pre_error    ,
    output [`ysyx_22041752_PC_WD-1:0] bj_addr
);

wire [`ysyx_22041752_PC_WD-1:0] bt_a;
wire [`ysyx_22041752_PC_WD-1:0] bt_b;
wire count;    
assign bt_a = jalr ? jalr_src1 : es_pc;

assign bt_b = branch ? {{19{imm_b[12]}},imm_b} :
                       {{20{imm_i[11]}},imm_i} ;

ysyx_22041752_aser #(.WIDTH (32))
U_ASER_1(
    .a          ( bt_a      ),
    .b          ( bt_b      ),
    .sub        ( 1'b0      ),
    .cout       ( count     ),
    .result     ( bj_addr   )
);

wire br_err   = branch && (br_taken_pre!=b_taken_real);
wire jalr_err = jalr   && (bj_addr     !=jt_pre);

assign pre_error = br_err || jalr_err;

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2022 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_MEU.v
// Author        : Cw
// Created On    : 2022-11-21 15:40
// Last Modified : 2023-07-17 19:23
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------

module ysyx_22041752_MEU (
    input                                        clk           ,
    input                                        reset         ,
    
    input                                        ws_allowin    ,
    output                                       ms_allowin    ,
    
    input                                        es_to_ms_valid,
    input  [`ysyx_22041752_ES_TO_MS_BUS_WD -1:0] es_to_ms_bus  ,
   
    output                                       ms_to_ws_valid,
    output [`ysyx_22041752_MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus  ,
    
    input  [`ysyx_22041752_DATA_DATA_WD    -1:0] data_rdata    ,
    input                                        cache_miss    ,
	
	output [`ysyx_22041752_FORWARD_BUS_WD-1:0]   ms_forward_bus
`ifdef DPI_C
    ,
    input                                        debug_es_out_of_mem    ,
    input  [`ysyx_22041752_INST_WD         -1:0] debug_es_inst          ,
    output reg [`ysyx_22041752_INST_WD     -1:0] debug_ms_inst          ,
    output reg                                   debug_ms_out_of_mem    ,
    output                                       debug_cache_miss       ,
    output [`ysyx_22041752_DATA_DATA_WD    -1:0] debug_ms_data_rdata    ,
    output                                       debug_ms_rdata_valid   
`endif

);

reg         ms_valid;
wire        ms_ready_go;

reg [`ysyx_22041752_ES_TO_MS_BUS_WD -1:0] es_to_ms_bus_r;

wire                   res_sext    ;
wire                   res_zext    ;
wire [            1:0] ms_mem_bytes;
wire [            2:0] ms_addr_offset;
wire            	   ms_mem_re   ;  
wire            	   ms_mem_we   ;  
wire                   ms_rf_we    ;
wire [`ysyx_22041752_RF_ADDR_WD-1:0]    rd          ;
wire [`ysyx_22041752_RF_DATA_WD-1:0]    alu_result  ;
//wire [`ysyx_22041752_PC_WD     -1:0]    ms_pc       ;

assign {res_sext        ,
		res_zext        ,
        ms_addr_offset  ,
		ms_mem_bytes    ,        
	    ms_mem_re       ,  
        ms_mem_we       ,
        ms_rf_we        ,
        rd              ,
        alu_result      //,
        //ms_pc           
       } = es_to_ms_bus_r;

wire [`ysyx_22041752_RF_DATA_WD-1:0] mem_result;
wire [`ysyx_22041752_RF_DATA_WD-1:0] ms_final_result;

assign ms_to_ws_bus = {ms_rf_we       ,  
                       rd             ,  
                       ms_final_result//,  
                       //ms_pc             
                      };

assign ms_ready_go    = ms_mem_we|ms_mem_re ? !cache_miss: 1'b1;
assign ms_allowin     = !ms_valid || ms_ready_go && ws_allowin;
assign ms_to_ws_valid = ms_valid && ms_ready_go;
always @(posedge clk) begin
    if (reset) begin
        ms_valid <= 1'b0;
    end
    else if (ms_allowin) begin
        ms_valid <= es_to_ms_valid;
    end
end
always @(posedge clk) begin
    if (reset) begin
        es_to_ms_bus_r <= 0;
    end
	else if (es_to_ms_valid && ms_allowin) begin
        es_to_ms_bus_r <= es_to_ms_bus;
    end
end

reg [`ysyx_22041752_DATA_DATA_WD-1:0] shift_data;
always @(*) begin
    case (ms_addr_offset)
        3'b000: begin
            shift_data = data_rdata;
        end
        3'b001: begin
            shift_data = data_rdata >> 8;
        end
        3'b010: begin
            shift_data = data_rdata >> 16;
        end
        3'b011: begin
            shift_data = data_rdata >> 24;
        end
        3'b100: begin
            shift_data = data_rdata >> 32;
        end
        3'b101: begin
            shift_data = data_rdata >> 40;
        end
        3'b110: begin
            shift_data = data_rdata >> 48;
        end
        default: begin
            shift_data = data_rdata >> 56;
        end
    endcase
end

assign mem_result = ms_mem_bytes==2'b00 && res_sext ? {{56{shift_data[ 7]}}, shift_data[ 7:0]} : 
                    ms_mem_bytes==2'b00 && res_zext ? {{56{          1'b0}}, shift_data[ 7:0]} :
                    ms_mem_bytes==2'b01 && res_sext ? {{48{shift_data[15]}}, shift_data[15:0]} :
                    ms_mem_bytes==2'b01 && res_zext ? {{48{          1'b0}}, shift_data[15:0]} :
                    ms_mem_bytes==2'b10 && res_sext ? {{32{shift_data[31]}}, shift_data[31:0]} :
                    ms_mem_bytes==2'b10 && res_zext ? {{32{          1'b0}}, shift_data[31:0]} :
                                                                             shift_data        ;

//assign mem_result = ms_mem_bytes==2'b00 && res_sext ? {{56{data_rdata[ 7]}}, data_rdata[ 7:0]} : 
                    //ms_mem_bytes==2'b00 && res_zext ? {{56{          1'b0}}, data_rdata[ 7:0]} :
                    //ms_mem_bytes==2'b01 && res_sext ? {{48{data_rdata[15]}}, data_rdata[15:0]} :
                    //ms_mem_bytes==2'b01 && res_zext ? {{48{          1'b0}}, data_rdata[15:0]} :
                    //ms_mem_bytes==2'b10 && res_sext ? {{32{data_rdata[31]}}, data_rdata[31:0]} :
                    //ms_mem_bytes==2'b10 && res_zext ? {{32{          1'b0}}, data_rdata[31:0]} :
                                                                             //data_rdata        ;

assign ms_final_result = ms_mem_re ? mem_result : alu_result;
						 
//forward_bus
wire ms_forward_valid;
assign ms_forward_valid = ms_rf_we && ms_valid;
assign ms_forward_bus   = {cache_miss&ms_mem_re&ms_valid, ms_forward_valid,ms_final_result,rd};

`ifdef DPI_C
assign debug_cache_miss = cache_miss;      
always @(posedge clk) begin
    if (es_to_ms_valid && ms_allowin) begin
        debug_ms_inst <= debug_es_inst;
    end
end
always @(posedge clk) begin
    if (es_to_ms_valid && ms_allowin) begin
        debug_ms_out_of_mem <= debug_es_out_of_mem;
    end
end
assign debug_ms_rdata_valid = ms_mem_re && !cache_miss && ms_to_ws_valid && ws_allowin;
assign debug_ms_data_rdata  = ms_final_result;
`endif

endmodule
// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_memspace.v
// Author        : Cw
// Created On    : 2023-07-01 16:22
// Last Modified : 2023-07-17 22:34
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------

module ysyx_22041752_memspace (
    input   clk  ,
    input   reset,

    input                                      es_data_en_i         ,
    input  [`ysyx_22041752_DATA_WEN_WD -1:0]   es_data_wen_i        ,
    input  [`ysyx_22041752_DATA_ADDR_WD-1:0]   es_data_addr_i       ,
    input  [`ysyx_22041752_DATA_DATA_WD-1:0]   es_data_wdata_i      ,
    output                                     es_write_hit_o       ,
    output [`ysyx_22041752_DATA_DATA_WD-1:0]   ms_data_rdata_o      ,
    output                                     ms_miss_o            ,

    output                                     clint_en_o           ,
    output                                     clint_wen_o          ,
    output [`ysyx_22041752_DATA_ADDR_WD-1:0]   clint_data_addr_o    ,
    output [`ysyx_22041752_DATA_DATA_WD-1:0]   clint_data_wdata_o   ,
    input  [`ysyx_22041752_DATA_DATA_WD-1:0]   clint_data_rdata_i   ,

    output                                     dcache_en_o          ,
    output [`ysyx_22041752_DATA_WEN_WD -1:0]   dcache_wen_o         ,
    output [`ysyx_22041752_DATA_ADDR_WD-1:0]   dcache_data_addr_o   ,
    output [`ysyx_22041752_DATA_DATA_WD-1:0]   dcache_data_wdata_o  ,
    input                                      dcache_miss_i        , 
    input                                      dcache_write_hit_i   ,
    input  [`ysyx_22041752_DATA_DATA_WD-1:0]   dcache_data_rdata_i  ,

    input                                      io_miss_i            , 
    input  [`ysyx_22041752_DATA_DATA_WD-1:0]   io_data_rdata_i      ,
    output                                     io_en_o              ,
    output [`ysyx_22041752_DATA_WEN_WD -1:0]   io_wen_o             ,
    output [`ysyx_22041752_DATA_ADDR_WD-1:0]   io_data_addr_o       ,
    output [`ysyx_22041752_DATA_DATA_WD-1:0]   io_data_wdata_o      
`ifdef DPI_C
    ,
    output                                     debug_dcache_en
`endif
);
    
wire access_clint= ((es_data_addr_i == `ysyx_22041752_CLINT_BASE_ADDR+`ysyx_22041752_MTIME_OFFSET) || (es_data_addr_i == `ysyx_22041752_CLINT_BASE_ADDR+`ysyx_22041752_MTIMECMP_OFFSET));

wire access_mem  = (es_data_addr_i >= `ysyx_22041752_MEM_BASEADDR) && (es_data_addr_i <= (`ysyx_22041752_MEM_END));

wire access_io   = !(access_clint || access_mem);

assign clint_en_o = es_data_en_i & access_clint;
assign dcache_en_o= es_data_en_i & access_mem  ;
assign io_en_o    = es_data_en_i & access_io   ;

assign clint_wen_o  = |es_data_wen_i;
assign dcache_wen_o =  es_data_wen_i;
assign io_wen_o     =  es_data_wen_i;

assign clint_data_addr_o  = es_data_addr_i;
assign dcache_data_addr_o = es_data_addr_i;
assign io_data_addr_o     = es_data_addr_i;

assign clint_data_wdata_o = es_data_wdata_i;
assign dcache_data_wdata_o= es_data_wdata_i;
assign io_data_wdata_o    = es_data_wdata_i;

/* ================================ to ms ===============================*/
reg mem_r, io_r, clint_r;
always @(posedge clk) begin
    if (reset) begin
        mem_r   <= 0;
    end
    else if (dcache_en_o) begin
        mem_r   <= 1'b1;
    end
    else if (mem_r && !dcache_miss_i) begin
        mem_r   <= 1'b0;
    end
end
always @(posedge clk) begin
    if (reset) begin
        io_r    <= 0;
    end
    else if (io_en_o) begin
        io_r    <= 1'b1;
    end
    else if (io_r && !io_miss_i) begin
        io_r    <= 1'b0;
    end
end
always @(posedge clk) begin
    if (reset) begin
        clint_r <= 0;
    end
    else begin
        clint_r <= clint_en_o;
    end
end

assign es_write_hit_o  = mem_r & dcache_write_hit_i;
assign ms_data_rdata_o = {`ysyx_22041752_DATA_DATA_WD{mem_r}}   & dcache_data_rdata_i | 
                         {`ysyx_22041752_DATA_DATA_WD{io_r}}    & io_data_rdata_i     |
                         {`ysyx_22041752_DATA_DATA_WD{clint_r}} & clint_data_rdata_i  ;
assign ms_miss_o       = mem_r   & dcache_miss_i ||
                         io_r    & io_miss_i     ;

`ifdef DPI_C
assign debug_dcache_en = dcache_en_o;
`endif
endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_io.v
// Author        : Cw
// Created On    : 2023-06-28 15:14
// Last Modified : 2023-07-22 22:31
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_io (
    input  clk   ,
    input  reset ,

    input                                      io_en         , 
    input  [`ysyx_22041752_DATA_WEN_WD -1:0]   io_wen        , 
    input  [`ysyx_22041752_DATA_ADDR_WD-1:0]   io_data_addr  , 
    input  [`ysyx_22041752_DATA_DATA_WD-1:0]   io_data_wdata , 
    output [`ysyx_22041752_DATA_DATA_WD-1:0]   io_data_rdata , 
    output                                     io_miss       ,  

    output                                     sram_req      ,
    output [ 2:0]                              size          ,
    input                                      sram_ready    ,
    output [`ysyx_22041752_DATA_WEN_WD -1:0]   sram_wen      ,
    output [`ysyx_22041752_DATA_ADDR_WD-1:0]   sram_addr     ,
    output [`ysyx_22041752_DATA_DATA_WD-1:0]   sram_wdata    ,
    input  [`ysyx_22041752_DATA_DATA_WD-1:0]   sram_rdata    ,
    input                                      sram_valid    
);
    
reg [2:0]                               size_r          ;
reg                                     io_en_r         ;
reg [`ysyx_22041752_DATA_WEN_WD -1:0]   io_wen_r        ; 
reg [`ysyx_22041752_DATA_ADDR_WD-1:0]   io_data_addr_r  ; 
reg [`ysyx_22041752_DATA_DATA_WD-1:0]   io_data_wdata_r ; 
always @(posedge clk) begin
    if (reset) begin
        io_en_r <= 0;
    end
    else begin
        io_en_r <= io_en;
    end
end
always @(posedge clk) begin
    if (reset) begin
        io_wen_r <= 0;
    end
    else if (io_en) begin
        io_wen_r <= io_wen;
    end
end
always @(posedge clk) begin
    if (reset) begin
        io_data_addr_r <= 0;
    end
    else if (io_en) begin
        io_data_addr_r <= io_data_addr;
    end
end
always @(posedge clk) begin
    if (reset) begin
        size_r <= 3'b000; //1 byte
    end
    else if (io_en) begin
        if ((io_data_addr>=`ysyx_22041752_UART_BASEADDR) && (io_data_addr<=`ysyx_22041752_UART_END)) begin
            size_r <= 3'b000; //1 byte
        end
        else if ((io_data_addr>=`ysyx_22041752_FLASH_BASEADDR) && (io_data_addr<=`ysyx_22041752_FLASH_END)) begin
            size_r <= 3'b010; //4 bytes
        end
        else if ((io_data_addr>=`ysyx_22041752_SPI_BASEADDR) && (io_data_addr<=`ysyx_22041752_SPI_END)) begin
            size_r <= 3'b010; //4 bytes
        end
        else begin
            size_r <= 3'b011; //8 bytes
        end
    end
end
always @(posedge clk) begin
    if (reset) begin
        io_data_wdata_r <= 0;
    end
    else if (io_en) begin
        io_data_wdata_r <= io_data_wdata;
    end
end

reg  [2:0] iofsm_pre;
wire [2:0] iofsm_nxt;
parameter IDLE       = 0;
parameter WRITE_REQ  = 1;
parameter WRITE_RESP = 2;
parameter WRITE_DONE = 3;
parameter READ_REQ   = 4;
parameter READ_RESP  = 5;
parameter READ_DONE  = 6;
always @(posedge clk) begin
    if (reset) begin
        iofsm_pre <= IDLE;
    end
    else begin
        iofsm_pre <= iofsm_nxt;
    end
end

assign iofsm_nxt = (iofsm_pre==IDLE||iofsm_pre==READ_DONE||iofsm_pre==WRITE_DONE) && io_en_r   &&io_wen_r==0 ? READ_REQ  :
                    iofsm_pre==READ_REQ                                           && sram_ready        ? READ_RESP :
                    iofsm_pre==READ_RESP                                          && sram_valid        ? READ_DONE :
                   (iofsm_pre==IDLE||iofsm_pre==READ_DONE||iofsm_pre==WRITE_DONE) && io_en_r   &&io_wen_r!=0 ? WRITE_REQ :
                    iofsm_pre==WRITE_REQ                                          && sram_ready        ? WRITE_RESP:
                    iofsm_pre==WRITE_RESP                                         && sram_valid        ? WRITE_DONE:
                   (iofsm_pre==READ_DONE||iofsm_pre==WRITE_DONE)                                       ? IDLE      :
                                                                                                         iofsm_pre ;

assign sram_req = (iofsm_pre==READ_REQ||iofsm_pre==WRITE_REQ) && !sram_ready;
assign sram_wen = {8{iofsm_pre==WRITE_REQ}} & io_wen_r;
assign size     = size_r;
assign sram_addr     = io_data_addr_r;
assign sram_wdata    = io_data_wdata_r;

assign io_miss = iofsm_pre==WRITE_REQ || iofsm_pre==WRITE_RESP ||
                 iofsm_pre==READ_REQ  || iofsm_pre==READ_RESP  ||
                 iofsm_pre==IDLE      && io_en_r;

reg [`ysyx_22041752_DATA_DATA_WD-1:0]   io_data_rdata_r ;
always @(posedge clk)begin
    if (reset) begin
        io_data_rdata_r <= 0;
    end
    else if (sram_valid) begin
        io_data_rdata_r <= sram_rdata;
    end
end
assign io_data_rdata = io_data_rdata_r;
endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_mmu.v
// Author        : Cw
// Created On    : 2023-06-23 19:24
// Last Modified : 2023-07-18 21:07
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------

module ysyx_22041752_mmu (
    input                                      clk                  ,
    input                                      reset                ,

    //dcache_to_axiram    
    input                                          dcache_sram_req_i    ,
    output reg                                     dcache_sram_ready_o  ,
    input      [`ysyx_22041752_DATA_WEN_WD -1:0]   dcache_sram_wen_i    , 
    input      [`ysyx_22041752_DATA_ADDR_WD-1:0]   dcache_sram_addr_i   , 
    input      [`ysyx_22041752_DATA_DATA_WD-1:0]   dcache_sram_wdata_i  , 
    output reg [`ysyx_22041752_DATA_DATA_WD-1:0]   dcache_sram_rdata_o  ,
    output reg                                     dcache_sram_valid_o  ,

    //io_to_axiram    
    input                                          io_sram_req_i        ,
    input      [2:0]                               io_sram_size_i       ,
    output reg                                     io_sram_ready_o      ,
    input      [`ysyx_22041752_DATA_WEN_WD -1:0]   io_sram_wen_i        , 
    input      [`ysyx_22041752_DATA_ADDR_WD-1:0]   io_sram_addr_i       , 
    input      [`ysyx_22041752_DATA_DATA_WD-1:0]   io_sram_wdata_i      , 
    output reg [`ysyx_22041752_DATA_DATA_WD-1:0]   io_sram_rdata_o      ,
    output reg                                     io_sram_valid_o      ,

/*** connected to axi_arbiter ***/
    output                                         sram_req_o           ,
    output reg [2:0]                               sram_size_o          ,
    input                                          sram_ready_i         ,
    output reg [`ysyx_22041752_DATA_WEN_WD -1:0]   sram_wen_o           , 
    output reg [`ysyx_22041752_DATA_ADDR_WD-1:0]   sram_addr_o          , 
    output reg [`ysyx_22041752_DATA_DATA_WD-1:0]   sram_wdata_o         , 
    input      [`ysyx_22041752_DATA_DATA_WD-1:0]   sram_rdata_i         ,
    input                                          sram_valid_i         
);
    
parameter IDLE    = 0;
parameter REQ_DC  = 1;
parameter REQ_IO  = 2;
parameter WAIT_DC = 3;
parameter WAIT_IO = 4;
parameter GET_DC  = 5;
parameter GET_IO  = 6;

reg  [2:0] mmufsm_pre;
wire [2:0] mmufsm_nxt;
always @(posedge clk) begin
    if (reset) begin
        mmufsm_pre <= IDLE;
    end
    else begin
        mmufsm_pre <= mmufsm_nxt;
    end
end

assign mmufsm_nxt = (mmufsm_pre==IDLE || mmufsm_pre==GET_DC || mmufsm_pre==GET_IO) && dcache_sram_req_i ? REQ_DC    :
                    (mmufsm_pre==IDLE || mmufsm_pre==GET_DC || mmufsm_pre==GET_IO) && io_sram_req_i     ? REQ_IO    :
                     mmufsm_pre==REQ_DC                                            && sram_ready_i      ? WAIT_DC   :
                     mmufsm_pre==WAIT_DC                                           && sram_valid_i      ? GET_DC    :
                     mmufsm_pre==REQ_IO                                            && sram_ready_i      ? WAIT_IO   :
                     mmufsm_pre==WAIT_IO                                           && sram_valid_i      ? GET_IO    :
                    (mmufsm_pre==GET_DC || mmufsm_pre==GET_IO)                                          ? IDLE      :
                                                                                                          mmufsm_pre;

always @(posedge clk)begin
    if (reset) begin
        dcache_sram_ready_o <= 0;
    end
    else begin
        dcache_sram_ready_o <= mmufsm_nxt==REQ_DC;
    end
end
always @(posedge clk) begin
    if (reset) begin
        io_sram_ready_o <= 0;
    end
    else begin
        io_sram_ready_o <= mmufsm_nxt==REQ_IO;
    end
end
always @(posedge clk) begin
    if (reset) begin
        dcache_sram_valid_o <= 0;
    end
    else begin
        dcache_sram_valid_o <= mmufsm_nxt==GET_DC;
    end
end
always @(posedge clk) begin
    if (reset) begin
        io_sram_valid_o <= 0;
    end
    else begin
        io_sram_valid_o <= mmufsm_nxt==GET_IO;
    end
end
always @(posedge clk) begin
    if (reset) begin
        dcache_sram_rdata_o <= 0;
    end
    else if (mmufsm_nxt==GET_DC) begin
        dcache_sram_rdata_o <= sram_rdata_i;
    end
end
always @(posedge clk) begin
    if (reset) begin
        io_sram_rdata_o <= 0;
    end
    else if (mmufsm_nxt==GET_IO) begin
        io_sram_rdata_o <= sram_rdata_i;
    end
end

assign sram_req_o = (mmufsm_pre==REQ_DC || mmufsm_pre==REQ_IO) && !sram_ready_i;

always @(posedge clk) begin
    if (reset) begin
        sram_size_o <= 0;
    end
    else if(mmufsm_pre!=REQ_IO && mmufsm_nxt==REQ_IO) begin
        sram_size_o <= io_sram_size_i;
    end
    else if(mmufsm_pre!=REQ_DC && mmufsm_nxt==REQ_DC) begin
        sram_size_o <= 3'b011;
    end
end
always @(posedge clk) begin
    if (reset) begin
        sram_wen_o <= 0;
    end
    else if(mmufsm_pre!=REQ_DC && mmufsm_nxt==REQ_DC) begin
        sram_wen_o <= dcache_sram_wen_i;
    end
    else if(mmufsm_pre!=REQ_IO && mmufsm_nxt==REQ_IO) begin
        sram_wen_o <= io_sram_wen_i;
    end
end
always @(posedge clk) begin
    if (reset) begin
        sram_addr_o <= 0;
    end
    else if(mmufsm_pre!=REQ_DC && mmufsm_nxt==REQ_DC) begin
        sram_addr_o <= dcache_sram_addr_i;
    end
    else if(mmufsm_pre!=REQ_IO && mmufsm_nxt==REQ_IO) begin
        sram_addr_o <= io_sram_addr_i;
    end
end
always @(posedge clk) begin
    if (reset) begin
        sram_wdata_o <= 0;
    end
    else if(mmufsm_pre!=REQ_DC && mmufsm_nxt==REQ_DC) begin
        sram_wdata_o <= dcache_sram_wdata_i;
    end
    else if(mmufsm_pre!= REQ_IO && mmufsm_nxt==REQ_IO) begin
        sram_wdata_o <= io_sram_wdata_i;
    end
end
endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_clint.v
// Author        : Cw
// Created On    : 2023-05-26 20:44
// Last Modified : 2023-07-20 10:00
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------

module ysyx_22041752_clint (
    input  clk          ,
    input  reset        ,

    input             en    ,
    input             wen   ,
    input      [31:0] addr  ,
    input      [63:0] wdata ,
    output reg [63:0] rdata ,

    output reg        int_t_o
);

reg [63:0] mtime;
always @(posedge clk) begin
    if (reset) begin
        mtime <= 0;
    end
    else if (wen && (addr == `ysyx_22041752_CLINT_BASE_ADDR+`ysyx_22041752_MTIME_OFFSET)) begin
        mtime <= wdata;
    end
    else begin
        mtime <= mtime+1;
    end
end

reg [63:0] mtimecmp;
always @(posedge clk) begin
    if (reset) begin
        mtimecmp <= 0;
    end
    else if (wen && (addr == `ysyx_22041752_CLINT_BASE_ADDR+`ysyx_22041752_MTIMECMP_OFFSET)) begin
        mtimecmp <= wdata;
    end
end

always @(posedge clk) begin
    if (reset) begin
        rdata <= 0;
    end
    else if (en && !wen) begin
        if (addr==`ysyx_22041752_CLINT_BASE_ADDR+`ysyx_22041752_MTIME_OFFSET) begin
            rdata <= mtime;
        end
        else if (addr==`ysyx_22041752_CLINT_BASE_ADDR+`ysyx_22041752_MTIMECMP_OFFSET) begin
            rdata <= mtimecmp;
        end
    end
end

always @(posedge clk) begin
    if (reset) begin
        int_t_o <= 0;
    end
    else begin
        int_t_o <= mtime >= mtimecmp;
    end
end

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_axiarbiter.v
// Author        : Cw
// Created On    : 2023-05-27 17:57
// Last Modified : 2023-07-24 12:15
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_axiarbiter (
    input          clk     ,
    input          reset   ,

    //from IFU & LSU
    input                                    inst_en    ,
    output                                   inst_ready ,
    input  [`ysyx_22041752_DATA_ADDR_WD-1:0] inst_addr  ,
    output [`ysyx_22041752_DATA_DATA_WD-1:0] inst_rdata ,
    output                                   inst_valid ,
    input                                    data_en    ,
    input  [2:0]                             data_size  ,
    output                                   data_ready ,
    input  [`ysyx_22041752_DATA_WEN_WD -1:0] data_wen   ,
    input  [`ysyx_22041752_DATA_ADDR_WD-1:0] data_addr  ,
    input  [`ysyx_22041752_DATA_DATA_WD-1:0] data_wdata ,
    output [`ysyx_22041752_DATA_DATA_WD-1:0] data_rdata ,
    output                                   data_valid ,

    //axi_interface
    output [ 3:0] arid    ,
    output [31:0] araddr  ,
    output [ 7:0] arlen   ,
    output [ 2:0] arsize  ,
    output [ 1:0] arburst ,
    output        arvalid ,
    input         arready ,
                               
    input  [ 3:0] rid     ,
    input  [63:0] rdata   ,
    input  [ 1:0] rresp   ,
    input         rlast   ,
    input         rvalid  ,
    output        rready  ,
                               
    output [ 3:0] awid    ,
    output [31:0] awaddr  ,
    output [ 7:0] awlen   ,
    output [ 2:0] awsize  ,
    output [ 1:0] awburst ,
    output        awvalid ,
    input         awready ,
                          
    output [63:0] wdata   ,
    output [ 7:0] wstrb   ,
    output        wlast   ,
    output        wvalid  ,
    input         wready  ,
                               
    input  [ 3:0] bid     ,
    input  [ 1:0] bresp   ,
    input         bvalid  ,
    output        bready  
);
    
reg inst_buf_split;
reg [1:0] inst_buf_cnt;
reg [`ysyx_22041752_DATA_DATA_WD-1:0] inst_buf;

reg  [3:0] arfsm_pre;
wire [3:0] arfsm_nxt;
parameter AR_IDLE         = 0;
parameter AR_FETCH_LOW    = 1;
parameter AR_FETCH_HIGH   = 2;
parameter AR_FETCH        = 3;
parameter AR_LOAD         = 4;
parameter AR_FETCH_LOW_OK = 5;
parameter AR_FETCH_OK     = 6;
parameter AR_LOAD_OK      = 7;
always @(posedge clk) begin
    if (reset) begin
        arfsm_pre <= AR_IDLE;
    end
    else begin
        arfsm_pre <= arfsm_nxt;
    end
end
wire data_ren = data_en && data_wen==0;

wire i_ar_split = (inst_addr >= `ysyx_22041752_FLASH_BASEADDR) && (inst_addr <= `ysyx_22041752_FLASH_END)  ;

assign arfsm_nxt = (arfsm_pre==AR_IDLE || arfsm_pre==AR_FETCH_OK || arfsm_pre==AR_LOAD_OK) && inst_en  && i_ar_split ? AR_FETCH_LOW    :  
                   (arfsm_pre==AR_IDLE || arfsm_pre==AR_FETCH_OK || arfsm_pre==AR_LOAD_OK) && inst_en  &&!i_ar_split ? AR_FETCH        :  
                   (arfsm_pre==AR_IDLE || arfsm_pre==AR_FETCH_OK || arfsm_pre==AR_LOAD_OK) && data_ren               ? AR_LOAD         :
                    arfsm_pre==AR_FETCH                                                                && arready    ? AR_FETCH_OK     :  
                    arfsm_pre==AR_LOAD                                                                 && arready    ? AR_LOAD_OK      :
                    arfsm_pre==AR_FETCH_LOW                                                            && arready    ? AR_FETCH_LOW_OK :  
                    arfsm_pre==AR_FETCH_LOW_OK                                                                       ? AR_FETCH_HIGH   :  
                    arfsm_pre==AR_FETCH_HIGH                                                           && arready    ? AR_FETCH_OK     :  
                   (arfsm_pre==AR_FETCH_OK || arfsm_pre==AR_LOAD_OK)                                                 ? AR_IDLE         :
                                                                                                                       arfsm_pre       ;
reg  [3:0] rfsm_pre;
wire [3:0] rfsm_nxt;
parameter R_IDLE                = 0;
parameter R_WAIT_FETCH_LOW      = 1;
parameter R_WAIT_FETCH          = 3;
parameter R_WAIT_LOAD           = 4;
parameter R_WAIT_FETCH_HIGH     = 5;
parameter R_GET_INST_LOW        = 7;
parameter R_GET_INST            = 8;
parameter R_GET_DATA            =10;
always @(posedge clk) begin
    if (reset) begin
        rfsm_pre <= R_IDLE;
    end
    else begin
        rfsm_pre <= rfsm_nxt;
    end
end

assign rfsm_nxt = (rfsm_pre==R_IDLE || rfsm_pre==R_GET_INST || rfsm_pre==R_GET_DATA) && arfsm_pre==AR_FETCH_LOW_OK      ? R_WAIT_FETCH_LOW :
                  (rfsm_pre==R_IDLE || rfsm_pre==R_GET_INST || rfsm_pre==R_GET_DATA) && arfsm_pre==AR_FETCH_OK          ? R_WAIT_FETCH     :
                  (rfsm_pre==R_IDLE || rfsm_pre==R_GET_INST || rfsm_pre==R_GET_DATA) && arfsm_pre==AR_LOAD_OK           ? R_WAIT_LOAD      :
                   rfsm_pre==R_WAIT_FETCH_LOW                                        && rvalid&&rid==0                  ? R_GET_INST_LOW   :
                   rfsm_pre==R_GET_INST_LOW                                                                             ? R_WAIT_FETCH_HIGH:
                   rfsm_pre==R_WAIT_FETCH                                            && rvalid&&rid==0                  ? R_GET_INST       :
                   rfsm_pre==R_WAIT_FETCH_HIGH                                       && rvalid&&rid==0                  ? R_GET_INST       :
                   rfsm_pre==R_WAIT_LOAD                                             && rvalid&&rid==1                  ? R_GET_DATA       :
                   rfsm_pre==R_GET_DATA                                              && inst_buf_cnt==1&&inst_buf_split ? R_WAIT_FETCH_HIGH: 
                  (rfsm_pre==R_GET_INST|| rfsm_pre==R_GET_DATA)                                                         ? R_IDLE           :
                                                                                                                          rfsm_pre         ;

reg data_buf_v;
reg [`ysyx_22041752_DATA_DATA_WD-1:0] data_buf;
always @(posedge clk) begin
    if (reset) begin
        data_buf_v <= 0;
    end
    else if ((rfsm_pre==R_WAIT_FETCH || rfsm_pre==R_WAIT_FETCH_HIGH) && rvalid && (rid==1)) begin
        data_buf_v <= 1;
    end
    else if (rfsm_nxt==R_GET_INST) begin
        data_buf_v <= 0;
    end
end
always @(posedge clk) begin
    if (reset) begin
        data_buf <= 0;
    end
    else if ((rfsm_pre==R_WAIT_FETCH || rfsm_pre==R_WAIT_FETCH_HIGH) && rvalid && (rid==1)) begin
        data_buf <= rdata;
    end
end

always @(posedge clk) begin
    if (reset) begin
        inst_buf_split <= 0;
    end
    else if (arfsm_nxt==AR_FETCH_LOW && rfsm_pre==R_WAIT_LOAD) begin
        inst_buf_split <= 1;
    end
    else if (rfsm_nxt==R_GET_DATA) begin
        inst_buf_split <= 0;
    end
end
always @(posedge clk) begin
    if (reset) begin
        inst_buf_cnt <= 0;
    end
    else if (rfsm_pre==R_WAIT_LOAD && rvalid && rid==0) begin
        inst_buf_cnt <= inst_buf_cnt + 1;
    end
    else if (rfsm_nxt==R_GET_DATA) begin
        inst_buf_cnt <= 0;
    end
end
always @(posedge clk) begin
    if (reset) begin
        inst_buf <= 0;
    end
    else if (rfsm_pre==R_WAIT_LOAD && rvalid && rid==0) begin
        if(inst_buf_cnt==0)
            inst_buf <= rdata;
        else
            inst_buf[`ysyx_22041752_DATA_DATA_WD-1:32] <= rdata[`ysyx_22041752_DATA_DATA_WD-1:32];
    end
end

reg  [2:0] awfsm_pre;
wire [2:0] awfsm_nxt;
parameter AW_IDLE=0;
parameter AW_WAIT=1;
parameter AW_WAIT_W=2;
parameter AW_WAIT_AW=3;
parameter AW_OK=4;
always @(posedge clk) begin
    if (reset) begin
        awfsm_pre <= AW_IDLE;
    end
    else begin
        awfsm_pre <= awfsm_nxt;
    end
end

assign awfsm_nxt = (awfsm_pre==AW_IDLE || awfsm_pre==AW_OK) &&  data_en&&|data_wen ? AW_WAIT    :
                    awfsm_pre==AW_WAIT                      &&  awready&&wready    ? AW_OK      :
                    awfsm_pre==AW_WAIT                      &&  awready            ? AW_WAIT_W  :
                    awfsm_pre==AW_WAIT                      &&  wready             ? AW_WAIT_AW :
                    awfsm_pre==AW_WAIT_AW                   &&  awready            ? AW_OK      :
                    awfsm_pre==AW_WAIT_W                    &&  wready             ? AW_OK      :
                    awfsm_pre==AW_OK                                               ? AW_IDLE    :
                                                                                     awfsm_pre  ;
reg  [1:0] bfsm_pre;
wire [1:0] bfsm_nxt;
parameter B_IDLE=0;
parameter B_WAIT_STORE=1;
parameter B_GET=2;
always @(posedge clk) begin
    if (reset) begin
        bfsm_pre <= B_IDLE;
    end
    else begin
        bfsm_pre <= bfsm_nxt;
    end
end

assign bfsm_nxt = (bfsm_pre==B_IDLE || bfsm_pre==B_GET) && awfsm_pre==AW_OK ? B_WAIT_STORE :
                   bfsm_pre==B_WAIT_STORE               && bvalid           ? B_GET        :
                   bfsm_pre==B_GET                                          ? B_IDLE       :
                                                                              bfsm_pre     ;

reg                                   inst_ready_r ;
reg [`ysyx_22041752_DATA_DATA_WD-1:0] inst_rdata_r ;
reg                                   inst_valid_r ;
reg                                   data_ready_r ;
reg [`ysyx_22041752_DATA_DATA_WD-1:0] data_rdata_r ;
reg                                   data_valid_r ;
assign inst_ready = inst_ready_r;
assign inst_rdata = inst_rdata_r;
assign inst_valid = inst_valid_r;
assign data_ready = data_ready_r;
assign data_rdata = data_rdata_r;
assign data_valid = data_valid_r;

always @(posedge clk) begin
    if (reset) begin
        inst_ready_r <= 0;
    end
    else begin
        inst_ready_r <= arfsm_nxt==AR_FETCH || arfsm_pre==AR_FETCH_HIGH && arfsm_nxt==AR_FETCH_OK;
    end
end

reg        inst_rdata_l_v;
reg [31:0] inst_rdata_l;
always @(posedge clk) begin
    if (reset) begin
        inst_rdata_l_v <= 0;
    end
    else if(rfsm_nxt==R_GET_INST_LOW || rfsm_nxt==R_GET_DATA && inst_buf_cnt==2'd1 && inst_buf_split) begin
        inst_rdata_l_v <= 1;
    end
    else if(rfsm_nxt==R_GET_INST) begin
        inst_rdata_l_v <= 0;
    end
end
always @(posedge clk) begin
    if (reset) begin
        inst_rdata_l <= 0;
    end
    else if(rfsm_nxt==R_GET_INST_LOW) begin
        inst_rdata_l <= rdata[31:0];
    end
    else if(rfsm_nxt==R_GET_DATA && inst_buf_cnt==2'd1 && inst_buf_split) begin
        inst_rdata_l <= inst_buf[31:0];
    end
end

always @(posedge clk) begin
    if (reset) begin
        inst_rdata_r <= 0;
    end
    else if (rfsm_nxt==R_GET_INST) begin
        if (inst_rdata_l_v) begin
            inst_rdata_r <= {rdata[`ysyx_22041752_DATA_DATA_WD-1:32], inst_rdata_l};
        end
        else begin
            inst_rdata_r <= rdata;
        end
    end
    else if(rfsm_nxt==R_GET_DATA && inst_buf_cnt==2'd2 || rfsm_nxt==R_GET_DATA && inst_buf_cnt==2'd1 && !inst_buf_split) begin
        inst_rdata_r <= inst_buf;
    end
end

always @(posedge clk) begin
    if (reset) begin
        inst_valid_r <= 0;
    end
    else begin
        inst_valid_r <= rfsm_nxt==R_GET_INST                                            || 
                        rfsm_nxt==R_GET_DATA && inst_buf_cnt==2'd2                      ||
                        rfsm_nxt==R_GET_DATA && inst_buf_cnt==2'd1 && !inst_buf_split;
    end
end

always @(posedge clk) begin
    if (reset) begin
        data_ready_r <= 0;
    end
    else begin
        data_ready_r <= data_en && data_wen==0 && (arfsm_nxt==AR_LOAD) ||
                        data_en && data_wen!=0 && awfsm_nxt==AW_WAIT   ;
    end
end

always @(posedge clk) begin
    if (reset) begin
        data_rdata_r <= 0;
    end
    else if (rfsm_nxt==R_GET_DATA) begin
        data_rdata_r <= rdata;
    end
    else if(rfsm_nxt==R_GET_INST && data_buf_v) begin
        data_rdata_r <= data_buf;
    end
end

always @(posedge clk) begin
    if (reset) begin
        data_valid_r <= 0;
    end
    else begin
        data_valid_r <= rfsm_nxt==R_GET_DATA               || 
                        rfsm_nxt==R_GET_INST && data_buf_v ||
                        bfsm_nxt==B_GET                    ;
    end
end

reg [ 3:0] arid_r   ; 
reg [31:0] araddr_r ; 
reg [ 7:0] arlen_r  ; 
reg [ 2:0] arsize_r ; 
reg [ 1:0] arburst_r; 
reg        arvalid_r; 

assign arid    = arid_r   ; 
assign araddr  = araddr_r ; 
assign arlen   = arlen_r  ; 
assign arsize  = arsize_r ; 
assign arburst = arburst_r; 
assign arvalid = arvalid_r; 

always @(posedge clk) begin
    if (reset) begin
        arid_r <= 0;
    end
    else begin
        if (arfsm_nxt==AR_FETCH || arfsm_nxt==AR_FETCH_LOW || arfsm_nxt==AR_FETCH_HIGH) begin
            arid_r <= 0;
        end
        else if (arfsm_nxt==AR_LOAD) begin
            arid_r <= 1;
        end
    end
end

always @(posedge clk) begin
    if (reset) begin
        araddr_r <= 0;
    end
    else begin
        if (arfsm_nxt==AR_FETCH) begin
            araddr_r <= inst_addr;
        end
        else if (arfsm_nxt==AR_FETCH_LOW) begin
            araddr_r <= {inst_addr[`ysyx_22041752_DATA_ADDR_WD-1:3], 3'b000};
        end
        else if (arfsm_nxt==AR_FETCH_HIGH) begin
            araddr_r <= {inst_addr[`ysyx_22041752_DATA_ADDR_WD-1:3], 3'b100};
        end
        else if (arfsm_nxt==AR_LOAD) begin
            araddr_r <= data_addr;
        end
    end
end

always @(*) begin
    arlen_r = 0;
end

always @(posedge clk) begin
    if (reset) begin
        arsize_r <= 3'b010; // 4 bytes
    end
    else if (arfsm_nxt==AR_FETCH) begin
        arsize_r <= 3'b011; // 8 bytes
    end
    else if (arfsm_nxt==AR_FETCH_LOW || arfsm_nxt==AR_FETCH_HIGH) begin
        arsize_r <= 3'b010; // 4 bytes
    end
    else if(arfsm_nxt==AR_LOAD) begin
        arsize_r <= data_size;
    end
end

always @(*) begin
    arburst_r = 2'b01;
end

always @(posedge clk) begin
    if (reset) begin
        arvalid_r <= 0;
    end
    else begin
        if (arfsm_nxt==AR_FETCH_LOW || arfsm_nxt==AR_FETCH_HIGH || arfsm_nxt==AR_FETCH || arfsm_nxt==AR_LOAD) begin
            arvalid_r <= 1;
        end
        else begin
            arvalid_r <= 0;
        end
    end
end

reg rready_r;
assign rready = rready_r;

always @(posedge clk) begin
    if (reset) begin
        rready_r <= 0;
    end
    else begin
        if (rfsm_nxt==R_WAIT_FETCH_LOW || rfsm_nxt==R_WAIT_FETCH_HIGH ||rfsm_nxt==R_WAIT_FETCH || rfsm_nxt==R_WAIT_LOAD) begin
            rready_r <= 1;
        end      
        else begin
            rready_r <= 0;
        end
    end
end

reg [ 3:0] awid_r   ; 
reg [31:0] awaddr_r ; 
reg [ 7:0] awlen_r  ; 
reg [ 2:0] awsize_r ; 
reg [ 1:0] awburst_r; 
reg        awvalid_r; 

assign awid    = awid_r   ; 
assign awaddr  = awaddr_r ; 
assign awlen   = awlen_r  ; 
assign awsize  = awsize_r ; 
assign awburst = awburst_r; 
assign awvalid = awvalid_r; 

always @(*) begin
    awid_r = 1;
end

always @(posedge clk) begin
    if (reset) begin
        awaddr_r <= 0;
    end
    else if (awfsm_nxt==AW_WAIT) begin
        awaddr_r <= data_addr;
    end
end

always @(*) begin
    awlen_r = 0;
end

always @(posedge clk) begin
    if (reset) begin
        awsize_r <= 3'b000; //1 bytes
    end
    else begin
        awsize_r <= data_size; 
    end
end

always @(*) begin
    awburst_r = 0;
end

always @(posedge clk) begin
    if (reset) begin
        awvalid_r <= 0;
    end
    else begin
        if (awfsm_nxt==AW_WAIT || awfsm_nxt==AW_WAIT_AW) begin
            awvalid_r <= 1;
        end
        else begin
            awvalid_r <= 0;
        end
    end
end

reg [63:0] wdata_r ;  
reg [ 7:0] wstrb_r ;  
reg        wlast_r ;  
reg        wvalid_r;  
assign wdata  = wdata_r ;  
assign wstrb  = wstrb_r ;  
assign wlast  = wlast_r ;  
assign wvalid = wvalid_r;  

always @(posedge clk) begin
    if (reset) begin
        wdata_r <= 0;
    end
    else if (awfsm_nxt==AW_WAIT || awfsm_nxt==AW_WAIT_W) begin
        wdata_r <= data_wdata;
    end
end

always @(posedge clk) begin
    if (reset) begin
        wstrb_r <= 0;
    end
    else if (awfsm_nxt==AW_WAIT || awfsm_nxt==AW_WAIT_W) begin
        wstrb_r <= data_wen;
    end
end

always @(*) begin
    wlast_r = 1;
end

always @(posedge clk) begin
    if (reset) begin
        wvalid_r <= 0;
    end
    else begin
        if (awfsm_nxt==AW_WAIT || awfsm_nxt==AW_WAIT_W) begin
            wvalid_r <= 1;
        end
        else begin
            wvalid_r <= 0;
        end
    end
end

reg bready_r;
assign bready = bready_r;
always @(posedge clk) begin
    if (reset) begin
        bready_r <= 0;
    end
    else begin
        if (bfsm_nxt==B_WAIT_STORE) begin
            bready_r <= 1;
        end
        else begin
            bready_r <= 0;
        end
    end
end

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2022 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_WBU.v
// Author        : Cw
// Created On    : 2022-11-21 16:21
// Last Modified : 2023-07-17 19:22
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------

module ysyx_22041752_WBU (
    input                                         clk           ,
    input                                         reset         ,
    
    output                                        ws_allowin    ,
    
    input                                         ms_to_ws_valid,
    input  [`ysyx_22041752_MS_TO_WS_BUS_WD -1:0]  ms_to_ws_bus  ,
    
    output [`ysyx_22041752_WS_TO_RF_BUS_WD -1:0]  ws_to_rf_bus  ,
   
	output [`ysyx_22041752_WS_FORWARD_BUS_WD-1:0] ws_forward_bus
`ifdef DPI_C
    ,
    output wire [`ysyx_22041752_PC_WD           -1:0]  debug_wb_pc            ,
    output wire                                        debug_ws_valid         ,
    input                                              debug_ms_out_of_mem    ,
    output reg  [`ysyx_22041752_INST_WD         -1:0]  debug_ws_inst          ,
    output reg                                         debug_ws_out_of_mem    ,
    input       [`ysyx_22041752_INST_WD         -1:0]  debug_ms_inst
`endif
);

reg         ws_valid;
wire        ws_ready_go;

reg [`ysyx_22041752_MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus_r;
wire                                 ws_rf_we;
wire [`ysyx_22041752_RF_ADDR_WD-1:0] rd      ;
wire [`ysyx_22041752_RF_DATA_WD-1:0] ws_r    ;
//wire [`ysyx_22041752_PC_WD     -1:0] ws_pc   ;
assign {ws_rf_we ,  
        rd       ,  
        ws_r     //,  
        //ws_pc             
       } = ms_to_ws_bus_r;

wire                                 rf_we;
wire [`ysyx_22041752_RF_ADDR_WD-1:0] rf_waddr;
wire [`ysyx_22041752_RF_DATA_WD-1:0] rf_wdata;
assign ws_to_rf_bus = {rf_we   ,  
                       rf_waddr,  
                       rf_wdata   
                      };

assign ws_ready_go = 1'b1;
assign ws_allowin  = !ws_valid || ws_ready_go;
always @(posedge clk) begin
    if (reset) begin
        ws_valid <= 1'b0;
    end
    else if (ws_allowin) begin
        ws_valid <= ms_to_ws_valid;
    end
end
always @(posedge clk) begin
    if (reset) begin
        ms_to_ws_bus_r <= 0;
    end
	else if (ms_to_ws_valid && ws_allowin) begin
        ms_to_ws_bus_r <= ms_to_ws_bus;
    end
end

assign rf_we    = ws_rf_we&&ws_valid;
assign rf_waddr = rd;
assign rf_wdata = ws_r;

// forward info generate
wire ws_forward_valid;
assign ws_forward_valid = rf_we;
assign ws_forward_bus   = {ws_forward_valid,ws_r,rd};

`ifdef DPI_C
assign debug_wb_pc       = ws_pc;
assign debug_ws_valid    = ws_valid;

always @(posedge clk) begin
    if(ms_to_ws_valid && ws_allowin) begin
        debug_ws_inst <= debug_ms_inst;    
    end
end
always @(posedge clk) begin
    if(ms_to_ws_valid && ws_allowin) begin
        debug_ws_out_of_mem <= debug_ms_out_of_mem;    
    end
end
`endif


endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_ICACHE.v
// Author        : Cw
// Created On    : 2023-06-17 10:29
// Last Modified : 2023-07-17 17:24
// ---------------------------------------------------------------------------------
// Description   : 2-way set associative cache
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_ICACHE(
    input clk     ,
    input reset   ,
    input flush   ,
    input fence_i ,

    input                                    inst_en    ,
    input  [`ysyx_22041752_PC_WD  -1:0]      inst_addr  ,
    output [`ysyx_22041752_INST_WD-1:0]      inst_rdata ,
    output                                   cache_miss ,

    output                                   sram_req   ,
    input                                    sram_ready ,
    output [`ysyx_22041752_DATA_ADDR_WD-1:0] sram_addr  ,
    input  [`ysyx_22041752_DATA_DATA_WD-1:0] sram_rdata ,
    input                                    sram_valid ,

    output [  5:0] io_sram0_addr     ,
    output         io_sram0_cen      ,
    output         io_sram0_wen      ,
    output [127:0] io_sram0_wmask    ,
    output [127:0] io_sram0_wdata    ,
    input  [127:0] io_sram0_rdata    ,
    output [  5:0] io_sram1_addr     ,
    output         io_sram1_cen      ,
    output         io_sram1_wen      ,
    output [127:0] io_sram1_wmask    ,
    output [127:0] io_sram1_wdata    ,
    input  [127:0] io_sram1_rdata    ,
    output [  5:0] io_sram2_addr     ,
    output         io_sram2_cen      ,
    output         io_sram2_wen      ,
    output [127:0] io_sram2_wmask    ,
    output [127:0] io_sram2_wdata    ,
    input  [127:0] io_sram2_rdata    ,
    output [  5:0] io_sram3_addr     ,
    output         io_sram3_cen      ,
    output         io_sram3_wen      ,
    output [127:0] io_sram3_wmask    ,
    output [127:0] io_sram3_wdata    ,
    input  [127:0] io_sram3_rdata    
);
    
wire [`ysyx_22041752_ICACHE_EN_WD   -1:0] rden       ;
wire [                               5:0] raddr      ;

wire                                        cmp_allowin    ;
wire                                        rs_to_cs_valid ;
wire [`ysyx_22041752_IRS_TO_ICS_BUS_WD-1:0] rs_to_cs_bus   ;

ysyx_22041752_ICACHE_RDU U_ICACHE_RDU_0(
    .inst_en                ( inst_en                       ),
    .inst_addr              ( inst_addr                     ),
    .cmp_allowin            ( cmp_allowin                   ),
    .rs_to_cs_valid         ( rs_to_cs_valid                ),
    .rs_to_cs_bus           ( rs_to_cs_bus                  ),
    .rden                   ( rden                          ),
    .raddr                  ( raddr                         )
);

wire [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  tag0 ;
wire [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  tag1 ;
wire [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  tag2 ;
wire [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  tag3 ;
wire [128                           -1:0]  data0;
wire [128                           -1:0]  data1;
wire [128                           -1:0]  data2;
wire [128                           -1:0]  data3;
wire                                       v0   ;
wire                                       v1   ;
wire                                       v2   ;
wire                                       v3   ;
wire                                       wen0 ;
wire                                       wen1 ;
wire                                       wen2 ;
wire                                       wen3 ;
wire [128                           -1:0]  bwen0;
wire [128                           -1:0]  bwen1;
wire [128                           -1:0]  bwen2;
wire [128                           -1:0]  bwen3;
wire [128                           -1:0]  wdata0;         
wire [128                           -1:0]  wdata1;         
wire [128                           -1:0]  wdata2;         
wire [128                           -1:0]  wdata3;         
wire [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  wtag0 ;
wire [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  wtag1 ;
wire [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  wtag2 ;
wire [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  wtag3 ;
wire                                       wv0   ;
wire                                       wv1   ;
wire                                       wv2   ;
wire                                       wv3   ;
wire [                               5:0]  waddr0;
wire [                               5:0]  waddr1;
wire [                               5:0]  waddr2;
wire [                               5:0]  waddr3;

ysyx_22041752_ICACHE_CMP U_ICACHE_CMP_0(
    .clk    ( clk   ),
    .reset  ( reset ),
    .flush  ( flush ),

    .cmp_allowin    ( cmp_allowin    ),
    .rs_to_cs_valid ( rs_to_cs_valid ),
    .rs_to_cs_bus   ( rs_to_cs_bus   ),

    .tag0           ( tag0           ),
    .tag1           ( tag1           ),
    .tag2           ( tag2           ),
    .tag3           ( tag3           ),

    .data0          ( data0          ),
    .data1          ( data1          ),
    .data2          ( data2          ),
    .data3          ( data3          ),

    .valid          ( {v3,v2,v1,v0}  ),
    .wen            ( {wen3,wen2,wen1,wen0}),

    .bwen0          ( bwen0          ),
    .wdata0         ( wdata0         ),
    .waddr0         ( waddr0         ),
    .bwen1          ( bwen1          ),
    .wdata1         ( wdata1         ),
    .waddr1         ( waddr1         ),
    .bwen2          ( bwen2          ),
    .wdata2         ( wdata2         ),
    .waddr2         ( waddr2         ),
    .bwen3          ( bwen3          ),
    .wdata3         ( wdata3         ),
    .waddr3         ( waddr3         ),
    .wtag0          ( wtag0          ),
    .wtag1          ( wtag1          ),
    .wtag2          ( wtag2          ),
    .wtag3          ( wtag3          ),
    .wv0            ( wv0            ),
    .wv1            ( wv1            ),
    .wv2            ( wv2            ),
    .wv3            ( wv3            ),

    .inst_rdata     ( inst_rdata     ),
    .cache_miss     ( cache_miss     ),

    .sram_req       ( sram_req       ),
    .sram_ready     ( sram_ready     ),
    .sram_addr      ( sram_addr      ),
    .sram_rdata     ( sram_rdata     ),
    .sram_valid     ( sram_valid     )
);

// the first way data
assign data0          = io_sram0_rdata;
assign io_sram0_cen   = rden[0]&wen0;
assign io_sram0_wen   = wen0;
assign io_sram0_wmask = bwen0;
assign io_sram0_addr  = !wen0 ? waddr0 : raddr;
assign io_sram0_wdata = wdata0;

assign data1 = io_sram1_rdata;
assign io_sram1_cen   = rden[1]&wen1;
assign io_sram1_wen   = wen1;
assign io_sram1_wmask = bwen1;
assign io_sram1_addr  = !wen1 ? waddr1 : raddr;
assign io_sram1_wdata = wdata1;

// the first way tag
ysyx_22041752_ICACHE_TAG U_ICACHE_TAG_0(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .addr                           (!wen0 ? waddr0 : raddr         ),
    .en                             ( rden[0]&wen0                  ),
    .wen                            ( wen0                          ),
    .in                             ( wtag0                         ),
    .out                            ( tag0                          )
);
ysyx_22041752_ICACHE_TAG U_ICACHE_TAG_1(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .addr                           (!wen1 ? waddr1 : raddr         ),
    .en                             ( rden[1]&wen1                  ),
    .wen                            ( wen1                          ),
    .in                             ( wtag1                         ),
    .out                            ( tag1                          )
);

// the first way valid 
ysyx_22041752_ICACHE_V U_YSYX_22041752_ICACHE_V_0(
    .clk                            ( clk                       ),
    .reset                          ( reset|fence_i             ),
    .addr                           (!wen0 ? waddr0 : raddr     ),
    .v_o                            ( v0                        ),
    .en                             ( rden[0]&wen0              ),
    .we                             ( wen0                      ),
    .v_i                            ( wv0                       )
);
ysyx_22041752_ICACHE_V U_YSYX_22041752_ICACHE_V_1(
    .clk                            ( clk                       ),
    .reset                          ( reset|fence_i             ),
    .addr                           (!wen1 ? waddr1 : raddr     ),
    .v_o                            ( v1                        ),
    .en                             ( rden[1]&wen1              ),
    .we                             ( wen1                      ),
    .v_i                            ( wv1                       )
);


/*=================================================================================*/
/*=================================================================================*/
/*=================================================================================*/

// the second way data
assign data2          = io_sram2_rdata;
assign io_sram2_cen   = rden[2]&wen2;
assign io_sram2_wen   = wen2;
assign io_sram2_wmask = bwen2;
assign io_sram2_addr  = !wen2 ? waddr2 : raddr;
assign io_sram2_wdata = wdata2;

assign data3          = io_sram3_rdata;
assign io_sram3_cen   = rden[3]&wen3;
assign io_sram3_wen   = wen3;
assign io_sram3_wmask = bwen3;
assign io_sram3_addr  = !wen3 ? waddr3 : raddr;
assign io_sram3_wdata = wdata3;

// the second way tag
ysyx_22041752_ICACHE_TAG U_ICACHE_TAG_2(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .addr                           (!wen2 ? waddr2 : raddr         ),
    .en                             ( rden[2]&wen2                  ),
    .wen                            ( wen2                          ),
    .in                             ( wtag2                         ),
    .out                            ( tag2                          )
);
ysyx_22041752_ICACHE_TAG U_ICACHE_TAG_3(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .addr                           (!wen3 ? waddr3 : raddr         ),
    .en                             ( rden[3]&wen3                  ),
    .wen                            ( wen3                          ),
    .in                             ( wtag3                         ),
    .out                            ( tag3                          )
);

// the second way valid 
ysyx_22041752_ICACHE_V U_YSYX_22041752_ICACHE_V_2(
    .clk                            ( clk                       ),
    .reset                          ( reset|fence_i             ),
    .addr                           (!wen2 ? waddr2 : raddr     ),
    .v_o                            ( v2                        ),
    .en                             ( rden[2]&wen2              ),
    .we                             ( wen2                      ),
    .v_i                            ( wv2                       )
);
ysyx_22041752_ICACHE_V U_YSYX_22041752_ICACHE_V_3(
    .clk                            ( clk                       ),
    .reset                          ( reset|fence_i             ),
    .addr                           (!wen3 ? waddr3 : raddr     ),
    .v_o                            ( v3                        ),
    .en                             ( rden[3]&wen3              ),
    .we                             ( wen3                      ),
    .v_i                            ( wv3                       )
);

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_ICACHE_RDU.v
// Author        : Cw
// Created On    : 2023-06-17 11:07
// Last Modified : 2023-06-27 17:13
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_ICACHE_RDU (
    input                                           inst_en        ,
    input  [`ysyx_22041752_PC_WD-1:0]               inst_addr      ,

    input                                           cmp_allowin    ,
    output                                          rs_to_cs_valid ,
    output [`ysyx_22041752_IRS_TO_ICS_BUS_WD-1:0]   rs_to_cs_bus   ,

    output [`ysyx_22041752_ICACHE_EN_WD     -1:0]   rden           ,
    output [                                 5:0]   raddr
);
    
wire [`ysyx_22041752_ICACHE_INDEX_WD -1:0] index ;

assign index = inst_addr[`ysyx_22041752_ICACHE_INDEX_WD+`ysyx_22041752_ICACHE_OFFSET_WD -1:`ysyx_22041752_ICACHE_OFFSET_WD];
assign rs_to_cs_bus = {inst_addr, ~rden};
assign rs_to_cs_valid = 1'b1;

assign rden[0] = !(inst_en && cmp_allowin && !index[`ysyx_22041752_ICACHE_INDEX_WD-1]);
assign rden[2] = !(inst_en && cmp_allowin && !index[`ysyx_22041752_ICACHE_INDEX_WD-1]);
assign rden[1] = !(inst_en && cmp_allowin &&  index[`ysyx_22041752_ICACHE_INDEX_WD-1]);
assign rden[3] = !(inst_en && cmp_allowin &&  index[`ysyx_22041752_ICACHE_INDEX_WD-1]);

assign raddr = index[5:0];

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_ICACHE_CMP.v
// Author        : Cw
// Created On    : 2023-06-17 11:07
// Last Modified : 2023-07-24 12:16
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------

module ysyx_22041752_ICACHE_CMP (
    input  clk    ,
    input  reset  ,
    input  flush  ,

    output                                       cmp_allowin    ,
    input                                        rs_to_cs_valid ,
    input  [`ysyx_22041752_IRS_TO_ICS_BUS_WD-1:0]rs_to_cs_bus   ,

    input  [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  tag0           ,
    input  [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  tag1           ,
    input  [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  tag2           ,
    input  [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  tag3           ,

    input  [128                           -1:0]  data0          ,
    input  [128                           -1:0]  data1          ,
    input  [128                           -1:0]  data2          ,
    input  [128                           -1:0]  data3          ,

    input  [`ysyx_22041752_ICACHE_EN_WD   -1:0]  valid          ,
    output [`ysyx_22041752_ICACHE_EN_WD   -1:0]  wen            ,

    output [128                           -1:0]  bwen0          ,
    output [128                           -1:0]  wdata0         ,
    output [                               5:0]  waddr0         ,
    output [128                           -1:0]  bwen1          ,
    output [128                           -1:0]  wdata1         ,
    output [                               5:0]  waddr1         ,
    output [128                           -1:0]  bwen2          ,
    output [128                           -1:0]  wdata2         ,
    output [                               5:0]  waddr2         ,
    output [128                           -1:0]  bwen3          ,
    output [128                           -1:0]  wdata3         ,
    output [                               5:0]  waddr3         ,
    output [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  wtag0          ,
    output [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  wtag1          ,
    output [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  wtag2          ,
    output [`ysyx_22041752_ICACHE_TAG_WD  -1:0]  wtag3          ,
    output                                       wv0            ,
    output                                       wv1            ,
    output                                       wv2            ,
    output                                       wv3            ,

    output [`ysyx_22041752_INST_WD        -1:0]  inst_rdata     ,
    output                                       cache_miss     ,

    output                                       sram_req       ,
    input                                        sram_ready     ,
    output [`ysyx_22041752_DATA_ADDR_WD   -1:0]  sram_addr      ,
    input  [`ysyx_22041752_DATA_DATA_WD   -1:0]  sram_rdata     ,
    input                                        sram_valid     
);
    
wire cs_ready_go;
reg  cs_valid   ;
always @(posedge clk) begin
    if (reset) begin
        cs_valid <= 1'b0;
    end
    else if (cmp_allowin) begin
        cs_valid <= rs_to_cs_valid;
    end
end

reg [`ysyx_22041752_IRS_TO_ICS_BUS_WD-1:0] rs_to_cs_bus_r;
always @(posedge clk) begin
    if (reset) begin
        rs_to_cs_bus_r <= 0;
    end
    else if (rs_to_cs_valid && cmp_allowin) begin
        rs_to_cs_bus_r <= rs_to_cs_bus;
    end
end

wire [`ysyx_22041752_ICACHE_OFFSET_WD-1:0] offset_cs;
wire [`ysyx_22041752_ICACHE_TAG_WD   -1:0] tag_cs   ;
wire [`ysyx_22041752_ICACHE_INDEX_WD -1:0] index_cs ;
wire [`ysyx_22041752_ICACHE_EN_WD    -1:0] rden_cs  ;
assign {tag_cs, index_cs, offset_cs, rden_cs} = rs_to_cs_bus_r;

wire hit_w0 = missfsm_pre==IDLE && (rden_cs[0]&valid[0] && tag0==tag_cs ||
                                    rden_cs[1]&valid[1] && tag1==tag_cs );

wire hit_w1 = missfsm_pre==IDLE && (rden_cs[2]&valid[2] && tag2==tag_cs ||
                                    rden_cs[3]&valid[3] && tag3==tag_cs );

wire [127:0] hit_line = hit_w0 ? rden_cs[0] ? data0 : data1 :
                                 rden_cs[2] ? data2 : data3 ;


assign cache_miss = |rden_cs && cs_valid && !(hit_w0 || hit_w1 || missfsm_pre==GET_1);

reg  [3:0] missfsm_pre;
wire [3:0] missfsm_nxt;
parameter IDLE         =0;

parameter REQUEST_0    =1;
parameter RESPONSE_0   =2;
parameter GET_0        =3;
parameter DROP_REQ_0   =4;
parameter DROP_RESP_0  =5;
parameter DROPED_0     =6;

parameter REQUEST_1    =7;
parameter RESPONSE_1   =8;
parameter GET_1        =9;
parameter DROP_REQ_1   =10;
parameter DROP_RESP_1  =11;
parameter DROPED_1     =12;

always @(posedge clk) begin
    if (reset) begin
        missfsm_pre <= IDLE;
    end
    else begin
        missfsm_pre <= missfsm_nxt;
    end
end

assign missfsm_nxt = missfsm_pre==IDLE          && !flush && cache_miss ? REQUEST_0    :
                     missfsm_pre==REQUEST_0     && !flush && sram_ready ? RESPONSE_0   :
                     missfsm_pre==REQUEST_0     &&  flush &&!sram_ready ? DROP_REQ_0   :
                     missfsm_pre==REQUEST_0     &&  flush && sram_ready ? DROP_RESP_0  :
                     missfsm_pre==RESPONSE_0    && !flush && sram_valid ? GET_0        :
                     missfsm_pre==RESPONSE_0    &&  flush &&!sram_valid ? DROP_RESP_0  :
                     missfsm_pre==RESPONSE_0    &&  flush && sram_valid ? DROPED_0     :
                     missfsm_pre==GET_0         && !flush               ? REQUEST_1    :         
                     missfsm_pre==GET_0         &&  flush               ? DROP_REQ_1   :         
                     missfsm_pre==REQUEST_1     && !flush && sram_ready ? RESPONSE_1   :
                     missfsm_pre==REQUEST_1     &&  flush &&!sram_ready ? DROP_REQ_1   :
                     missfsm_pre==REQUEST_1     &&  flush && sram_ready ? DROP_RESP_1  :
                     missfsm_pre==RESPONSE_1    && !flush && sram_valid ? GET_1        :
                     missfsm_pre==RESPONSE_1    &&  flush &&!sram_valid ? DROP_RESP_1  :
                     missfsm_pre==RESPONSE_1    &&  flush && sram_valid ? DROPED_1     :
                     missfsm_pre==GET_1                                 ? IDLE         :
                     missfsm_pre==DROP_REQ_0    &&           sram_ready ? DROP_RESP_0  :
                     missfsm_pre==DROP_RESP_0   &&           sram_valid ? DROPED_0     :
                     missfsm_pre==DROPED_0                              ? DROP_REQ_1   :
                     missfsm_pre==DROP_REQ_1    &&           sram_ready ? DROP_RESP_1  :
                     missfsm_pre==DROP_RESP_1   &&           sram_valid ? DROPED_1     :
                     missfsm_pre==DROPED_1                              ? IDLE         :
                                                                          missfsm_pre;

wire [`ysyx_22041752_PC_WD-1 :0] inst_addr_cs = {tag_cs, index_cs, offset_cs};
assign sram_req = (missfsm_pre==REQUEST_0 || missfsm_pre==REQUEST_1 || missfsm_pre==DROP_REQ_0 || missfsm_pre==DROP_REQ_1) && !sram_ready;
assign sram_addr= (missfsm_pre==REQUEST_0 || missfsm_pre==DROP_REQ_0) ? {inst_addr_cs[`ysyx_22041752_PC_WD-1:4], 4'b0000} : {inst_addr_cs[`ysyx_22041752_PC_WD-1:4], 4'b1000};

reg [`ysyx_22041752_DATA_DATA_WD-1:0] line_lower;
always @(posedge clk) begin
    if (reset) begin
        line_lower <= 0;
    end
    else if(missfsm_nxt==GET_0) begin
        line_lower <= sram_rdata;
    end
end
reg [`ysyx_22041752_DATA_DATA_WD-1:0] line_upper;
always @(posedge clk) begin
    if (reset) begin
        line_upper <= 0;
    end
    else if(missfsm_nxt==GET_1) begin
        line_upper <= sram_rdata;
    end
end

wire [127:0] new_line = {line_upper, line_lower}; 

assign inst_rdata = missfsm_pre == GET_1 ?
                    offset_cs[`ysyx_22041752_ICACHE_OFFSET_WD-1:2] == 0 ? new_line[ 31: 0] : 
                    offset_cs[`ysyx_22041752_ICACHE_OFFSET_WD-1:2] == 1 ? new_line[ 63:32] : 
                    offset_cs[`ysyx_22041752_ICACHE_OFFSET_WD-1:2] == 2 ? new_line[ 95:64] : 
               /* offset_cs[`ysyx_22041752_ICACHE_OFFSET_WD-1:2] == 3 ?*/ new_line[127:96] 
                                        :
                    offset_cs[`ysyx_22041752_ICACHE_OFFSET_WD-1:2] == 0 ? hit_line[ 31: 0] : 
                    offset_cs[`ysyx_22041752_ICACHE_OFFSET_WD-1:2] == 1 ? hit_line[ 63:32] : 
                    offset_cs[`ysyx_22041752_ICACHE_OFFSET_WD-1:2] == 2 ? hit_line[ 95:64] : 
               /* offset_cs[`ysyx_22041752_ICACHE_OFFSET_WD-1:2] == 3 ?*/ hit_line[127:96] ;

reg replace;
always @(posedge clk) begin
    if (reset) begin
        replace <= 0;
    end
    else begin
        replace <= ~replace;
    end
end

assign wen[0] = ~(missfsm_nxt==GET_1 && rden_cs[0] && replace==0) ;
assign wen[1] = ~(missfsm_nxt==GET_1 && rden_cs[1] && replace==0) ;
assign wen[2] = ~(missfsm_nxt==GET_1 && rden_cs[2] && replace==1) ;
assign wen[3] = ~(missfsm_nxt==GET_1 && rden_cs[3] && replace==1) ;

assign bwen0  = 0;
assign bwen1  = 0;
assign bwen2  = 0;
assign bwen3  = 0;

assign wdata0 = {sram_rdata, line_lower};
assign wdata1 = {sram_rdata, line_lower};
assign wdata2 = {sram_rdata, line_lower};
assign wdata3 = {sram_rdata, line_lower};

assign wtag0  = tag_cs;
assign wtag1  = tag_cs;
assign wtag2  = tag_cs;
assign wtag3  = tag_cs;

assign wv0  = 1'b1;
assign wv1  = 1'b1;
assign wv2  = 1'b1;
assign wv3  = 1'b1;

assign waddr0 = index_cs[5:0];
assign waddr1 = index_cs[5:0];
assign waddr2 = index_cs[5:0];
assign waddr3 = index_cs[5:0];

assign cmp_allowin = !cs_valid || cs_ready_go;
assign cs_ready_go = missfsm_pre==IDLE && !cache_miss || missfsm_pre==GET_1 || missfsm_pre==DROPED_1;

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_ICACHE_TAG.v
// Author        : Cw
// Created On    : 2023-07-17 17:09
// Last Modified : 2023-07-24 12:18
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_ICACHE_TAG (
    input clk       ,
    input reset     ,

    input  [5:0]                              addr,
    input                                     en  ,
    input                                     wen ,
    input  [`ysyx_22041752_ICACHE_TAG_WD-1:0] in  ,
    output reg [`ysyx_22041752_ICACHE_TAG_WD-1:0] out
);
    
reg [`ysyx_22041752_ICACHE_TAG_WD-1:0] tag [63:0];

genvar i;
generate
    for (i = 0; i < 64; i=i+1) begin
        :Write_Regs
        always @(posedge clk) begin
            if (reset) begin
                tag[i] <= 0;
            end
            else if(!wen && !en && (addr == i))
                tag[i] <= in;
        end
    end
endgenerate

always @(posedge clk) begin
    if (reset) begin
        out <= 0;
    end
    else if(!en && wen) begin
        out <= tag[addr];
    end
end

endmodule
// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_ICACHE_V.v
// Author        : Cw
// Created On    : 2023-06-17 16:46
// Last Modified : 2023-07-24 12:17
// ---------------------------------------------------------------------------------
// Description   : valid table for cache
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_ICACHE_V (
    input  clk  ,
    input  reset,

    input  [5:0] addr ,
    output reg   v_o  ,
    input        en   ,
    input        we   ,
    input        v_i
);
    
reg [63:0] valid;

genvar i;
generate
    for (i = 0; i < 64; i=i+1) begin
        :Write_Regs
        always @(posedge clk) begin
            if (reset) begin
                valid[i] <= 0;
            end
            else if(!we && !en && (addr == i))
                valid[i] <= v_i;
        end
    end
endgenerate

always @(posedge clk) begin
    if (reset) begin
        v_o <= 0;
    end
    else if(!en && we) begin
        v_o <= valid[addr];
    end
end
endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_DCACHE.v
// Author        : Cw
// Created On    : 2023-06-17 10:29
// Last Modified : 2023-07-17 17:32
// ---------------------------------------------------------------------------------
// Description   : 4-way set associative cache
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_DCACHE(
    input  clk       ,
    input  reset     ,
    input  fence_i   ,
    output fence_over,

    input                                    data_en         ,
    input  [`ysyx_22041752_DATA_WEN_WD -1:0] data_wen        ,
    input  [`ysyx_22041752_DATA_ADDR_WD-1:0] data_addr       ,
    input  [`ysyx_22041752_DATA_DATA_WD-1:0] data_wdata      ,
    output [`ysyx_22041752_DATA_DATA_WD-1:0] data_rdata      ,
    output                                   cache_miss      ,
    output                                   write_hit       ,

    output                                   sram_req        ,
    input                                    sram_ready      ,
    output [`ysyx_22041752_DATA_WEN_WD -1:0] sram_wen        ,
    output [`ysyx_22041752_DATA_ADDR_WD-1:0] sram_addr       ,
    output [`ysyx_22041752_DATA_DATA_WD-1:0] sram_wdata      ,
    input  [`ysyx_22041752_DATA_DATA_WD-1:0] sram_rdata      ,
    input                                    sram_valid      ,

    output [  5:0]                           io_sram4_addr   ,
    output                                   io_sram4_cen    ,
    output                                   io_sram4_wen    ,
    output [127:0]                           io_sram4_wmask  ,
    output [127:0]                           io_sram4_wdata  ,
    input  [127:0]                           io_sram4_rdata  ,
    output [  5:0]                           io_sram5_addr   ,
    output                                   io_sram5_cen    ,
    output                                   io_sram5_wen    ,
    output [127:0]                           io_sram5_wmask  ,
    output [127:0]                           io_sram5_wdata  ,
    input  [127:0]                           io_sram5_rdata  ,
    output [  5:0]                           io_sram6_addr   ,
    output                                   io_sram6_cen    ,
    output                                   io_sram6_wen    ,
    output [127:0]                           io_sram6_wmask  ,
    output [127:0]                           io_sram6_wdata  ,
    input  [127:0]                           io_sram6_rdata  ,
    output [  5:0]                           io_sram7_addr   ,
    output                                   io_sram7_cen    ,
    output                                   io_sram7_wen    ,
    output [127:0]                           io_sram7_wmask  ,
    output [127:0]                           io_sram7_wdata  ,
    input  [127:0]                           io_sram7_rdata  
);
    
wire [`ysyx_22041752_DCACHE_EN_WD     -1:0] rden           ;
wire [                                 5:0] raddr          ;
wire                                        cmp_allowin    ;
wire                                        rs_to_cs_valid ;
wire [`ysyx_22041752_DRS_TO_DCS_BUS_WD-1:0] rs_to_cs_bus   ;

ysyx_22041752_DCACHE_RDU U_DCACHE_RDU_0(
    .clk                            ( clk                           ), 
    .reset                          ( reset                         ), 
    .fence_i                        ( fence_i                       ),
    .data_en                        ( data_en                       ),
    .data_wen                       ( data_wen                      ),
    .data_addr                      ( data_addr                     ),
    .data_wdata                     ( data_wdata                    ),
    .cmp_allowin                    ( cmp_allowin                   ),
    .rs_to_cs_valid                 ( rs_to_cs_valid                ),
    .rs_to_cs_bus                   ( rs_to_cs_bus                  ),
    .rden                           ( rden                          ),
    .raddr                          ( raddr                         )
);

wire [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  tag0 ;
wire [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  tag1 ;
wire [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  tag2 ;
wire [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  tag3 ;
wire [128                           -1:0]  data0;
wire [128                           -1:0]  data1;
wire [128                           -1:0]  data2;
wire [128                           -1:0]  data3;
wire                                       v0   ;
wire                                       v1   ;
wire                                       v2   ;
wire                                       v3   ;
wire                                       d0   ;
wire                                       d1   ;
wire                                       d2   ;
wire                                       d3   ;
wire                                       wen0 ;
wire                                       wen1 ;
wire                                       wen2 ;
wire                                       wen3 ;
wire [128                           -1:0]  bwen0;
wire [128                           -1:0]  bwen1;
wire [128                           -1:0]  bwen2;
wire [128                           -1:0]  bwen3;
wire [128                           -1:0]  wdata0;         
wire [128                           -1:0]  wdata1;         
wire [128                           -1:0]  wdata2;         
wire [128                           -1:0]  wdata3;         
wire [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  wtag0 ;
wire [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  wtag1 ;
wire [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  wtag2 ;
wire [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  wtag3 ;
wire                                       wv0   ;
wire                                       wv1   ;
wire                                       wv2   ;
wire                                       wv3   ;
wire                                       wd0   ;
wire                                       wd1   ;
wire                                       wd2   ;
wire                                       wd3   ;
wire [                               5:0]  waddr0;
wire [                               5:0]  waddr1;
wire [                               5:0]  waddr2;
wire [                               5:0]  waddr3;

ysyx_22041752_DCACHE_CMP U_DCACHE_CMP_0(
    .clk            ( clk                   ),
    .reset          ( reset                 ),

    .cmp_allowin    ( cmp_allowin           ),
    .rs_to_cs_valid ( rs_to_cs_valid        ),
    .rs_to_cs_bus   ( rs_to_cs_bus          ),

    .tag0           ( tag0                  ),
    .tag1           ( tag1                  ),
    .tag2           ( tag2                  ),
    .tag3           ( tag3                  ),

    .data0          ( data0                 ),
    .data1          ( data1                 ),
    .data2          ( data2                 ),
    .data3          ( data3                 ),

    .valid          ( {v3,v2,v1,v0}         ),
    .dirty          ( {d3,d2,d1,d0}         ),
    .wen            ( {wen3,wen2,wen1,wen0} ),

    .bwen0          ( bwen0                 ),
    .wdata0         ( wdata0                ),
    .waddr0         ( waddr0                ),
    .bwen1          ( bwen1                 ),
    .wdata1         ( wdata1                ),
    .waddr1         ( waddr1                ),
    .bwen2          ( bwen2                 ),
    .wdata2         ( wdata2                ),
    .waddr2         ( waddr2                ),
    .bwen3          ( bwen3                 ),
    .wdata3         ( wdata3                ),
    .waddr3         ( waddr3                ),
    .wtag0          ( wtag0                 ),
    .wtag1          ( wtag1                 ),
    .wtag2          ( wtag2                 ),
    .wtag3          ( wtag3                 ),
    .wv0            ( wv0                   ),
    .wv1            ( wv1                   ),
    .wv2            ( wv2                   ),
    .wv3            ( wv3                   ),
    .wd0            ( wd0                   ),
    .wd1            ( wd1                   ),
    .wd2            ( wd2                   ),
    .wd3            ( wd3                   ),

    .data_rdata     ( data_rdata            ),
    .cache_miss     ( cache_miss            ),
    .write_hit      ( write_hit             ),
    .fence_over     ( fence_over            ),

    .sram_req       ( sram_req              ),
    .sram_ready     ( sram_ready            ),
    .sram_wen       ( sram_wen              ),
    .sram_addr      ( sram_addr             ),
    .sram_wdata     ( sram_wdata            ),
    .sram_rdata     ( sram_rdata            ),
    .sram_valid     ( sram_valid            )
);

// the first way data
assign data0          = io_sram4_rdata;
assign io_sram4_cen   = rden[0]&wen0;
assign io_sram4_wen   = wen0;
assign io_sram4_wmask = bwen0;
assign io_sram4_addr  = !wen0 ? waddr0 : raddr;
assign io_sram4_wdata = wdata0;

// the first way tag
ysyx_22041752_DCACHE_TAG U_DCACHE_TAG_0(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .addr                           (!wen0 ? waddr0 : raddr         ),
    .en                             ( rden[0]&wen0                  ),
    .wen                            ( wen0                          ),
    .in                             ( wtag0                         ),
    .out                            ( tag0                          )
);

// the first way valid 
ysyx_22041752_DCACHE_VD U_DCACHE_V_0(
    .clk                            ( clk                       ),
    .reset                          ( reset                     ),
    .addr                           (!wen0 ? waddr0 : raddr     ),
    .o                              ( v0                        ),
    .en                             ( rden[0]&wen0              ),
    .we                             ( wen0                      ),
    .in                             ( wv0                       )
);

// the first way dirty
ysyx_22041752_DCACHE_VD U_DCACHE_D_0(
    .clk                            ( clk                       ),
    .reset                          ( reset                     ),
    .addr                           (!wen0 ? waddr0 : raddr     ),
    .o                              ( d0                        ),
    .en                             ( rden[0]&wen0              ),
    .we                             ( wen0                      ),
    .in                             ( wd0                       )
);

// the second way data
assign data1          = io_sram5_rdata;
assign io_sram5_cen   = rden[1]&wen1;
assign io_sram5_wen   = wen1;
assign io_sram5_wmask = bwen1;
assign io_sram5_addr  = !wen1 ? waddr1 : raddr;
assign io_sram5_wdata = wdata1;

// the second way tag
ysyx_22041752_DCACHE_TAG U_DCACHE_TAG_1(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .addr                           (!wen1 ? waddr1 : raddr         ),
    .en                             ( rden[1]&wen1                  ),
    .wen                            ( wen1                          ),
    .in                             ( wtag1                         ),
    .out                            ( tag1                          )
);

// the second way valid
ysyx_22041752_DCACHE_VD U_DCACHE_V_1(
    .clk                            ( clk                       ),
    .reset                          ( reset                     ),
    .addr                           (!wen1 ? waddr1 : raddr     ),
    .o                              ( v1                        ),
    .en                             ( rden[1]&wen1              ),
    .we                             ( wen1                      ),
    .in                             ( wv1                       )
);

// the second way dirty
ysyx_22041752_DCACHE_VD U_DCACHE_D_1(
    .clk                            ( clk                       ),
    .reset                          ( reset                     ),
    .addr                           (!wen1 ? waddr1 : raddr     ),
    .o                              ( d1                        ),
    .en                             ( rden[1]&wen1              ),
    .we                             ( wen1                      ),
    .in                             ( wd1                       )
);

// the third way data
assign data2          = io_sram6_rdata;
assign io_sram6_cen   = rden[2]&wen2;
assign io_sram6_wen   = wen2;
assign io_sram6_wmask = bwen2;
assign io_sram6_addr  = !wen2 ? waddr2 : raddr;
assign io_sram6_wdata = wdata2;

// the third way tag
ysyx_22041752_DCACHE_TAG U_DCACHE_TAG_2(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .addr                           (!wen2 ? waddr2 : raddr         ),
    .en                             ( rden[2]&wen2                  ),
    .wen                            ( wen2                          ),
    .in                             ( wtag2                         ),
    .out                            ( tag2                          )
);

// the third way valid 
ysyx_22041752_DCACHE_VD U_DCACHE_V_2(
    .clk                            ( clk                       ),
    .reset                          ( reset                     ),
    .addr                           (!wen2 ? waddr2 : raddr     ),
    .o                              ( v2                        ),
    .en                             ( rden[2]&wen2              ),
    .we                             ( wen2                      ),
    .in                             ( wv2                       )
);

// the third way dirty
ysyx_22041752_DCACHE_VD U_DCACHE_D_2(
    .clk                            ( clk                       ),
    .reset                          ( reset                     ),
    .addr                           (!wen2 ? waddr2 : raddr     ),
    .o                              ( d2                        ),
    .en                             ( rden[2]&wen2              ),
    .we                             ( wen2                      ),
    .in                             ( wd2                       )
);

// the fourth way data
assign data3          = io_sram7_rdata;
assign io_sram7_cen   = rden[3]&wen3;
assign io_sram7_wen   = wen3;
assign io_sram7_wmask = bwen3;
assign io_sram7_addr  = !wen3 ? waddr3 : raddr;
assign io_sram7_wdata = wdata3;

// the fourth way tag
ysyx_22041752_DCACHE_TAG U_DCACHE_TAG_3(
    .clk                            ( clk                           ),
    .reset                          ( reset                         ),
    .addr                           (!wen3 ? waddr3 : raddr         ),
    .en                             ( rden[3]&wen3                  ),
    .wen                            ( wen3                          ),
    .in                             ( wtag3                         ),
    .out                            ( tag3                          )
);

// the fourth way valid 
ysyx_22041752_DCACHE_VD U_DCACHE_V_3(
    .clk                            ( clk                       ),
    .reset                          ( reset                     ),
    .addr                           (!wen3 ? waddr3 : raddr     ),
    .o                              ( v3                        ),
    .en                             ( rden[3]&wen3              ),
    .we                             ( wen3                      ),
    .in                             ( wv3                       )
);

// the fourth way dirty
ysyx_22041752_DCACHE_VD U_DCACHE_D_3(
    .clk                            ( clk                       ),
    .reset                          ( reset                     ),
    .addr                           (!wen3 ? waddr3 : raddr     ),
    .o                              ( d3                        ),
    .en                             ( rden[3]&wen3              ),
    .we                             ( wen3                      ),
    .in                             ( wd3                       )
);
endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_DCACHE_RDU.v
// Author        : Cw
// Created On    : 2023-06-17 11:07
// Last Modified : 2023-07-17 18:47
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_DCACHE_RDU (
    input   clk         ,
    input   reset       ,
    input   fence_i     ,

    input                                    data_en    ,
    input  [`ysyx_22041752_DATA_WEN_WD -1:0] data_wen   ,
    input  [`ysyx_22041752_DATA_ADDR_WD-1:0] data_addr  ,
    input  [`ysyx_22041752_DATA_DATA_WD-1:0] data_wdata ,

    input                                         cmp_allowin    ,
    output                                        rs_to_cs_valid ,
    output [`ysyx_22041752_DRS_TO_DCS_BUS_WD-1:0] rs_to_cs_bus   ,

    output [`ysyx_22041752_DCACHE_EN_WD     -1:0] rden           ,
    output [                                 5:0] raddr
);
    
wire [`ysyx_22041752_DCACHE_INDEX_WD -1:0] index ;
wire [`ysyx_22041752_DCACHE_TAG_WD   -1:0] tag   ;
wire [`ysyx_22041752_ICACHE_OFFSET_WD-1:0] offset;

assign {tag, index, offset} = data_addr;

reg fence_i_r;
always @(posedge clk) begin
    if (reset) begin
        fence_i_r <= 0;
    end
    else begin
        fence_i_r <= fence_i;
    end
end
wire fence_i_rising = fence_i && !fence_i_r;

reg  [`ysyx_22041752_DCACHE_INDEX_WD :0] fence_cnt;
wire [`ysyx_22041752_DCACHE_INDEX_WD :0] fence_addr=fence_cnt-1;
wire fence_to_mem = fence_cnt!=0;
wire fence_last   = fence_cnt==1;
assign rs_to_cs_bus = {tag, raddr, offset, data_wdata, data_wen, ~rden, fence_to_mem, fence_last};
assign rs_to_cs_valid = 1'b1;

always @(posedge clk) begin
    if (reset) begin
        fence_cnt <= 0;
    end
    else if (fence_i_rising) begin
        fence_cnt <= 64;//`ysyx_22041752_DCACHE_LINE_PERWAY;
    end
    else if(fence_cnt!=0 && cmp_allowin) begin
        fence_cnt <= fence_addr;
    end
end

assign rden[0] = !((fence_cnt!=0 || data_en) && cmp_allowin);
assign rden[2] = !((fence_cnt!=0 || data_en) && cmp_allowin);
assign rden[1] = !((fence_cnt!=0 || data_en) && cmp_allowin);
assign rden[3] = !((fence_cnt!=0 || data_en) && cmp_allowin);
assign raddr = fence_cnt!=0 ? fence_addr[`ysyx_22041752_DCACHE_INDEX_WD-1:0]: index;

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_DCACHE_CMP.v
// Author        : Cw
// Created On    : 2023-06-17 11:07
// Last Modified : 2023-07-24 12:25
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_DCACHE_CMP (
    input  clk      ,
    input  reset    ,

    output                                         cmp_allowin    ,
    input                                          rs_to_cs_valid ,
    input  [`ysyx_22041752_DRS_TO_DCS_BUS_WD-1:0]  rs_to_cs_bus   ,

    input  [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  tag0           ,
    input  [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  tag1           ,
    input  [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  tag2           ,
    input  [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  tag3           ,

    input  [128                           -1:0]  data0          ,
    input  [128                           -1:0]  data1          ,
    input  [128                           -1:0]  data2          ,
    input  [128                           -1:0]  data3          ,

    input  [`ysyx_22041752_DCACHE_EN_WD   -1:0]  valid          ,
    input  [`ysyx_22041752_DCACHE_EN_WD   -1:0]  dirty          ,
    output [`ysyx_22041752_DCACHE_EN_WD   -1:0]  wen            ,

    output [128                           -1:0]  bwen0          ,
    output [128                           -1:0]  wdata0         ,
    output [                               5:0]  waddr0         ,
    output [128                           -1:0]  bwen1          ,
    output [128                           -1:0]  wdata1         ,
    output [                               5:0]  waddr1         ,
    output [128                           -1:0]  bwen2          ,
    output [128                           -1:0]  wdata2         ,
    output [                               5:0]  waddr2         ,
    output [128                           -1:0]  bwen3          ,
    output [128                           -1:0]  wdata3         ,
    output [                               5:0]  waddr3         ,
    output [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  wtag0          ,
    output [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  wtag1          ,
    output [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  wtag2          ,
    output [`ysyx_22041752_DCACHE_TAG_WD  -1:0]  wtag3          ,
    output                                       wv0            ,
    output                                       wv1            ,
    output                                       wv2            ,
    output                                       wv3            ,
    output                                       wd0            ,
    output                                       wd1            ,
    output                                       wd2            ,
    output                                       wd3            ,

    output [`ysyx_22041752_DATA_DATA_WD   -1:0]  data_rdata     ,
    output                                       cache_miss     ,
    output                                       write_hit      ,
    output                                       fence_over     ,

    output                                       sram_req       ,
    input                                        sram_ready     ,
    output [`ysyx_22041752_DATA_WEN_WD    -1:0]  sram_wen       ,
    output [`ysyx_22041752_DATA_ADDR_WD   -1:0]  sram_addr      ,
    output [`ysyx_22041752_DATA_DATA_WD   -1:0]  sram_wdata     ,
    input  [`ysyx_22041752_DATA_DATA_WD   -1:0]  sram_rdata     ,
    input                                        sram_valid     
);
    
wire cs_ready_go;
reg  cs_valid   ;
always @(posedge clk) begin
    if (reset) begin
        cs_valid <= 1'b0;
    end
    else if (cmp_allowin) begin
        cs_valid <= rs_to_cs_valid;
    end
end

reg [`ysyx_22041752_DRS_TO_DCS_BUS_WD-1:0] rs_to_cs_bus_r;
always @(posedge clk) begin
    if (reset) begin
        rs_to_cs_bus_r <= 0;
    end
    else if (rs_to_cs_valid && cmp_allowin) begin
        rs_to_cs_bus_r <= rs_to_cs_bus;
    end
end

reg  [3:0] missfsm_pre;
wire [3:0] missfsm_nxt;
parameter IDLE         = 0;
parameter MISS         = 1; 
parameter WRITE_REQ_0  = 2;
parameter WRITE_RESP_0 = 3;
parameter WRITE_DONE_0 = 4;
parameter WRITE_REQ_1  = 5;
parameter WRITE_RESP_1 = 6;
parameter WRITE_DONE_1 = 7;
parameter READ_REQ_0   = 8;
parameter READ_RESP_0  = 9;
parameter READ_DONE_0  =10;
parameter READ_REQ_1   =11;
parameter READ_RESP_1  =12;
parameter READ_DONE_1  =13;

wire [`ysyx_22041752_ICACHE_OFFSET_WD-1:0] offset_cs    ;
wire [`ysyx_22041752_DCACHE_TAG_WD   -1:0] tag_cs       ;
wire [`ysyx_22041752_DCACHE_INDEX_WD -1:0] index_cs     ;
wire [`ysyx_22041752_DCACHE_EN_WD    -1:0] rden_cs      ;
wire [`ysyx_22041752_DATA_DATA_WD    -1:0] data_wdata   ;
wire [`ysyx_22041752_DATA_WEN_WD     -1:0] data_wen     ;
wire                                       fence_to_mem ;
wire                                       fence_last   ;
assign {tag_cs, index_cs, offset_cs, data_wdata, data_wen, rden_cs, fence_to_mem, fence_last} = rs_to_cs_bus_r;

wire hit_w0 = !fence_to_mem && missfsm_pre==IDLE && (rden_cs[0]&valid[0] && tag0==tag_cs);
wire hit_w1 = !fence_to_mem && missfsm_pre==IDLE && (rden_cs[1]&valid[1] && tag1==tag_cs);
wire hit_w2 = !fence_to_mem && missfsm_pre==IDLE && (rden_cs[2]&valid[2] && tag2==tag_cs);
wire hit_w3 = !fence_to_mem && missfsm_pre==IDLE && (rden_cs[3]&valid[3] && tag3==tag_cs);

wire [127:0] hit_line = {128{hit_w0}} & data0 | 
                        {128{hit_w1}} & data1 |
                        {128{hit_w2}} & data2 |
                        {128{hit_w3}} & data3 ;

assign write_hit = (hit_w0||hit_w1||hit_w2||hit_w3) && data_wen!=0;

assign cache_miss = !fence_to_mem && |rden_cs && cs_valid && !(hit_w0 || hit_w1 || hit_w2 || hit_w3 || missfsm_pre==READ_DONE_1);
wire   miss_write = cache_miss &&|data_wen;
wire   miss_read  = cache_miss &&!miss_write;


always @(posedge clk) begin
    if (reset) begin
        missfsm_pre <= IDLE;
    end
    else begin
        missfsm_pre <= missfsm_nxt;
    end
end

reg[1:0] random;
always @(posedge clk) begin
    if (reset) begin
        random <= 0;
    end
    else begin
        random <= random+1;
    end
end
reg [1:0] replace;
always @(posedge clk) begin
    if (reset) begin
        replace <= 0;
    end
    else if(missfsm_nxt==MISS) begin
        casez (valid)
            4'b???0: begin
                replace <= 0;
            end
            4'b??01: begin
                replace <= 1;
            end
            4'b?011: begin
                replace <= 2;
            end
            4'b0111: begin
                replace <= 3;
            end
            default: begin
                replace <= random;
            end
        endcase
    end
end

assign missfsm_nxt =(missfsm_pre==IDLE||missfsm_pre==READ_DONE_1) &&  cache_miss     ? MISS         :
                     missfsm_pre==MISS                            &&  dirty[replace] ? WRITE_REQ_0  :
                     missfsm_pre==MISS                            && !dirty[replace] ? READ_REQ_0   :
                     missfsm_pre==WRITE_REQ_0                     &&  sram_ready     ? WRITE_RESP_0 :
                     missfsm_pre==WRITE_RESP_0                    &&  sram_valid     ? WRITE_DONE_0 :
                     missfsm_pre==WRITE_DONE_0                                       ? WRITE_REQ_1  :
                     missfsm_pre==WRITE_REQ_1                     &&  sram_ready     ? WRITE_RESP_1 :
                     missfsm_pre==WRITE_RESP_1                    &&  sram_valid     ? WRITE_DONE_1 :
                     missfsm_pre==WRITE_DONE_1                                       ? READ_REQ_0   :
                     missfsm_pre==READ_REQ_0                      &&  sram_ready     ? READ_RESP_0  :
                     missfsm_pre==READ_RESP_0                     &&  sram_valid     ? READ_DONE_0  :
                     missfsm_pre==READ_DONE_0                                        ? READ_REQ_1   :
                     missfsm_pre==READ_REQ_1                      &&  sram_ready     ? READ_RESP_1  :
                     missfsm_pre==READ_RESP_1                     &&  sram_valid     ? READ_DONE_1  :
                     missfsm_pre==READ_DONE_1                                        ? IDLE         :
                                                                                       missfsm_pre  ;

parameter PRE_FENCE  = 1; 
parameter WAY0_REQ0  = 2;
parameter WAY0_RESP0 = 3;
parameter WAY0_DONE0 = 4;
parameter WAY0_REQ1  = 5;
parameter WAY0_RESP1 = 6;
parameter WAY0_DONE1 = 7;
parameter WAY1_REQ0  = 8;
parameter WAY1_RESP0 = 9;
parameter WAY1_DONE0 =10;
parameter WAY1_REQ1  =11;
parameter WAY1_RESP1 =12;
parameter WAY1_DONE1 =13;
parameter WAY2_REQ0  =14;
parameter WAY2_RESP0 =15;
parameter WAY2_DONE0 =16;
parameter WAY2_REQ1  =17;
parameter WAY2_RESP1 =18;
parameter WAY2_DONE1 =19;
parameter WAY3_REQ0  =20;
parameter WAY3_RESP0 =21;
parameter WAY3_DONE0 =22;
parameter WAY3_REQ1  =23;
parameter WAY3_RESP1 =24;
parameter WAY3_DONE1 =25;

reg  [4:0] fencefsm_pre;
wire [4:0] fencefsm_nxt;
always @(posedge clk) begin
    if (reset) begin
        fencefsm_pre <= IDLE;
    end
    else begin
        fencefsm_pre <= fencefsm_nxt;
    end
end
assign fencefsm_nxt =  fencefsm_pre==IDLE                              && fence_to_mem        ? PRE_FENCE      :
                       fencefsm_pre==PRE_FENCE                         && valid[0]&dirty[0]   ? WAY0_REQ0      :
                       fencefsm_pre==PRE_FENCE                         && valid[1]&dirty[1]   ? WAY1_REQ0      :
                       fencefsm_pre==PRE_FENCE                         && valid[2]&dirty[2]   ? WAY2_REQ0      :
                       fencefsm_pre==PRE_FENCE                         && valid[3]&dirty[3]   ? WAY3_REQ0      :
                       fencefsm_pre==PRE_FENCE                                                ? WAY3_DONE1     :

                       fencefsm_pre==WAY0_REQ0                         && sram_ready          ? WAY0_RESP0     :
                       fencefsm_pre==WAY0_RESP0                        && sram_valid          ? WAY0_DONE0     :
                       fencefsm_pre==WAY0_DONE0                                               ? WAY0_REQ1      :
                       fencefsm_pre==WAY0_REQ1                         && sram_ready          ? WAY0_RESP1     :
                       fencefsm_pre==WAY0_RESP1                        && sram_valid          ? WAY0_DONE1     :
                       fencefsm_pre==WAY0_DONE1                        && valid[1]&dirty[1]   ? WAY1_REQ0      :
                       fencefsm_pre==WAY0_DONE1                        && valid[2]&dirty[2]   ? WAY2_REQ0      :
                       fencefsm_pre==WAY0_DONE1                        && valid[3]&dirty[3]   ? WAY3_REQ0      :
                       fencefsm_pre==WAY0_DONE1                                               ? WAY3_DONE1     :

                       fencefsm_pre==WAY1_REQ0                         && sram_ready          ? WAY1_RESP0     :
                       fencefsm_pre==WAY1_RESP0                        && sram_valid          ? WAY1_DONE0     :
                       fencefsm_pre==WAY1_DONE0                                               ? WAY1_REQ1      :
                       fencefsm_pre==WAY1_REQ1                         && sram_ready          ? WAY1_RESP1     :
                       fencefsm_pre==WAY1_RESP1                        && sram_valid          ? WAY1_DONE1     :
                       fencefsm_pre==WAY1_DONE1                        && valid[2]&dirty[2]   ? WAY2_REQ0      :
                       fencefsm_pre==WAY1_DONE1                        && valid[3]&dirty[3]   ? WAY3_REQ0      :
                       fencefsm_pre==WAY1_DONE1                                               ? WAY3_DONE1     :

                       fencefsm_pre==WAY2_REQ0                         && sram_ready          ? WAY2_RESP0     :
                       fencefsm_pre==WAY2_RESP0                        && sram_valid          ? WAY2_DONE0     :
                       fencefsm_pre==WAY2_DONE0                                               ? WAY2_REQ1      :
                       fencefsm_pre==WAY2_REQ1                         && sram_ready          ? WAY2_RESP1     :
                       fencefsm_pre==WAY2_RESP1                        && sram_valid          ? WAY2_DONE1     :
                       fencefsm_pre==WAY2_DONE1                        && valid[3]&dirty[3]   ? WAY3_REQ0      :
                       fencefsm_pre==WAY2_DONE1                                               ? WAY3_DONE1     :
                       
                       fencefsm_pre==WAY3_REQ0                         && sram_ready          ? WAY3_RESP0     :
                       fencefsm_pre==WAY3_RESP0                        && sram_valid          ? WAY3_DONE0     :
                       fencefsm_pre==WAY3_DONE0                                               ? WAY3_REQ1      :
                       fencefsm_pre==WAY3_REQ1                         && sram_ready          ? WAY3_RESP1     :
                       fencefsm_pre==WAY3_RESP1                        && sram_valid          ? WAY3_DONE1     :
                       fencefsm_pre==WAY3_DONE1                                               ? IDLE           :
                                                                                                fencefsm_pre   ;
assign fence_over = fence_to_mem && fence_last && fencefsm_pre==WAY3_DONE1;

wire [`ysyx_22041752_PC_WD-1 :0] data_addr_cs = {tag_cs, index_cs, offset_cs};

reg [127:0] data0_r;
always @(posedge clk) begin
    if (reset) begin
        data0_r <= 0;
    end
    else if(missfsm_nxt==MISS || fencefsm_nxt==PRE_FENCE) begin
        data0_r <= data0;
    end
end
reg [127:0] data1_r;
always @(posedge clk) begin
    if (reset) begin
        data1_r <= 0;
    end
    else if(missfsm_nxt==MISS || fencefsm_nxt==PRE_FENCE) begin
        data1_r <= data1;
    end
end
reg [127:0] data2_r;
always @(posedge clk) begin
    if (reset) begin
        data2_r <= 0;
    end
    else if(missfsm_nxt==MISS || fencefsm_nxt==PRE_FENCE) begin
        data2_r <= data2;
    end
end
reg [127:0] data3_r;
always @(posedge clk) begin
    if (reset) begin
        data3_r <= 0;
    end
    else if(missfsm_nxt==MISS || fencefsm_nxt==PRE_FENCE) begin
        data3_r <= data3;
    end
end

wire [`ysyx_22041752_DCACHE_TAG_WD  -1:0] tag = {`ysyx_22041752_DCACHE_TAG_WD{replace==0}} & tag0 |
                                                {`ysyx_22041752_DCACHE_TAG_WD{replace==1}} & tag1 |
                                                {`ysyx_22041752_DCACHE_TAG_WD{replace==2}} & tag2 |
                                                {`ysyx_22041752_DCACHE_TAG_WD{replace==3}} & tag3 ;
wire [`ysyx_22041752_PC_WD-1 :0] replace_addr = {tag, index_cs, offset_cs};

assign sram_req = (missfsm_pre ==WRITE_REQ_0 || missfsm_pre ==WRITE_REQ_1 || 
                   missfsm_pre ==READ_REQ_0  || missfsm_pre ==READ_REQ_1  ||
                   fencefsm_pre==WAY0_REQ0   || fencefsm_pre==WAY0_REQ1   ||
                   fencefsm_pre==WAY1_REQ0   || fencefsm_pre==WAY1_REQ1   ||
                   fencefsm_pre==WAY2_REQ0   || fencefsm_pre==WAY2_REQ1   ||
                   fencefsm_pre==WAY3_REQ0   || fencefsm_pre==WAY3_REQ1   ) && !sram_ready;
assign sram_addr= {`ysyx_22041752_DATA_ADDR_WD{missfsm_pre ==READ_REQ_0 }} & {data_addr_cs[`ysyx_22041752_DATA_ADDR_WD-1:4], 4'b0000} |
                  {`ysyx_22041752_DATA_ADDR_WD{missfsm_pre ==READ_REQ_1 }} & {data_addr_cs[`ysyx_22041752_DATA_ADDR_WD-1:4], 4'b1000} |
                  {`ysyx_22041752_DATA_ADDR_WD{missfsm_pre ==WRITE_REQ_0}} & {replace_addr[`ysyx_22041752_DATA_ADDR_WD-1:4], 4'b0000} |
                  {`ysyx_22041752_DATA_ADDR_WD{missfsm_pre ==WRITE_REQ_1}} & {replace_addr[`ysyx_22041752_DATA_ADDR_WD-1:4], 4'b1000} |
                  {`ysyx_22041752_DATA_ADDR_WD{fencefsm_pre==WAY0_REQ0}}   & {tag0, index_cs, 4'b0000} |
                  {`ysyx_22041752_DATA_ADDR_WD{fencefsm_pre==WAY1_REQ0}}   & {tag1, index_cs, 4'b0000} |
                  {`ysyx_22041752_DATA_ADDR_WD{fencefsm_pre==WAY2_REQ0}}   & {tag2, index_cs, 4'b0000} |
                  {`ysyx_22041752_DATA_ADDR_WD{fencefsm_pre==WAY3_REQ0}}   & {tag3, index_cs, 4'b0000} |
                  {`ysyx_22041752_DATA_ADDR_WD{fencefsm_pre==WAY0_REQ1}}   & {tag0, index_cs, 4'b1000} |
                  {`ysyx_22041752_DATA_ADDR_WD{fencefsm_pre==WAY1_REQ1}}   & {tag1, index_cs, 4'b1000} |
                  {`ysyx_22041752_DATA_ADDR_WD{fencefsm_pre==WAY2_REQ1}}   & {tag2, index_cs, 4'b1000} |
                  {`ysyx_22041752_DATA_ADDR_WD{fencefsm_pre==WAY3_REQ1}}   & {tag3, index_cs, 4'b1000} ;
                  
assign sram_wen   = {8{(missfsm_pre==WRITE_REQ_0 || missfsm_pre==WRITE_REQ_1 ||
                        fencefsm_pre==WAY0_REQ0  ||
                        fencefsm_pre==WAY1_REQ0  ||
                        fencefsm_pre==WAY2_REQ0  ||
                        fencefsm_pre==WAY3_REQ0  ||
                        fencefsm_pre==WAY0_REQ1  ||
                        fencefsm_pre==WAY1_REQ1  ||
                        fencefsm_pre==WAY2_REQ1  ||
                        fencefsm_pre==WAY3_REQ1  )}};

wire [127:0] writeback = {128{replace==0}} & data0_r |
                         {128{replace==1}} & data1_r |
                         {128{replace==2}} & data2_r |
                         {128{replace==3}} & data3_r ;
assign sram_wdata = {`ysyx_22041752_DATA_DATA_WD{missfsm_pre==WRITE_REQ_0}} & writeback[ 63: 0]  |
                    {`ysyx_22041752_DATA_DATA_WD{missfsm_pre==WRITE_REQ_1}} & writeback[127:64]  |
                    {`ysyx_22041752_DATA_DATA_WD{fencefsm_pre==WAY0_REQ0}}  & data0_r  [ 63: 0]  |
                    {`ysyx_22041752_DATA_DATA_WD{fencefsm_pre==WAY1_REQ0}}  & data1_r  [ 63: 0]  |
                    {`ysyx_22041752_DATA_DATA_WD{fencefsm_pre==WAY2_REQ0}}  & data2_r  [ 63: 0]  |
                    {`ysyx_22041752_DATA_DATA_WD{fencefsm_pre==WAY3_REQ0}}  & data3_r  [ 63: 0]  |
                    {`ysyx_22041752_DATA_DATA_WD{fencefsm_pre==WAY0_REQ1}}  & data0_r  [127:64]  |
                    {`ysyx_22041752_DATA_DATA_WD{fencefsm_pre==WAY1_REQ1}}  & data1_r  [127:64]  |
                    {`ysyx_22041752_DATA_DATA_WD{fencefsm_pre==WAY2_REQ1}}  & data2_r  [127:64]  |
                    {`ysyx_22041752_DATA_DATA_WD{fencefsm_pre==WAY3_REQ1}}  & data3_r  [127:64]  ;

reg [`ysyx_22041752_DATA_DATA_WD-1:0] line_lower;
always @(posedge clk) begin
    if (reset) begin
        line_lower <= 0;
    end
    else if(missfsm_nxt==READ_DONE_0) begin
        line_lower <= sram_rdata;
    end
end
reg [`ysyx_22041752_DATA_DATA_WD-1:0] line_upper;
always @(posedge clk) begin
    if (reset) begin
        line_upper <= 0;
    end
    else if(missfsm_nxt==READ_DONE_1) begin
        line_upper <= sram_rdata;
    end
end

wire [127:0] new_line = {line_upper, line_lower}; 

assign data_rdata = missfsm_pre == READ_DONE_1 ?
                    offset_cs[`ysyx_22041752_DCACHE_OFFSET_WD-1] ? new_line[127:64] : 
                                                                   new_line[ 63: 0]
                                               :
                    offset_cs[`ysyx_22041752_DCACHE_OFFSET_WD-1] ? hit_line[127:64] : 
                                                                   hit_line[ 63: 0] ;

assign wen[0] = ~(missfsm_nxt==READ_DONE_1 && replace==0 || write_hit && hit_w0 || fencefsm_nxt==WAY0_DONE1) ;
assign wen[1] = ~(missfsm_nxt==READ_DONE_1 && replace==1 || write_hit && hit_w1 || fencefsm_nxt==WAY1_DONE1) ;
assign wen[2] = ~(missfsm_nxt==READ_DONE_1 && replace==2 || write_hit && hit_w2 || fencefsm_nxt==WAY2_DONE1) ;
assign wen[3] = ~(missfsm_nxt==READ_DONE_1 && replace==3 || write_hit && hit_w3 || fencefsm_nxt==WAY3_DONE1) ;

wire [7:0] data_wen_bits [`ysyx_22041752_DATA_WEN_WD-1:0];
genvar i;
generate
    for (i = 0; i < `ysyx_22041752_DATA_WEN_WD; i=i+1) begin
        : DATA_WEN_BITS
        assign data_wen_bits[i] = {8{data_wen[i]}};
    end
endgenerate
wire [63:0] data_wen_bits64 = {data_wen_bits[7],
                               data_wen_bits[6], 
                               data_wen_bits[5], 
                               data_wen_bits[4], 
                               data_wen_bits[3], 
                               data_wen_bits[2], 
                               data_wen_bits[1], 
                               data_wen_bits[0]
                              };

assign bwen0  = ~(missfsm_nxt==READ_DONE_1 && replace==0 ? {128{1'b1}} : offset_cs[`ysyx_22041752_DCACHE_OFFSET_WD-1] ? {data_wen_bits64,64'b0} : {64'b0,data_wen_bits64});
assign bwen1  = ~(missfsm_nxt==READ_DONE_1 && replace==1 ? {128{1'b1}} : offset_cs[`ysyx_22041752_DCACHE_OFFSET_WD-1] ? {data_wen_bits64,64'b0} : {64'b0,data_wen_bits64});
assign bwen2  = ~(missfsm_nxt==READ_DONE_1 && replace==2 ? {128{1'b1}} : offset_cs[`ysyx_22041752_DCACHE_OFFSET_WD-1] ? {data_wen_bits64,64'b0} : {64'b0,data_wen_bits64});
assign bwen3  = ~(missfsm_nxt==READ_DONE_1 && replace==3 ? {128{1'b1}} : offset_cs[`ysyx_22041752_DCACHE_OFFSET_WD-1] ? {data_wen_bits64,64'b0} : {64'b0,data_wen_bits64});

reg [127:0] write_newline; 
always @(*) begin
    if (offset_cs[`ysyx_22041752_DCACHE_OFFSET_WD-1]) begin
        write_newline = {(sram_rdata& ~data_wen_bits64) | (data_wen_bits64&data_wdata),line_lower};
    end
    else begin
        write_newline = {sram_rdata,(line_lower& ~data_wen_bits64)|(data_wen_bits64&data_wdata)};
    end
end

assign wdata0 = write_hit ? {2{data_wdata}} : miss_read ? {sram_rdata, line_lower} : write_newline;
assign wdata1 = write_hit ? {2{data_wdata}} : miss_read ? {sram_rdata, line_lower} : write_newline;
assign wdata2 = write_hit ? {2{data_wdata}} : miss_read ? {sram_rdata, line_lower} : write_newline;
assign wdata3 = write_hit ? {2{data_wdata}} : miss_read ? {sram_rdata, line_lower} : write_newline;

assign wtag0  = tag_cs;
assign wtag1  = tag_cs;
assign wtag2  = tag_cs;
assign wtag3  = tag_cs;

assign wv0  = fencefsm_nxt!=WAY0_DONE1;
assign wv1  = fencefsm_nxt!=WAY1_DONE1;
assign wv2  = fencefsm_nxt!=WAY2_DONE1;
assign wv3  = fencefsm_nxt!=WAY3_DONE1;

assign wd0  = write_hit || miss_write;
assign wd1  = write_hit || miss_write;
assign wd2  = write_hit || miss_write;
assign wd3  = write_hit || miss_write;

assign waddr0 = index_cs;
assign waddr1 = index_cs;
assign waddr2 = index_cs;
assign waddr3 = index_cs;

assign cmp_allowin = !cs_valid || cs_ready_go;
assign cs_ready_go = missfsm_pre==IDLE && !cache_miss   && !fence_to_mem || missfsm_pre==READ_DONE_1 ||
                     fencefsm_pre==IDLE&& !fence_to_mem && !cache_miss   || fencefsm_pre==WAY3_DONE1;

endmodule

// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_DCACHE_TAG.v
// Author        : Cw
// Created On    : 2023-07-17 17:09
// Last Modified : 2023-07-24 12:18
// ---------------------------------------------------------------------------------
// Description   : 
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_DCACHE_TAG (
    input clk       ,
    input reset     ,

    input  [5:0]                              addr,
    input                                     en  ,
    input                                     wen ,
    input  [`ysyx_22041752_DCACHE_TAG_WD-1:0] in  ,
    output reg [`ysyx_22041752_DCACHE_TAG_WD-1:0] out
);
    
reg [`ysyx_22041752_DCACHE_TAG_WD-1:0] tag [63:0];

genvar i;
generate
    for (i = 0; i < 64; i=i+1) begin
        :Write_Regs
        always @(posedge clk) begin
            if (reset) begin
                tag[i] <= 0;
            end
            else if(!wen && !en && (addr == i))
                tag[i] <= in;
        end
    end
endgenerate

always @(posedge clk) begin
    if (reset) begin
        out <= 0;
    end
    else if(!en && wen) begin
        out <= tag[addr];
    end
end

endmodule
// +FHDR----------------------------------------------------------------------------
//                 Copyright (c) 2023 
//                       ALL RIGHTS RESERVED
// ---------------------------------------------------------------------------------
// Filename      : ysyx_22041752_DCACHE_VD.v
// Author        : Cw
// Created On    : 2023-06-17 16:46
// Last Modified : 2023-07-24 12:18
// ---------------------------------------------------------------------------------
// Description   : valid/dirty table for cache
//
//
// -FHDR----------------------------------------------------------------------------
module ysyx_22041752_DCACHE_VD (
    input  clk  ,
    input  reset,

    input  [5:0] addr ,
    output reg   o    ,
    input        en   ,
    input        we   ,
    input        in
);
    
reg [63:0] dat;

genvar i;
generate
    for (i = 0; i < 64; i=i+1) begin
        :Write_Regs
        always @(posedge clk) begin
            if (reset) begin
                dat[i] <= 0;
            end
            else if(!we && !en && (addr == i))
                dat[i] <= in;
        end
    end
endgenerate

always @(posedge clk) begin
    if (reset) begin
        o <= 0;
    end
    else if(!en && we) begin
        o <= dat[addr];
    end
end

endmodule

