# UIGifImage
Adds GIF support in iOS

# Installation

1. Download the latest release from https://github.com/ObjSal/UIGifImage/releases
2. Drag and drop the UIGifImage.framework to your project and select "Copy Items if Needed".
3. Select your target and add a new "Copy Files Phase".
4. In the new Copy Files Phase select Frameworks under the Destination dropdown.
5. Click the [ + ] button and select the UIGifImage.framework


# Instructions

UIImageview instances will automatically start animating after assigning the gif as their image

```
UIGifImage *gif = [[UIGifImage alloc] initWithData:imageData];
anUiImageView.image = gif;
```

# Requirements

UIGifImage requires iOS7+ even though embedded frameworks are targeted to iOS8 only, it should in iOS 7 just fine, read the following forum for more details: https://devforums.apple.com/message/999579#999579

