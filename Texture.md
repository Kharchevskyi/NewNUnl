# Texture

![docs](https://texturegroup.org/)

## Pros
* High performance. All layout calculation is done on a background Thread and only UI updates on main thread. Image decoding, text sizing and rendering, and other expensive UI operations off the main thread
* Layer based UI. No UIView subviews adding/removing and layout calculation which is bad for performance. CALayers are the fastest way of rendering UI.
* UI Layout is done in ASDisplayNode(UIView), so no need to do it in a view controller or somewhere else
* Hight calculation. In current situation heigh calculation is done by ViewLayouter, where we need manually calculate all frames and height for a view
* Declarative UI based on CSS FlexBox model (looks like SwiftUI)
* Well maintained SDK (Facebook). A lot of application using it (Pinterst, Telegram)
* No cell reusing (CellBlocks based)
* Preload data mechanism (Intelligent Preloading)

## Cons
- Onboarding. A bit new way of creating UI, but it's quite easy it is well documented and Based on CSS FlexBox, so easy to use. 
Also, the current way of building UI considers an onboarding for new developers (UI layouting is in separate view layouter) 
