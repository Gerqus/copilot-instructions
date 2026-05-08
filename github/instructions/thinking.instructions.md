---
applyTo: "**"
description: This file contains thinking approach instructions. It should be applied to all files in the project.
---
Before starting work, explain to yourself what is the scope of request and work, what are the dependencies and main subject. If unsure - deduce from whole project context and best coding practices. Get to know the files and code in scope.

Strive for understanding the whole context.

When planning your work, perform a dry code modifications in your mind - imagine how you would change the code step by step to achieve the goal. Visualize the code logic flow and data flow and what your changes do with them.

When tests are part of the work, reason in TDD order: define a behavior-first test that surfaces the bug or missing behavior through observable output, state, public contract, or user-visible result first, verify that failure reveals in correct place lack of logic that is yet to be implemented, then proceed with the smallest implementation change to move from red to green. Do not treat private-helper checks, internal call ordering/counts, or mock choreography as sufficient TDD evidence unless that interaction is the explicit contract.

In your thinking apply Occam's Razor - prefer the simplest solution that works.

After making a decision, change in code or approach, invoke the #skill:sanity-check to consider reasons for it from project and task perspective and potential consequences of introducing it (a "why-whatFor" thinking). Use it frequently and don't shy from adjusting changes, code of approach at question according to this check reasoning.
