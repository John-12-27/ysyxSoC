# Warning汇总

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5788:20: Signal is not used: 'io_interrupt'
* **不清理原因：** 未实现外部中断，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5790:20: Signal is not used: 'io_slave_awvalid'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5791:20: Signal is not used: 'io_slave_awid'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5792:20: Signal is not used: 'io_slave_awaddr'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5793:20: Signal is not used: 'io_slave_awlen'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5794:20: Signal is not used: 'io_slave_awsize'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5795:20: Signal is not used: 'io_slave_awburst'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5797:20: Signal is not used: 'io_slave_wvalid'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5798:20: Signal is not used: 'io_slave_wdata'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5799:20: Signal is not used: 'io_slave_wstrb'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5800:20: Signal is not used: 'io_slave_wlast'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5801:20: Signal is not used: 'io_slave_bready'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5806:20: Signal is not used: 'io_slave_arvalid'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5807:20: Signal is not used: 'io_slave_arid'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5808:20: Signal is not used: 'io_slave_araddr'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5809:20: Signal is not used: 'io_slave_arlen'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5810:20: Signal is not used: 'io_slave_arsize'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5811:20: Signal is not used: 'io_slave_arburst'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5812:20: Signal is not used: 'io_slave_rready'
* **不清理原因：** 未实现从端AXI接口，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:2640:13: Bits of signal are not used: 'mem_addr'[63:32]
* **不清理原因：** 加法器计算得到的结果作为访存地址，访存总线的地址位宽只有32位，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:3373:13: Signal is not used: 'h_cout'
* **不清理原因：** 加法器进位输出，不使用该信号
* **备注：** 无


### Warning-UNUSED
* **描述：** ysyx_22041752.v:3498:19: Signal is not used: 'rresp'
* **不清理原因：** 仅实现了AXI接口的基础功能，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:3499:19: Signal is not used: 'rlast'
* **不清理原因：** 仅实现了AXI接口的基础功能，不支持突发传输，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:3517:19: Signal is not used: 'bid'
* **不清理原因：** icache只会读RAM，不存在写入的情况，此信号返回的一定是dcache的写入应答信息，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:3518:19: Signal is not used: 'bresp'
* **不清理原因：** 仅实现了AXI接口的基础功能，因此不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:2173:14: Bits of signal are not used: 'r_sra'[127:64]
* **不清理原因：** 移位指令实现时丢弃的高位
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:4309:16:  Bits of signal are not used: 'inst_addr_cs'[3:0] 
* **不清理原因：** icache向RAM取指令的地址，1个cacheline的大小为16字节，不使用该信号的低4位
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5135:16:  Bits of signal are not used: 'data_addr_cs'[3:0] 
* **不清理原因：** dcache向RAM读数据的地址，1个cacheline的大小为16字节，不使用该信号的低4位
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:5178:16:  Bits of signal are not used: 'replace_addr'[3:0] 
* **不清理原因：** dcache向RAM写入被替换数据的地址，1个cacheline的大小为16字节，不使用该信号的低4位
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:1689:24:  Bits of signal are not used: 'saved_c'[127]
* **不清理原因：** 华莱士树乘法器生成的最高位进位信号，因保留进位信号需移位后再与部分和相加，故不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:1700:16:  Bits of signal are not used: 'booth_c_r'[32]
* **不清理原因：** 乘法器中booth2编码单元生成的最高为输出信号，被乘数是在符号扩展后才输入到booth2编码单元的，扩展后的信号的最高3位是相同的，所以booth_c的最高位一定是0，故不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:1930:6:  Signal is not used: 'cout00' 
* **不清理原因：** 除法器中例化的加法器的进位输出信号，不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:1930:14:  Signal is not used: 'cout01' 
* **不清理原因：** 除法器中例化的加法器的进位输出信号，不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:1930:22:  Signal is not used: 'cout10' 
* **不清理原因：** 除法器中例化的加法器的进位输出信号，不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:1930:30:  Signal is not used: 'cout11' 
* **不清理原因：** 除法器中例化的加法器的进位输出信号，不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:1994:6:  Signal is not used: 'cout20' 
* **不清理原因：** 除法器中例化的加法器的进位输出信号，不使用该信号
* **备注：** 无

### Warning-UNUSED
* **描述：** ysyx_22041752.v:1994:14:  Signal is not used: 'cout21' 
* **不清理原因：** 除法器中例化的加法器的进位输出信号，不使用该信号
* **备注：** 无
