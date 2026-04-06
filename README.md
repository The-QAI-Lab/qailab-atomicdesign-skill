# qailab-atomicdesign-skill
**Author: William McDonald | University of North Carolina | Founder & Head Scientist at the QAI Lab**

A GitHub-ready agent skill pack that enforces an **Atomic Design workflow** for building mobile apps, websites, dashboards, and cross-platform product UIs.

This repository is built around a single canonical skill:

- `skills/qailab-atomic-design/SKILL.md`

With adapters and examples for:

- Kiro CLI
- Claude Code
- Codex
- Cursor
- GitHub Copilot
- Gemini CLI
- OpenClaw

---

## What this skill does

When an agent detects prompts such as:

- `Build a mobile application`
- `Build a mobile app`
- `Build a website`
- `Design a mobile app`
- `Design a website`
- `Create a dashboard UI`

the skill instructs the agent to **avoid jumping straight into pages or code** and instead move through a disciplined design sequence:

1. Define product scope and constraints
2. Define design tokens and **atoms**
3. Compose **molecules**
4. Compose **organisms**
5. Build **templates**
6. Build **pages / screens**
7. Map implementation to the target platform
8. Validate reuse, responsiveness, accessibility, and consistency

---

## Repo layout

```text
qailab-atomicdesign-skill/
├── README.md
├── PROMPTS.md
├── LICENSE
├── skills/
│   └── qailab-atomic-design/
│       ├── SKILL.md
│       └── resources/
│           ├── activation-phrases.md
│           ├── workflow-checklist.md
│           ├── output-contract.md
│           └── platform-mapping.md
├── .gemini/
│   └── commands/
│       └── qailab/
│           └── atomic-design.toml
├── .kiro/
│   └── agents/
│       └── qailab-atomic-designer.json
├── examples/
│   ├── prompts/
│   │   ├── mobile-app-request.md
│   │   └── website-request.md
│   └── outputs/
│       ├── expected-architecture-outline.md
│       └── expected-component-breakdown.md
└── scripts/
    └── install-skill.sh
```

---

## Quick start — install with the script

From the root of your project, run:

```bash
# Install for all supported agents
bash scripts/install-skill.sh all

# Install for a specific agent
bash scripts/install-skill.sh kiro
bash scripts/install-skill.sh claude
bash scripts/install-skill.sh cursor
bash scripts/install-skill.sh copilot
bash scripts/install-skill.sh gemini
```

---

## The design method enforced by this skill

The skill uses **Atomic Design** as the primary UI decomposition method.

### Layers

- **Atoms** — Smallest reusable UI primitives: color tokens, spacing tokens, typography styles, icons, buttons, inputs, badges, avatar shells.
- **Molecules** — Small combinations of atoms that solve a focused interface problem: labeled input rows, stat rows, CTA groups, search bars.
- **Organisms** — Larger reusable sections: navbars, login modules, dashboards, feed cards, hero blocks, onboarding panels, settings sections.
- **Templates** — Layout structures and screen skeletons without final production content.
- **Pages / Screens** — Fully realized screens with real content, data bindings, and states.

### Why this matters

Without this workflow, agents skip directly to pages or components that are too large and too brittle. This skill prevents that by making the agent:

- classify every UI element into the atomic hierarchy
- prioritize reuse before creating new components
- define tokens before page implementation
- separate layout concerns from content concerns
- produce a cleaner handoff for SwiftUI, React, web, and hybrid projects

---

## Prompts and phrases

See **[PROMPTS.md](./PROMPTS.md)** for a full guide including:

- Minimum viable trigger phrases
- Strong prompt patterns
- Example prompts by product type (mobile app, website, dashboard, cross-platform)
- Phrases that maximize output quality
- How to recover when an agent skips the hierarchy

---

## Install and use with Kiro CLI

Kiro CLI supports project and global skill directories:

- `.kiro/skills/` (project-level)
- `~/.kiro/skills/` (global)

### Manual install

```bash
mkdir -p .kiro/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md .kiro/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources .kiro/skills/qailab-atomic-design/
```

### Custom agent

Use `.kiro/agents/qailab-atomic-designer.json` from this repo as a starter. It wires the skill into a Kiro custom agent with all resource files referenced.

### Prompt example

```
Build a mobile app for rehab progress tracking.
Use the QAI Lab atomic design process and produce the component hierarchy first.
```

---

## Install and use with Claude Code

### Manual install

```bash
mkdir -p .claude/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md .claude/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources .claude/skills/qailab-atomic-design/
```

### Prompt example

```
Let's build a mobile application for a sports science lab.
Use the qailab-atomic-design skill and do not skip atoms, molecules, organisms, templates, and screens.
```

---

## Install and use with Codex

### Manual install

```bash
mkdir -p .codex/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md .codex/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources .codex/skills/qailab-atomic-design/
```

### Prompt example

```
Build a website for a sports analytics platform.
Use qailab-atomic-design and give me the atomic hierarchy before code.
```

---

## Install and use with Gemini CLI

Gemini CLI supports custom commands in:

- `~/.gemini/commands/`
- `<project>/.gemini/commands/`

This repo includes `.gemini/commands/qailab/atomic-design.toml`.

### Install

```bash
mkdir -p .gemini/commands/qailab
cp .gemini/commands/qailab/atomic-design.toml .gemini/commands/qailab/atomic-design.toml
```

### Use it

```
/commands reload
/qailab:atomic-design Build a mobile app for athlete readiness with onboarding, dashboard, alerts, and profile.
```

---

## Install and use with Cursor

### Manual install

```bash
mkdir -p .cursor/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md .cursor/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources .cursor/skills/qailab-atomic-design/
```

### Recommended Cursor rule

Add a project rule that tells Cursor when to apply the skill:

```
When asked to build a mobile app, mobile application, website, or product UI, use the qailab-atomic-design skill. Do not jump straight to pages or implementation. First produce atoms, molecules, organisms, templates, then pages/screens.
```

---

## Install and use with GitHub Copilot

### Manual install

```bash
mkdir -p .github/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md .github/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources .github/skills/qailab-atomic-design/
```

### Prompt example

```
Build a website for a research lab and use the qailab-atomic-design skill.
```

---

## Install and use with OpenClaw

### Manual install

```bash
mkdir -p ~/.openclaw/workspace/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md ~/.openclaw/workspace/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources ~/.openclaw/workspace/skills/qailab-atomic-design/
```

### Prompt example

```
Build a mobile application for athlete monitoring. Use qailab-atomic-design.
```

---

## Expected agent behavior

A compliant agent should respond by producing:

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

If the agent jumps straight into page code without component decomposition, it is **not following the skill correctly**. See [PROMPTS.md](./PROMPTS.md) for recovery phrases.

---

## Included files explained

| File | Purpose |
|------|---------|
| `skills/qailab-atomic-design/SKILL.md` | Main skill contract — primary source of truth |
| `resources/activation-phrases.md` | Phrases that should activate the skill |
| `resources/workflow-checklist.md` | Concise execution checklist for the agent |
| `resources/output-contract.md` | Defines the shape of a good agent response |
| `resources/platform-mapping.md` | Maps atomic method to SwiftUI, React, HTML/CSS |
| `.gemini/commands/qailab/atomic-design.toml` | Gemini CLI command adapter |
| `.kiro/agents/qailab-atomic-designer.json` | Kiro CLI custom agent starter config |
| `scripts/install-skill.sh` | Install script for all supported agents |
| `PROMPTS.md` | Full prompts and phrases guide |

---

## License

MIT
