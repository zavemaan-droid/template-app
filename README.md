name: CI

on:
  pull_request:
  push:
    branches: jobs:
  test-and-build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node: steps:
      - uses: actions/checkout@v4

      - name: Use Node.js ${{ matrix.node }}
        uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
          cache: 'pnpm'

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Lint
        run: pnpm lint

      - name: Build
        run: pnpm build

      - name: Test
        run: pnpm test
