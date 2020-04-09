/*:
# NUnl app problems

## Modularisation

All architecture logic is coupled inside NuCore module(363 files) which is quite huge functionality in the app.
All app dependencies are assembled in Application `ViewControllerAssembly` which is now 1750 lines of code.
So we are quite tight to dependency that we have right now.

![NUCore](1.png)

// Possible steps to solve
 * Try to define folder structure - ✅
 * Try to redefine folder structure - ❌
 * Move all nucore files to a project and start modularistaion from the beginning - ❌
 * Try to move whole Target into Swift package - 🟡 in progress but will not solve current problem


 ## Dependencies
 This is an example of how many dependencies are injected just to create an article view controller, which doesn’t even have all types of blocks that we want to show.
 So for example, if we will have one GenericViewController we will just inject all classes
 which are responsible for presenting/handling user logic and routing for each particular block(element)
 Like for now, we do, for example with weatherLocationOnboardingActionHandler or linkActionHandler, or tagsActionHandler
 It will be hard to test, for example mock, debug and maintain. Because all logic will be scattered all over these injections.
 When we have a BFF code in place we will need to add even more logic to our app

 ![Dependencies](2.png)

 So we will end up with a Huuuuuge constructor with all the dependency.

 ![Dependencies](3.png)

 // Possible steps to solve
 * Use SwiftInject or any other DI library - ❌
 * Consider refactoring 1752 lines of code - ❌


## CellModelFactory

 Now we have an “array" of all possible elements that can be shown(Content).
 Every new Content inherited from Content
 This image shows only "array" for ArticleViewController
 but we have the same for SectionController, WeatherController, SetttingController and so on.
 So I can assume that this will grow up even more with every new Block.

![CellModelFactory](4.png)

 ## Debugging

 In Current situation is we don’t have strong types defined
 So for example, with `articleHeaderBuilder`
 We are trying to create styler, builder and layout for this Content
 And for ArticleHeaderContentViewBuilder we have a type cast to some particular style class

![StackTrace](5.png)

 In case we have a wrong class name for the style we will just return nil
 And after have an assertionFailure in some other place without any context.

 Stack trace for the assertion is on the left.

![StackTrace](6.png)

 So I need to know here exactly the class of styler and a class of a content.
 For example for 50 blocks I will need to know about
 50 names of the styler,
 50 names of Content
 50 names for Layouter.
 Based on this we receive information how to render a cell in view controller.
 So it’s really hard to debug where I made a mistake if this type casting is failed.
 We don’t have a functionality which compiler can give us.
 If we have for example, array of enum cases.
 in that case we will know on compiling phase that we don’t have a proper layouter/builder/style.

 // Possible steps to solve
 * Use enum instead of strings - All app should be refactored - ❌
 * Was proposed in chapter meeting and then declined in PR - ❌
 * With BFF number of Contents that app suppoerts will increase.
   Because We will have one Descriptor for all cell models (will combine all known cellModels) - ❌


 ## Huge inheritance

 Every subview is inherited from some class and changing in one class can lead to unpredictable behaviour in some other place.
 On ui level We have inheritance from ContentView all over the place and every new class inherited from it.
 We can override the functionality and do not know who and where actually
 ![UI](7.png)

 // Possible steps to solve
 * will just grow with every new Content type - ❌

 ## Composability

 We are quite tight to current implementation and it’s almost impossible to create a separate page not in our code
 without knowing about NuCore, ContentView or CellModelFactory, and so on.

 // Possible steps to solve
 * sea Modularisation - ❌

 ## Logic handling

 For now logic inside ArticleViewController is handled by ArticleFlowController
 Which is now more than 670 lines of code with a lot of dependency injected which also can handle some functionality, or some actions.
 And it’s not even full Logic in app.
 We have also logic for IntermediateFlowController, SlidePageFlowController, TimelineFlowController

 But, for example Logic about how tap on links are handled is doing not by flow controller
 instead it’s done by self -> which is ViewControllerAssembly (1752 lines of code)
 And then this logic translated to some coreAssemble.eventRouter who handles this onComment event.
 EventRouter has an array of 5 different link handlers, which can also handle this event.
 There is no clear responsibility of who is actually responsible for handling one particular event (Tap on link)
 If we will have hundreds different elements from BFF without clear responsibility of who is handling any type of logic we will end up in a messy code.

 ![Article](8.png)


 * Tap on link in text is handled by
 `ArticleFlowController -> EventRouter -> OpenLinkAction -> mainDeepleenkHandler -> show next controller`

 * Tap on Reactions(in top of navigation) handling is going to
 `ArticleBarButtonsController (instead of ArticleFlowController) -> ViewControllerAssembley -> EventRouter -> OpenLinkAction -> mainDeepleenkHandler -> show next controller`

 * Tap on Image
 `ArticleFlowController -> ArticleFlowController shows next controller`

 In all of this  cases we will show next controller
 But there are two different places who handle this and two different classes responsible for showing next controller.
 Also Tracking for this events is handled in one situation in `ArticleFlowController` and in another in `ViewControllerAssembly`

 // Possible steps to solve
 * Define clear responsibility inside app - ❌
 * Separate routing from ArticleFlowController - ❌


 ## Routing

 There is no defined place where routing is exactly going on.
 We have MainViewController, TabBarController, DefaultAlertControllerPresenter who are responsible for routing in application.
 And if I want to push or present something I need to inject Presenter to be able to make navigation.
 Also we have something like ArticleOptionsManager this is injected in ArticleFlowController can also present something.
 FlowControllers are also responsible not only for some business logic, like tracking, they are also responsible how to show controllers

 ![routing1](9.png)

 ![routing](10.png)

 // Possible steps to solve

 * Have one particular flow how to handle routing events. Consider refactoring - ❌


 ## Different architectural approaches
 Overtime, different approaches mainly for BlockStreamController has been created,
 Therefore, you have different ways of how to interact with it
 For example, with RxSwift or with closures.
 We should have a team defined way of doing so, to be consistent over components.

 // Possible steps to solve
 * Not Critical for BFF implementation- ✅


 ## Magic UI
 Along the app we have hardcoded on multiple places different sizes for the font.
 Would be ideal to align with UX, and defined some names or categories for those font sizes.
 Same applies to font type, font weight, etc.

 // Possible steps to solve
 * Can increase complexity - 🟡

 ## Magic Strings
 Instead of using enum where statements are exhaustive which ensures that enumeration cases aren’t accidentally omitted.
 For example for displayStyle

 // Possible steps to solve
 * Can increase complexity - 🟡

 ![strings](11.png)

❌ - Not ready
🟡 - Not critical
✅ - Done
*/
