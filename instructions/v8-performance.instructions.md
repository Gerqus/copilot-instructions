---
applyTo: "**/*.ts,**/*.tsx,**/*.js,**/*.jsx"
description: This file contains TypeScript coding standards. It should be applied to all TypeScript code files in the project.
---
# Project coding standards for performance optimization
- Use memoization to cache results of expensive function calls and avoid redundant calculations.
- Use lazy loading to defer loading of non-critical resources until they are needed.
- Use code splitting to break down large bundles into smaller, more manageable chunks that can be loaded on demand.
- Use tree shaking to eliminate unused code from the final bundle.
- Use virtualization to render only the visible portion of large lists or tables, improving rendering performance.
- Use web workers to offload heavy computations to a separate thread, preventing UI blocking.
- Use requestAnimationFrame for smooth animations and to optimize rendering performance.
- Use debouncing and throttling to limit the frequency of function calls in response to user input or events.
- Use efficient data structures and algorithms to optimize performance-critical code:
    - Prefer using maps and sets over objects and arrays for lookups and membership checks.
    - Remember that V8 keeps objects blueprints in hidden classes and optimizes property access patterns. Never add or remove properties from once created objects.
    - Prefer using BufferArray and TypedArray for numerical data processing.
    - Remember that JavaScript engines optimize for contiguous memory access patterns.
    - Utilize V8 inline caching by keeping function signatures consistent.
    - Utilize V8 optimizing compiler by avoiding de-optimizing patterns (e.g., using `with` statement, deleting properties).
    - When Arrays are used, do not remove elements manually. Use shift, unshift, pop, push and splice methods instead.
    - Remember about SMI, DOUBLE, OBJECT and EXOTIC representations in V8 and prefer faster representations.
    - Use classes, extensions and factories instead of plain objects inline definitions.
- Always use C-style loops (for, while) instead of forEach, map, filter and reduce methods on Arrays.
- Use functions with fixed number of parameters and of consistent type and shape of parameters. Avoid using rest parameters and arguments object.
- Use algorithms with better time complexity (e.g., O(log n) or O(n)) for large datasets.
- Avoid nested loops and recursive functions where possible.
- Remember that V8 optimizes for monomorphic functions. Avoid polymorphic functions.
- Remember that V8 optimizes for predictable control flow. Avoid using try-catch blocks in performance-critical code.
