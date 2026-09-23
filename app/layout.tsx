import type { Metadata } from 'next';
import './globals.css';

export const metadata: Metadata = {
  metadataBase: new URL('https://ahmedtamer.dev'),
  title: 'Ahmed Tamer — Mobile Software Engineer',
  description: 'Ahmed Tamer is a Mobile Software Engineer building reliable, production-grade Flutter applications for Android and iOS.',
  alternates: { canonical: '/' },
  openGraph: {
    title: 'Ahmed Tamer — Mobile Software Engineer',
    description: 'Production mobile apps, thoughtful architecture, and smooth delivery.',
    url: '/',
    siteName: 'Ahmed Tamer',
    type: 'website',
  },
  twitter: { card: 'summary_large_image', title: 'Ahmed Tamer — Mobile Software Engineer', description: 'Production mobile apps, thoughtful architecture, and smooth delivery.' },
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  const person = { '@context': 'https://schema.org', '@type': 'Person', name: 'Ahmed Tamer', jobTitle: 'Mobile Software Engineer', email: 'a.tamer7112002@gmail.com', url: 'https://linkedin.com/in/a7medtamer7', sameAs: ['https://github.com/a7medtamer7', 'https://linkedin.com/in/a7medtamer7'] };
  return <html lang="en" suppressHydrationWarning><body suppressHydrationWarning>{children}<script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(person) }} /></body></html>;
}
