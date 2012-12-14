#include<stdio.h>


// the callback function, which should match the 
// the signature of the callback function, i.e 
// pNotifyChange here
int onNotify(int nProgress){
    printf("Current progress: %d\n", nProgress);
    return 1;
}

// Be careful with the signature of the parameter here
// which is a function pointer
int download(int (*notify)(int))
{
    int i = 0;
    int step = 20;
    for (; i <= 100; i += step){
        notify(i);  // callback is called
    }
}

int main(){
    int (*notify)(int) = onNotify;
    download(notify);
    return 0;
}
