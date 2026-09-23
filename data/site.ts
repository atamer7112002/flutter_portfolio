export const profile = {
  name: 'Ahmed Tamer Ahmed', role: 'Mobile Software Engineer', email: 'a.tamer7112002@gmail.com', phone: '+201028684980', location: 'Cairo, Egypt', linkedin: 'https://linkedin.com/in/a7medtamer7', github: 'https://github.com/a7medtamer7', portfolio: 'https://ahmed-tamer-portfolio.web.app',
  summary: 'Mobile Software Engineer with 2+ years of experience shipping production-grade Flutter applications used by thousands of users on Google Play and the App Store. Delivered BayToStay — a booking platform managing 500+ tourism units — with full ownership of Android & iOS release cycles including TestFlight, Staged Rollouts, and Shorebird hot-fixes. Specialized in Monorepo architecture, Performance Profiling, native integrations via Method Channels, and mobile distribution pipelines including Firebase App Distribution.',
};

export const experience = [
  { role: 'Mobile Developer', company: 'RunSoft', period: '02/2026 – Present', location: 'Cairo, Egypt', summary: 'Working on BayToStay, a booking super app managing 500+ tourism units, and Masane3 Online, a large-scale B2B marketplace — both live on Google Play and the App Store.', bullets: ['Implement structured networking layers with robust error handling and type-safe environment configurations using Envied', 'Work within a monorepo architecture supporting multiple apps across shared and feature-specific modules', 'Own full Android & iOS release cycles: TestFlight, Staged Rollouts, Shorebird hot-fixes, and CI/CD pipelines', 'Apply observability best practices using Sentry and Crashlytics to monitor real-time errors and performance bottlenecks in production'] },
  { role: 'Mobile Developer', company: 'Forsova', period: '01/2026 – Present', location: 'Remote / UAE', summary: 'Deliver end-to-end Flutter projects with Clean Architecture + BLoC/Cubit and implement Firebase backend services independently.', bullets: ['Built FinTrackr, a fintech app that automatically reads incoming financial SMS messages, parses and categorizes transactions, and presents them in a structured personal finance dashboard', 'Integrated native Android SMS reading via Method Channels, enabling real-time detection and parsing of bank and payment notifications without manual input', 'Manage the full project lifecycle — development, testing, client feedback, and deployment — while maintaining a 5-star rating on Mustaqil'] },
  { role: 'Flutter Developer Intern', company: 'RASID', period: '05/2024 – 09/2024', location: 'Giza, Egypt', summary: 'Contributed to an enterprise workforce management app used in production.', bullets: ['Contributed to an enterprise workforce management app that captured remote employee biometric fingerprints for clock-in/out and enabled digital submission of documents and reports, replacing paper-based workflows', 'Collaborated with backend developers and UX designers in an Agile team environment', 'Integrated RESTful APIs with Dio, implementing interceptors for token refresh and centralized error handling'] },
];

export const projects = [
  { title: 'BayToStay', eyebrow: 'Travel & Booking Super App', description: 'Production booking platform managing 500+ tourism units. Clean Architecture + MVVM. Owned Maps integration, payment flows & wallet, Deep Links, GPU jank and Raster thread profiling, memory optimization, DNS and environment switching via Cloudflare, CI/CD, Dev/Prod flavors, Shorebird patches, Firebase Cloud Messaging, and real-time booking status updates.', tech: ['Flutter', 'Clean Architecture', 'MVVM', 'Maps', 'Payments', 'FCM', 'CI/CD', 'Shorebird'], badge: 'Production', date: '02/2026 – Present', links: [['Google Play', 'https://play.google.com/store/apps/details?id=com.runsoft.bay_to_stay'], ['App Store', 'https://apps.apple.com/eg/app/bay-to-stay/id6743452055']] },
  { title: 'Masane3 Online', eyebrow: 'B2B Marketplace Platform', description: 'Large-scale B2B platform built within a Monorepo using Clean Architecture. Handled full Staging & Production environment management with Envied, scalable networking and error handling, shared and feature-specific packages, and BLoC-based supplier and product catalog flows.', tech: ['Flutter', 'Clean Architecture', 'BLoC', 'Monorepo', 'Envied'], badge: 'Production', date: '02/2026 – Present', links: [['Google Play', 'https://play.google.com/store/apps/details?id=com.ValuxApps.Masane3Online'], ['App Store', 'https://apps.apple.com/eg/app/%D9%85%D8%B5%D8%A7%D9%86%D8%B9-%D8%A7%D9%88%D9%86%D9%84%D8%A7%D9%8A%D9%86/id1453506308']] },
  { title: 'FinTrackr', eyebrow: 'Fintech / Personal Finance Tracker', description: 'Personal finance app that automatically reads and parses incoming financial SMS messages from banks and payment providers through native Android Method Channels, categorizes income, expense, and transfer transactions, handles background detection, and protects financial data with Biometric Authentication.', tech: ['Flutter', 'Clean Architecture', 'BLoC', 'Method Channels', 'SMS', 'Biometric Auth'], badge: 'Security', date: '01/2026 – 02/2026', links: [] },
  { title: 'Wahag Al-Elm App', eyebrow: 'Educational Mobile Application', description: 'Educational mobile application with reusable UI components and responsive layouts. Integrated REST APIs with a focus on performance, stability, and consistent theming.', tech: ['Flutter', 'REST APIs', 'Responsive UI', 'Theming'], badge: 'Education', date: '', links: [['GitHub', 'https://github.com/atamer7112002/wahag_elelm']] },
  { title: 'RASID Mobile App', eyebrow: 'Enterprise Workforce Management', description: 'Enterprise workforce management application using Clean Architecture, BLoC/Cubit, REST APIs, and Firebase services for biometric clock-in/out, authentication, real-time updates, and digital document workflows.', tech: ['Flutter', 'BLoC', 'Firebase', 'REST APIs'], badge: 'Enterprise', date: '05/2024 – 09/2024', links: [] },
  { title: 'Renting System App', eyebrow: 'Property Renting Utility', description: 'Property renting application with responsive UI, structured navigation, RESTful APIs for real-time property data, and Shared Preferences for local settings.', tech: ['Flutter', 'REST APIs', 'Shared Preferences'], badge: 'Utility', date: '', links: [['GitHub', 'https://github.com/atamer7112002/Renting_system_app']] },
];

export const skillGroups = [
  { label: 'Core', items: ['Flutter', 'Dart', 'Cross-Platform Mobile Development'] },
  { label: 'Architecture & Patterns', items: ['Clean Architecture', 'MVVM', 'Repository Pattern', 'Modular / Monorepo Architecture'] },
  { label: 'State Management', items: ['BLoC', 'Cubit'] },
  { label: 'Networking & Backend', items: ['REST APIs', 'Dio', 'Retrofit', 'Firebase Auth', 'Firestore', 'Functions'] },
  { label: 'Native Integration', items: ['Method Channels', 'SMS & Background Tasks', 'Biometric Authentication'] },
  { label: 'Observability & Quality', items: ['Sentry', 'Crashlytics', 'Unit Testing', 'Memory Profiling', 'Performance Optimization'] },
  { label: 'Release Engineering', items: ['CI/CD', 'Flavor Config', 'Envied', 'Shorebird', 'TestFlight', 'Staged Rollouts', 'Build Runner'] },
  { label: 'Tools', items: ['Git', 'GitHub', 'Android Studio', 'VS Code', 'Postman', 'Cloudflare'] },
];

export const education = [
  { period: '09/2019 – 2024', title: 'Bachelor of Computer Science', institution: 'Faculty of Computers & Informatics, Suez Canal University', location: 'Ismailia, Egypt' },
  { period: '2022 – 2024', title: 'Mobile Development (Cross-Platform & iOS)', institution: 'Information Technology Institute (ITI)', location: 'Ismailia, Egypt' },
];

export const certifications = [
  'CS50x: Introduction to Computer Science — Harvard University (2022)',
  'Flutter Certification — Google Developer Student Clubs / GDSC (2023)',
  'Flutter Development Bootcamp — Udemy (2023)',
];
