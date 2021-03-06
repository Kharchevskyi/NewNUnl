
# Why?

* With bff adding it would be a nice idea to not have a support for old, logic and a new logic, then removing an old one. 
(Merging steps/ Removing OldContent/ Integrating new code)
* Way to structurize an application logic.
* Separate app responsibility.
* Modularize application.
* Easy onboarding for new developer.
* Unidirectional app flow.
* Performance. Texture is one fo the most performance ui in iOS. 
* Also easy way to run longtime operation on background threads and have ui update on main 
also because of unidirectional app architecture.
* Clear way of debugging.
* Knowledge sharing, all our logic parts are confirmed to some protocols. So a lot of existed code will be reused.
* Testability. 

# Concerns
![concerns](https://github.com/Kharchevskyi/NewNUnl/master/Nunl.pdf)

# Proposed App. Overview

## Unidirectional app flow (VIP)

`ViewController -> Interactor -> Presenter -> ViewController or Router`

Application - VIP scene (generic scene)
* **ViewController** 
    * receive a state from Presenter (update(with state: MainViewController.State))
    * send event to interactor (user action or some lifecycle event)
* **Interactor**
    * receive event from view controller and perform business logic
    * send event to Presenter
    * send routing event
* **Presenter** 
    * send event to router to show new scene
    * send event to ViewController to update it state
* **Router** 
    * perform navigation
* **MainConfigurator** - helper with static function which just return a scene and inject all dependencies

## Modules
* **BFF** - Code that will be generated from BFF  *Separate Swift Package*
* **NUCommon** - some Common app functionality (Extensions). Just an example how modularisation can be *Separate Swift Package*
* **NuUi** - Module with all UI Elements *Separate Target*
* **Mapper** - Pure function which map BFF business model to view representable model. Can be improved even more with separate module which will contain just ViewModels (see ViewModels folder) *Separate Swift Package*
* **CardBoard** - SingleView Application where all UI elements can be tested *Separate App*
* **Tracker** - Example of some Dependency. Can reuse a lot from current app.
* **DI** - Simple Dependency Injection Module (Better to use SwiftInject) or create own DI. *Separate Swift Package*
        

## Problems described in current app

* **Modularisation** - Every function part is a testable separate target which can be easily move to another workspace or project. (Mapper, BFF, Tracker)
* **CellModelFactory** - Solved with type safe enum cases. (Try to add new bff element). Compiler will do everything for you. Easy onboarding process.
* **Inheritance** - No inheritance. No UI inheritance. Ui built in a separate target. All Ui elements is dummy element with just Input (information what needed to render a view). Made with layers.
* **Composability** - All modules can be easily tested.  Or there is even a separate App where we can just inspect how UI element looks like (CardBoard app)
* **Logic** handling  - All logic is handled inside interactor. Even if we want to inject some dependecy we will know where to find a place where logic is handling. 
* **Routing** - Routing events received unidirectional from presenter. Or we can have some GlobalRouter who will handle not only viewcontroller event, like push notifications taps.
* **Different** architectural approaches - One VIP architecture. Reactive code can be presented in interactor and not distributed over the place. For example receive event of viewControllerDidAppear combine it with BannerPool ready event and update presenter with new add.
* **Magic UI + UI** - all UI elements is in separate module. Can be easily shown in app. See CardBoard app
* **Magic Strings** - everything is type safe. Try to uncomment BFFFetcher -> fetchAll(). Everything is coupled using enums which ensures that enumeration cases aren’t accidentally omitted. You will receive just one assertion failure in Mapper, not even in an app. So our app will not crash if new element will be pushed from BFF.  
* **Clear** way how to add new content. Try step 9
* **Easy** onboarding. 


## TODO
* Show how to update one particular element in ViewController, or batch of elements (can be done with DeepDiff)
* Inteligente preloading (AsyncDisplayKit have already this functionality)
* Add possibility to handle tap events from view model based on it type 
