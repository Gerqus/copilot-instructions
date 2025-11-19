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

Alternatively you can create symlinks from this repository folders to your project `.github` folder, eg.:
`ln -s <path-to-this-repo>/agents <path-to-your-project>/.github/agents`
Be mindful of trailing slashes and relative paths when creating symlinks.
