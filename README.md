# ui-starter

Starter for personal web apps: Vite + React + TypeScript + Tailwind, with my UI/UX kit wired in.
`ui-kit/` holds my three forked repos as git submodules. Their Claude skills load automatically as project
skills, so Claude builds UI from them without extra setup. See [CLAUDE.md](CLAUDE.md) for what each fork is for.

| Fork                                                                 | Role                                          |
| -------------------------------------------------------------------- | --------------------------------------------- |
| [taste-skill](https://github.com/lea-tinoso/taste-skill)             | Art direction skill (`design-taste-frontend`) |
| [agent-skills](https://github.com/lea-tinoso/agent-skills)           | Vercel React and UI review skills             |
| [awesome-design-md](https://github.com/lea-tinoso/awesome-design-md) | 84 `DESIGN.md` design systems to pick from    |

## One-time setup: make this a template

On GitHub, open this repo's **Settings**, then under **General** tick **Template repository**.

## Start a new project

1. On GitHub, click **Use this template → Create a new repository**.
2. Clone it with its submodules:
   ```sh
   git clone --recurse-submodules https://github.com/lea-tinoso/<new-project>.git
   cd <new-project>
   ```
   If you already cloned without the flag, run `git submodule update --init`.
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
- Then run `npm run ui-kit:update` in a project and commit the new pins (`git commit -am "Update ui-kit"`).

## Layout

```
ui-kit/                 forks (git submodules, tracking main)
.claude/skills/         ui-ux skill + symlinks into ui-kit skills
scripts/                update-ui-kit.sh, use-design.sh
src/pages/              one component per screen
src/components/         reusable components
src/index.css           Tailwind + design tokens (@theme)
```

On Windows, the skill symlinks need `git config --global core.symlinks true` and Developer Mode enabled.
