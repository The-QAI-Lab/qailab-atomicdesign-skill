---
name: qailab-atomic-design
description: Enforce an Atomic Design workflow for mobile apps, mobile applications, websites, dashboards, and cross-platform product UI. Use this when the user asks to build or design a mobile app, mobile application, website, web app, dashboard UI, landing page, or product interface. Prevent direct page-level implementation before defining atoms, molecules, organisms, templates, and pages/screens.
license: MIT
---

# QAI Lab Atomic Design Skill

## Purpose

This skill forces the agent to use a disciplined **Atomic Design** workflow whenever the user asks to build or design:

- a mobile app
- a mobile application
- a website
- a web app
- a landing page
- a dashboard UI
- a product interface
- a responsive cross-platform UI

This skill exists to stop common agent failure modes:

1. jumping straight to page code
2. creating oversized components with mixed concerns
3. skipping design tokens
4. duplicating UI primitives
5. mixing layout, behavior, and content too early

The expected result is a cleaner design system, stronger reuse, and better handoff to implementation.

---

## Activation signals

Activate this skill when the user says or strongly implies any of the following:

- build a mobile app
- build a mobile application
- let's build a mobile application
- build a website
- build a web app
- design a mobile app
- design a website
- create a landing page
- design a dashboard
- make a responsive UI
- build an iOS app
- build a SwiftUI app
- build a React website
- build a frontend

Also activate when the user does not use these exact phrases but the request is clearly about creating a new product UI.

---

## Core operating rule

**Do not produce final pages or implementation-first code until the atomic hierarchy has been defined.**

That means:

- define tokens and atoms first
- compose molecules next
- compose organisms next
- define templates next
- define pages/screens last
- only then begin implementation planning or code generation

If the user explicitly asks for code immediately, still provide a compressed atomic decomposition before the code unless they directly instruct you to skip the method.

---

## Required workflow

Follow these phases in order.

### Phase 1 — Clarify the product frame

Determine and state:

- product type
- target users
- primary jobs to be done
- target platforms
- required screens/pages
- key data objects
- constraints
- visual tone if provided
- accessibility or responsiveness requirements if provided

If some details are missing, make reasonable assumptions and clearly label them as assumptions.

### Phase 2 — Define design tokens and atoms

List the foundational primitives that will be reused across the system.

Include, where applicable:

- color tokens
- typography scale
- spacing scale
- border radius tokens
- elevation/shadow tokens
- icon set assumptions
- button variants
- input variants
- badges
- chips
- avatars
- dividers
- loading indicators
- empty states
- base cards

For mobile, include touch target and navigation assumptions.
For web, include responsiveness and breakpoint assumptions.

### Phase 3 — Define molecules

Compose small functional combinations of atoms.

Examples include:

- labeled input field
- password field with helper text
- search bar
- KPI row
- CTA group
- notification item
- progress stat row
- tab trigger group
- segmented filter control
- profile summary strip

Each molecule should have:

- name
- purpose
- atoms used
- major states
- likely reuse contexts

### Phase 4 — Define organisms

Compose larger reusable sections made from molecules and atoms.

Examples include:

- top navigation bar
- side navigation
- onboarding card stack
- dashboard summary section
- hero section
- AI insights panel
- analytics chart module
- settings block
- account security block
- content feed section
- modal or drawer module

Each organism should have:

- name
- purpose
- child molecules/atoms
- layout behavior
- major states
- responsive/mobile behavior

### Phase 5 — Define templates

Define screen/page structures without final production content.

For each template include:

- template name
- purpose
- major regions
- organisms placed within it
- responsive behavior
- navigation placement
- content priority

Templates should be structural, not content-heavy.

### Phase 6 — Define pages / screens

Define final user-facing pages/screens.

For each page or screen include:

- name
- user goal
- template used
- organisms present
- key interactions
- empty/loading/error/success states
- data dependencies

Pages must map back to templates and organisms. Nothing should appear on a page unless it can be traced down the hierarchy.

### Phase 7 — Produce implementation mapping

After the design hierarchy is complete, map the system into the requested implementation environment.

Examples:

#### For SwiftUI / iOS

- Atoms → primitive views, theme tokens, `ButtonStyle`, `TextStyle`, color constants
- Molecules → small composable `View`s
- Organisms → section-level `View`s
- Templates → layout containers and shell views
- Screens → feature views and navigation destinations

#### For React / web

- Atoms → tokens, primitive components, utilities
- Molecules → small composite components
- Organisms → feature sections
- Templates → page shells/layout routes
- Pages → route-level screens

#### For HTML/CSS prototypes

- Atoms → utility classes / tokens
- Molecules → partials/snippets
- Organisms → larger sections
- Templates → page structures
- Pages → content-filled HTML documents

---

## Mandatory output structure

When this skill is active, structure the response using this sequence:

1. Product Scope
2. Assumptions
3. Atoms
4. Molecules
5. Organisms
6. Templates
7. Pages / Screens
8. Reuse Rules
9. Implementation Mapping
10. Next Build Step

If the user asks for code, append:

11. Starter File/Folder Structure
12. Initial Code Plan

---

## Reuse rules

You must enforce all of the following:

- Reuse an existing atom before inventing a new atom.
- Reuse an existing molecule before inventing a new molecule.
- Do not create page-specific atoms.
- Do not create page-specific molecules unless absolutely necessary.
- Every organism must be reusable in at least one other realistic context, or explicitly justify why it is page-bound.
- Pages must only assemble templates, organisms, molecules, and atoms.
- Layout logic belongs higher in the hierarchy than atom styling.
- Token decisions should be centralized.
- Accessibility and responsive concerns should be considered from the atom layer upward.

---

## State modeling rules

For any meaningful component, identify relevant states such as:

- default
- hover (web)
- active
- focused
- disabled
- loading
- empty
- error
- success
- selected
- expanded/collapsed

Do not describe only the happy path.

---

## Platform-specific guidance

### Mobile-first guidance

When the target includes mobile apps:

- prefer concise navigation depth
- use thumb-reachable interaction assumptions when relevant
- call out tab bars, stacks, sheets, bottom actions, and cards
- keep molecules and organisms suitable for small screens
- define touch target and scrolling assumptions
- note offline or low-connectivity implications if relevant

### Web-first guidance

When the target includes websites or web apps:

- define breakpoint assumptions
- identify desktop/tablet/mobile layout transitions
- consider hover/focus semantics
- identify route-level pages
- separate persistent chrome from page content
- account for accessibility semantics and keyboard navigation

### Cross-platform guidance

If the user wants both mobile and web:

- define a shared design language first
- identify which atoms can be identical conceptually across platforms
- identify molecules and organisms that can stay conceptually aligned while implementation differs
- treat templates and pages/screens as platform-specific unless clearly shared

---

## Handoff behavior

After producing the hierarchy, ask what the user wants next only if necessary. Otherwise continue with the most logical next artifact, such as:

- component inventory
- folder structure
- design tokens file
- SwiftUI architecture
- React architecture
- screen-by-screen implementation plan
- starter code scaffold

Do not restart the design process from zero unless the user changes the product direction.

---

## Anti-patterns to avoid

Do not:

- jump directly to a full homepage or dashboard mock without decomposition
- bury design tokens inside page code
- produce one huge “Card” component that tries to do everything
- create organisms with no reusable role
- skip states
- mix visual tokens with business logic
- treat templates and pages as the same thing

---

## Example response pattern

### User
Build a mobile application for athlete recovery tracking.

### Good response pattern
- Define scope: rehab athletes, clinicians, iPhone-first
- Define atoms: colors, type scale, buttons, form fields, stat badges
- Define molecules: readiness row, symptom slider block, progress metric row
- Define organisms: dashboard summary, recovery trends card group, AI insights panel, profile section
- Define templates: dashboard template, check-in template, history template, settings template
- Define screens: Home, Daily Check-In, Trends, Profile, Settings
- Map to SwiftUI structure

### Bad response pattern
- Immediately write a monolithic `HomeScreen.swift` with all controls inline

---

## Reference files in this skill

Consult these bundled files when useful:

- `resources/activation-phrases.md`
- `resources/workflow-checklist.md`
- `resources/output-contract.md`
- `resources/platform-mapping.md`

Use them as supporting context, but follow this `SKILL.md` as the primary contract.
