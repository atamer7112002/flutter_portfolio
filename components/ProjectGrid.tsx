'use client';

import { useState } from 'react';
import Image from 'next/image';
import { projects } from '../data/site';
import { LinkIcon } from './LinkIcon';

const screenshotPath = process.env.NODE_ENV === 'production'
  ? '/flutter_portfolio/images/centerly'
  : '/images/centerly';

function ProjectScreenshots({ screenshots }: {
  screenshots: { file: string; label: string }[];
}) {
  return (
    <figure className="project-screenshots">
      <div>
        {screenshots.map(({ file, label }) => {
          const src = `${screenshotPath}/${file}`;
          return (
            <a key={file} href={src} target="_blank" rel="noreferrer">
              <Image src={src} alt={label} width={160} height={356} />
            </a>
          );
        })}
      </div>
      <figcaption>Sample data shown in screenshots.</figcaption>
    </figure>
  );
}

export function ProjectGrid() {
  const [filter, setFilter] = useState('All');
  const shown = filter === 'All' ? projects : projects.filter((project) => project.badge === filter);
  return <><div className="filters" role="tablist" aria-label="Project filters">{['All', 'Production', 'Security', 'Education'].map((item) => <button key={item} className={filter === item ? 'filter active' : 'filter'} onClick={() => setFilter(item)} role="tab" aria-selected={filter === item}>{item}</button>)}</div><div className="project-grid">{shown.map((project, index) => <article className="project-card" id={project.screenshots ? "centerly" : undefined} key={project.title}><div className="project-top"><span className="project-number">0{index + 1}</span><span className="project-badge">{project.badge}</span></div><div><p className="project-eyebrow">{project.eyebrow}</p><h3>{project.title}</h3><p className="project-date">{project.date}</p><p className="project-description">{project.description}</p></div>{project.screenshots && <ProjectScreenshots screenshots={project.screenshots} />}<div className="project-bottom"><div className="tag-list">{project.tech.map((tech) => <span key={tech}>{tech}</span>)}</div>{project.links.length > 0 && <div className="project-links">{project.links.map(([label, href]) => { const type = label === 'Google Play' ? 'play' : label === 'App Store' ? 'appstore' : 'github'; return <a key={label} href={href} target="_blank" rel="noreferrer"><LinkIcon type={type} />{label}</a>; })}</div>}</div></article>)}</div></>;
}
