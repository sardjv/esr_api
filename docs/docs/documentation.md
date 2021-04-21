---
id: documentation
title: Documentation
---

The documentation can be found in the `/docs` directory. When Docker is running the documentation site
is served locally at [http://localhost:3002/esr_api](http://localhost:3002/esr_api). Any changes made
in the `/docs` directory will be immediately visible.

We also serve the documentation online at [https://sardjv.github.io/esr_api/](https://sardjv.github.io/esr_api/).

To deploy changes to this site:

```
cd docs # Very important! The following commands will not work at the project's root directory.
yarn install # Only the first time.
GIT_USER=<Your GitHub username> USE_SSH=true yarn deploy
```

It may take a few minutes to update.
