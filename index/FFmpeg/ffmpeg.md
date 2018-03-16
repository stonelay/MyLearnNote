

## ffmpeg

### av_register_all()

* avcodec_register_all
注册编解码器有关的组件：硬件加速器，解码器，编码器，Parser，Bitstream Filter。
    - av_register_hwaccel 硬件加速器
    - avcodec_register 编解码器
    - av_register_codec_parser parser
    - av_register_bitstream_filter bit filter

* av_register_output_format
复用器

* av_register_input_format
解复用器

* ffurl_register_protocol
协议处理器


### avformat_alloc_context()

### avformat_open_input()

### av_find_stream_info()

### avcodec_find_decoder()

### avcodec_open()

### av_read_frame()


## av

AVFormatContext：统领全局的基本结构体。主要用于处理封装格式（FLV/MKV/RMVB等）。
AVIOContext：输入输出对应的结构体，用于输入输出（读写文件，RTMP协议等）。

AVStream，AVCodecContext：视音频流对应的结构体，用于视音频编解码。

AVFrame：存储非压缩的数据（视频对应RGB/YUV像素数据，音频对应PCM采样数据）

AVPacket：存储压缩数据（视频对应H.264等码流数据，音频对应AAC/MP3等码流数据）