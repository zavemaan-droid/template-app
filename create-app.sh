#!/usr/bin/env bash
set -e

TEMPLATE="zavemaan-droid/template-app"

if ! command -v gh >/dev/null 2>&1; then
  echo "Please install GitHub CLI (gh) first: https://cli.github.com/"
  exit 1
fi

if ; then
  echo "Usage: ./create-app.sh my-app-name"
  exit 1
fi

APP_NAME="$1"
DESC="${2:-A new BuilderBolt app}"

echo "Creating repo $APP_NAME from template $TEMPLATE..."
gh repo create "$APP_NAME" --template "$TEMPLATE" --visibility private --description "$DESC" --confirm

git clone "https://github.com/zavemaan-droid/$APP_NAME.git" "$APP_NAME"
cd "$APP_NAME"

cp .env.example .env

echo "✅ Bootstrapped $APP_NAME successfully!"
echo "Next: cd $APP_NAME && pnpm install"
