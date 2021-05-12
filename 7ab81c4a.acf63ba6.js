(window.webpackJsonp=window.webpackJsonp||[]).push([[11],{67:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return i})),n.d(t,"metadata",(function(){return c})),n.d(t,"rightToc",(function(){return s})),n.d(t,"default",(function(){return p}));var r=n(2),o=n(6),a=(n(0),n(77)),i={id:"documentation",title:"Documentation"},c={unversionedId:"documentation",id:"documentation",isDocsHomePage:!1,title:"Documentation",description:"The documentation can be found in the /docs directory. When Docker is running the documentation site",source:"@site/docs/documentation.md",slug:"/documentation",permalink:"/esr_api/docs/documentation",editUrl:"https://github.com/sardjv/esr_api/docs/documentation.md",version:"current",sidebar:"someSidebar",previous:{title:"System Reset",permalink:"/esr_api/docs/reset"},next:{title:"Licenses",permalink:"/esr_api/docs/licenses"}},s=[],u={rightToc:s};function p(e){var t=e.components,n=Object(o.a)(e,["components"]);return Object(a.b)("wrapper",Object(r.a)({},u,n,{components:t,mdxType:"MDXLayout"}),Object(a.b)("p",null,"The documentation can be found in the ",Object(a.b)("inlineCode",{parentName:"p"},"/docs")," directory. When Docker is running the documentation site\nis served locally using ",Object(a.b)("a",Object(r.a)({parentName:"p"},{href:"https://docusaurus.io/"}),"Docusaurus")," at ",Object(a.b)("a",Object(r.a)({parentName:"p"},{href:"http://localhost:3002/esr_api"}),"http://localhost:3002/esr_api"),". Any changes made in the ",Object(a.b)("inlineCode",{parentName:"p"},"/docs")," directory will be immediately visible in the local version of the documentation."),Object(a.b)("p",null,"We also serve the documentation online at ",Object(a.b)("a",Object(r.a)({parentName:"p"},{href:"https://sardjv.github.io/esr_api/"}),"https://sardjv.github.io/esr_api/"),"."),Object(a.b)("p",null,"To deploy the latest changes to the online documentation site, make sure Pages is activated on Github/settings and the branch is set to ",Object(a.b)("inlineCode",{parentName:"p"},"gh-pages")," and ",Object(a.b)("inlineCode",{parentName:"p"},"root"),". CircleCI automatically deploys changes to the site, you can find the config for this in ",Object(a.b)("inlineCode",{parentName:"p"},".circleci/config.yml")," under the ",Object(a.b)("inlineCode",{parentName:"p"},"deploy_docs")," job."))}p.isMDXComponent=!0},77:function(e,t,n){"use strict";n.d(t,"a",(function(){return l})),n.d(t,"b",(function(){return b}));var r=n(0),o=n.n(r);function a(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function i(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function c(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?i(Object(n),!0).forEach((function(t){a(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):i(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function s(e,t){if(null==e)return{};var n,r,o=function(e,t){if(null==e)return{};var n,r,o={},a=Object.keys(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||(o[n]=e[n]);return o}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(o[n]=e[n])}return o}var u=o.a.createContext({}),p=function(e){var t=o.a.useContext(u),n=t;return e&&(n="function"==typeof e?e(t):c(c({},t),e)),n},l=function(e){var t=p(e.components);return o.a.createElement(u.Provider,{value:t},e.children)},d={inlineCode:"code",wrapper:function(e){var t=e.children;return o.a.createElement(o.a.Fragment,{},t)}},m=o.a.forwardRef((function(e,t){var n=e.components,r=e.mdxType,a=e.originalType,i=e.parentName,u=s(e,["components","mdxType","originalType","parentName"]),l=p(n),m=r,b=l["".concat(i,".").concat(m)]||l[m]||d[m]||a;return n?o.a.createElement(b,c(c({ref:t},u),{},{components:n})):o.a.createElement(b,c({ref:t},u))}));function b(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var a=n.length,i=new Array(a);i[0]=m;var c={};for(var s in t)hasOwnProperty.call(t,s)&&(c[s]=t[s]);c.originalType=e,c.mdxType="string"==typeof e?e:r,i[1]=c;for(var u=2;u<a;u++)i[u]=n[u];return o.a.createElement.apply(null,i)}return o.a.createElement.apply(null,n)}m.displayName="MDXCreateElement"}}]);