

# Image

```plantuml
class GPUImageOutput

GPUImageOutput <-- GPUImageVideoCamera
GPUImageOutput <-- GPUImagePicture
GPUImageOutput <-- GPUImageMovie
GPUImageOutput <-- GPUImageTextureInput
GPUImageOutput <-- GPUImageRawDataInput
GPUImageOutput <-- GPUImageUIElement
GPUImageOutput <-- GPUImageFilter
GPUImageOutput <-- GPUImageFilterGroup

```

```plantuml
class GPUImageVideoCamera

GPUImageVideoCamera <-- GPUImageStillCamera
GPUImageMovie <-- GPUImageMovieComposition

```

```plantuml
class GPUImageFilter


```

```plantuml
class GPUImageFilterGroup


```