/** @type {import('next').NextConfig} */
const nextConfig = {
    reactStrictMode: true,
    swcMinify: true,
    env: {
        NEXT_APP_ENV: 'DEVELOPMENT',
        NEXT_APP_API_URL: 'http://localhost:5100/api/v1',
        NEXT_APP_CLIENT: 'http://localhost:3100',
        BROWSER: 'none',
        PORT: 3100,
    },
    output: "standalone"
}

module.exports = nextConfig
