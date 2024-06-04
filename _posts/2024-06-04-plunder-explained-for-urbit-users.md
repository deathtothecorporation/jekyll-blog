---
layout: post
title: Plunder, explained for Urbit users
tags:
  - written
date: 2024-06-04T19:14:00.000Z
description: Provide a short description which will be used on social share cards
image: https://blog.vaporware.network/assets/images/vaporware-default.avif
visible: true
authors:
  - cve
---
# Plunder, explained for Urbit users

This article is a high level introduction to Plunder for the interested Urbit user. If you are not already familiar with Urbit, we suggest you skip this article and check out Plunder’s technical documentation instead. Plunder is fundamentally working towards a similar set of goals as Urbit, but diverges in two important ways. 



First, Plunder does not invent a new computing model, but instead recombines existing technologies in a new way. In particular, Plunder is based on lambda calculus, supercombinators, and graph reduction.



Second, Plunder is explicitly political, or to be more precise, meta-political. Plunder does not have a constitution and is not a republic, but it does encode a set of beliefs about the way human societies should relate to one another, what kind of function societies and individuals play in the broader world, and how to protect the natural rights of these entities from totalizing control.

## Plunder is pragmatic 

Plunder invents just enough technology to accomplish its goal and no more. This is in contrast to the strategy employed by Urbit, which first enumerates a set of axiomatic engineering principles and then constructs a system in harmony with those principles (here, one plainly sees the Austrian in Moldbug). This difference crosscuts the entirety of the project, but can be seen quite clearly in a comparison of PLAN and Nock. 



PLAN is old technology recombined in a new way. In particular, PLAN restricts lambda calculus to supercombinators, which enables a compiler architecture that can make use of well understood optimization techniques. For example, Plunder’s interpreter performs standard graph reduction, like Haskell’s GHC, and deduplicates data using a merkle DAG, mimicking similar systems found in IPFS or BitTorrent.



In contrast, Urbit invents an entirely new axiomatic computing system. At LambdaConf 2016, Yarvin justifies this decision thusly, 

> “[Lambda calculus] has these features that are like symbols and variables and scope that are features of a higher level language. But if you want to use that as an axiomatic system…and put the higher level language as something that is actually loaded onto that axiomatic interpreter, then those things are in the wrong place. They’re in the wrong layer”


[YouTube](https://youtu.be/ztg3OQHPJ4s?t=742)



His solution to this problem was Nock, “a tool for defining higher-level languages - comparable to the lambda calculus, but meant as foundational system software rather than foundational metamathematics.” To his great credit, retrofitting lambda calculus wouldn’t have seemed possible without the invention of Nock in the first place. Still, if you know a better path, why not take it?

[Moron Lab post](https://moronlab.blogspot.com/2010/01/nock-maxwells-equations-of-software.html]



Plunder is also pragmatic in another way, which overlaps with its political orientation: a frozen operating system is not a goal of the project. We believe an OS is a component of the larger complex and adaptive system we call technology. These kinds of systems co-evolve with the ecosystem in which they are embedded and freezing by fiat entirely misses the dynamics at play. There is overwhelming evidence—including from Urbit itself—that operating system design is a moving target.



By committing to a frozen operating system, Urbit exploded its scope. The impact of this decision is not merely technical. The political, financial, and operational complexity managed by the Urbit Foundation is downstream of this engineering decision. A different choice in scope would have yielded a change in governance. Plunder avoids these hard social questions by avoiding scope creep: freeze the base layer and nothing more.



To summarize, the choice is not between an ever expanding ball of mud or a diamond perfect operating system, but between different substrates from which an organic-like explosion of complexity can emerge. The goal is not a frozen operating system, but a system from which many OSs can spawn. Said differently, from Plunder’s perspective, Urbit is merely an application.

## Plunder is political

Plunder is a reaction to the corporate and governmental encroachment on private life. Everywhere we turn there are powerful centralized institutions attempting to exercise control over society. Some are motivated by profit, others motivated by ideology; all of them opaque to those they seek to influence. We firmly reject this state of affairs.



As Eric Hughes reminded us in A Cypherpunk's Manifesto, “Privacy is necessary for an open society in the electronic age.” We believe the personal communications you have on the internet should be as private as the words you utter in your home. By communication, we mean any exchange of information between any consenting parties whatsoever. We believe the gradual abandonment of this traditional liberal principle is a threat to the security and prosperity of our world. This does not mean that we endorse speech without accountability, or action without oversight, but we reject the notion that these virtues can only be cultivated through industrial-scale censorship.



Our project also rejects the 20th century activist strategy. Activism implicitly recognizes the authority of the structure it attempts to modify, otherwise why appeal to it at all? Given the advanced state of institutional decay in western society, we think such an appeal would be useless at best, and counter-productive at worst.



A successful version of Plunder is a realistic alternative to the existing control structures. By control structures, we mean the tools of information propagation and filtering, which through conscious direction, circumscribe the realm of the “possible.” We do not seek to modify or reform these structures—we aim to displace them. But with what alternative? 



Plunder’s goal is to create a computing system for tightly connected communities, loosely bound to one another, through shared foundational infrastructure. Like a federated constitution, this infrastructure needs to be sufficiently opinionated to be useful, but flexible enough to permit broad and deep experimentation. Human societies have always been networks, but ours is the most networked in history. If we take the challenges of our time seriously, individuals must have control over their networks and the tools for maintaining or modifying them.



These are democratic ideals rooted in the tradition of American independence and self-determination. The challenge for us, is politics in the 21st century is technical.

## Some practical differences

Finally, for those that want concrete details, we’ll leave you with some direct comparisons (and please check out our technical documentation for more information):



PLAN and Nock are similarly tight specifications for abstract computation, but PLAN trades off some formal simplicity in exchange for much better practical performance and legibility. PLAN does not claim to be Maxwellian, but Nock does. 



PLAN is designed as a general purpose compilation target for other functional languages. Sire is Plunder’s version of Hoon, but is not intended to be used for high level application development. Languages like Haskell or Elm can compile to PLAN, but have no chance of compiling to Nock.



Plunder does not provide a universal networking or identity layer, whereas Urbit does. Networking and identity are contingent on use case, so Plunder leaves it up to the developer. Vaporware will develop an offering, but others are free to compete.



Plunder doesn’t include kernel modules or Urbit-like “vanes” at the base layer. Plunder has a (yet unfinished) notion of a SYSCALL, which defines a frozen interface for interacting with external environments. Roughly speaking, a Plunder runtime knows something about the affordances of the underlying system and can make that functionality available to the programmer. A programmer specifies the semantics of the call, the runtime decides how.



Today, Plunder can store and transparently page in large amounts of data from disk. Urbit currently cannot, though this will change if Ares proves successful. 



Both systems provide orthogonal persistence, though in Plunder’s case, the developer has finer grained control over the use of this feature.



Every Plunder process—roughly analogous to an “agent”—can be uniquely identified by a private/public key pair. A Plunder process can have one or more key pairs. Urbit has a roughly analogous system available via “comets”, but comets suffer from the overhead of running a full Urbit node. Plunder can spawn these with little additional overhead; they can be long lived or ephemeral.


---


This article is a high level introduction to Plunder for the interested Urbit user. If you are not already familiar with Urbit, we suggest you skip this article and check out Plunder’s technical documentation instead. Plunder is fundamentally working towards a similar set of goals as Urbit, but diverges in two important ways. 



First, Plunder does not invent a new computing model, but instead recombines existing technologies in a new way. In particular, Plunder is based on lambda calculus, supercombinators, and graph reduction.



Second, Plunder is explicitly political, or to be more precise, meta-political. Plunder does not have a constitution and is not a republic, but it does encode a set of beliefs about the way human societies should relate to one another, what kind of function societies and individuals play in the broader world, and how to protect the natural rights of these entities from totalizing control.



Plunder is pragmatic 

Plunder invents just enough technology to accomplish its goal and no more. This is in contrast to the strategy employed by Urbit, which first enumerates a set of axiomatic engineering principles and then constructs a system in harmony with those principles (here, one plainly sees the Austrian in Moldbug). This difference crosscuts the entirety of the project, but can be seen quite clearly in a comparison of PLAN and Nock. 



PLAN is old technology recombined in a new way. In particular, PLAN restricts lambda calculus to supercombinators, which enables a compiler architecture that can make use of well understood optimization techniques. For example, Plunder’s interpreter performs standard graph reduction, like that found in Haskell’s GHC, and deduplicates data using a merkle DAG, mimicking similar systems found in IPFS or BitTorrent.



In contrast, Urbit invents an entirely new axiomatic computing system. At LambdaConf 2016, Yarvin justifies this decision thusly, “insert a transcript from lambdaconf.” 



His solution to this problem was Nock, “a tool for defining higher-level languages - comparable to the lambda calculus, but meant as foundational system software rather than foundational metamathematics.” To his credit, the repurposing of lambda calculus in place of Nock wouldn’t have seemed possible without the invention of Nock in the first place. 



Plunder is pragmatic in another way, which overlaps with its political orientation: a frozen operating system is not a goal of the project. We believe an OS is a component of the larger complex and adaptive system we call technology. These kinds of systems co-evolve with the ecosystem in which they are embedded and freezing by fiat entirely misses the dynamics at play. We find it unlikely that a frozen operating system will be successful over the long term and any effort expended in explicitly attempting this could better be used elsewhere. 



The choice is not between an ever expanding ball of mud or a diamond perfect operating system, but between different substrates from which an organic-like explosion of complexity can emerge. The goal is not a frozen operating system, but a system from which many OSs can spawn. Said differently, from Plunder’s perspective, Urbit is merely an application.

Plunder is political

Plunder is a reaction to the corporate and governmental encroachment on private life. It is our belief that corporations, and the nation-states on whose behalf they act, should not have the power to censor societal-level political speech. If this is a popular belief, it is not reflected in the actions or principles of our international leaders or institutions, either in the commercial or public spheres. 



As Eric Hughes reminded us in A Cypherpunk's Manifesto, “Privacy is necessary for an open society in the electronic age.” We believe the personal communications you have on the internet should be as private as the words you utter in your home. By communication, we mean any exchange of information between any consenting parties whatsoever. We believe the gradual abandonment of this traditional liberal principle is a threat to the security and prosperity of our world. This does not mean that we endorse speech without accountability, or action without oversight, but we reject the notion that these virtues can only be cultivated through industrial-scale censorship.



A successful version of Plunder is a realistic alternative to the existing control structures. By control structures, we mean the tools of information propagation and filtering, which through conscious direction, circumscribe the realm of the “possible.” We do not seek to modify or reform these structures—we aim to displace them. Our project is a rejection of 20th century activist strategy; activism can only amplify the power and legitimacy of a system, so we do not engage in activism. 



Plunder’s goal is to create a computing foundation in such a form that we may be guaranteed the right to pursue our safety and happiness, as individuals and as communities. These are democratic ideals rooted in the tradition of American independence and self-determination. Human societies have always been networks, but ours is the most networked in history. If we are to take seriously the challenges of our time, individuals must have control over their networks and the tools for maintaining or modifying them. Politics in the 21st century is technical.

Some practical differences

Finally, for those that want concrete details, we’ll leave you with some direct comparisons:



PLAN and Nock are similarly tight specifications for abstract computation, but PLAN trades off some formal simplicity in exchange for much better practical performance and legibility. PLAN does not claim to be Maxwellian, but Nock does. 



Plunder and Urbit both use “jets”, but Plunder can jet both data structures and computation.



PLAN is designed as a general purpose compilation target for other functional languages. Sire is Plunder’s version of Hoon, but is not intended to be used for high level application development. Languages like Haskell or Elm can compile to PLAN, but have no chance of compiling to Nock.



Plunder does not provide a universal networking or identity layer, whereas Urbit does. Networking and identity are contingent on use case, so Plunder leaves it up to the developer. 



Plunder doesn’t include kernel modules or Urbit-like “vanes” at the base layer. Plunder has a (yet unfinished) notion of a SYSCALL, which defines a frozen interface for interacting with external environments. Roughly speaking, a Plunder runtime knows something about the affordances of the underlying system and can make that functionality available to the programmer. A programmer specifies the semantics of the call, the runtime decides how.



Today, Plunder can store and transparently page in large amounts of data from disk. Urbit currently cannot, though this will change if Ares proves successful. 



Both systems provide orthogonal persistence, though in Plunder’s case, the developer has finer grained control over the use of this feature.



Every Plunder process—roughly analogous to an “agent”—can be uniquely identified by a private/public key pair. A Plunder process can have one or more key pairs. Urbit has a roughly analogous system available via “comets”, but comets suffer from the overhead of running a full Urbit node. Plunder can spawn these with little additional overhead; they can be long lived or ephemeral. 



























Plunder is a reaction to the corporate and governmental encroachment on private life. Everywhere we turn there are powerful centralized institutions attempting to exercise control over society. Some are motivated by profit, others motivated by ideology; all of them opaque to those they seek to influence. We firmly reject this state of affairs.



As Eric Hughes reminded us in A Cypherpunk's Manifesto, “Privacy is necessary for an open society in the electronic age.” We believe the personal communications you have on the internet should be as private as the words you utter in your home. By communication, we mean any exchange of information between any consenting parties whatsoever. We believe the gradual abandonment of this traditional liberal principle is a threat to the security and prosperity of our world. This does not mean that we endorse speech without accountability, or action without oversight, but we reject the notion that these virtues can only be cultivated through industrial-scale censorship.



Our project is also a rejection of the 20th century activist strategy. Activism implicitly recognizes the authority of the structure it attempts to modify, otherwise why appeal to it at all? Given the advanced state of institutional decay in western society, we think such an appeal would be useless at best, and counter-productive at worst.



A successful version of Plunder is a realistic alternative to the existing control structures. By control structures, we mean the tools of information propagation and filtering, which through conscious direction, circumscribe the realm of the “possible.” We do not seek to modify or reform these structures—we aim to displace them. But what is the alternative? 



Plunder’s goal is to create a computing system for tightly connected communities, loosely bound to one another, but with shared foundational infrastructure. Like a federated constitution, this infrastructure needs to be sufficiently opinionated to be useful, but flexible enough to permit broad and deep experimentation. Human societies have always been networks, but ours is the most networked in history. If we are to take seriously the challenges of our time, individuals must have control over their networks and the tools for maintaining or modifying them.



These are democratic ideals rooted in the tradition of American independence and self-determination. The difference is, politics in the 21st century is technical.
