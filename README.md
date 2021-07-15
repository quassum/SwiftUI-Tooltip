# SwiftUI Tooltip

This package provides you with an easy way to show tooltips over any SwiftUI view, since Apple does not provide one.

## Getting started

You can add this package to your project using Swift Package Manager. Enter following url when adding it to your project package dependencies:

```
https://github.com/quassummanus/SwiftUI-Tooltip.git
```

We are using [semver](https://semver.org) for versioning, so we would recomment selecting "Up to next major relase" option for this package.

After you added the package, all you need to do is import it and you can add a tooltip to any SwiftUI View in that file!

## Usage

### Example 1

As the first example, the `Text` view is provided as the tooltip content and it's attached to the other `Text` view.
Below you can see the example of code that is required to create the tooltip and the result you see on the screen.

*Code:*

```swift
import SwiftUITooltip
...
Text("Say something nice...")
    .tooltip(.bottom) {
        Text("Something nice!")
    }
...
```

*Result:*

![example 1](images/example_1.jpg)

### Example 2

Second example shows you how you can add jumping animation to the tooltip from the first example.

*Code:*

```swift
import SwiftUI
import SwiftUITooltip

struct SwiftUIView: View {
    var tooltipConfig = DefaultTooltipConfig()
    
    init() {
        self.tooltipConfig.enableAnimation = true
        self.tooltipConfig.animationOffset = 10
        self.tooltipConfig.animationTime = 1
    }
    
    var body: some View {
        Text("Say something nice...")
            .tooltip(.bottom, config: tooltipConfig) {
                Text("Something nice!")
            }
    }
}
```

*Result:*

![example 2](images/example_2.gif)

## Configuration Reference

Below you can see all the properties that you can set in the configuration.

| Property | Type |
| ---------- | ------ |
| side | TooltipSide |
| margin | CGFloat |
| borderRadius | CGFloat |
| borderWidth | CGFloat |
| borderColor | Color |
| backgroundColor | Color |
| contentPaddingLeft | CGFloat |
| contentPaddingRight | CGFloat |
| contentPaddingTop | CGFloat |
| contentPaddingBottom | CGFloat |
| showArrow | Bool |
| arrowWidth | CGFloat |
| arrowHeight | CGFloat |
| enableAnimation | Bool |
| animationOffset | CGFloat |
| animationTime | Double | 

## Contributing

If you like this package but feel that you need more control or custom implmentation - feel free to open an issue, send a pull request or fork the repo!

## Author

This package was created by [Antoni Silvestrovic](https://github.com/bring-shrubbery)

## License

This package is licensed under [MIT License](LICENSE)
