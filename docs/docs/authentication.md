---
id: authentication
title: Authentication
---

## Devise

The [Devise gem](https://github.com/heartcombo/devise) is used to handle administrator authentication. The first ESR Wrapper administrator must be bootstrapped by the developer performing the installation. All subsequent administrators can be activated by administrators who have already been activated.

## API Tokens

Administrators can generate bearer tokens which can be used to access the API. The token must be passed in request headers in the format `Authorization: Bearer <token>`. The API checks if the token exists, and then checks if the token has permission to access the requested resource. It filters the returned columns according to the permissions granted to the token by the administrator.
