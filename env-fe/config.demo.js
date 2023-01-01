/** @type {import('next').NextConfig} */
const nextConfig = {
    reactStrictMode: true,
    swcMinify: true,
    env: {
        NEXT_APP_ENV: 'DEMO',
        NEXT_APP_API_URL: 'https://sgu-community-qoptr.run-ap-south1.goorm.io/api/v1',
        NEXT_APP_CLIENT: 'https://sgu-community.run-ap-south1.goorm.io',
        BROWSER: 'none',
        PORT: 3100,
    },
    output: "standalone"
}

module.exports = nextConfig
