import type { ComponentProps } from 'react'

type Variant = 'primary' | 'secondary'

const variants: Record<Variant, string> = {
  primary: 'bg-primary text-on-primary hover:opacity-90',
  secondary: 'border border-hairline text-ink hover:bg-surface',
}

export function Button({
  variant = 'primary',
  className = '',
  ...props
}: ComponentProps<'button'> & { variant?: Variant }) {
  return (
    <button
      className={`rounded-control px-4 py-2 text-sm font-medium transition focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary ${variants[variant]} ${className}`}
      {...props}
    />
  )
}
