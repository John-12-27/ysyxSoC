# Cache规格

### ICache
* data array大小：4KB
* tag array大小： 256 * 21b
* 一个块的tag和标志位大小：22b (tag:21b, valid:1b)
* 一个块的data大小：16B
* 相联度： 2
* 块总数： 256

### DCache
* data array大小：4KB
* tag array大小： 256 * 22b
* 一个块的tag和标志位大小：24b (tag:22b, valid:1b, dirty:1b)
* 一个块的data大小：16B
* 相联度： 4
* 块总数： 256
