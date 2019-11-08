# openCX-*Live Feedback* Development Report

Welcome to the documentation pages of the Live Feedback of **openCX**!

You can find here detailed about the (sub)product, hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report (see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)), organized by discipline (as of RUP): 

* Business modeling 
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* [Test](#Test)
* [Configuration and change management](#Configuration-and-change-management)
* [Project management](#Project-management)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us! 

Thank you!

Ana Teresa Silva

Andreia Gouveia

Cláudia Martins

Manuel Moreira

Margarida Pinho


---

## Product Vision
 For the participants of the conference who want to take the best profit of the event the LiveFeedback app is a strong ally that provides the opportunity of interacting at any time of the talks by using a real time forum in which any attendee can give feedback, share and search the material used during each talk, ask questions, which you can do anonymously to make yourself comfortable for asking anything at all and also read other's questions.
 
 Unlike other common apps, our product helps not only the attendees but also the speakers because it gives you the chance to consult or answer the questions that weren't answered during the time of the talk afterwards.

---
## Elevator Pitch
 LiveFeedback solves the problem of having to wait until the end of the talks to ask your questions, risking forgetting them or even not asking them because it had to be in front of everybody, by using an online forum to help the attendees to ask their questions, that can be anonynous, share material and give feddback, all of this in real time during any talk. 

---
## Requirements

In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.

Start by contextualizing your module, describing the main concepts, terms, roles, scope and boundaries of the application domain addressed by the project.

### Use case diagram 

![alt text](https://github.com/softeng-feup/open-cx-aacm/blob/master/Use%20Case%20Diagram.png) 



**Give Feedback**

* **Actor** : Participant

* **Description** : The participant of any lecture can give feedback on it.

* **Preconditions and Postconditions**. To give feedback about a lecture, the participant must be attending the lecture (preconditions); when you give your feedback, it will be available to the speaker of the talk in question (postconditions).

* **Normal Flow**. 

* **Alternative Flows and Exceptions**. 



**Ask Questions**

* **Actor** : Participant

* **Description** : The participant of any lecture can ask questions about it on forum.

* **Preconditions and Postconditions**. To ask questions about a lecture, the participant has to be present in it (preconditions); when you submit a question, it is visible in a forum for the speaker and other participants (postconditions).
 

* **Normal Flow**. 

* **Alternative Flows and Exceptions**. 



**Manage Questions**

* **Actor** : Speaker

* **Description** : The speaker can handle questions raised by participants during his lecture.

* **Preconditions and Postconditions**. The speaker may remove or answer any questions posed in his lecture (preconditions); any of these actions will be reflected in the discussion forum for the talk in question.


* **Normal Flow**. 

* **Alternative Flows and Exceptions**. 



**Consult Feedback**

* **Actor** : Speaker

* **Description** : The speaker can consult the feedback given by participants during his lecture.

* **Preconditions and Postconditions**. The speaker can read the feedback left by the participants about all the parts of the lecture.


* **Normal Flow**. 

* **Alternative Flows and Exceptions**. 

 

**Share Resources**

* **Actor** : Speaker

* **Description** : Speaker can share all the resources used during presentation with participants.

* **Preconditions and Postconditions**. The speaker can share material with participants present in his lecture (preconditions); it will be available during and after it (postconditions).

* **Normal Flow**. 

* **Alternative Flows and Exceptions**. 



### User stories
This section will contain the requirements of the product described as **user stories**, organized in a global **user story map** with **user roles** or **themes**.

[User stories in trello](https://trello.com/b/ROideknb)

![alt_text](https://github.com/softeng-feup/open-cx-aacm/blob/master/User%20Stories.png)

For each theme, or role, you may add a small description. User stories should be detailed in the tool you decided to use for project management (e.g. trello or github projects).

A user story is a description of desired functionality told from the perspective of the user or customer. A starting template for the description of a user story is 

*As a < user role >, I want < goal > so that < reason >.*


**INVEST in good user stories**. 
You may add more details after, but the shorter and complete, the better. In order to decide if the user story is good, please follow the [INVEST guidelines](https://xp123.com/articles/invest-in-good-stories-and-smart-tasks/).

**User interface mockups**.
After the user story text, you should add a draft of the corresponding user interfaces, a simple mockup or draft, if applicable.

**Acceptance tests**.
For each user story you should write also the acceptance tests (textually in Gherkin), i.e., a description of scenarios (situations) that will help to confirm that the system satisfies the requirements addressed by the user story.

**Value and effort**.
At the end, it is good to add a rough indication of the value of the user story to the customers (e.g. [MoSCoW](https://en.wikipedia.org/wiki/MoSCoW_method) method) and the team should add an estimation of the effort to implement it, for example, using t-shirt sizes (XS, S, M, L, XL).

### Domain model

To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module.

---

## Architecture and Design
The architecture of a software system encompasses the set of key decisions about its overall organization. 

A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.

To document the architecture requires describing the decomposition of the system in their parts (high-level components) and the key behaviors and collaborations between them. 

In this section you should start by briefly describing the overall components of the project and their interrelations. You should also describe how you solved typical problems you may have encountered, pointing to well-known architectural and design patterns, if applicable.

### Logical architecture
The purpose of this subsection is to document the high-level logical structure of the code, using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.

It can be beneficial to present the system both in a horizontal or vertical decomposition:
* horizontal decomposition may define layers and implementation concepts, such as the user interface, business logic and concepts; 
* vertical decomposition can define a hierarchy of subsystems that cover all layers of implementation.

### Physical architecture
The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams or component diagrams (separate or integrated), showing the physical structure of the system.

It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for openCX are, for example, frameworks for mobile applications (Flutter vs ReactNative vs ...), languages to program with microbit, and communication with things (beacons, sensors, etc.).

### Prototype
To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.

In this subsection please describe in more detail which, and how, user(s) story(ies) were implemented.

---

## Implementation
During implementation, while not necessary, it 

It might be also useful to explain a few aspects of the code that have the greatest potential to confuse software engineers about how it works. 

Since the code should speak by itself, try to keep this section as short and simple as possible.

Use cross-links to the code repository and only embed real fragments of code when strictly needed, since they tend to become outdated very soon.

---
## Test

To assure the quality of our application, we will run some tests.

We are planning to test the following features:
* Sign in
        -Check the input data and its validity.
* Add doubt
        -Check that the question is added to the forum and that it is displayed correctly.
* Answer doubt
        If speaker: 
                -Check that, when answering a question, the reply is highlighted to distinguish it from the other users.
        If speaker/user : 
                -Check that the reply is added and displayed correctly.
  
There are several ways of documenting testing activities, and quality assurance in general, being the most common: a strategy, a plan, test case specifications, and test checklists.

In this section it is only expected to include the following:
* test plan describing the list of features to be tested and the testing methods and tools;
* test case specifications to verify the functionalities, using unit tests and acceptance tests.
 
A good practice is to simplify this, avoiding repetitions, and automating the testing actions as much as possible.

---
## Configuration and change management

Configuration and change management are key activities to control change to, and maintain the integrity of, a project’s artifacts (code, models, documents).

For the purpose of ESOF, we will use a very simple approach, just to manage feature requests, bug fixes, and improvements, using GitHub issues and following the [GitHub flow](https://guides.github.com/introduction/flow/).


---

## Project management

Software project management is an art and science of planning and leading software projects, in which software projects are planned, implemented, monitored and controlled.

In the context of ESOF, we expect that each team adopts a project management tool capable of registering tasks, assign tasks to people, add estimations to tasks, monitor tasks progress, and therefore being able to track their projects.

Example of tools to do this are:
  * [Trello.com](https://trello.com)
  * [Github Projects](https://github.com/features/project-management/com)
  * [Pivotal Tracker](https://www.pivotaltracker.com)
  * [Jira](https://www.atlassian.com/software/jira)

We recommend to use the simplest tool that can possibly work for the team.
