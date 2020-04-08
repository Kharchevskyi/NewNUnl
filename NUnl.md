# NUnl app problems

## Modularisation

Current situation - every logic is coupled inside NuCore module which is quite huge functionality in the app.
All dependency for ViewController is assembled in ViewControllerAssembly which is now 1750 lines of code. So we are quite tight to dependency that we have right now. 

![image alt text](1.png)




This is an example of how many dependency are injected just to create an article view controller, which doesn’t even have all types of blocks that we want to show. So for example if we will have one GenericViewController (GVC) we will just inject all classes which are responsible for presenting/handling user logic and routing for each particular block(element).
Like for now we deal for example with weatherLocationOnboardingActionHandler or linkActionHandler, or tagsActionHandler.  So we will end up with Huge constructor with all the dependency. 
So it will be hard to test, for example mock it, debug and maintain. Because all logic will be spreader all over this injections. 

When we have a BFF code in place we will need to add even more logic to our app


2. CellModelFactory

Now we have an “array" of all possible elements that can be shown(Contents). This image shows only for ArticleViewController, but we have the same for SectionController, WeatherController, SetttingController and so on. So I can assume that this will grow up even more with every new Block. 

Current situation is we don’t have a strong types defined
So for example with articleHeaderBuilder we are trying to create styler, builder and layout for this

And for ArticleHeaderContentViewBuilder we have a type cast to some particular style 
In case we have wrong class for style we will just return nil and after have an assertionFailure in some other place. 
Stack trace for assertion is on the left. 

So I need to know here exactly the class of styler and a class of a content.  so For example for 50 blocks I will need to know about 50 names of the styler, 50 names of Content and 50 names for Layouter.    This is functionality needed just to render a cell in view controller. 


So it’s really hard to debug where I made a mistake if this type casting is failed. 

We don’t have a functionality which compiler can give us if we have for example array of enum cases. And then you will know it on compiling phase that you don’t have a proper element layouter/builder/style. 





3. Huge inheritance


Every subview is inherited from some class and changing in one class can lead to unpredictable behaviour in some other place. For example.
So we have inheritance from ContentView all over the place and every new class inherited from. 
We can override the functionality and do not know who and where actually was4. Composability
We are quite tight to current implementation and it’s almost impossible for example to create a separate page not in our code without knowing about NuCore, ContentView or CellModelFactory, and so on.



5) Logic handling   For now logic inside ArticleViewController is handled by ArticleFlowController which is now more than 670 lines of code with a lot of dependency injected which also can handle some functionality, or some actions. And it’s not even full Logic in app. We have also logic for IntermediateFlowController, SlidePageFlowController, TimelineFlowController
And in this case, for example onOpenComments(in the bottom)

Logic about how comments are handling is doing not by flow controller instead it’s done by self -> which is ViewControllerAssembly (1752 lines of code)
And then this logic translated to some coreAssemble.eventRouter who handles this onComment event. EventRouter has an array of 5 different link handlers, which can also handle this event. 
There is no clear responsibility of who is actually responsible for handling one particular event.  If we have hundreds different elements from BFF without clear responsibility of who is handling any type of logic we will end up in a messy code.



For example * tapping on link in text is handled by: 
ArticleFlowController -> EventRouter -> OpenLinkAction -> mainDeepleenkHandler -> show next controller

But tap on Reactions handling is going to:
ArticleBarButtonsController (instead of ArticleFlowController) -> ViewControllerAssembley -> EventRouter -> OpenLinkAction -> mainDeepleenkHandler -> show next controller  Tap on Image:
 ArticleFlowController -> ArticleFlowController shows next controller

In all of this  cases we will show next controller but there are two different places who handle this and two different classes responsible for showing next controller. 

Tracking for this events is handled in one situation in ArticleFlowController and in another in ViewControllerAssembly6) Routing  There is no defined place where routing is exactly going on. We have MainViewController, TabBarController, DefaultAlertControllerPresenter who are responsible for routing in application. And if I want to push or present something I need to inject Presenter to be able to make navigation. So I will also inject whole TaBarController for example. For example ArticleOptionsManager this is injected in ArticleFlowController can also present something 


So it also can present something, and also knew about a presenter. 
 
FlowController is also responsible not only for some business logic, like tracking, it’s also responsible how to show viewcontroller.7) Different architectural approaches

Overtime, different approaches mainly for BlockStreamController has been created, therefore, you have different ways of interact with it, for example, with RxSwift or with closures. We should have a team defined way of doing so, to be consistent over components. 8) Magic UI

Along the app we have hardcoded on multiple places different sizes for the font. Would be ideal to align with UX, and defined some names or categories for those font sizes. Same applies to font type, font weight, etc.


9) Magic Strings
No type safety instead of using enum where with statements are exhaustive which ensures that enumeration cases aren’t accidentally omitted.

