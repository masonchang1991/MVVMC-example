# MVVMC-example
## CoorDinator Flow and Relationship
1. AppDelegate holds on top the AppCoordinator
2. Every Coordinator holds an array of its child coordinators
3. Each navigationController gets its own coordinator
4. Definitely not one coordinator per VC. Each coordinator represents a flow, not a screen. (from @khanlou at https://twitter.com/khanlou/status/1096808803046178818)

![image](https://github.com/masonchang1991/MVVMC-example/blob/master/Coordinator%20Flow.png)

# Integrates with MVVM

## Model:
1. handle data access
2. handle saving data
3. uses functions not properties
4. all functions return data in a completion handler (always assume to be asynchronous)

## View:
1. subView allocation
2. layout
3. user input

## View Model
1. get data from a Model
2. send data to a Model
3. provide a data interface For Views
4. inform View of data changes
5. business logic
6. communicate state to Coordinator

## Coordinator
1. handle app navigation
2. build the MVVM stacks


## Relationship
![image](https://github.com/masonchang1991/MVVMC-example/blob/master/relationship1.png)

![image](https://github.com/masonchang1991/MVVMC-example/blob/master/relationship2.png)


# Reference:
### Coordinator
1. http://khanlou.com/2015/01/the-coordinator/
2. http://khanlou.com/2015/10/coordinators-redux/
3. http://khanlou.com/tag/advanced-coordinators/
4. https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps
### MVVMC
1. https://speakerdeck.com/macdevnet/mvvm-c-in-practice

