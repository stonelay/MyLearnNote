# mothod

## glUniform1i (GLint location, GLint x)
location 句柄
x 代表第几层
GLuint location = glGetUniformLocation(self.myProgram, "colorMap1");
glUniform1i(location, 1);

## glUniform2f (GLint location, GLint x, GLint y)
location 句柄
x y 为两个传入值

## active
确定 纹理和哪个 层绑定
glActiveTexture(GL_TEXTURE0);
glBindTexture(GL_TEXTURE_2D, myTexture);
