(window.webpackJsonp=window.webpackJsonp||[]).push([[6],{62:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return i})),n.d(t,"metadata",(function(){return s})),n.d(t,"rightToc",(function(){return c})),n.d(t,"default",(function(){return d}));var r=n(2),a=n(6),o=(n(0),n(76)),i={id:"reset",title:"System Reset",slug:"reset"},s={unversionedId:"reset",id:"reset",isDocsHomePage:!1,title:"System Reset",description:"After a testing period, or if there has been data corruption, you may need to do a total reset of the system and start again from scratch.",source:"@site/docs/reset.md",slug:"/reset",permalink:"/esr_api/docs/reset",editUrl:"https://github.com/sardjv/esr_api/edit/master/docs/docs/reset.md",version:"current",sidebar:"someSidebar",previous:{title:"Development",permalink:"/esr_api/docs/development"},next:{title:"Documentation",permalink:"/esr_api/docs/documentation"}},c=[],l={rightToc:c};function d(e){var t=e.components,n=Object(a.a)(e,["components"]);return Object(o.b)("wrapper",Object(r.a)({},l,n,{components:t,mdxType:"MDXLayout"}),Object(o.b)("p",null,"After a testing period, or if there has been data corruption, you may need to do a total reset of the system and start again from scratch."),Object(o.b)("div",{className:"admonition admonition-warning alert alert--danger"},Object(o.b)("div",Object(r.a)({parentName:"div"},{className:"admonition-heading"}),Object(o.b)("h5",{parentName:"div"},Object(o.b)("span",Object(r.a)({parentName:"h5"},{className:"admonition-icon"}),Object(o.b)("svg",Object(r.a)({parentName:"span"},{xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"}),Object(o.b)("path",Object(r.a)({parentName:"svg"},{fillRule:"evenodd",d:"M5.05.31c.81 2.17.41 3.38-.52 4.31C3.55 5.67 1.98 6.45.9 7.98c-1.45 2.05-1.7 6.53 3.53 7.7-2.2-1.16-2.67-4.52-.3-6.61-.61 2.03.53 3.33 1.94 2.86 1.39-.47 2.3.53 2.27 1.67-.02.78-.31 1.44-1.13 1.81 3.42-.59 4.78-3.42 4.78-5.56 0-2.84-2.53-3.22-1.25-5.61-1.52.13-2.03 1.13-1.89 2.75.09 1.08-1.02 1.8-1.86 1.33-.67-.41-.66-1.19-.06-1.78C8.18 5.31 8.68 2.45 5.05.32L5.03.3l.02.01z"})))),"warning")),Object(o.b)("div",Object(r.a)({parentName:"div"},{className:"admonition-content"}),Object(o.b)("p",{parentName:"div"},"This will irrevocably delete ALL local data, ALL tokens, ALL admins and any other history or data which has been built up while using the wrapper. You will need to start again completely, adding all users again and creating new tokens. You will need to re-add FTP Credentials, which will request a new seed file from the remote FTP server."))),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"# Shut down the running system.\ndocker-compose down --remove-orphans\n\n# List and remove volumes. THIS WILL REMOVE ALL USERS, TOKENS, DATA AND HISTORY.\ndocker volume ls\ndocker volume rm esr_api_db\ndocker volume rm esr_api_redis\ndocker volume rm esr_api_bundle_cache (Dev mode only)\ndocker volume rm esr_api_db_test (Dev mode only)\n\n# Remove all stopped containers, caches and unused images from the entire system.\n# WARNING: This is not limited to only this project, and will affect any other Docker systems you have\n# on the same server.\ndocker system prune -a\n\n# (Dev mode only)\n# Remove file indicating that the system has already been set up.\nrm script/first_run_complete.tmp\n\n# Remove all downloaded and uploaded .DAT files.\nrm -rf data/\n")),Object(o.b)("p",null,"You can then follow the ",Object(o.b)("a",Object(r.a)({parentName:"p"},{href:"/esr_api/docs/quickstart"}),"Quickstart Guide")," to set the system up again."))}d.isMDXComponent=!0},76:function(e,t,n){"use strict";n.d(t,"a",(function(){return p})),n.d(t,"b",(function(){return b}));var r=n(0),a=n.n(r);function o(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function i(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function s(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?i(Object(n),!0).forEach((function(t){o(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):i(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function c(e,t){if(null==e)return{};var n,r,a=function(e,t){if(null==e)return{};var n,r,a={},o=Object.keys(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||(a[n]=e[n]);return a}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(a[n]=e[n])}return a}var l=a.a.createContext({}),d=function(e){var t=a.a.useContext(l),n=t;return e&&(n="function"==typeof e?e(t):s(s({},t),e)),n},p=function(e){var t=d(e.components);return a.a.createElement(l.Provider,{value:t},e.children)},m={inlineCode:"code",wrapper:function(e){var t=e.children;return a.a.createElement(a.a.Fragment,{},t)}},u=a.a.forwardRef((function(e,t){var n=e.components,r=e.mdxType,o=e.originalType,i=e.parentName,l=c(e,["components","mdxType","originalType","parentName"]),p=d(n),u=r,b=p["".concat(i,".").concat(u)]||p[u]||m[u]||o;return n?a.a.createElement(b,s(s({ref:t},l),{},{components:n})):a.a.createElement(b,s({ref:t},l))}));function b(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var o=n.length,i=new Array(o);i[0]=u;var s={};for(var c in t)hasOwnProperty.call(t,c)&&(s[c]=t[c]);s.originalType=e,s.mdxType="string"==typeof e?e:r,i[1]=s;for(var l=2;l<o;l++)i[l]=n[l];return a.a.createElement.apply(null,i)}return a.a.createElement.apply(null,n)}u.displayName="MDXCreateElement"}}]);