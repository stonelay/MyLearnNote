
# GPUImageFilter
1. 初始化OpenGL ES环境，编译、链接顶点着色器和片元着色器；
2. 缓存顶点、纹理坐标数据，传送图像数据到GPU；
3. 绘制图元到特定的帧缓存；

# GPUImageFramebuffer负责是第四步
4. 在帧缓存取出绘制的图像。
