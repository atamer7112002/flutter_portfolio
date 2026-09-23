import type { NextConfig } from 'next';

const isProduction = process.env.NODE_ENV === 'production';
const repositoryName = 'flutter_portfolio';

const nextConfig: NextConfig = {
  output: 'export',
  trailingSlash: true,
  basePath: isProduction ? `/${repositoryName}` : '',
  assetPrefix: isProduction ? `/${repositoryName}/` : '',
  images: { unoptimized: true, formats: ['image/avif', 'image/webp'] },
  devIndicators: false,
};

export default nextConfig;
