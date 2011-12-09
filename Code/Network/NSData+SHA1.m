//
//  NSString+MD5.m
//  RestKit
//
//  Created by Jeff Arena on 4/4/11.
//  Copyright 2011 Two Toasters
//  
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//  http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSData+SHA1.h"
#import "../Support/RKFixCategoryBug.h"

RK_FIX_CATEGORY_BUG(NSData_SHA1)

@implementation NSData (SHA1)

- (NSString*)SHA1 {
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(self.bytes, self.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

@end
