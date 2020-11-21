# Swift Package Manager

[swift.org/package-manager](https://swift.org/package-manager/)  
[developer.apple.com/swift-packages](https://developer.apple.com/documentation/swift_packages)  
[github.com/apple/swift-package-manager](https://github.com/apple/swift-package-manager/blob/main/Documentation/Usage.md)

The Swift Package Manager is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

Swift packages are reusable components of Swift, Objective-C, Objective-C++, C, or C++ code that developers can use in their projects. They bundle source files, binaries, and resources in a way that’s easy to use in your app’s project.

<br>

#### Help

``` sh
swift package --help
```

<br>

#### Create Package

Create and enter the directory, the directory will be the name of the package. Every package must have a manifest file called `Package.swift` in its root directory.

``` sh
mkdir MyPackage && cd MyPackage

swift package init
```

By default the `init` command will create a library package directory structure:

``` text
├── Package.swift
├── README.md
├── Sources
│   └── MyPackage
│       └── MyPackage.swift
└── Tests
    ├── MyPackageTests
    │   └── MyPackageTests.swift
    └── LinuxMain.swift
```

<br>

#### Create Executable

Create and enter the directory, the directory will be the name of the executable, use the option `---type executable`. A target is considered as an executable if it contains a file named `main.swift`. The package manager will compile that file into a binary executable. 

``` sh
mkdir MyExecutable && cd MyExecutable

swift package init --type executable
```

The `init --type executable` command will create an executable directory structure:

``` text
├── Package.swift
├── README.md
├── Sources
│   └── MyExecutable
│       └── main.swift
└── Tests
    ├── MyExecutableTests
    │   └── MyExecutableTests.swift
    └── LinuxMain.swift
```

<br>

#### Run

To build and run the executable. Since there is only one executable in this package, we could omit the executable name from the `swift run` command.

``` sh
swift run MyExecutable
```

You can also compile the package by running the `swift build` command and then run the binary from the `.build` directory (`.build/debug/<projectname>` or `.build/x86_64-apple-macosx/debug/<projectname>`) in the executable project directory.

<br>

#### Build

To build a package. This will download, resolve and compile dependencies mentioned in the manifest file `Package.swift`.

``` sh
swift build
```

<br>

#### Test

To run the tests for a package.

``` sh
swift test
```

<br>

#### Generate Xcode Project

To generate an Xcode project. This will run `swift build` also.

``` sh
swift package generate-xcodeproj

open ./<projectname>.xcodeproj
```

<br>

## Create Package In Xcode

[developer.apple.com/creat-swift-package-with-xcode](https://developer.apple.com/documentation/xcode/creating_a_standalone_swift_package_with_xcode)