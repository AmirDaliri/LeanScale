# Lean Scale
A sample project to show my experience.

### Installation
Run the following command to clone.

```bash
$ git clone https://github.com/AmirDaliri/LeanScale.git
$ cd LeanScale
$ open -a Xcode LeanScale.xcodeproj 
```

### Todos
- if it's possible run the app on real device and see app in dark mode easily. it's awesome 😎
- please for remove favorites use swipe to left, like the following screenshot.

<p align="center">
  <img src="https://raw.githubusercontent.com/AmirDaliri/LeanScale/master/imgs/Screen%20Shot%202020-07-02%20at%2002.52.31.png" width="300" title="hover text">
</p>

## Tech Detail & Architectural Detail

- MVC Design Pattern
- URLSession Network Layer
- Swift Codable to implement Data models
- StoryBoard and @IBOutlet to implement UI
- Encoding and Not Nil Unit Testing 
- CoreData to implement Fave tab and offline mode
- System Colors to implement Dark Mode
- Functional Parametric Comments.
- Atomic commits to clear changes.

#### some more detail
- I Chose MVC and StoryBoard because it was smal project and i could develop faster than other design pattern like MVVM.
- URLSession and Codable because in the test description wrote please don't use any libraries, and in fact, URLSession has better than any libraries like Alamofre because they are swift default methods and if developer writes good thread for Requests and implemented a network layer with this, it gonna be a good performance for iOS app. On the other hand i have good knowledge on implementing network layer and data models with any libraries.
- Implement fave tab and todo feature took me a long time
but it was my favorite part in this app.
- This Little app is ready for upload to store.
- Thanks For your attention.
