# AFNetworking

## NSURLConnection

```plantuml
class NSOperation

class AFURLConnectionOperation

class AFHTTPRequestOperation

NSOperation <|-- AFURLConnectionOperation
AFURLConnectionOperation <|-- AFHTTPRequestOperation
AFHTTPRequestOperationManager ..>  AFHTTPRequestOperation
```