# Modules
* BFF - Code that will be generated from BFF
* NUCommon - some Common app functionality (Extensions)
* NuUi - Module with all UI Elements
* Mapper - Pure function which glue BFF business model to view representable model
* CardBoard - SingleView Application where all UI elements can be tested

* Application - VIP scene (generic scene)
    * ViewController 
        * receive a state from Presenter (update(with state: MainViewController.State))
        * send event to interactor
    * Interactor
        * receive event from view controller and perform business logic
        * send event to Presenter
        * send routing event
    * Presenter 
        * send event to router to show new scene
        * send event to ViewController to update it state
    * Router 
        * perform navigation
        
    
## Unidirectional app flow (VIP)
    ViewController -> Interactor -> Presenter -> ViewController or Router
