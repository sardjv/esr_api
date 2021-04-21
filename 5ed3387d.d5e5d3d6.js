(window.webpackJsonp=window.webpackJsonp||[]).push([[7],{63:function(e,t,r){"use strict";r.r(t),r.d(t,"frontMatter",(function(){return a})),r.d(t,"metadata",(function(){return c})),r.d(t,"rightToc",(function(){return u})),r.d(t,"default",(function(){return p}));var n=r(2),i=r(6),o=(r(0),r(76)),a={id:"requirements",title:"Requirements"},c={unversionedId:"requirements",id:"requirements",isDocsHomePage:!1,title:"Requirements",description:"Docker",source:"@site/docs/requirements.md",slug:"/requirements",permalink:"/esr_api/docs/requirements",editUrl:"https://github.com/sardjv/esr_api/edit/master/docs/docs/requirements.md",version:"current",sidebar:"someSidebar",previous:{title:"Authentication",permalink:"/esr_api/docs/authentication"},next:{title:"Development",permalink:"/esr_api/docs/development"}},u=[{value:"Docker",id:"docker",children:[]},{value:"Core Technologies",id:"core-technologies",children:[]}],s={rightToc:u};function p(e){var t=e.components,r=Object(i.a)(e,["components"]);return Object(o.b)("wrapper",Object(n.a)({},s,r,{components:t,mdxType:"MDXLayout"}),Object(o.b)("h2",{id:"docker"},"Docker"),Object(o.b)("p",null,"If you can run ",Object(o.b)("a",Object(n.a)({parentName:"p"},{href:"https://en.wikipedia.org/wiki/Docker_(software)"}),"Docker"),", that is the quickest way to get started. If Docker install is not possible, the Dockerfile, docker-compose.yml and Gemfile files included in the repository can be used as a guide for dependencies."),Object(o.b)("h2",{id:"core-technologies"},"Core Technologies"),Object(o.b)("ul",null,Object(o.b)("li",{parentName:"ul"},"Ruby ",Object(o.b)("a",Object(n.a)({parentName:"li"},{href:"https://github.com/ruby/ruby"}),"https://github.com/ruby/ruby")),Object(o.b)("li",{parentName:"ul"},"Rails ",Object(o.b)("a",Object(n.a)({parentName:"li"},{href:"https://github.com/rails/rails"}),"https://github.com/rails/rails")),Object(o.b)("li",{parentName:"ul"},"Redis ",Object(o.b)("a",Object(n.a)({parentName:"li"},{href:"https://redis.io/"}),"https://redis.io/")),Object(o.b)("li",{parentName:"ul"},"Sidekiq ",Object(o.b)("a",Object(n.a)({parentName:"li"},{href:"https://github.com/mperham/sidekiq"}),"https://github.com/mperham/sidekiq")),Object(o.b)("li",{parentName:"ul"},"MySQL Community Edition"),Object(o.b)("li",{parentName:"ul"},"Various supporting open-source gems")))}p.isMDXComponent=!0},76:function(e,t,r){"use strict";r.d(t,"a",(function(){return l})),r.d(t,"b",(function(){return d}));var n=r(0),i=r.n(n);function o(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function a(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function c(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?a(Object(r),!0).forEach((function(t){o(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):a(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function u(e,t){if(null==e)return{};var r,n,i=function(e,t){if(null==e)return{};var r,n,i={},o=Object.keys(e);for(n=0;n<o.length;n++)r=o[n],t.indexOf(r)>=0||(i[r]=e[r]);return i}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(n=0;n<o.length;n++)r=o[n],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(i[r]=e[r])}return i}var s=i.a.createContext({}),p=function(e){var t=i.a.useContext(s),r=t;return e&&(r="function"==typeof e?e(t):c(c({},t),e)),r},l=function(e){var t=p(e.components);return i.a.createElement(s.Provider,{value:t},e.children)},b={inlineCode:"code",wrapper:function(e){var t=e.children;return i.a.createElement(i.a.Fragment,{},t)}},m=i.a.forwardRef((function(e,t){var r=e.components,n=e.mdxType,o=e.originalType,a=e.parentName,s=u(e,["components","mdxType","originalType","parentName"]),l=p(r),m=n,d=l["".concat(a,".").concat(m)]||l[m]||b[m]||o;return r?i.a.createElement(d,c(c({ref:t},s),{},{components:r})):i.a.createElement(d,c({ref:t},s))}));function d(e,t){var r=arguments,n=t&&t.mdxType;if("string"==typeof e||n){var o=r.length,a=new Array(o);a[0]=m;var c={};for(var u in t)hasOwnProperty.call(t,u)&&(c[u]=t[u]);c.originalType=e,c.mdxType="string"==typeof e?e:n,a[1]=c;for(var s=2;s<o;s++)a[s]=r[s];return i.a.createElement.apply(null,a)}return i.a.createElement.apply(null,r)}m.displayName="MDXCreateElement"}}]);