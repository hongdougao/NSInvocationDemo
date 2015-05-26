# NSInvocationDemo
InvocationSimpleUsage

在 iOS中可以直接调用某个对象的消息方式有两种：

一种是performSelector:withObject；

再一种就是NSInvocation。

第一种方式比较简单，能完成简单的调用。
但是对于>2个的参数或者有返回值的处理，那就需要做些额外工作才能搞定。那么在这种情况下，我们就可以使用NSInvocation来进行这些相对复杂的操作。
