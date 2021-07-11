# iOS Application Architecture Blueprint

This is a blueprint template for iOS application which adopt VIPER architecture.
Use this a good starting point for robust iOS application which are testable, scable.

## Documentation

- [VIPER](https://www.raywenderlich.com/8440907-getting-started-with-the-viper-architecture-pattern)
- [Swinject](https://github.com/Swinject/Swinject)
- [Moya](https://github.com/Moya/Moya)
- [SwiftLint](https://github.com/realm/SwiftLint)
- [fastlane](https://fastlane.tools/)
- [CocoaPods](https://cocoapods.org/)
- [The Clean Architecture (Uncle Bob)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

## Principles

- SOLID
- DRY

## App architecture

### Module

As follow VIPER architecture, each module contains 5 layers:

#### View: 
- Observe changes from Presenter.
- Observe user's interaction and tell Presenter.
- UI-related operation.
#### Interactor:
- Responsible for specific business-logic of one module.
- Inject services to do execution tasks, heavy operations.
#### Presenter:
- Communication gateway between View, Interactor, Router.
- Parsing business/network models to view-models.
#### Entity:
- Made up of classes that can contain methods.
- Domain models of one specific module. 
- Usually not being shared with other modules.
#### Router:
- Responsbile for navigation between modules.
- Creation of one module usually happens here.

### DependencyContainer
- Dependency Injection by Swinject
- Responsible for service registrations (register) or service resolution (resolve).

### Service
- Testable services
- Perform tasks which help solving business logic.
- Used application-wide.
- Single responsibility.

### Unit tests
- Common-used services are fully-tested.

## Getting Started

### Setup

```
Navigate to project folder
pod install
```

### Run

```
Open xCode and build/run application
```

**SwiftLint**

SwiftLint is configured to run for every build action, ensure high-quality code and good naming convention.

### Fastlane


**Cert & Profile**

```
fastlane ios cert_dev
fastlane ios cert_distribution
```

**Build**

```
fastlane ios build_dev
fastlane ios build_distribution
```

**Test**

```
fastlane ios test
```
