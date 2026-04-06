# Prompts & Phrases Guide

A reference for getting the most out of the QAI Lab Atomic Design skill across any supported agent.

---

## Minimum viable trigger

These phrases alone are enough to activate the skill:

```
Build a mobile app for [product].
```

```
Build a website for [product].
```

```
Design a mobile application for [product].
```

```
Create a dashboard UI for [product].
```

```
Build a web app for [product].
```

---

## Strong prompt pattern (recommended)

Use this structure for the best results. It removes ambiguity and tells the agent exactly what you expect.

```
Build a [mobile app / website / web app / dashboard] for [product description].
Apply the QAI Lab atomic design method.

Target: [platform — iPhone, Android, web, cross-platform]
Audience: [who uses this]
Need:
- [screen or feature 1]
- [screen or feature 2]
- [screen or feature 3]

Tone: [modern / minimal / technical / bold / etc.]

Give me:
1. Product Scope
2. Assumptions
3. Atoms
4. Molecules
5. Organisms
6. Templates
7. Pages / Screens
8. Implementation Mapping

Do not skip the design hierarchy. Do not jump to code first.
```

---

## Example prompts by product type

### Mobile app

```
Build a mobile application for athlete recovery tracking.
Apply qailab-atomic-design.
Target: iPhone first, later responsive web.
Need: onboarding, dashboard, daily check-in, recovery trends, AI insight panel, profile, settings.
Do not skip atoms, molecules, organisms, templates, and screens.
```

```
Build a mobile app for personal finance management.
Use the QAI Lab atomic design process.
Target: iOS and Android.
Need: account overview, transaction history, budget tracker, savings goals, notifications.
Tone: clean, trustworthy, minimal.
Give me the full atomic hierarchy before any code.
```

```
Design a mobile application for a telemedicine platform.
Apply the atomic design skill.
Target: iPhone first.
Need: patient onboarding, appointment booking, video consult screen, health records, messaging.
Produce atoms through screens before implementation.
```

### Website

```
Build a website for QAI Lab research collaborations.
Use the qailab-atomic-design skill.
Need: homepage, research page, collaborations page, about page, contact page.
Tone: modern, technical, credible, research-forward.
Give me the atomic design hierarchy before any implementation.
```

```
Build a marketing website for a SaaS product.
Apply qailab-atomic-design.
Need: hero section, features page, pricing page, testimonials, blog, contact.
Tone: bold, conversion-focused.
Produce the full component hierarchy first.
```

```
Design a portfolio website for a UX designer.
Use the atomic design method.
Need: home, work/case studies, about, contact.
Tone: minimal, elegant.
Give me atoms through pages before any code.
```

### Dashboard / web app

```
Build a dashboard UI for a sports analytics platform.
Apply the QAI Lab atomic design skill.
Target: desktop web, responsive to tablet.
Need: team overview, player stats, game history, AI insights panel, settings.
Produce the atomic hierarchy first.
```

```
Design a web app for project management.
Use qailab-atomic-design.
Target: desktop web.
Need: project board, task detail view, team members, timeline, notifications, settings.
Tone: productive, focused, minimal.
Give me the full design hierarchy before implementation.
```

### Cross-platform

```
Build a cross-platform product for fitness coaching.
Apply qailab-atomic-design.
Target: iPhone app and responsive web.
Need: coach dashboard, client profiles, workout builder, progress tracking, messaging.
Define a shared design language first, then platform-specific templates and screens.
```

---

## Phrases that maximize output quality

Add any of these to your prompt to get more thorough responses:

- `Do not skip the design hierarchy.`
- `Give me atoms through pages before any code.`
- `Produce the full atomic hierarchy first.`
- `Do not jump to implementation.`
- `Include component states (default, loading, error, empty, success).`
- `Include reuse rules.`
- `Map to [SwiftUI / React / HTML/CSS] after the hierarchy.`
- `Include a suggested folder structure.`
- `Include design token naming.`
- `Include accessibility considerations.`
- `Include responsive breakpoint assumptions.`

---

## Gemini CLI usage

After installing the command:

```
/commands reload
/qailab:atomic-design Build a mobile app for rehab progress tracking with onboarding, dashboard, and AI insights.
```

---

## Kiro CLI usage

With the custom agent installed:

```
Build a mobile application for athlete monitoring.
Use the QAI Lab atomic design process.
Target: iPhone first, then responsive web.
Need: onboarding, dashboard, recovery trends, AI insights, settings.
```

Or invoke the agent directly if configured:

```
@qailab-atomic-designer Build a website for a research lab with homepage, research page, and contact page.
```

---

## What a good response looks like

A compliant agent response will contain all of these sections in order:

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

If the agent jumps straight to page code or skips atoms and molecules, the skill was not applied correctly. Re-prompt with: `Apply the QAI Lab atomic design method and start from atoms, not pages.`

---

## What a weak response looks like

Watch out for these failure patterns:

- Response starts with a full page or screen layout immediately
- No atoms or design tokens defined
- Molecules and organisms are skipped
- Templates and pages are treated as the same thing
- No component states defined
- No reuse rules mentioned

If you see these, add this to your next message:

```
You skipped the atomic hierarchy. Start over from Phase 1. Define tokens and atoms first before any page or screen.
```
