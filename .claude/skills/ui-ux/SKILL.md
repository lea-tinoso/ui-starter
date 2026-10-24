---
name: ui-ux
description: Entry point for all UI work in this repo. Routes to the kit skills (design-taste-frontend, Vercel React skills, web-design-guidelines) and the project DESIGN.md, and gives the step-by-step for building a new page or component. Use whenever you design, build, restyle or review a page, screen, component, layout or style.
---

# UI/UX in this repo

The conventions come from the kit skills. This skill decides which one applies and in what order.

## Which skill for which job

| Job                                                           | Use                                            |
| ------------------------------------------------------------- | ---------------------------------------------- |
| Visual direction, layout, type, copy, polish, "looks generic" | `design-taste-frontend`                        |
| Colors, fonts, radii, component look                          | root `DESIGN.md` → `@theme` in `src/index.css` |
| Writing React components and data flow                        | `vercel-react-best-practices`                  |
| Component APIs, variants, compound components                 | `vercel-composition-patterns`                  |
| Page or route transitions, shared-element animation           | `vercel-react-view-transitions`                |
| Final UI, accessibility and UX review                         | `web-design-guidelines`                        |

If two sources conflict, `DESIGN.md` wins on tokens and `design-taste-frontend` wins on composition.
The style the user picked beats the taste skill's house rules: when the inspector flags a trait the
picked style calls for (neo-brutalism's hard shadows, thick outlines and pill buttons trip `shadow`,
`button-fx`, `outlined-box`, `pill-nav`), add those rule ids to `.design-allow` (one comma-separated
line) and say so in your report. Do not allow rules just to get a pass.

## Build a new page or component

1. **Let the user pick a direction.** For a new project, a new page with no set look, or a restyle, do not choose for the user. Deal 3 directions with `design-taste-frontend` (`draw.mjs --options 3`) and run `npm run samples -- <id> <id> <id>` to get real sample sites (with mood and colours) for each. Show 2 or 3 directions, each with its name, a one-line idea, colour swatches, 3 to 5 clickable sample sites with their mood, and one line on what it would look like for this project. Then wait for the pick. This overrides the taste skill's "you choose" step.
2. **Set the tokens.** If there is no root `DESIGN.md`, offer the closest designs from `npm run design` for the picked direction, run `npm run design -- <name>`, and map its tokens into the `@theme` block of `src/index.css`.
3. **Reuse first.** Check `src/components/` for something to use or extend before making a new component.
4. **Direct it.** Continue `design-taste-frontend` with the picked direction (`--direction <id>`): sections, idea, words.
5. **Build it.** Pages go in `src/pages/`, reusable parts in `src/components/`. Use token classes only, with no raw hex values. Follow `vercel-composition-patterns` for variants and `vercel-react-best-practices` for the React code.
6. **Verify.** Run `npm run lint && npm run build`. Then open the page with `npm run dev` and run the taste skill's inspector through `npm run inspect -- <url>`, not `inspect.mjs` directly. The wrapper turns off Chrome's sandbox when running as root (cloud sessions) and applies `.design-allow`.
7. **Review.** Run `web-design-guidelines` on the changed files and fix what it finds.

## Cloud sessions: network limits

Claude Code on the web blocks many hosts. Plan around it instead of retrying:

- **Fonts:** install from npm with `@fontsource/<font>` (or `@fontsource-variable/<font>`) and import it in `src/main.tsx`. Google Fonts, Fontshare and other font CDNs may be unreachable.
- **Pictures:** `assets.mjs` (Openverse, Wikimedia, Internet Archive) may fail. Ask the user for pictures, or leave clearly marked slots and list what goes in each. Do not invent stand-ins.
- **Reference sites:** live sites often will not load. Work from the site's entry in `.claude/skills/design-taste-frontend/library/sites.json` (`hero`, `type`, `colour`, `layout`, `steal`), which describes it in detail.
