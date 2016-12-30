# MacStudyProject
###最近在公司项目需要转往mac开发，遇到了很多坑，而且网上关于mac学习的资料又太少了，所以就在github上面把自己学习过程中遇到的一些问题记录下来，希望能为以后学习mac开发的人节省一些填坑的时间。


####1、MacGroup@Member
######该demo是用来实现群组聊天中的@功能

####2、Mac_NSTextView(NSScrollView)
######该demo是用来手写NSTextView（放在NSScrollView中），这么写是因为在封装cell中，用Masonry布局时，提示NSTextView为弱引用，后来发现需要把它放在NSScrollView中才能引用

####3、Mac_WorkCircle(工作圈)
######该demo是仿照朋友圈，实现了图片查看器、动态计算cell高度
![image](https://github.com/pengwj/MacStudyProject/blob/master/Mac_WorkCircle/WorkCircle.gif) 

####4、Mac_NSScrollView
######纯代码写NSScrollView

####5、Mac_NSTextView
######计算含有富文本的NSTextView的高度（后来发现没这么复杂，可以使用它自带的方法计算，我这里是因为自定义表情是gif格式的，无法设置size，才只能出此下策）

####6、Mac_NSTextField
######用代码修改NSTextField的边框颜色