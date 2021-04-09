module.exports = {
  title: 'ESR API',
  tagline: 'Documentation',
  url: 'https://sardjv.github.io',
  baseUrl: '/',
  favicon: 'img/favicon.ico',
  organizationName: 'sardjv', // Usually your GitHub org/user name.
  projectName: 'docs', // Usually your repo name.
  themeConfig: {
    navbar: {
      title: 'ESR API',
      logo: {
        alt: 'My Site Logo',
        src: 'img/logo.svg',
      },
      items: [
        {
          to: 'docs/introduction',
          activeBasePath: 'docs',
          label: 'Docs',
          position: 'left',
        },
        {
          href: 'https://github.com/sardjv/esr_api',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Docs',
          items: [
            {
              label: 'Introduction',
              to: 'docs/introduction',
            },
            {
              label: 'Technical Overview',
              to: 'docs/overview',
            },
            {
              label: 'Requirements',
              to: 'docs/requirements',
            },
            {
              label: 'Development',
              to: 'docs/development',
            },
            {
              label: 'Versioning',
              to: 'docs/versioning',
            }
          ],
        },
        {
          title: 'Community',
          items: [
            {
              label: 'SARD JV',
              href: 'https://sardjv.co.uk/',
            },
            {
              label: 'Oxleas NHS Foundation Trust',
              href: 'https://oxleas.nhs.uk/',
            },
            {
              label: 'Twitter',
              href: 'https://twitter.com/sardjv',
            },
          ],
        },
        {
          title: 'More',
          items: [
            {
              label: 'GitHub',
              href: 'https://github.com/sardjv/esr_api',
            },
          ],
        },
      ],
      copyright: `Built with <a href='https://docusaurus.io/'>Docusaurus</a>. Illustrations by <a href='https://www.drawkit.io/free'>Drawkit</a>.`,
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          // Please change this to your repo.
          editUrl:
            'https://github.com/sardjv/esr_api/tree/master/docs',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
