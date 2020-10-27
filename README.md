# SwiftUI Tooltip

## Description

SwiftUI does not provide an easy way to show tooltips over exiting views, so we created one!
The tooltip provideded by this package allows you to put any `View` you want into the tooltip and position it on any side of the other `View`.

## Usage

### Example 1

As the first example, the `Text` view is provided as the tooltip content and it's attached to the other `Text` view.
Below you can see the example of code that is required to create the tooltip and the result you see on the screen.

*Code:*

```swift
Text("Say something nice...")
    .tooltip(.bottom) {
        Text("Something nice!")
    }
```

*Result:*

![example 1](images/example_1.jpg)

### Example 2

Second example shows you how you can add jumping animation to the tooltip from the first example.

*Code:*

```swift
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

## Contributing

If you like this package but feel that you need more control or custom implmentation - feel free to open an issue, send a pull request or fork the repo!

## Author

This package was created by [Antoni Silvestrovic](https://github.com/bring-shrubbery)

## License

This package is licensed under [MIT License](LICENSE)
