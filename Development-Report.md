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
 The focus of our app is to provide the opportunity of interacting at any time of the talks by using a real time forum in which any attendee can give feedback, share and search the material used during each talk and ask and answer questions about it. All of this can be done anonymously. This way we aim to ease the communication at the conference substantially.
 
---
## Elevator Pitch
Getting your question and opinions through the end of a talk can be hard. LiveFeedback solves the problem of having to wait until the end of the talks to ask your questions and give your opinion, risking forgetting them or even not asking or giving them because it had to be in front of everybody, by using an online forum to help the attendees to ask their questions, share material and give feedback, all of this in real time during any talk and with the possibility of hiding your identity so that anything is left to say. 


Unlike other common apps, our product helps not only the attendees but also the speakers because it gives you the chance to consult or answer the questions that weren't answered during the time of the talk afterwards. 

---
## Requirements
Our project's main requirements are to being able to add feedback and consult such feedback, ask questions and consult such questions as well as being able to reply to them and finally, upload resources and consult such resources. 
All of these need to have an interface that is intuitive to the user.
### Use case diagram 

![alt text](https://github.com/softeng-feup/open-cx-aacm/blob/master/documentation/Use%20Case%20Diagram.png) 


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

* **Actor** : Participant

* **Description** : Participants can respond to questions raised by participants during his lecture.

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
	 
	 
	 
**Consult Feedback**

* **Actor** : Participant

* **Description** : Participants can consult the feedback given by participants during his lecture.

* **Preconditions and Postconditions**. The speaker can read the feedback left by the participants about all the parts of the lecture.

* **Normal Flow**. 
  * Actor selects lecture.
  * Actor selects a feedback. 
  * Returns to the lecture questions page.



**Share Resources**

* **Actor** : Participant

* **Description** : Participants can share all the resources used during presentation with participants.

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
	  
	  
	  
	  
### User stories
To see information about our user stories, check our trello:
	[User stories in trello](https://trello.com/b/ROideknb)
	
Interface mockups, acceptance tests and value and effort of each user story can be found on the description of each one in the link above.



### Domain model

![Live Feedback](https://github.com/softeng-feup/open-cx-aacm/blob/master/documentation/LiveFeedback%20UML2.png)

---

## Architecture and Design

The Feedback app starts with a main page that allows the user to login in the app. 
After the login, the homepage of the user allows to access the shcedule and forums of lectures that user attends. 
Each forum is associated to a lecture and can redirect user to three topics: resources, forum of answers and questions and feedback page.
Resources page allows every user (speaker and participant) to consult available resources and to share more resources.
In Q&A page, users can create a new topic and ask or answer previous questions; the speaker can delete a topic if it is unsuitable for the talk.
Feedback page allows participants to add a new topic and every user to consult an existing one. 


### Logical architecture
The purpose of this subsection is to document the high-level logical structure of the code, using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.
As the many levels of logic viewing requires, these are some of the high-level structures of LiveFeedback´s code. This way we can prevent and assure key features of our service.

As shown below, our key features include the client application, the web page and the beacon all connected to the database to assure our service's good running.  

![UMLComponentDiagram](https://github.com/softeng-feup/open-cx-aacm/blob/master/documentation/UMLComponentDiagram.png)


### Physical architecture
The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams or component diagrams (separate or integrated), showing the physical structure of the system.   

![PhysicalArchitecture](https://github.com/softeng-feup/open-cx-aacm/blob/master/documentation/PhysicalArchitecture1.png)  

We decided to use a beacon to prevent people that aren't in the lecture room from asking questions. This way we can prevent further spam and unwanted or unrelavent information.


### Prototype
In the initial prototype iteration, we didn't started building our app. First we decided to use Flutter as the programming language of our application and this iteration focused mainly on learning about this language.

Besides that, we had to decide how to organize the application and what features were more relevant in order to implement them first.

Relative to the prototype, we build some mockups and tried to implement the initial features (login page, for example) using Flutter.

---

## Implementation

We will divide this section in iterations, since our project evolution in terms of implemmentation is in accordance to such thing.

*Iteration 1:*
* In this iteration our main focous was to learn Flutter, which took a considerable amout of time. We were only able to implement the log in page and the page to display/add lectures.

*Iteration 2:*
* After learning flutter we were confident to futher develop the app. So our focous was to implement the back-end, wich we began in sql. We also updated the front-end by making the page of each lecture, that displayed the information about the lecture.

*Iteration 3:*
* After some complications with the sql, we decided that it would be more appropriate to simply inject information into the app. So we stoped developing the sql and focoused on that. Also we updated the Lecture page, having it now acess to the feedback and questions. We also added a profile page that displayed the name, description and social media of the user in question.

It also was very important to us, to start implementing the features that made us diferent from all of the other projects. One of those features was the *live* part and to do that, we only opened the feedback and question forums when the lecture was happening.

*Iteration 4:*
* Finally on this iteration we implement the last feature that made us different from anybody else, wich is *sharing resources*.Now the user is able to upload and view the resources used during the lecture.

We also used this iteration to finnish some last minute details. We did a huge improvement on the app design, making it much more user friendly. To do such deed we also implemented a calendar, that makes the user experience much more pleasent.

Releases can be found on the releases page in this repo.

---
## Test

To assure the quality of our application, we will run some tests.

We are planning to test the following features:
 * Sign in:
        * Check the input data and its validity.
 * Log in:
        * Check if the email is valid.
	* Check if the password matches the email.
 * Add doubt:
        * Check that the question is added to the forum and that it is displayed correctly.
 * Answer doubt:
       * If speaker: 
                * Check that, when answering a question, the reply is highlighted to distinguish it from the other users.
       * If speaker/user: 
                * Check that the reply is added and displayed correctly.
 * Feedback:
	* Check that the question is added to the forum and that it is displayed correctly.
	* Check that if user decides to give Feedback anonymously, that the username isn't displayed.

---
## Configuration and change management

In order to maintain the integrity of our project’s artifacts, during the development of our project we used some features from the Github Flow:
* Use of branch for a feature added to the code, related to the process of users information
* Merge of that branch with the master branch, ensuring that code remains functional and the app is working as expected
* Use of tags in order to identify the end of some iterations


---

## Project management

Software project management is an art and science of planning and leading software projects, in which software projects are planned, implemented, monitored and controlled. With that in mind, we decided to adopt a project management tool capable of registering tasks, assign tasks to people, add estimations to tasks, monitor tasks progress, and therefore being able to track our projects.

* [Trello.com](https://trello.com/b/ROideknb/livefeedback-user-stories


*Iteraction 3:* Search for the tag *iteraction3* in the releases.

*Iteraction 4:* Search for the tag *Iteraction4* in the releases.

