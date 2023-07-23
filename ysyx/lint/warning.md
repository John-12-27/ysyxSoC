# Warning汇总

### Warning-UNUSED
* **描述：** ysyx_22041752.v:92:20: Signal is not used: 'io_interrupt'
* **不清理原因：** 未实现外部中断，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:94:20: Signal is not used: 'io_slave_awvalid'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:95:20: Signal is not used: 'io_slave_awid'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:96:20: Signal is not used: 'io_slave_awaddr'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:97:20: Signal is not used: 'io_slave_awlen'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:98:20: Signal is not used: 'io_slave_awsize'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:99:20: Signal is not used: 'io_slave_awburst'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:101:20: Signal is not used: 'io_slave_wvalid'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:102:20: Signal is not used: 'io_slave_wdata'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:103:20: Signal is not used: 'io_slave_wstrb'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:104:20: Signal is not used: 'io_slave_wlast'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:105:20: Signal is not used: 'io_slave_bready'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:110:20: Signal is not used: 'io_slave_arvalid'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:111:20: Signal is not used: 'io_slave_arid'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:112:20: Signal is not used: 'io_slave_araddr'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:113:20: Signal is not used: 'io_slave_arlen'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:114:20: Signal is not used: 'io_slave_arsize'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:115:20: Signal is not used: 'io_slave_arburst'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:116:20: Signal is not used: 'io_slave_rready'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:918:6: Signal is not used: 'count'
* **不清理原因：** 用于计算取指地址加法器的进位信号输出，不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:1922:13: Bits of signal are not used: 'mem_addr'[63:32]
* **不清理原因：** ALU计算得到的结果作为访存地址，访存总线的地址位宽只有32位，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:3491:19: Signal is not used: 'rresp'
* **不清理原因：** 仅实现了AXI接口的基础功能，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:3492:19: Signal is not used: 'rlast'
* **不清理原因：** 仅实现了AXI接口的基础功能，不支持突发传输，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:3510:19: Signal is not used: 'bid'
* **不清理原因：** icache只会读RAM，不存在写入的情况，此信号返回的一定是dcache的写入应答信息，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:3511:19: Signal is not used: 'bresp'
* **不清理原因：** 仅实现了AXI接口的基础功能，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:2122:14: Bits of signal are not used: 'r_sra'[127:64]
* **不清理原因：** 移位指令实现时丢弃的高位
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:2748:6: Signal is not used: 'count'
* **不清理原因：** 用于计算分支/跳转指令的目标地址的加法器的进位信号输出，不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:4598:16:  Bits of signal are not used: 'inst_addr_cs'[3:0] 
* **不清理原因：** icache向RAM取指令的地址，1个cacheline的大小为16字节，不使用该信号的低4位
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5490:16:  Bits of signal are not used: 'data_addr_cs'[3:0] 
* **不清理原因：** dcache向RAM读数据的地址，1个cacheline的大小为16字节，不使用该信号的低4位
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5533:16:  Bits of signal are not used: 'replace_addr'[3:0] 
* **不清理原因：** dcache向RAM写入被替换数据的地址，1个cacheline的大小为16字节，不使用该信号的低4位
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:2459:6:  Signal is not used: 'cout0' 
* **不清理原因：** 除法器中例化的加法器的进位输出信号，不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:2459:13:  Signal is not used: 'cout1' 
* **不清理原因：** 除法器中例化的加法器的进位输出信号，不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:2459:20:  Signal is not used: 'cout2' 
* **不清理原因：** 除法器中例化的加法器的进位输出信号，不使用该信号
* **备注：** 无
