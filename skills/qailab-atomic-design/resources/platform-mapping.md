# Platform mapping

## SwiftUI
- Atoms: color tokens, typography tokens, spacing constants, `ButtonStyle`, primitive views
- Molecules: reusable `View` compositions such as stat rows, input groups, segmented controls
- Organisms: larger sections such as dashboards, profile blocks, onboarding modules
- Templates: screen layout shells and navigation shells
- Pages/Screens: route-level or tab-level feature views

## React / Next.js
- Atoms: tokens, button/input primitives, small presentational pieces
- Molecules: field groups, stat rows, compact cards
- Organisms: feature sections, nav blocks, feed modules, hero sections
- Templates: route layouts, content shells
- Pages: route-level screens

## HTML/CSS
- Atoms: CSS variables, base classes, primitive elements
- Molecules: reusable snippets/partials
- Organisms: large reusable sections
- Templates: page structures
- Pages: final rendered pages

## Cross-platform note
Keep the shared design language at the token/atom/molecule level when possible. Let templates and page layouts diverge by platform where needed.
