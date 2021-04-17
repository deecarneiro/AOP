# AOP
A simple introduction to Aspect Oriented Programming with AspectJ.

## What's AOP?
AOP (aspect-oriented programming) is a programming style that can be adopted to define certain policies that in turn are used to define and manage the cross-cutting concerns in an application. In essence, it's a programming paradigm that enables your application to be adaptable to changes.

## Libs/Frameworks
-AspectJ: an aspect-oriented programming (AOP) extension created at PARC for the Java programming language. It is available in Eclipse Foundation open-source projects, both stand-alone and integrated into Eclipse. AspectJ has become a widely used de facto standard for AOP by emphasizing simplicity and usability for end users. It uses Java-like syntax, and included IDE integrations for displaying crosscutting structure since its initial public release in 2001.

## Code Snippet
### Hello World 

- Class Exe01
```java
public class Exe01 {
	 public static void printHelloWorld(){
	        System.out.print(" World");
	    }

	    public static void main(String[] args){
	        Exe01.printHelloWorld();
	    }
	    
}
```
- AspectJ class applies to main class function printHelloWorld()
```java
public aspect Exe01Aspect {

	  pointcut nome(): execution (* Exe01.printHelloWorld());

	    before() : nome() {
	        System.out.print("Hello");
	    }

	    void around() : nome(){
	        proceed();
	        System.out.print(" Pra ninguém!");
	    }

	    after() : nome(){
	        System.out.print(", Vilmar!!");
	    }
}
```

#### Pointcuts
  They allow a programmer to specify join points (well-defined moments in the execution of a program, like method call, object instantiation, or variable access). All pointcuts are expressions (quantifications) that determine whether a given join point matches. For example, this point-cut matches the execution of printHelloWorld() method in an object of type Exe01:
  
```java
	  pointcut nome(): execution (* Exe01.printHelloWorld());
```
 
#### Advices
   They allow a programmer to specify code to run at a join point matched by a pointcut. The actions can be performed before, after, or around the specified join point. Here, the advice print on the screen a string after printHelloWorld() method execution:

```java
      after() : nome(){
	        System.out.print(", Vilmar!!");
	    }
```
  
