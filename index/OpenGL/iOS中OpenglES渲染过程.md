

1. 生成framebuffer, 生成renderbuffer, 并与Framebuffer关联一起
 * glGenFramebuffers, 创建帧缓冲.
 * glGenRenderbuffers,创建渲染缓冲.
 * glFramebufferRenderbuffer将Renderbuffer关联到相应的Framebuffer上.

 2. CAEAGLLayer对象
 如果要使输出画面只依赖OpenGLES渲染输出的图像,则要创建一个CAEAGLLayer对象. 并将不透明性设为YES.

 3. 生成一个EAGLContext对象

     EAGLContext对象管理着渲染状态信息,命令和将被渲染的资源(An EAGLContext object manages the state information, commands, and resources needed to draw using OpenGL ES. ). 并且在将画面显示到context对象之前必须将一个framebuffer 绑定到此Context之上( To draw to an EAGL context, a complete framebuffer object must first be bound to the context. ) . 但找了许多资料也没看到如何将framebuffer与一个context绑定, 只看到将renderbuffer与context绑定的接口.


4. Framebuffer与CAEAGLLayer的关联

   在创建完以上三个对象后, 

a. 先调用EAGLContext的类方法前之前生成的EAGLContext对象设定为当前context.

b. 然后调用EAGLContext对象的renderbufferStorage接口函数, 为之前生成的CAEAGLLayer对象分配空间.

   (　按IOS的文档的说法是:　Allocate its storage by calling the context’s renderbufferStorage:fromDrawable: method, passing the layer object as the parameter. 

　The width, height and pixel format are taken from the layer and used to allocate storage for the renderbuffer.　)

c. 在渲染之前先用glBindFramebuffer, 将之前用glGenFramebuffers创建的帧缓冲绑定为当前的Framebuffer(绑定到context上？).

    这样一来之后的所有的渲染命令就是针对当前绑定的Framebuffer(也就是针对新创建的Framebuffer)了.

    可以参见:http://miaoshuanghe.blog.163.com/blog/static/140130476201052453756439/ 中对Framebuffer的描述.





