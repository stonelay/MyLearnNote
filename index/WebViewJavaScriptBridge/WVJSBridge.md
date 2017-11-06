### WebViewJavascriptBridge



```plantuml

@startuml

class WebViewJavascriptBridge {
    - id _webViewDelegate
    - webview *_webView
    - long _uniqueId
    - WebViewJavascriptBridgeBase *_base

    + registerHandler(handlerName String, handler WVJBHandler)
    + removeHandler(handlerName String)
    + callHandler(handlerName String, data id, responseCallback WVJBResponseCallback)
}

class WebViewJavascriptBridgeBase {
    - NSMutableArray *startupMessageQueue //当WebView未加载完毕时，缓存的操作
    - NSMutableArray *responseCallbacks // 原生调用JS 等待JS执行时，存放的callbacks 原生代码的block
    - NSMutableArray *messageHandlers // JS调用原生，原生注册的Handler

    - flushMessageQueue(messagequeueString String) // JS 执行完毕后 通知 原生执行_fetchQueue

}

WebViewJavascriptBridge --> WebViewJavascriptBridgeBase

Note "_evaluateJavascript" as N1
Note "messagingIframe.src = hasMessage" as N2

@enduml

```
### 原生调用JS
最终都是通过调用基础接口 _evaluateJavascript 实现的。

### JS调用原生
```
sendMessageQueue.push(message);
messagingIframe.src = CUSTOM_PROTOCOL_SCHEME + '://' + QUEUE_HAS_MESSAGE;
```
通过改变iframe 通知原生更改。然后原生在webview 截取
