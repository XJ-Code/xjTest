# AFNetworkingHelper

A very simple wrapper over the most amazing networking library for objective C, AFNetworking. We extensively use it inside RC and it is actively being updated. Unless you know what you are using, I recommend not to use it unless we clearstrike this warning.

[![CI Status](http://img.shields.io/travis/RainingClouds/AFNetworkingHelper.svg?style=flat)](https://travis-ci.org/Akshay Deo/AFNetworkingHelper)
[![Version](https://img.shields.io/cocoapods/v/AFNetworkingHelper.svg?style=flat)](http://cocoadocs.org/docsets/AFNetworkingHelper)
[![License](https://img.shields.io/cocoapods/l/AFNetworkingHelper.svg?style=flat)](http://cocoadocs.org/docsets/AFNetworkingHelper)
[![Platform](https://img.shields.io/cocoapods/p/AFNetworkingHelper.svg?style=flat)](http://cocoadocs.org/docsets/AFNetworkingHelper)

## Whats added ?

We have added most commonly used HttpMethods with MBProgressHUD in a very simple format so as reduce the redundant code. You can consider it as a boilerplate code which you have to write when you're using AFNetworking inside your app.

Currently supported methods

1. DELETE
2. POST with multipart form data
3. POST with Authorization Headers
4. POST
5. GET
6. PATCH
7. PUT

```objective-c
+ (void) executeDeleteWithUrl:(NSString *)url AndParameters:(NSDictionary *)parameters AndHeaders:(NSDictionary *)headers withSuccessHandler:(void (^)(AFHTTPRequestOperation *, id, bool))success withFailureHandler:(void (^)(AFHTTPRequestOperation *, NSError *))failure withLoadingViewOn:(UIView *)parentView;

+ (void)executePostWithUrl:(NSString *)url andParameters:(NSDictionary *)parameters andHeaders:(NSDictionary *)headers constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block withSuccessHandler:(void (^)(AFHTTPRequestOperation *, id, bool))success withFailureHandler:(void (^)(AFHTTPRequestOperation *, NSError *))failure withLoadingViewOn:(UIView *)parentView;

+ (void)executePostWithUrl:(NSString *)url andParameters:(NSDictionary *)parameters andHeaders:(NSDictionary *)headers withSuccessHandler:(void (^)(AFHTTPRequestOperation *, id, bool))success withFailureHandler:(void (^)(AFHTTPRequestOperation *, NSError *))failure withLoadingViewOn:(UIView *)parentView;

+ (void)executePostWithUrl:(NSString *)url andParameters:(NSDictionary *)parameters andHeaders:(NSDictionary *)headers andAuthorizationHeaderUser:(NSString *)user andAuthrozationHeaderPassword:(NSString *)password withSuccessHandler:(void (^)(AFHTTPRequestOperation *, id, bool))success withFailureHandler:(void (^)(AFHTTPRequestOperation *, NSError *))failure withLoadingViewOn:(UIView *)parentView;

+ (void)executePutWithUrl:(NSString *)url andParameters:(NSDictionary *)parameters andHeaders:(NSDictionary *)headers withSuccessHandler:(void (^)(AFHTTPRequestOperation *, id, bool))success withFailureHandler:(void (^)(AFHTTPRequestOperation *, NSError *))failure withLoadingViewOn:(UIView *)parentView;

+ (void)executeGetWithUrl:(NSString *)url andParameters:(NSDictionary *)parameters andHeaders:(NSDictionary *)headers withSuccessHandler:(void (^)(AFHTTPRequestOperation *, id, bool))success withFailureHandler:(void (^)(AFHTTPRequestOperation *, NSError *))failure withLoadingViewOn:(UIView *)parentView;

+ (void)executePatchWithUrl:(NSString *)url andParameters:(NSDictionary *)parameters andHeaders:(NSDictionary *)headers withSuccessHandler:(void (^)(AFHTTPRequestOperation *, id, bool))success withFailureHandler:(void (^)(AFHTTPRequestOperation *, NSError *))failure withLoadingViewOn:(UIView *)parentView;
```

## Requirements

## Installation

AFNetworkingHelper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "AFNetworkingHelper"

## Coder

Akshay Deo, akshay@rainingclouds.com

## License

Copyright (c) 2014 Akshay Deo <akshay@rainingclouds.com>

Copyright (c) 2014 RainingClouds Technologies Private Limited

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


