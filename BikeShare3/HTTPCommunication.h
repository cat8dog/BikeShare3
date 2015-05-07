#import <Foundation/Foundation.h>

@interface HTTPCommunication : NSObject<NSURLSessionDownloadDelegate>

//successBlock:


@property (copy, nonatomic) void (^successBlock)(NSData *);

// craft and request using NSURLRequest and NSURL Connection

-(void) retrieveURL:(NSURL *)url successBlock:(void (^)(NSData *))successBlock;

// Task has finished downloading delegate method

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location;

@end


