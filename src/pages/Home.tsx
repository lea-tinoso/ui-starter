import { Button } from '../components/Button.tsx'

export default function Home() {
  return (
    <main className="mx-auto flex min-h-svh max-w-2xl flex-col justify-center gap-6 px-6">
      <h1 className="font-display text-4xl font-semibold text-ink">
        ui-starter
      </h1>
      <p>
        Pick a design with{' '}
        <code className="font-mono text-ink">
          npm run design -- &lt;name&gt;
        </code>
        , map its tokens into{' '}
        <code className="font-mono text-ink">src/index.css</code>, then ask
        Claude to build your first page.
      </p>
      <div className="flex gap-3">
        <Button>Primary</Button>
        <Button variant="secondary">Secondary</Button>
      </div>
    </main>
  )
}
