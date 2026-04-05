# qailab-atomicdesign-skill
# Author: William McDonald | University of North Carolina | Founder & Head Scientist at the QAI Lab
A GitHub-ready agent skill pack that enforces an **Atomic Design workflow** for building mobile apps, mobile application UIs, websites, and cross-platform products.

This repository is built around a single canonical skill:

- `skills/qailab-atomic-design/SKILL.md`

Then it adds lightweight adapters and examples for:

- OpenClaw
- Claude Code
- Codex
- Kiro CLI
- Gemini CLI
- Cursor
- GitHub Copilot
- Cursor Agent / Copilot Agent style workflows

---

## What this skill does

When an agent detects prompts such as:

- `Build a mobile application`
- `Let's build a mobile application`
- `Build a mobile app`
- `Build a website`
- `Let's build a website`
- `Design a mobile app`
- `Design a website`

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

## The design method enforced by this skill

The skill uses **Atomic Design** as the primary UI decomposition method.

### Layers

- **Atoms**  
  Smallest reusable UI primitives such as color tokens, spacing tokens, typography styles, icons, buttons, inputs, badges, and avatar shells.

- **Molecules**  
  Small combinations of atoms that solve a focused interface problem such as labeled input rows, stat rows, CTA groups, toggle rows, and search bars.

- **Organisms**  
  Larger reusable sections such as navbars, login modules, dashboards, feed cards, hero blocks, onboarding panels, and settings sections.

- **Templates**  
  Layout structures and screen skeletons without final production content.

- **Pages / Screens**  
  Fully realized screens containing real content, data bindings, and states.

### Why this matters

Without this workflow, many agents skip directly to pages or components that are too large and too brittle. This skill prevents that drift by making the agent:

- classify every UI element into the atomic hierarchy
- prioritize reuse before creating new components
- define tokens before page implementation
- separate layout concerns from content concerns
- produce a cleaner handoff for SwiftUI, React, web, and hybrid projects

---

## Recommended usage pattern

### Human prompt pattern

Use natural prompts like:

```text
Build a mobile app for athlete recovery tracking.
Use the QAI Lab atomic design method.
Target: iPhone first, then responsive web.
Need: onboarding, dashboard, recovery trends, AI insights, settings.
```

Or:

```text
Build a website for QAI Lab research collaborations.
Use the atomic design skill.
Need: homepage, research page, collaborations page, contact page.
```

### Expected agent behavior

A compliant agent should respond by first producing something like:

1. Product scope
2. Atomic inventory
3. Molecule list
4. Organism list
5. Template list
6. Screen/page map
7. Implementation strategy

If the agent jumps straight into page code without component decomposition, it is **not following the skill correctly**.

---

## Install and use with OpenClaw

OpenClaw uses workspace skills stored under:

- `~/.openclaw/workspace/skills/<skill>/SKILL.md`

### Manual install

```bash
mkdir -p ~/.openclaw/workspace/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md ~/.openclaw/workspace/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources ~/.openclaw/workspace/skills/qailab-atomic-design/
```

### Recommended prompt

```text
Build a mobile application for athlete monitoring. Use qailab-atomic-design.
```

### OpenClaw notes

OpenClaw supports an agent workspace and skill directories under the workspace path, with skills stored as `~/.openclaw/workspace/skills/<skill>/SKILL.md`. Official repo docs also note injected prompt files such as `AGENTS.md`, `SOUL.md`, and `TOOLS.md`, which means you can combine this skill with broader behavior instructions. citeturn907822view0

---

## Install and use with Claude Code

The open agent skills ecosystem and `skills` CLI support Claude Code project skills under:

- `.claude/skills/`
- `~/.claude/skills/`

### Manual install

```bash
mkdir -p .claude/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md .claude/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources .claude/skills/qailab-atomic-design/
```

### Via skills CLI

```bash
npx skills add . --skill qailab-atomic-design -a claude-code
```

### Prompt example

```text
Let's build a mobile application for a sports science lab.
Use the qailab-atomic-design skill and do not skip atoms, molecules, organisms, templates, and screens.
```

---

## Install and use with Codex

The open agent skills ecosystem supports Codex paths at:

- `.codex/skills/`
- `~/.codex/skills/` citeturn784729view0turn907822view5

### Manual install

```bash
mkdir -p .codex/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md .codex/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources .codex/skills/qailab-atomic-design/
```

### Via skills CLI

```bash
npx skills add . --skill qailab-atomic-design -a codex
```

### Prompt example

```text
Build a website for a sports analytics platform.
Use qailab-atomic-design and give me the atomic hierarchy before code.
```

---

## Install and use with Kiro CLI

Kiro CLI supports project and global skill directories in the open skills ecosystem:

- `.kiro/skills/`
- `~/.kiro/skills/`

The skills CLI docs also note that after installing skills for Kiro, you should add them to a custom agent's `resources`, for example:

```json
{
  "resources": ["skill://.kiro/skills/**/SKILL.md"]
}
```

Kiro's custom agent configuration also supports `prompt` as inline text or a `file://` URI, and supports `resources` in the agent config. citeturn784729view0turn784729view2

### Manual install

```bash
mkdir -p .kiro/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md .kiro/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources .kiro/skills/qailab-atomic-design/
```

### Custom agent example

Use `.kiro/agents/qailab-atomic-designer.json` from this repo as a starter.

### Prompt example

```text
Build a mobile app for rehab progress tracking.
Use the QAI Lab atomic design process and produce the component hierarchy first.
```

---

## Install and use with Gemini CLI

Gemini CLI supports custom commands in:

- `~/.gemini/commands/`
- `<project>/.gemini/commands/`

Commands are written in TOML, can be namespaced by subdirectory, and can use `{{args}}` to inject user-provided arguments. After changing command files, the docs say to run `/commands reload`. citeturn784729view3

This repo includes:

- `.gemini/commands/qailab/atomic-design.toml`

### Use it

Copy the command file into your project or global Gemini commands directory:

```bash
mkdir -p .gemini/commands/qailab
cp .gemini/commands/qailab/atomic-design.toml .gemini/commands/qailab/atomic-design.toml
```

Then in Gemini CLI:

```text
/commands reload
/qailab:atomic-design Build a mobile app for athlete readiness with onboarding, dashboard, alerts, and profile.
```

### Important note

Gemini CLI commands are not identical to SKILL.md-based agent skills. In Gemini, the best bridge is usually:
- a reusable command wrapper
- or a project rule / prompt file that references the methodology

That is why this repo includes a command adapter in addition to the canonical skill.

---

## Install and use with Cursor

Cursor supports persistent agent behavior using rules, and its documentation distinguishes between rules for static context and skills for dynamic capabilities. The open skills ecosystem also maps project skills to `.cursor/skills/` and global skills to `~/.cursor/skills/`. citeturn671209search11turn784729view0

### Manual install

```bash
mkdir -p .cursor/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md .cursor/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources .cursor/skills/qailab-atomic-design/
```

### Best practice in Cursor

Use both:
1. the skill in `.cursor/skills/`
2. a concise project rule that tells Cursor when to apply the skill

Example rule text:

```text
When asked to build a mobile app, mobile application, website, or product UI, use the qailab-atomic-design skill. Do not jump straight to pages or implementation. First produce atoms, molecules, organisms, templates, then pages/screens.
```

---

## Install and use with GitHub Copilot

GitHub Copilot officially supports agent skills as folders containing `SKILL.md` plus optional resources. Supported project locations include:

- `.github/skills/`
- `.claude/skills/`
- `.agents/skills/`

Supported personal locations include:

- `~/.copilot/skills/`
- `~/.claude/skills/`
- `~/.agents/skills/` citeturn784729view1

### Manual install

```bash
mkdir -p .github/skills/qailab-atomic-design
cp skills/qailab-atomic-design/SKILL.md .github/skills/qailab-atomic-design/SKILL.md
cp -R skills/qailab-atomic-design/resources .github/skills/qailab-atomic-design/
```

### Prompt example

```text
Build a website for a research lab and use the qailab-atomic-design skill.
```

---

## Install and use with skills CLI

The `skills` CLI supports installing skills from local repos, GitHub URLs, or repo shorthand. It supports Claude Code, Codex, Cursor, Gemini CLI, GitHub Copilot, and Kiro CLI among many others. It also documents agent-specific install paths and recommends symlink-based installation for a single source of truth. citeturn907822view6turn784729view0

### Project-local install to several agents

```bash
npx skills add . --skill qailab-atomic-design   -a claude-code   -a codex   -a cursor   -a github-copilot   -a gemini-cli   -a kiro-cli
```

### Global install

```bash
npx skills add . --skill qailab-atomic-design --global --all
```

---

## How the trigger phrases should be handled

The skill is written so the agent should activate on phrases including:

- build a mobile app
- build a mobile application
- let's build a mobile application
- build a website
- design a mobile app
- design a website
- create a landing page
- create a dashboard ui

You can add or remove trigger phrases in:

- `skills/qailab-atomic-design/resources/activation-phrases.md`

---

## How to run it correctly in agent conversations

When the trigger phrase appears, the agent should:

1. Confirm target platform, audience, and scope
2. Produce the atomic hierarchy
3. Produce the component reuse map
4. Produce layouts/templates
5. Only then move into implementation

### Strong prompting pattern

```text
Build a mobile application for [product].
Apply qailab-atomic-design.
First give me:
1. scope
2. atoms
3. molecules
4. organisms
5. templates
6. screens
7. implementation plan
Do not skip the design hierarchy.
```

---

## Included files explained

### `SKILL.md`
The main skill contract. This is what agents should read.

### `activation-phrases.md`
Phrases that should activate the skill.

### `workflow-checklist.md`
A concise execution checklist for the agent.

### `output-contract.md`
Defines the shape of a good response from the agent.

### `platform-mapping.md`
Maps the atomic method to SwiftUI, React, HTML/CSS, and design-system thinking.

### `atomic-design.toml`
Gemini CLI command wrapper that injects the atomic workflow for command-based invocation.

### `qailab-atomic-designer.json`
Starter custom-agent config for Kiro CLI.

---

## Suggested GitHub description

**Atomic Design skill pack for OpenClaw, Claude Code, Codex, Kiro CLI, Gemini CLI, Cursor, and GitHub Copilot. Enforces atoms → molecules → organisms → templates → pages before implementation.**

---

## Suggested tags

- agent-skill
- atomic-design
- design-system
- ui-architecture
- mobile-design
- web-design
- openclaw
- claude-code
- codex
- kiro-cli
- gemini-cli
- cursor
- github-copilot

---

## License

MIT
