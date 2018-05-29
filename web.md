# WEB what is RESTful means
# WEB

### What is RESTful means     
- REST stands for Representational State Transfer
- A set of design principles for making network communication more scalable and flexible

### The Fielding Constraints     
Architectural constraints that a system must satisfy to be considered RESTful
#### Client-server
- server: a computer has resources of interest
- client: a computer that wants to interact with the resources stored on the server

When browsing the Internet, your computer is acting as a client and sends HTTP requests to a server to access and manipulate informations.
A RESTful system has to operate in the client-sever model.

A non-RESTful alternative to client-server architecture is event-based integration architecture. Each component continuously broadcasts events while listening for pertinent events from other components. There's no one-to-one communication. REST requires one-to-one communication, so event-based integration architecture would not be RESTful.

#### Stateless     
Servers and clients have their own states, but they do not need to keep tract of each other's state. When a client is not interacting with the server, the server has no idea of its existence. The server also not keep a record of past requests. Each request is treated as a standalone.

##### Uniform interface     
This constraint ensures that there is a common language between servers and clients. This is achieved through 4 sub-constraints: identification of resources, manipulation of resources through representations, self-descriptive messages, and hypermedia.

1. **Identification of resources:**
In REST terminology, a resource could be anything(e.g HTML document, image, information about a user, etc...). Each resource must be uniquely identified by a stable identifier(it does not change across interactions and it does not change even when the state of the resource changes).

  The Web uses URI to identify resources and HTTP as its communication standard. To get a resource stored on a server, a client makes a HTTP GET request to the URI that identifies that resource. Every time you type an address into your browser, your browser makes a GET request to that URI, and then if it receives a 200 OK response and an HTML document back, then it renders the page in the window.

2. **Manipulation of resources through representations:**
Client sends representations, usually a JSON object containing the content that it would like to add, delete, or modify. In REST, the server has full control of the resources, and responsible for making any changes.

  When a client wishes to make changes to resources, it sends the server a representation of what it would like the resulting resources to look like, the server take the request as a suggestion, but still has ultimate control.

3. **Self-descriptive messages:**
Ensure a uniform interface between clients and servers. A self-descriptive message is one that contains **all** the information that the recipient needs to understand it.

  There should not be additional information in a separate documentation or in another message to avoid source and directions arrived out of order or third response was inserted between them.

4. **Hypermedia:**
Server send data to the client that contains informations about what the client can do next, what further requests it can make. In REST, servers should be sending only **hypermedia** to clients.

  HTML is a type of hypermedia.

  For example:

  ```<a href="http://www.recurse.com">Click me</a>``` tells the client it should make a GET request to the URL if the user clicks on the link.

  ```<img src="awesome.img">``` tells the client to immediately make a GET request to the URL so it can display the image to the user.        

When a system has identifiers for each resource, manipulates them through sending representations from the client to the server, and has messages that are self-descriptive and composed of hypermedia, it is said to have a **uniform interface**.
This is the most important attribute of a RESTful system, as it allows for clients to intelligently adapt to changes.

##### Caching
It refers to the constraint that server responses should be labelled as either cacheable or non-cacheable. Caching occurs when the client stores previous responses it received from the server, so when the data is needed again, it can save a trip over the network by using the cached data. The ability to cache is made possible by the interface constraint of "self-descriptive messages".

##### Layered system
It refers to the fact that there can be more components than just servers and clients. This means there can be more than one layer in the system. However, each component is constrained to only see and interact with the very next layer.

##### Code on demand
It is the only optional constraint and refers to the ability for a server to send executable code to the client. This is HTML's ```<script>``` tag. When the HTML document is loaded, the browser automatically fetches the JavaScript from the server and executes it locally.

