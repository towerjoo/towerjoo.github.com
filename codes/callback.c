#include<stdio.h>

// use typedef to ease the declaration
typedef int (*pNotifyChange)(int nProgress);

// the callback function, which should match the 
// the signature of the callback function, i.e 
// pNotifyChange here
int onNotify(int nProgress){
    printf("Current progress: %d\n", nProgress);
    return 1;
}

// the caller which will consume the callback
int download(pNotifyChange notify){
    int i = 0;
    int step = 20;
    for (; i <= 100; i += step){
        notify(i);  // callback is called here
    }
}

// main entry point
int main(){
    pNotifyChange notify = onNotify;
    download(notify);
    return 0;
}
