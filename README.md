# Modules

* BFF - Code that will be generated from BFF

* NUCommon - some Common app functionality (Extensions). Just an example how modularisation can be

* NuUi - Module with all UI Elements

* Mapper - Pure function which glue BFF business model to view representable model

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
