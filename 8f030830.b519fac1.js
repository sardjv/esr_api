(window.webpackJsonp=window.webpackJsonp||[]).push([[14],{70:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return c})),n.d(t,"metadata",(function(){return i})),n.d(t,"rightToc",(function(){return l})),n.d(t,"default",(function(){return p}));var r=n(2),a=n(6),o=(n(0),n(77)),c={id:"development",title:"Development"},i={unversionedId:"development",id:"development",isDocsHomePage:!1,title:"Development",description:".env file",source:"@site/docs/development.md",slug:"/development",permalink:"/esr_api/docs/development",editUrl:"https://github.com/sardjv/esr_api/docs/development.md",version:"current",sidebar:"someSidebar",previous:{title:"Requirements",permalink:"/esr_api/docs/requirements"},next:{title:"Existing Deltas",permalink:"/esr_api/docs/deltas"}},l=[{value:".env file",id:"env-file",children:[]},{value:"Development mode",id:"development-mode",children:[]},{value:"Booting up",id:"booting-up",children:[]},{value:"API Documentation",id:"api-documentation",children:[]},{value:"Licenses",id:"licenses",children:[]},{value:"ETL and Kiba",id:"etl-and-kiba",children:[{value:"Tips",id:"tips",children:[]}]},{value:"Specs",id:"specs",children:[]},{value:"Code Coverage",id:"code-coverage",children:[]},{value:"Debugging",id:"debugging",children:[]},{value:"Model Annotation",id:"model-annotation",children:[]},{value:"Accessing the database console",id:"accessing-the-database-console",children:[]},{value:"Emails",id:"emails",children:[]},{value:"Stop",id:"stop",children:[]},{value:"Testing an import",id:"testing-an-import",children:[]},{value:"Versioning",id:"versioning",children:[]}],b={rightToc:l};function p(e){var t=e.components,n=Object(a.a)(e,["components"]);return Object(o.b)("wrapper",Object(r.a)({},b,n,{components:t,mdxType:"MDXLayout"}),Object(o.b)("h2",{id:"env-file"},".env file"),Object(o.b)("p",null,"To get started, you need a ",Object(o.b)("inlineCode",{parentName:"p"},".env")," file with secrets. A script is provided to generate this file with new secrets:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"sh script/generate_env_file.sh\n")),Object(o.b)("p",null,'If the script succeeds, it will print ".env file generation complete."'),Object(o.b)("h2",{id:"development-mode"},"Development mode"),Object(o.b)("p",null,"To use development mode, activate the docker-compose override file:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"cp docker-compose.override.yml.sample docker-compose.override.yml\ndocker-compose build\n")),Object(o.b)("h2",{id:"booting-up"},"Booting up"),Object(o.b)("p",null,"If you have Docker on your machine, run:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"docker-compose up\n")),Object(o.b)("p",null,"It can then be accessed at ",Object(o.b)("a",Object(r.a)({parentName:"p"},{href:"http://localhost:3001/"}),"http://localhost:3001/")),Object(o.b)("h2",{id:"api-documentation"},"API Documentation"),Object(o.b)("p",null,"The Swagger docs are generated from the RSpec tests in ",Object(o.b)("inlineCode",{parentName:"p"},"spec/controllers/api")," To rebuild the swagger docs:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"docker-compose run rails bundle exec rails rswag\n")),Object(o.b)("h2",{id:"licenses"},"Licenses"),Object(o.b)("p",null,"You can check the licenses of unaccepted dependencies using:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"bundle exec license_finder\n")),Object(o.b)("p",null,"To add accepted licenses:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"bundle exec license_finder permitted_licenses add MIT\n")),Object(o.b)("h2",{id:"etl-and-kiba"},"ETL and Kiba"),Object(o.b)("p",null,"This project uses the ",Object(o.b)("a",Object(r.a)({parentName:"p"},{href:"https://github.com/thbar/kiba"}),"Kiba")," gem for scalable and maintainable data processing."),Object(o.b)("p",null,Object(o.b)("a",Object(r.a)({parentName:"p"},{href:"https://www.youtube.com/watch?v=fxVtbog7pIQ"}),"This talk")," contains a short, clear explanation of how Kiba works."),Object(o.b)("h3",{id:"tips"},"Tips"),Object(o.b)("ul",null,Object(o.b)("li",{parentName:"ul"},"Don't insert rows one by one - use bulk insert."),Object(o.b)("li",{parentName:"ul"},"Skip activerecord validations because they are too slow, find other ways to validate data."),Object(o.b)("li",{parentName:"ul"},"Fail fast; raise an exception and stop on failure rather than trying to carry on and creating bad data.")),Object(o.b)("h2",{id:"specs"},"Specs"),Object(o.b)("p",null,"To run Rubocop, and listen for file changes:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"docker-compose run rails bundle exec guard\n")),Object(o.b)("p",null,"Just press enter to run the whole test suite straight away."),Object(o.b)("h2",{id:"code-coverage"},"Code Coverage"),Object(o.b)("p",null,"After running the test suite, open the coverage/index.html file in a web browser to check what code is covered by the tests."),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"open coverage/index.html\n")),Object(o.b)("h2",{id:"debugging"},"Debugging"),Object(o.b)("p",null,"To access a 'binding.pry' debugging point, run with:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"docker-compose run --service-ports api\n")),Object(o.b)("h2",{id:"model-annotation"},"Model Annotation"),Object(o.b)("p",null,"To annotate rails models with schema run"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"docker-compose run rails bundle exec annotate --models\n")),Object(o.b)("h2",{id:"accessing-the-database-console"},"Accessing the database console"),Object(o.b)("p",null,"To access the MySQL database console:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"docker-compose exec db bash\nmysql -u root -p\n(enter root password)\nshow databases;\nuse esr_api_development;\nSELECT * FROM person_records;\n")),Object(o.b)("h2",{id:"emails"},"Emails"),Object(o.b)("p",null,"The application does not currently send any emails."),Object(o.b)("h2",{id:"stop"},"Stop"),Object(o.b)("p",null,"Stop containers but do not remove them:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"docker-compose stop\n")),Object(o.b)("p",null,"Stop containers and remove them:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"docker-compose down --remove-orphans\n")),Object(o.b)("h2",{id:"testing-an-import"},"Testing an import"),Object(o.b)("p",null,"If you need to compare 2 files, e.g. an export from ESR and an export form another system, you can compare the 2 files like this:"),Object(o.b)("pre",null,Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"cd spec/fixtures/file_diffing\nbash in_left_not_right.sh\n")),Object(o.b)("p",null,"This will print out any lines which appear in ",Object(o.b)("inlineCode",{parentName:"p"},"spec/fixtures/left_hand_file")," and not in ",Object(o.b)("inlineCode",{parentName:"p"},"spec/fixtures/right_hand_file"),"."),Object(o.b)("h2",{id:"versioning"},"Versioning"),Object(o.b)("p",null,"After a bug is fixed (0.0.x), a new feature is added (0.x.0), or a breaking change is introduced(x.0.0), please:"),Object(o.b)("ul",null,Object(o.b)("li",{parentName:"ul"},"Bump the relevant version number in ",Object(o.b)("inlineCode",{parentName:"li"},"config/initializers/version.rb")),Object(o.b)("li",{parentName:"ul"},"Add brief notes about the changes to ",Object(o.b)("inlineCode",{parentName:"li"},"CHANGELOG.md"),"."),Object(o.b)("li",{parentName:"ul"},"Add a git tag to the merge commit in the format ",Object(o.b)("inlineCode",{parentName:"li"},"v0.1.0"),":",Object(o.b)("pre",{parentName:"li"},Object(o.b)("code",Object(r.a)({parentName:"pre"},{}),"  git checkout master\n  git pull\n  git tag v0.1.0 && git push --tags\n"))),Object(o.b)("li",{parentName:"ul"},Object(o.b)("a",Object(r.a)({parentName:"li"},{href:"https://github.com/sardjv/esr_api/releases/new"}),"Add a release on Github")," using the tag number (for example) ",Object(o.b)("inlineCode",{parentName:"li"},"v0.1.0")," as the title and the changelog info as the description.")))}p.isMDXComponent=!0},77:function(e,t,n){"use strict";n.d(t,"a",(function(){return s})),n.d(t,"b",(function(){return m}));var r=n(0),a=n.n(r);function o(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function c(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?c(Object(n),!0).forEach((function(t){o(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):c(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,r,a=function(e,t){if(null==e)return{};var n,r,a={},o=Object.keys(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||(a[n]=e[n]);return a}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(a[n]=e[n])}return a}var b=a.a.createContext({}),p=function(e){var t=a.a.useContext(b),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},s=function(e){var t=p(e.components);return a.a.createElement(b.Provider,{value:t},e.children)},d={inlineCode:"code",wrapper:function(e){var t=e.children;return a.a.createElement(a.a.Fragment,{},t)}},u=a.a.forwardRef((function(e,t){var n=e.components,r=e.mdxType,o=e.originalType,c=e.parentName,b=l(e,["components","mdxType","originalType","parentName"]),s=p(n),u=r,m=s["".concat(c,".").concat(u)]||s[u]||d[u]||o;return n?a.a.createElement(m,i(i({ref:t},b),{},{components:n})):a.a.createElement(m,i({ref:t},b))}));function m(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var o=n.length,c=new Array(o);c[0]=u;var i={};for(var l in t)hasOwnProperty.call(t,l)&&(i[l]=t[l]);i.originalType=e,i.mdxType="string"==typeof e?e:r,c[1]=i;for(var b=2;b<o;b++)c[b]=n[b];return a.a.createElement.apply(null,c)}return a.a.createElement.apply(null,n)}u.displayName="MDXCreateElement"}}]);