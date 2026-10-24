# CLAUDE.md

Personal web app starter. Every project made from this template ships with Lea's UI/UX kit: three forked
repos in `ui-kit/` (git submodules) that hold Claude skills and design references. There is no component
library to import. The kit steers how UI gets designed and written.

## Rule: build UI from the kit first

Before designing or writing any page, component or style, load the `ui-ux` skill
(`.claude/skills/ui-ux/SKILL.md`). It says which kit skill to use for which job and gives the step-by-step.
Do not invent a visual style from scratch when the kit covers it.

## What is in `ui-kit/`

| Fork                       | What it is                                                                                                                            | Use it when                                                                                                                                             |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ui-kit/awesome-design-md` | 84 `DESIGN.md` files, each a design system taken from a real site (colors, type, radii, components)                                   | Starting a project or a new look. Copy one to the project root with `npm run design -- <name>`. The root `DESIGN.md` is the source of truth for tokens. |
| `ui-kit/taste-skill`       | Skill `design-taste-frontend`: art direction, composition, copy, and a screenshot look-and-fix loop                                   | Designing or restyling any page or app screen, or when something looks generic                                                                          |
| `ui-kit/agent-skills`      | Vercel skills: `vercel-react-best-practices`, `vercel-composition-patterns`, `vercel-react-view-transitions`, `web-design-guidelines` | Writing React (performance, component APIs), adding page transitions, reviewing UI and accessibility                                                    |

The skills are symlinked from `.claude/skills/<name>` into `ui-kit/`, so they load as project skills. If
`ui-kit/` is empty, run `git submodule update --init`. The deploy, Vercel CLI and React Native skills in
`agent-skills` are deliberately not linked.

## Stack

- Vite + React 19 + TypeScript, Tailwind CSS v4 (via `@tailwindcss/vite`), npm
- Lint: `npm run lint` (oxlint). Format: `npm run format` (Prettier: no semicolons, single quotes)
- Build check: `npm run build` (runs `tsc -b` first)

## Conventions

- `src/pages/` holds one component per screen. `src/components/` holds reusable pieces with a named export per file.
- Design tokens live only in the `@theme` block of `src/index.css`, mapped from `DESIGN.md`. Components use
  token classes (`bg-canvas`, `text-ink`, `rounded-control`) and never raw hex values or arbitrary colors.
- Add a token to `@theme` before using a new color, font or radius.
- Import local files with their extension (`./Button.tsx`), as the existing code does.
- Before calling UI work done: `npm run lint && npm run build`, then run the `web-design-guidelines` review on the changed files.

## Scripts

- `npm run dev`: start the app
- `npm run design`: list designs. `npm run design -- <name>` copies one to `./DESIGN.md`
- `npm run ui-kit:update`: pull the latest of every fork, then commit the new submodule pins
