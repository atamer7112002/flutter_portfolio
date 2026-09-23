import Image from 'next/image';
import { Header } from '../components/Header';
import { ProjectGrid } from '../components/ProjectGrid';
import { Reveal } from '../components/Reveal';
import { LinkIcon } from '../components/LinkIcon';
import { certifications, education, experience, profile, skillGroups } from '../data/site';

const Arrow = () => <span aria-hidden="true">↗</span>;
const profileImage = process.env.NODE_ENV === 'production' ? '/flutter_portfolio/images/profile.png' : '/images/profile.png';


const services = [
  ['01', 'Mobile App Development', 'Production-grade Flutter apps for Android and iOS, built for speed, stability, and measurable outcomes.'],
  ['02', 'UI/UX Implementation', 'Responsive interfaces and reusable design systems that make complex product flows feel simple.'],
  ['03', 'Backend & API Integration', 'Type-safe networking, Firebase services, native integrations, and robust error handling.'],
  ['04', 'Launch & Optimization', 'Release pipelines, CI/CD, monitoring, profiling, and the careful work behind reliable launches.'],
];

const processSteps = [
  ['01', 'Discovery & Research', 'Start with the product goal, user needs, and the constraints that shape a good technical direction.'],
  ['02', 'Product Strategy', 'Translate the idea into clear flows, modular boundaries, and a roadmap that can actually ship.'],
  ['03', 'Engineering & Build', 'Build with Flutter, Clean Architecture, BLoC/Cubit, and native capabilities where they add real value.'],
  ['04', 'Launch & Growth', 'Own testing, store releases, CI/CD, crash monitoring, performance, and the next iteration.'],
];

export default function Home() {
  return <main id="top"><Header />
    <section className="hero-ref shell-ref"><div className="hero-ref-copy"><div className="store-pills"><span title="Apple App Store"><LinkIcon type="appstore" /></span><span title="Google Play Store"><LinkIcon type="play" /></span></div><h1>Mobile <em>Software</em><br />Engineer</h1><p>{profile.summary}</p><div className="hero-ref-actions"><a className="ref-pill" href="https://drive.google.com/drive/folders/15tJJYPiZhWWubysCwx0PzOcmtfuxsOBY" target="_blank" rel="noreferrer"><b><LinkIcon type="download" /></b><span>Download CV<small>Resume / CV (PDF)</small></span></a><a className="ref-pill" href={profile.github} target="_blank" rel="noreferrer"><b><LinkIcon type="github" /></b><span>GitHub<small>View Source &amp; Projects</small></span></a><a className="ref-pill" href={profile.linkedin} target="_blank" rel="noreferrer"><b><LinkIcon type="linkedin" /></b><span>LinkedIn<small>Connect Profile</small></span></a></div></div><div className="hero-ref-visual"><div className="hero-ring"><Image src={profileImage} alt="Ahmed Tamer" width={400} height={400} priority quality={100} /></div></div></section>
    <section className="stack-strip"><span>TECH STACK &amp; ECOSYSTEM</span><div className="tech-marquee"><div className="tech-track"><div className="tech-sequence"><strong>Dart</strong><strong>Flutter</strong><strong>Clean Architecture</strong><strong>Firebase</strong><strong>CI/CD</strong><strong>REST APIs</strong></div><div className="tech-sequence" aria-hidden="true"><strong>Dart</strong><strong>Flutter</strong><strong>Clean Architecture</strong><strong>Firebase</strong><strong>CI/CD</strong><strong>REST APIs</strong></div></div></div></section>
    <Reveal><section id="services" className="ref-section shell-ref"><div className="ref-heading"><span>What I Build</span><h2>Services &amp; <em>Architecture</em></h2><p>From a first idea to a production release, I build the systems that make a mobile product dependable.</p></div><div className="service-grid">{services.map(([number, title, text]) => <article className="service-card" key={number}><span className="card-number">{number}</span><h3>{title}</h3><p>{text}</p><Arrow /></article>)}</div></section></Reveal>
    <Reveal><section id="projects-flow" className="ref-section shell-ref projects-ref"><div className="ref-heading"><span>Latest Projects</span><h2>Selected <em>Work</em></h2><p>Real products, real constraints, and a lot of care in the details.</p></div><ProjectGrid /></section></Reveal>
    <Reveal><section id="experience" className="ref-section shell-ref experience-ref"><div className="ref-heading centered"><span>My Journey</span><h2>Experience</h2><p>A timeline of continuous evolution — from foundational mobile craftsmanship to production product scale.</p></div><div className="timeline-ref">{experience.map((item, i) => <article className="journey-card" key={`${item.company}-${item.role}`}><div className="journey-year">{item.period}</div><span className="card-kicker">{item.company.toUpperCase()} · {item.location.toUpperCase()}</span><h3>{item.role}</h3><p>{item.summary}</p><ul>{item.bullets.map((bullet) => <li key={bullet}>{bullet}</li>)}</ul><a href="#contact">Explore chapter <Arrow /></a><span className={`journey-node node-${i}`} /></article>)}</div><div className="year-line"><b>2026</b><b>2025</b><b>2024</b></div></section></Reveal>
    <Reveal><section className="ref-section process-ref"><div className="shell-ref"><div className="ref-heading centered"><span>How I Work</span><h2>Process</h2><p>A disciplined, step-by-step methodology turning ambitious product concepts into high-performance digital reality.</p></div><div className="process-grid">{processSteps.map(([number, title, text]) => <article key={number}><span>PHASE {number}</span><h3>{title}</h3><p>{text}</p></article>)}</div></div></section></Reveal>
    <Reveal><section id="credentials" className="ref-section shell-ref credentials-ref"><div className="ref-heading"><span>Credentials</span><h2>Built on a foundation<br />of <em>curiosity.</em></h2></div><div className="credentials-layout"><div className="credentials-column"><div className="credential-panel"><b>EDUCATION</b>{education.map((item) => <div className="credential-item" key={item.title}><span>{item.period}</span><h3>{item.title}</h3><p>{item.institution}<br />{item.location}</p></div>)}</div><div className="credential-panel"><b>CERTIFICATIONS</b><div className="cert-list">{certifications.map((item, index) => <div className="cert-item" key={item}><span>0{index + 1}</span><p>{item}</p></div>)}</div></div></div><div className="toolkit-panel"><b>TECHNICAL TOOLKIT</b><p className="toolkit-intro">A practical toolkit for building, testing, releasing, and improving production mobile software.</p><div className="toolkit-grid">{skillGroups.map((group) => <div className="toolkit-group" key={group.label}><span>{group.label}</span><div>{group.items.map((item) => <em key={item}>{item}</em>)}</div></div>)}</div></div></div></section></Reveal>
    <section id="contact" className="ref-contact"><div className="shell-ref contact-ref"><div><span>Before We Start</span><h2>Let&apos;s build<br /><em>something real.</em></h2><p>{profile.summary}</p></div><div className="contact-side"><a className="email-ref" href={`mailto:${profile.email}`}><LinkIcon type="mail" />{profile.email}</a><a className="chat-ref" href={`tel:${profile.phone}`}><LinkIcon type="phone" />{profile.phone}</a><div className="contact-links"><a href={profile.linkedin} target="_blank" rel="noreferrer"><LinkIcon type="linkedin" />LinkedIn</a><a href={profile.github} target="_blank" rel="noreferrer"><LinkIcon type="github" />GitHub</a></div></div></div></section>
    <footer className="ref-footer shell-ref"><span>Ahmed Tamer · © 2026 All rights reserved.</span><span>Designed with impact · <a href="#top">Back to top ↑</a></span></footer>
  </main>;
}
