# DZAppDelegate

Purpose: DZAppDelegate abstracts some of the commonly used tasks into a Subclass-protocol style implementation thereby making it easier and faster to get started on new projects.

The protocol defines the following 5 optional methods:

    - (NSDictionary *)appDefaults;
    - (void)setupAppearance;
    - (void)setupRouting;
    - (void)setupNetworking;
    - (void)setupRootController;
    
You can implement any of the above methods or all of them. They are invoked in the same order as they are listed. This seems logical, as:  
1. You would first load the standard defaults and set them up for probable future methods to work with.  
2. You would setup appearances on common views such as `UINavigationBar`, `UIButton` and so on.  
3. You would setup routing if your app can be invoked using URL schemes.  
4. Your networking stack setup if you require one.  
5. Your root controller:  
    - If you're using Storyboards, you need not implement this method at all or leave the implementation empty.   
    - If you're initializing View Controllers programatically, you'll also have to create the window as shown in the example.  
6. At the end of this process, if the window object exists and is not the key window, it's made so.  

Feel free to suggest newer commonly used methods, or fork and send a pull request.  
