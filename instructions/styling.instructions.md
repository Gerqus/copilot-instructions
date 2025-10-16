---
applyTo: "**/*.css,**/*.scss,**/*.sass,**/*.less,**/*.styl"
description: This file contains styling standards. It should be applied to all styling files in the project.
---
# Project styling standards
- use variables for colors, fonts, sizes, and other reusable values
- use of `calc()` is allowed
- keep specificity low
- use BEM (Block Element Modifier) naming convention for classes
- keep styles modular and reusable
- **NEVER** use `!important` clause
- **NEVER** use inline styles in HTML files
- **NEVER** use standard HTML tag names as selectors (e.g., `div`, `p`, `h1`)
- avoid defining global styles
- comment complex or non-obvious code
- organize styles into logical sections
