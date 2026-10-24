# ui-starter

Starter for personal web apps: Vite + React + TypeScript + Tailwind, with my UI/UX kit wired in.
The Claude skills from my forks are copied into `.claude/skills/`, so Claude builds UI from them in every
clone with no setup, including cloud sessions. The design library is a git submodule in `ui-kit/`.
See [CLAUDE.md](CLAUDE.md) for what each piece is for.

| Fork                                                                 | Role                                          | Lives in                   |
| -------------------------------------------------------------------- | --------------------------------------------- | -------------------------- |
| [taste-skill](https://github.com/lea-tinoso/taste-skill)             | Art direction skill (`design-taste-frontend`) | `.claude/skills/` (copied) |
| [agent-skills](https://github.com/lea-tinoso/agent-skills)           | Vercel React and UI review skills             | `.claude/skills/` (copied) |
| [awesome-design-md](https://github.com/lea-tinoso/awesome-design-md) | 84 `DESIGN.md` design systems to pick from    | `ui-kit/` (submodule)      |

## One-time setup: make this a template

On GitHub, open this repo's **Settings**, then under **General** tick **Template repository**.

## Start a new project

1. On GitHub, click **Use this template → Create a new repository**.
2. Clone it with its submodule:
   ```sh
   git clone --recurse-submodules https://github.com/lea-tinoso/<new-project>.git
   cd <new-project>
   ```
   If you already cloned without the flag, run `git submodule update --init`. The skills work either way;
   only `npm run design` needs the submodule.
3. Pull the latest of every fork:
   ```sh
   npm run ui-kit:update   # same as scripts/update-ui-kit.sh
   ```
4. Install and run:
   ```sh
   npm install
   npm run dev
   ```
5. Pick a design. `npm run design` lists the choices. Then run `npm run design -- <name>` and ask Claude to
   map its tokens into `src/index.css`.

## Keeping forks current

- Your forks fall behind their upstreams. To catch up, press **Sync fork** on each fork's GitHub page.
- Then run `npm run ui-kit:update` in a project. It re-copies the skills, pulls the design library and
  lists what changed. Commit with `git add -A .claude/skills ui-kit && git commit -m "Update ui-kit"`.
- To copy another skill from a fork, add a line to the `SKILLS` list at the top of `scripts/update-ui-kit.sh`.

## Layout

```
.claude/skills/         ui-ux skill + skills copied from the forks (skills.lock records the source commits)
ui-kit/                 awesome-design-md (git submodule, tracking main)
scripts/                update-ui-kit.sh, use-design.sh
src/pages/              one component per screen
src/components/         reusable components
src/index.css           Tailwind + design tokens (@theme)
```
