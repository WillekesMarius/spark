# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
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
