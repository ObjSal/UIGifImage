# UIGifImage
Adds GIF support to iOS

# Installation

1. Download the latest release from https://github.com/ObjSal/UIGifImage/releases
2. Drag and drop the UIGifImage.framework to your project and select "Copy Items if Needed".
3. Select your target and add a new "Copy Files Phase".
4. In the new Copy Files Phase select Frameworks under the Destination dropdown.
5. Click the [ + ] button and select the UIGifImage.framework


# Instructions

UIImageView instances will automatically start animating after assigning the gif as its image

```
UIGifImage *gif = [UIGifImage imageWithData:imageData];
anUiImageView.image = gif;
```

# Requirements

UIGifImage requires iOS7+ even though embedded frameworks are targeted to iOS8 only, it should in iOS 7 just fine, read the following forum for more details: https://devforums.apple.com/message/999579#999579

