#include<stdio.h>

typedef int (*pNotifyChange)(int nProgress);
// use struct to pass the additional parameters
// is a good way to go
typedef struct{
    pNotifyChange onNotify;
    int timeout;
}CallbackInfo;

int onNotify(int nProgress){
    printf("Current progress: %d\n", nProgress);
    return 1;
}

int download(CallbackInfo info){
    int i = 0;
    int step = 20;
    // check the timeout
    printf("time out is: %d\n", info.timeout);
    for (; i <= 100; i += step){
        info.onNotify(i);
    }
}

int main(){
    pNotifyChange notify = onNotify;
    CallbackInfo info;
    info.timeout =  100;
    info.onNotify = notify; 
    download(info);
    return 0;
}
