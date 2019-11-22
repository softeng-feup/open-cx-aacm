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
  * Actor selects lecture that wants to give feedback on.
  * Actor selects the give feedback option. -E1 Actor is not present in lecture-
  * Actor selects how many stars to give to the lecture -E2 Actor doesn't leave a rating.-
  * Actor writes a review -A1 Actor doen't leave a review-
  * Actor submits feedback.
  * Feedback is available for everyone to see.
  * Returns to the lecture main page

* **Alternative Flows and Exceptions**. 
  * A1 - Actor doesn't leave a review.
	  * System notifies that a review wasn't written.
	  * System asks if user really wants to not write a review.

  * E1 - Actor doesn't leave a rating.
  	  * Actor tries to submit and system doesn't allow. 
	  * System notifies that the rating is mandatory.
	  * If user chooses not to write a review, the use cases continues at Actor submits feedback.
	  * Else the use cases continues at Actor writes a review.

  * E2 - Actor is not present in lecture.
	  * Actor tries to give feedback and system doesn't allow. 
	  * System notifies that being present is necessary.
	  * Use cases continues at Returns to the lecture main page.
	  
	  
	  
**Ask Questions**

* **Actor** : Participant

* **Description** : The participant of any lecture can ask questions about it on forum.

* **Preconditions and Postconditions**. To ask questions about a lecture, the participant has to be present in it (preconditions); when you submit a question, it is visible in a forum for the speaker and other participants (postconditions).

* **Normal Flow**. 
   * Actor selects lecture.
   * Actor selects "add question" button. 
   * Actor fills title of the question - E1 Actor doesn't fill the question tittle -
   * Actor writes the question details - A1 Actor doesn't write details about the question - 
   * Actor submits question.
   * Question is available for everyone to see.
   * Returns to the lecture questions page.

* **Alternative Flows and Exceptions**. 
   * A1 - Actor doesn't write details about the question.
	 * Actor tries to submit question.
	 * System notifies that a review wasn't written.
	 * System asks if user really wants to skip writing details about the question.
	 * If selected yes, cases continues at Returns to the lecture questions page.
	 * If selected no, cases continues at -Actor writes the question details.

   * E1 - Actor doesn't fill the question tittle.
	 * Actor tries to submit question.
	 * Actor tries to ask a question with no title.
	 * System notifies that a title is necessary.
	 * Use cases continues at Returns to the lecture questions page.
	 
	 
	 
**Answer Questions**

* **Actor** : Speaker

* **Description** : The speaker can respond to questions raised by participants during his lecture.

* **Preconditions and Postconditions**. The speaker may answer any questions posed in his lecture (preconditions); any of these actions will be reflected in the discussion forum for the talk in question.

* **Normal Flow**. 
  * Actor selects lecture.
  * Actor selects a question. 
  * Actor responds question - E1 Actor doesn't respond question -
  * Actor submits answer.
  * Answer is available for everyone to see.
  * Returns to the lecture questions page.

* **Alternative Flows and Exceptions**. 

   * E1 - Actor doesn't respond question.
   	  * Actor tries to submit question.
	  * System notifies that an answer is necessary.
	  * System asks if user really wants leave without responding to the question.
	  * If selected yes, cases continues at Returns to the lecture questions page.
	  * If selected no, cases continues at Actor selects a question. 
	 
	 
	 
**Delete Questions**

* **Actor** : Speaker

* **Description** : The speaker can delete questions raised by participants during his lecture.

* **Preconditions and Postconditions**. The speaker may remove any questions posed in his lecture (preconditions); any of these actions will be reflected in the discussion forum for the talk in question.

* **Normal Flow**. 
  * Actor selects lecture.
  * Actor selects a question. 
  * Actor deletes question - A1 Actor doesn't delete question -
  * Question is no longer available for everyone to see.
  * Returns to the lecture questions page.

* **Alternative Flows and Exceptions**. 

   * A1 - Actor doesn't delete question.
   	  * System asks if user really wants leave without removing the question.
	  * If selected yes, cases continues at Returns to the lecture questions page.
	  * If selected no, cases continues at Actor selects a question. 
	 
	 
	 
**Consult Feedback**

* **Actor** : Speaker

* **Description** : The speaker can consult the feedback given by participants during his lecture.

* **Preconditions and Postconditions**. The speaker can read the feedback left by the participants about all the parts of the lecture.

* **Normal Flow**. 
  * Actor selects lecture.
  * Actor selects a feedback. 
  * Returns to the lecture questions page.



**Share Resources**

* **Actor** : Speaker

* **Description** : Speaker can share all the resources used during presentation with participants.

* **Preconditions and Postconditions**. The speaker can share material with participants present in his lecture (preconditions); it will be available during and after it (postconditions).

* **Normal Flow**. 
   * Actor selects lecture.
   * Actor selects "add resources" button. 
   * Actor fills title of the new resource - E1 Actor doen't fill the resource tittle -
   * Actor writes a summary of the new resource - A1 Actor doesn't write a summary of the new material -
   * Actor selects "upload file" button.
   * Actor selects a file - E2 Actor doesn't upload file - 
   * Actor submits new resource.
   * Resources are available for everyone to see.
   * Returns to the lectures main page.

* **Alternative Flows and Exceptions**. 

   * A1 - Actor doesn't write a summary of the new material.
   	  * Actor tries to submit new resource.
	  * System notifies that the summary wasn't written.
	  * System asks if user really wants to submit resource without a summary.
	  * If selected yes, cases continues at Returns to the lectures main page.
	  * If selected no, cases continues at Actor writes a summary of the new resource.

   * E1 - Actor doesn't fill the resource tittle.
	  * Actor tries to submit a new resource without a title.
	  * System notifies that a title is necessary.
	  * System asks if user still wants to Share Resources.
	  * If selected yes, cases continues at Actor fills tittle of the new resource.
	  * If selected no, cases continues at Returns to the lectures main page.
   
   * E2 - Actor doesn't upload any file.
	  * Actor tries to submit a new resource without a file.
	  * System notifies that a file is necessary.
	  * System asks if user still wants to Share Resources.
	  * If selected yes, cases continues at Actor selects a file.
	  * If selected no, cases continues at Returns to the lectures main page.



### User stories
This section contains the requirements of the product described as **user stories**, organized in a global **user story map** with **user roles** or **themes**.

[User stories in trello](https://trello.com/b/ROideknb)


### Domain model

To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module.

![Live Feedback](https://github.com/softeng-feup/open-cx-aacm/blob/master/LiveFeedback%20UML.png)

---

## Architecture and Design

The Feedback app starts with a main page that redirect automatically the user to the login page. 
After the login, the homepage of the user allows to access the foruns of lectures that user attends. 
Each forum is associated to a lecture and can redirect user to three topics: resources, forum of answers and questions and feedback page.
Resources page allows every user (speaker and participant) to consult available resources and the speaker to share more resources.
In Q&A page, users can create a new topic and ask questions; the speaker, can create or delete a topic and answer questions.
Feedback page allows participants to add a new topic and every user to consult an existing one. 


### Logical architecture
The purpose of this subsection is to document the high-level logical structure of the code, using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.
As the many levels of logic viewing requires, these are some of the high-level structures of LiveFeedback´s code. This way we can prevent and assure key features of our service.

Log In Case Diagram shows how the app handles misused loggin information or non-existent loggin information.  
![LogInCase](https://github.com/softeng-feup/open-cx-aacm/blob/master/LogIn%20Case%20Diagram.png)

Ask Questions Case Diagram makes sure that the user inputs the question acoording to our restriction os number of characters.  
![AskQuestionCase](https://github.com/softeng-feup/open-cx-aacm/blob/master/AskQuestion%20Case%20Diagram.png)

Get Resources Case Diagram checks if the Resource number requested exists and if so presents it to the user.  
![GetResourceCase](https://github.com/softeng-feup/open-cx-aacm/blob/master/GetResources%20Diagram.png)

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
        * Check the input data and its validity.
 * Add doubt
        * Check that the question is added to the forum and that it is displayed correctly.
 * Answer doubt
       * If speaker: 
                * Check that, when answering a question, the reply is highlighted to distinguish it from the other users.
       * If speaker/user: 
                * Check that the reply is added and displayed correctly.
  
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

Software project management is an art and science of planning and leading software projects, in which software projects are planned, implemented, monitored and controlled. With that in mind, we decided to adopt a project management tool capable of registering tasks, assign tasks to people, add estimations to tasks, monitor tasks progress, and therefore being able to track our projects.

* [Trello.com](https://trello.com/b/ROideknb/livefeedback-user-stories

*22nd November's Delivery:*
Browse the repository at this delivery: https://github.com/softeng-feup/open-cx-aacm/tree/86c5146642f411d5be2bb8f1ab5d2be2d5562886

