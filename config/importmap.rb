# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.2/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "openai", to: "https://ga.jspm.io/npm:openai@4.2.0/index.mjs"
pin "openai/_shims/agent", to: "https://ga.jspm.io/npm:openai@4.2.0/_shims/agent.mjs"
pin "openai/_shims/fetch", to: "https://ga.jspm.io/npm:openai@4.2.0/_shims/fetch.mjs"
pin "openai/_shims/fileFromPath", to: "https://ga.jspm.io/npm:openai@4.2.0/_shims/fileFromPath.mjs"
pin "openai/_shims/formdata", to: "https://ga.jspm.io/npm:openai@4.2.0/_shims/formdata.mjs"
pin "openai/_shims/getMultipartRequestOptions", to: "https://ga.jspm.io/npm:openai@4.2.0/_shims/getMultipartRequestOptions.mjs"
pin "openai/_shims/node-readable", to: "https://ga.jspm.io/npm:openai@4.2.0/_shims/node-readable.mjs"
pin "openai/core", to: "https://ga.jspm.io/npm:openai@4.2.0/core.mjs"
pin "openai/pagination", to: "https://ga.jspm.io/npm:openai@4.2.0/pagination.mjs"
pin "openai/resource", to: "https://ga.jspm.io/npm:openai@4.2.0/resource.mjs"
pin "stimulus-carousel", to: "https://ga.jspm.io/npm:stimulus-carousel@5.0.1/dist/stimulus-carousel.mjs"
pin "dom7", to: "https://ga.jspm.io/npm:dom7@4.0.6/dom7.esm.js"
pin "ssr-window", to: "https://ga.jspm.io/npm:ssr-window@4.0.2/ssr-window.esm.js"
pin "swiper/bundle", to: "https://ga.jspm.io/npm:swiper@8.4.7/swiper-bundle.esm.js"
pin "swiper/element/bundle", to: "https://ga.jspm.io/npm:swiper@10.2.0/swiper-element-bundle.mjs"
pin "mapbox-gl", to: "https://ga.jspm.io/npm:mapbox-gl@2.15.0/dist/mapbox-gl.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/process-production.js"
