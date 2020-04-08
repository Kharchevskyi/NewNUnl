# Modules

* BFF - Code that will be generated from BFF **1**

* NUCommon - some Common app functionality (Extensions). Just an example how modularisation can be

* NuUi - Module with all UI Elements

* Mapper - Pure function which map BFF business model to view representable model. Can be improved even more with separate module which will contain just ViewModels (see ViewModels folder)

* CardBoard - SingleView Application where all UI elements can be tested

* DI - Simple Dependency Injection Module (Better to use SwiftInject) or create own DI. *Example* 

* Application - VIP scene (generic scene)
    * ViewController 
        * receive a state from Presenter (update(with state: MainViewController.State))
        * send event to interactor (user action or some lifecycle event)
    * Interactor
        * receive event from view controller and perform business logic
        * send event to Presenter
        * send routing event
    * Presenter 
        * send event to router to show new scene
        * send event to ViewController to update it state
    * Router 
        * perform navigation
    * MainConfigurator - helper with static function which just return a scene and inject all dependencies
        
## Unidirectional app flow (VIP)
    ViewController -> Interactor -> Presenter -> ViewController or Router


### TODO:
* Show how to update one particular element in ViewController, or batch of elements (can be done with DeepDiff)
* Inteligente preloading (AsyncDisplayKit have already this functionality)
* Add possibility to handle tap events from view model based on it type 



### Problems described in current app

1) Modularisation 
2) CellModelFactory - Solved with type safe enum cases
3) Inheritance - No inheritance. No UI inheritance. 
    All Ui elements is dummy element with just Input (information what needed to render a view). Made with layers.
4) Composability - All modules can be easily tested.  Or there is even a separate App where we can just inspect how UI element looks like (CardBoard app)
5) Logic handling  - All logis is handled inside interactor. Even if we want to inject some dependecy we will know where to find a place where logic is handling
6) Routing - Routing events received unidirectional from presenter. Or we can have some GlobalRouter who will handle not only viewcontroller event, like push notifications taps.
7) Different architectural approaches - One VIP architecture. Reactive code can be presented in interactor and not distributed over the place
8) Magic UI - all UI elements is in separate module
9) Magic Strings - everything is type safe. Try to uncomment BFFFetcher -> fetchAll(). Everything is coupled using enums which ensures that enumeration cases aren’t accidentally omitted. You will receive just one assertion failure in Mapper, not even in an app. So our app will not crash if new element will be pushed from BFF.  
10) Clear way how to add new content. Try step 9