

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



①解封装(Demuxing)：就是将输入的封装格式的数据，分离成为音频流压缩编码数据和视频流压缩编码数据。封装格式种类很多，例如MP4，MKV，RMVB，TS，FLV，AVI等等，它的作用就是将已经压缩编码的视频数据和音频数据按照一定的格式放到一起。例如，FLV格式的数据，经过解封装操作后，输出H.264编码的视频码流和AAC编码的音频码流。

②解码(Decode)：就是将视频/音频压缩编码数据，解码成为非压缩的视频/音频原始数据。音频的压缩编码标准包含AAC，MP3等，视频的压缩编码标准则包含H.264，MPEG2等。解码是整个系统中最重要也是最复杂的一个环节。通过解码，压缩编码的视频数据输出成为非压缩的颜色数据，例如YUV、RGB等等；压缩编码的音频数据输出成为非压缩的音频抽样数据，例如PCM数据。

③音视频同步：就是根据解封装模块处理过程中获取到的参数信息，同步解码出来的音频和视频数据，并将音视频频数据送至系统的显卡和声卡播放出来(Render)。