# GLSL

# pre
OpenGL Shading Language GLSL作为一种着色语言是纯粹的和GPU打交道的计算机语言。
因为GPU是多线程并行处理器，所以GLSL直接面向SIMD模型的多线程计算。
GLSL编写的着色器函数是对每个数据同时执行的。
每个顶点都会由顶点着色器中的算法处理，每个像素也都会由片段着色器中的算法处理。
因此，初学者在编写自己的着色器时，需要考虑到SIMD的并发特性，并用并行计算的思路来思考问题。

# 数据类型

### 标量
* float 
* int 
* bool 

### 矢量
* vec2,  vec3,  vec4 // 包含2/3/4个浮点数的矢量
* ivec2, ivec3, ivec4 // 包含2/3/4个整数的矢量
* bvec2, bvec3, bvec4 // 包含2/3/4个布尔值的矢量

### 矩阵
* mat2, mat3, mat4 -- 2x2/3x3/4x4/的矩阵矩阵是按列顺序组织的，先列后行

### 取样器(Sampler)
纹理查找需要制定哪个纹理或者纹理单元将制定查找。
* sampler1D           访问一个一维纹理
* sampler2D           访问一个二维纹理           
* sampler3D           访问一个三维纹理
* samplerCube         访问一个立方贴图纹理
* sampler1DShadow     访问一个带对比的一维深度纹理
* sampler2DShadow     访问一个带对比的二维深度纹理 
```
uniform sampler2D grass;

vcc2 coord = vec2(100, 100);
vec4 color = texture2D(grass, coord);
```

### 结构体
这是唯一的用户定义类型
```
struct light  
{  
    vec3 position;  
    vec3 color;  
};  

light ceiling_light;
```

### 数组
数组索引是从0开始的，而且没有指针概念
```
// 创建一个10个元素的数组  
vec4 points[10];  
// 创建一个不指定大小的数组
vec4 points[]; 
points[2] = vec4(1.0);  // points现在大小为3
points[7] = vec4(2.0);  // points现在大小为8
```
### void
只能用于声明函数返回值

### 类型转换
必须明确地进行类型转换，不会自动类型提升
```
float f = 2.3; 
bool b = bool(f); 
```

### 限定符
* const
const和C++里差不多，定义不可变常量
表示限定的变量在编译时不可被修改

* attribute
attribute是应用程序传给顶点着色器用的

不允许声明时初始化
attribute限定符标记的是一种全局变量,该变量在顶点着色器中是只读（read-only）的，该变量被用作从OpenGL应用程序向顶点着色器中传递参数，_因此该限定符仅能用于顶点着色器_。

* uniform
unifrom一般是应用程序用于设定顶点着色器和片断着色器相关初始化值。

不允许声明时初始化
uniform限定符标记的是一种全局变量,该变量对于一个图元（primitive）来说是不可更改的 它可以从OpenGL应用程序中接收传递来的参数。

* varying
varying用于传递顶点着色器的值给片断着色器

不允许声明时初始化
它提供了从顶点着色器向片段着色器传递数据的方法，varying限定符可以在顶点着色器中定义变量，然后再传递给光栅化器，光栅化器对数据插值后，再将每个片段的值交给片段着色器。 