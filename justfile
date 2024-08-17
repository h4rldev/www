default: 
  just --list
  
@start: install
  cd www-bin
  @docker compose up --build -d

@install:
  mkdir www-dir || true
  chmod +x just_wrapper.sh
  ./just_wrapper.sh www-backend build
  mv www-backend/www-bin ./www-dir/www-bin

  cp www-frontend/backend-config ./www-dir/
  cp -r www-frontend/assets ./www-dir/
  cp -r www-frontend/html ./www-dir/
  cp -r www-frontend/css ./www-dir/
  cp -r *ocker* ./www-dir/


# For git purposes, ignore unless you need to update.
@submod_update:
  git submodule foreach git pull origin main

# This too.
@submod_update_remote: submod_update
  git add .
  git commit . -m "sync(submodules): Sync submodules to latest commit."
  git push
