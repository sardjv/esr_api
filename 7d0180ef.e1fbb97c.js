(window.webpackJsonp=window.webpackJsonp||[]).push([[10],{66:function(e,t,r){"use strict";r.r(t),r.d(t,"frontMatter",(function(){return a})),r.d(t,"metadata",(function(){return u})),r.d(t,"rightToc",(function(){return s})),r.d(t,"default",(function(){return p}));var n=r(2),i=r(6),o=(r(0),r(75)),c=r(76),a={id:"security",title:"Security"},u={unversionedId:"security",id:"security",isDocsHomePage:!1,title:"Security",description:"Snyk",source:"@site/docs/security.mdx",slug:"/security",permalink:"/docs/security",editUrl:"https://github.com/sardjv/esr_api/tree/master/docs/docs/security.mdx",version:"current",sidebar:"someSidebar",previous:{title:"Licenses",permalink:"/docs/licenses"},next:{title:"API",permalink:"/docs/api"}},s=[{value:"Snyk",id:"snyk",children:[]},{value:"PEN Testing",id:"pen-testing",children:[]}],l={rightToc:s};function p(e){var t=e.components,r=Object(i.a)(e,["components"]);return Object(o.b)("wrapper",Object(n.a)({},l,r,{components:t,mdxType:"MDXLayout"}),Object(o.b)("h2",{id:"snyk"},"Snyk"),Object(o.b)("p",null,"ESR API is integrated with ",Object(o.b)("a",Object(n.a)({parentName:"p"},{href:"https://snyk.io/"}),"Snyk")," to find and patch vulnerabilities in dependencies. Here is an example of checks on a pull request:"),Object(o.b)("a",{href:"https://github.com/sardjv/esr_api/pull/50"},Object(o.b)("img",{alt:"Example of pull request check on Github showing build, test and security review outcomed as green ticks",src:Object(c.a)("img/github_build_success.png")})),Object(o.b)("p",null,"Snyk provides automated pull requests for vulnerabilities in dependencies as they arise, as well as advance patches, developed in-house by Snyk, until the maintainers patch the root vulnerability."),Object(o.b)("h2",{id:"pen-testing"},"PEN Testing"),Object(o.b)("p",null,"A penetration test by a reputable external agency is planned before the project goes live."))}p.isMDXComponent=!0},74:function(e,t,r){"use strict";var n=r(0),i=r(20);t.a=function(){var e=Object(n.useContext)(i.a);if(null===e)throw new Error("Docusaurus context not provided");return e}},75:function(e,t,r){"use strict";r.d(t,"a",(function(){return p})),r.d(t,"b",(function(){return b}));var n=r(0),i=r.n(n);function o(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function c(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function a(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?c(Object(r),!0).forEach((function(t){o(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):c(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function u(e,t){if(null==e)return{};var r,n,i=function(e,t){if(null==e)return{};var r,n,i={},o=Object.keys(e);for(n=0;n<o.length;n++)r=o[n],t.indexOf(r)>=0||(i[r]=e[r]);return i}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(n=0;n<o.length;n++)r=o[n],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(i[r]=e[r])}return i}var s=i.a.createContext({}),l=function(e){var t=i.a.useContext(s),r=t;return e&&(r="function"==typeof e?e(t):a(a({},t),e)),r},p=function(e){var t=l(e.components);return i.a.createElement(s.Provider,{value:t},e.children)},d={inlineCode:"code",wrapper:function(e){var t=e.children;return i.a.createElement(i.a.Fragment,{},t)}},f=i.a.forwardRef((function(e,t){var r=e.components,n=e.mdxType,o=e.originalType,c=e.parentName,s=u(e,["components","mdxType","originalType","parentName"]),p=l(r),f=n,b=p["".concat(c,".").concat(f)]||p[f]||d[f]||o;return r?i.a.createElement(b,a(a({ref:t},s),{},{components:r})):i.a.createElement(b,a({ref:t},s))}));function b(e,t){var r=arguments,n=t&&t.mdxType;if("string"==typeof e||n){var o=r.length,c=new Array(o);c[0]=f;var a={};for(var u in t)hasOwnProperty.call(t,u)&&(a[u]=t[u]);a.originalType=e,a.mdxType="string"==typeof e?e:n,c[1]=a;for(var s=2;s<o;s++)c[s]=r[s];return i.a.createElement.apply(null,c)}return i.a.createElement.apply(null,r)}f.displayName="MDXCreateElement"},76:function(e,t,r){"use strict";r.d(t,"b",(function(){return o})),r.d(t,"a",(function(){return c}));var n=r(74),i=r(78);function o(){var e=Object(n.a)().siteConfig,t=(e=void 0===e?{}:e).baseUrl,r=void 0===t?"/":t,o=e.url;return{withBaseUrl:function(e,t){return function(e,t,r,n){var o=void 0===n?{}:n,c=o.forcePrependBaseUrl,a=void 0!==c&&c,u=o.absolute,s=void 0!==u&&u;if(!r)return r;if(r.startsWith("#"))return r;if(Object(i.b)(r))return r;if(a)return t+r;var l=r.startsWith(t)?r:t+r.replace(/^\//,"");return s?e+l:l}(o,r,e,t)}}}function c(e,t){return void 0===t&&(t={}),(0,o().withBaseUrl)(e,t)}},78:function(e,t,r){"use strict";function n(e){return!0===/^(\w*:|\/\/)/.test(e)}function i(e){return void 0!==e&&!n(e)}r.d(t,"b",(function(){return n})),r.d(t,"a",(function(){return i}))}}]);