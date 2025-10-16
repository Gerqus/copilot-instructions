---
applyTo: "**"
description: This file contains coding standards, development guidelines, set of good practices and such. It should be applied to all code files in the project.
---
**Carefully follow ALL of the rules listed below**:
- Modularize the code as blackboxes (private logic and public interfaces)
- Prefer using installed packages over writing own code
- When making changes always reuse existing functions and methods if possible.
- Reduce boilerplate.
- **ALWAYS write code using principles of SOLID, ACID (atomicity, consistency, isolation, and durability), DRY, KISS and YAGNI**
- Functions should avoid side effects.
- Methods should prefer getting data through `this` keyword instead of parameters when possible.
- Insert logic into existing files with similar logic.
- Use available utility functions.
- If old methods can be replaced with new ones - replace them. If they are not used any more - remove them.
- Keep the project tidy and organized.
- When refactoring, keep logically connected areas together.
- Prefer shorter files.
- Precisely follow instructions - do not add anything not mentioned and not necessary to complete the task successfully.
- If you write a function or method - check if such functionality does not exist already. Reuse it. If it's scattered in many instances across the project - refactor to use one method in place of all that occurrences for maintainability.
- BackEnd is THE SOLE authority of application state. It decides whether user is logged in, who they are, what they can do and what data they can access.
- NEVER trust FrontEnd with anything - inputs, reports, identity, host. Consider it hostile environment.
- On BackEnd always sanitize and validate all inputs coming *from FrontEnd*.
- For each functionality maintain only one source of truth. If something is defined in one place - do not redefine it somewhere else, but reuse the original definition and derive from it.
- centralize repetitive logic into reusable functions and methods
- centralize repetitive functionalities into reusable services
- try and reuse existing logic and functionalities and derive from them and bild off of them as much as possible
- no fallbacks. Create one, robust solution that will work.
