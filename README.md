# NMTMaterialTextField

NMTMaterialTextField is an iOS Swift package that provides a customizable Material Design-inspired text field component for iOS applications. It is designed to offer various modifications and enhance the user experience when collecting user input.

![](/Sources/Resources/showcase.gif)

Key features of NMTMaterialTextField include:

1. Customizable Design: The package provides a wide range of customization options, allowing developers to tailor the appearance of the text field to fit their app's visual style. Users can modify properties such as the background color, border color, placeholder text color, and more.

2. Floating Placeholder: NMTMaterialTextField incorporates a floating placeholder label that animates above the text field when the user begins typing, giving a subtle visual indication of the active text field.

3. Error State: Developers can easily trigger an error state for the text field, highlighting it with a different color or style to draw attention to input validation issues or incorrect values.

4. Input Validation: NMTMaterialTextField includes built-in functionality for input validation, allowing developers to set validation rules and provide error messages if the user's input doesn't meet the required criteria.

5. Secure Text Entry: For password or sensitive data input, NMTMaterialTextField supports secure text entry, obscuring the entered characters.

By leveraging the NMTMaterialTextField package, iOS developers can easily incorporate Material Design text fields into their applications while benefiting from the flexibility and customization options provided.


## Installation

To use a custom text field Swift package in an iOS app with Storyboard, you can follow these general steps:

### Swift Package Manager

Add the Swift package to your Xcode project:

```swift
"https://github.com/Think-Nik/NMTMaterialTextField/"
```

Go to Xcode, open your project, from the file menu click on "Add Package" menu. Enter the above URL or search for the package, then click "Next" and "Finish" to add it to your project.


#### Import the package in your View Controller:

- Open the View Controller where you want to use the custom text field.
Add the import statement at the top of the file to import the package: import NMTMaterialTextField.


#### Open your Storyboard:

- Open the Storyboard file that contains the view where you want to use the custom text field. Add a regular UIView from the Object Library:

- Drag and drop a regular UIView onto your view controller's scene in the Storyboard.

- Change the UIView's class to the custom text field class:

- Select the UIView in the storyboard scene. In the Identity Inspector panel (on the right side of Xcode), find the "Custom Class" section. Change the Class field to the custom text field class provided by the package (e.g., NMTMaterialTextField).

- Customize the text field's properties:

- With the custom text field selected in the storyboard scene, you can modify its properties using the Attributes Inspector panel (on the right side of Xcode).

- Depending on the custom text field package, you may have various properties available to customize, such as placeholder text, error text, isSecureText, placeholder text color, border color, icon, isOptional, isDisable etc.


![](/Sources/Resources/properties.png)


- Connect the text field to your View Controller:

- Control-drag from the custom text field in the storyboard to the View Controller's code to create an outlet or action connection. Specify a name for the connection (e.g., @IBOutlet var customTextField: NMTMaterialTextField).

#### By following these steps, you should be able to integrate and use the custom text field Swift package within your iOS app's Storyboard-based interface. 
