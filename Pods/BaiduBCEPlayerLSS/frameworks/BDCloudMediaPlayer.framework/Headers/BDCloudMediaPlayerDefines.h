//
//  BDCloudMediaPlayerDefines.h
//  BDCloudMediaPlayer
//
//  Copyright © 2016年 Baidu. All rights reserved.
//

#import <Availability.h>

#ifdef __cplusplus
#define BDCLOUD_MP_EXTERN extern "C" __attribute__((visibility ("default")))
#else
#define BDCLOUD_MP_EXTERN extern __attribute__((visibility ("default")))
#endif
