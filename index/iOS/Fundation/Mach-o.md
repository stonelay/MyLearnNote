

# mach-o
mach-o格式是OS X系统上的可执行文件格式，类似于windows的PE与linux的ELF。
每个Mach-O文件斗包含一个Mach-O头，然后是载入命令(Load Commands),最后是数据块(Data)。

```
* The 32-bit mach header appears at the very beginning of the object file for
 * 32-bit architectures.
 */
 // 保存了Mach-O的一些基本信息，包括了平台、文件类型、LoadCommands的个数等等。
struct mach_header {
	uint32_t	magic;		// 魔数
	cpu_type_t	cputype;	    // 平台与版本
	cpu_subtype_t	cpusubtype;	
	uint32_t	filetype;	// 文件类型
	uint32_t	ncmds;		// command 个数
	uint32_t	sizeofcmds;	// command 长度
	uint32_t	flags;		// dyld加载时的标志位
};


#define	MH_MAGIC	0xfeedface	// 固定的
#define MH_CIGAM	0xcefaedfe	


 * The 64-bit mach header appears at the very beginning of object files for
 * 64-bit architectures.
 */
struct mach_header_64 {
	uint32_t	magic;		
	cpu_type_t	cputype;	
	cpu_subtype_t	cpusubtype;	
	uint32_t	filetype;	
	uint32_t	ncmds;		
	uint32_t	sizeofcmds;	
	uint32_t	flags;		
	uint32_t	reserved;	
};


#define MH_MAGIC_64 0xfeedfacf 
#define MH_CIGAM_64 0xcffaedfe 
```


