#!/usr/bin/env bash
# QAI Lab Atomic Design Skill — Install Script
# Usage: bash scripts/install-skill.sh [agent]
# Examples:
#   bash scripts/install-skill.sh kiro
#   bash scripts/install-skill.sh claude
#   bash scripts/install-skill.sh cursor
#   bash scripts/install-skill.sh copilot
#   bash scripts/install-skill.sh gemini
#   bash scripts/install-skill.sh all

set -e

SKILL_SRC="skills/qailab-atomic-design"
AGENT="${1:-all}"

install_skill() {
  local dest="$1"
  echo "Installing to $dest ..."
  mkdir -p "$dest"
  cp "$SKILL_SRC/SKILL.md" "$dest/SKILL.md"
  cp -R "$SKILL_SRC/resources" "$dest/"
  echo "Done: $dest"
}

case "$AGENT" in
  kiro)
    install_skill ".kiro/skills/qailab-atomic-design"
    ;;
  claude)
    install_skill ".claude/skills/qailab-atomic-design"
    ;;
  cursor)
    install_skill ".cursor/skills/qailab-atomic-design"
    ;;
  copilot)
    install_skill ".github/skills/qailab-atomic-design"
    ;;
  gemini)
    mkdir -p ".gemini/commands/qailab"
    cp ".gemini/commands/qailab/atomic-design.toml" ".gemini/commands/qailab/atomic-design.toml" 2>/dev/null || true
    echo "Done: .gemini/commands/qailab"
    ;;
  all)
    install_skill ".kiro/skills/qailab-atomic-design"
    install_skill ".claude/skills/qailab-atomic-design"
    install_skill ".cursor/skills/qailab-atomic-design"
    install_skill ".github/skills/qailab-atomic-design"
    mkdir -p ".gemini/commands/qailab"
    echo "All agents installed."
    ;;
  *)
    echo "Unknown agent: $AGENT"
    echo "Valid options: kiro, claude, cursor, copilot, gemini, all"
    exit 1
    ;;
esac
