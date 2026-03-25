---
applyTo: "**"
description: This file contains instructions for architecture organisation and modularization.
---
# Architecture Instructions
- Search for, read, understand and respect project-specific architecture.md/architecture.overview.md or other similar architecture documentation file in project #codebase
- Design the architecture to be modular, allowing for easy addition, removal, or modification of components without affecting the entire system.
- Abstract away the logic by organizing code into distinct layers (e.g., presentation, business logic, data access). Goal of abstracting is to make lower layers interchangeable without affecting upper layers. This layers stack should follow the Dependency Inversion Principle.
- Ensure that each component of each layer has a single responsibility and adheres to the Single Responsibility Principle
- Encapsulate related functionalities into components within layers. Use Liskov Substitution Principle when extending existing components.
- Promote reusability by designing components that can be easily reused across different parts of the application.
- Use closed layers approach where each layer can only interact with the layer directly below it. This helps to maintain a clear separation of concerns and reduces dependencies between layers.
- A fall-through interaction is discouraged, where a request can pass through multiple layers. Each layer should be meaningful. If it's not, consider changing problem solution approach.
- Define clear interfaces for each module or service to facilitate communication and integration.
- The following layers are recommended (from top to bottom):
  - Presentation/UI Layer: Handles user interface and user experience, produces what will than face the user. Examples: view templates, view controllers
  - Business Layer: Manages application workflows.
  - Domain/Service Layer: Contains domain and core logic.
  - Infrastructure Layer: Handles data storage and manages retrieval.
  - Data Access Layer: Responsible for direct interaction with databases or external data sources.
- Formulate logic columns across layers for specific features or functionalities. Each column should encapsulate all necessary components from each layer to implement a complete feature. This promotes feature-centric development and easier maintenance. Columns can span through different layers but should remain cohesive and focused on a single feature or functionality.
- Regularly review and refactor the architecture to ensure it remains modular, maintainable, and aligned with best practices.
- When planning or implementing new features or changes, start from the highest layer (Presentation/UI Layer) and work your way down to the lowest layer (Data Access Layer). This top-down approach ensures that user needs and experiences are prioritized throughout the development process.
- About files structure - each module should be encapsulated with a single system-facing service and the rest hidden inside own sub-folders, e.g.
```
src/Infrastructure/Mdsws
├── MdswsXmlTransport.php   <-- the only system-facing service
├── Auxiliary
│   └── MdswsEndpointSet.php
└── Models
    ├── MdswsXmlTransportException.php
    └── MdswsXmlTransportResponse.php
```
or
```
src/Service/Email
├── EmailingService.php   <-- the only system-facing service
├── Auxiliary
│   ├── EmailSanitizer.php
│   ├── MimeMessageBuilder.php
│   ├── SmtpTransport.php
│   ├── TemplateRenderer.php
│   └── TemplateRepository.php
├── Models
│   ├── CustomerContactConfig.php
│   ├── EmailConfig.php
│   ├── EmailFromConfig.php
│   ├── EmailMessage.php
│   ├── EmailTypeConfig.php
│   └── SmtpConfig.php
└── Types
    └── MailException.php
```
