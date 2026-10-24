---
name: ui-ux
description: Entry point for all UI work in this repo. Routes to the ui-kit skills (design-taste-frontend, Vercel React skills, web-design-guidelines) and the project DESIGN.md, and gives the step-by-step for building a new page or component. Use whenever you design, build, restyle or review a page, screen, component, layout or style.
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

## Build a new page or component

1. **Check the design.** If there is no root `DESIGN.md`, ask which design to use (`npm run design` lists them), then run `npm run design -- <name>` and map its tokens into the `@theme` block of `src/index.css`.
2. **Reuse first.** Check `src/components/` for something to use or extend before making a new component.
3. **Direct it.** Run `design-taste-frontend` for the page: brief, direction, sections, words.
4. **Build it.** Pages go in `src/pages/`, reusable parts in `src/components/`. Use token classes only, with no raw hex values. Follow `vercel-composition-patterns` for variants and `vercel-react-best-practices` for the React code.
5. **Verify.** Run `npm run lint && npm run build`. Then open the page with `npm run dev` and use the screenshot loop from `design-taste-frontend`.
6. **Review.** Run `web-design-guidelines` on the changed files and fix what it finds.
