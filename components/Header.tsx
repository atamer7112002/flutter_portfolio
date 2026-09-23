'use client';

import { useState } from 'react';

const links = [['What I Build', 'services'], ['Selected Work', 'projects-flow'], ['My Journey', 'experience'], ['Credentials', 'credentials']];

export function Header() {
  const [open, setOpen] = useState(false);
  return <header className="site-header"><a className="brand" href="#top" aria-label="Ahmed Tamer home">Portfolio</a><nav className={open ? 'nav open' : 'nav'} aria-label="Primary navigation">{links.map(([label, id]) => <a key={id} href={`#${id}`} onClick={() => setOpen(false)}>{label}</a>)}<a className="nav-cta" href="#contact">Let&apos;s Build Together <span>↗</span></a></nav><button className="menu" aria-label="Toggle navigation" aria-expanded={open} onClick={() => setOpen(!open)}>{open ? '×' : '☰'}</button></header>;
}
