# About
Set of instructions to use with VSCode copilot extension for Front-End TypeScript + HTML + SCSS project. Works with Angular. Should work for a project with Python alongside too (contains default suggested instructions for Python language)

# How to enable
Suggested way of enabling is to:
- clone the project to some place outside any other project, e.g. `~/copilot-instructions` or `<user-data>/copilot-instructions`
- set this path as additional source path for copilot instructions, chatmodes and prompts in VSCode. Setting names are:
  - instructions: 
    - setting name: `chat.instructionsFilesLocations`
    - example value: ~/copilot-instructions/instructions
  - prompts:
    - setting name: `chat.promptFilesLocations`
    - example value: ~/copilot-instructions/prompts
  - chat modes:
    - setting name: `chat.modeFilesLocations`
    - example value: ~/copilot-instructions/agents
- make sure to enable them in the config

If you want guidance that is active on **every chat prompt**, not only when a file instruction matches, also place or symlink `github/copilot-instructions.md` into the target project's `.github/copilot-instructions.md`. That file is the workspace-level always-on instruction surface for GitHub Copilot Chat.

Alternatively you can create symlinks from this repository folders to your project `.github` folder, eg.:
`ln -s <FULL-absolute-path-to-this-repo>/agents <FULL-absolute-path-to-your-project>/.github/agents`
Be mindful of trailing slashes and relative paths when creating symlinks.

When using the symlink approach, also symlink `github/copilot-instructions.md` to `<project>/.github/copilot-instructions.md` if you want the thinking guidance to apply on every user prompt.


# Codex line
This repository now also contains a Codex-native equivalent under `codex/`, organized as a project-local `.codex` style workspace.

Suggested way of using it:
- point your Codex project instructions to `codex/AGENTS.md`
- keep Codex skills in scope from `codex/skills/`
- use `codex/references/` for shared instruction material
