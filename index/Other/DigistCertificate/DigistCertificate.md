# DigistCertificate

## 

```plantuml
Client -> Server: hello
Server -> Client: hello
Server -> Client: 服务器数字证(包含公钥)
Client -> Client: 验证 证书的 合法性（说明公钥是服务器的）
Client -> Server: 发送 随机字符串（证明你是服务器）
Server --> Client: 将得到的随机字符串 用私钥加密
Client -> Client: 得到的密文用公钥解密（验证就是刚才发出去的随机字符串）
Client -> Client: 生成对称秘钥，用公钥加密。
Client -> Server: 私钥解密，得到对称密码。


```