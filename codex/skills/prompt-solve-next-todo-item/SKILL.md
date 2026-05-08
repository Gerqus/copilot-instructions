---
name: prompt-solve-next-todo-item
description: 'Codex-native counterpart of `/home/projekty/copilot-instructions/prompts/Solve_next_todo_item.prompt.md`.'
argument-hint: 'Prompt context and required inputs'
user-invocable: true
metadata: {
  "skill": "prompt-solve-next-todo-item",
  "line": "codex",
  "counterpart": "/home/projekty/copilot-instructions/prompts/Solve_next_todo_item.prompt.md",
  "type": "prompt-counterpart"
}
---

# Prompt Counterpart: Solve_next_todo_item

Source prompt: `/home/projekty/copilot-instructions/prompts/Solve_next_todo_item.prompt.md`
Target agent (original): `N/A`

## Prompt Content

I need you to have a look at #file:TODO.md and pick up first from the top task of highest severity tasks and work on resolving it.
Keep in mind we are still fixing MVP. Do not introduce target production architecture yet.
Your current goal is to follow description and requirements of picked task and fix slowly and systematically every point from the item description, steps and actions.
Remember about running app to check if it still FULLY works after your changes to confirm EACH and EVERY todo step you will create will be done, operational and FUNCTIONAL in context of whole project.
Remember about using TDD approach with behavior-first tests: assert observable output/state/public contract/user-visible behavior, not implementation details, unless the interaction itself is the explicit contract.
As part of your handoff remove the entry that you have worked on from TODO.md file after determining it confidently as done by confirming changed/implemented functionality is successful and full (this confirmation should be part of your definition of done)
**Never use piping to head or tail!!!**
